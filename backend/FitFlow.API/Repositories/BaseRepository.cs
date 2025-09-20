using System.Linq.Expressions;
using FitFlow.API.Data;
using FitFlow.API.Entities;
using Microsoft.EntityFrameworkCore;

namespace FitFlow.API.Repositories
{
    public class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class, IEntity
    {
        protected readonly AppDbContext _context;
        private readonly DbSet<TEntity> _dbSet;

        public BaseRepository(AppDbContext context)
        {
            _context = context;
            _dbSet = _context.Set<TEntity>();
        }
        public async Task<Guid> AddAsync(TEntity entity)
        {
            entity.Id = Guid.NewGuid();
            await _dbSet.AddAsync(entity);
            await _context.SaveChangesAsync();
            return entity.Id;
        }

        public async Task DeleteAsync(Guid id)
        {
            var entity = await GetByIdAsync(id);
            if (entity != null)
            {
                _dbSet.Remove(entity);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        => await _dbSet.ToListAsync();

        public async Task<IEnumerable<TEntity>> GetAllByFilterAsync(Expression<Func<TEntity, bool>> filter)
        => await _dbSet.Where(filter).ToListAsync();

        public async Task<TEntity?> GetByIdAsync(Guid id)
        => await _dbSet.FindAsync(id);

        public async Task UpdateAsync(TEntity entity)
        {
            _dbSet.Update(entity);
            await _context.SaveChangesAsync();
        }
    }
}
