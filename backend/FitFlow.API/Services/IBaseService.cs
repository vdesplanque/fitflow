using System.Linq.Expressions;
using FitFlow.API.Entities;

namespace FitFlow.API.Services
{
    public interface IBaseService<TEntity, TDTO> where TEntity : IEntity
    {
        Task<IEnumerable<TDTO>> GetAllAsync();
        Task<TDTO?> GetByIdAsync(Guid id);
        Task<Guid> AddAsync(TDTO entity);
        Task UpdateAsync(TDTO entity);
        Task DeleteAsync(Guid id);
        Task<IEnumerable<TDTO>> GetAllByFilterAsync(Expression<Func<TEntity, bool>> filter);
    }
}
