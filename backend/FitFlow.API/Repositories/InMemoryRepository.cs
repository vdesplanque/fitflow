using System.Linq.Expressions;
using FitFlow.API.Entities;
using FitFlow.API.Exceptions;
namespace FitFlow.API.Repositories
{
    public class InMemoryRepositoryBase<T> : IBaseRepository<T> where T : IEntity
    {
        protected readonly List<T> _entities = new();

        public virtual async Task<IEnumerable<T>> GetAllAsync()
        {
            return await Task.FromResult(_entities);
        }

        public virtual async Task<T?> GetByIdAsync(Guid id)
        {
            var prop = typeof(T).GetProperty("Id");

            var entity = _entities.FirstOrDefault(e => (Guid)prop?.GetValue(e)! == id);
            return await Task.FromResult(entity);
        }

        public virtual Task<Guid> AddAsync(T entity)
        {
            if (entity.Id == Guid.Empty) entity.Id = Guid.NewGuid();
            _entities.Add(entity);
            return Task.FromResult(entity.Id);
        }

        public async Task UpdateAsync(T entity)
        {
            var savedEntity = await GetByIdAsync(entity.Id);
            if (savedEntity == null) throw new NotFoundException($"Unable to find entity of type '{entity.GetType().Name}' with ID : '{entity.Id}'");
            throw new NotImplementedException();
        }

        public Task DeleteAsync(Guid id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> GetAllByFilterAsync(Expression<Func<T, bool>> filter)
        {
            throw new NotImplementedException();
        }
    }
}
