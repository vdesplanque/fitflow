using System.Linq.Expressions;
using System.Text.Json;
using FitFlow.API.Entities;

namespace FitFlow.API.Repositories
{
    public class JsonRepository<T> : IBaseRepository<T> where T : IEntity
    {
        private readonly string _filePath;
        private List<T> _items = new();

        public JsonRepository(string filePath)
        {
            _filePath = filePath;
            LoadFromFile();
        }

        public Task<IEnumerable<T>> GetAllAsync() => Task.FromResult<IEnumerable<T>>(_items);

        public Task<T?> GetByIdAsync(Guid id) =>
            Task.FromResult(_items.FirstOrDefault(x => x.Id == id));

        public Task<Guid> AddAsync(T entity)
        {
            if (entity.Id == Guid.Empty) entity.Id = Guid.NewGuid();
            _items.Add(entity);
            SaveToFile();
            return Task.FromResult(entity.Id);
        }

        public Task DeleteAsync(Guid id)
        {
            var prop = typeof(T).GetProperty("Id");
            if (prop == null) throw new Exception("Entity must have an 'Id' property of type Guid");

            var item = _items.FirstOrDefault(x =>
            {
                var value = prop.GetValue(x);
                return value != null && value is Guid guidValue && guidValue == id;
            });

            if (item != null)
            {
                _items.Remove(item);
                SaveToFile();
            }
            else
            {
                throw new Exception("Entity to delete not found");
            }

            return Task.CompletedTask;
        }

        private void LoadFromFile()
        {
            if (!File.Exists(_filePath)) { _items = new List<T>(); return; }
            var json = File.ReadAllText(_filePath);
            _items = JsonSerializer.Deserialize<List<T>>(json, JsonSettings.DefaultOptions) ?? new List<T>();
        }

        private void SaveToFile()
        {
            var json = JsonSerializer.Serialize(_items, JsonSettings.DefaultOptions);
            File.WriteAllText(_filePath, json);
        }

        public Task UpdateAsync(T entity)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> GetAllByFilterAsync(Expression<Func<T, bool>> filter)
        {
            throw new NotImplementedException();
        }
    }

}