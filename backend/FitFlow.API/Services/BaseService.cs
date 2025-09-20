using System.Linq.Expressions;
using AutoMapper;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;

namespace FitFlow.API.Services
{
    public class BaseService<TEntity, TDto> : IBaseService<TEntity, TDto> where TEntity : IEntity where TDto : IEntity
    {
        protected readonly IBaseRepository<TEntity> _repo; // si tu utilises DTO dans repo in-memory
                                                           // ou IRepositoryBase<ProgramEntity> si repo expose Entities
        protected readonly IMapper _mapper;

        public BaseService(IBaseRepository<TEntity> repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        public async Task<Guid> AddAsync(TDto dto)
        {
            var entity = _mapper.Map<TEntity>(dto);
            var id = await _repo.AddAsync(entity);
            return id;
        }

        public async Task<IEnumerable<TDto>> GetAllAsync()
        {
            var entities = await _repo.GetAllAsync();
            var programDtos = _mapper.Map<IEnumerable<TDto>>(entities);
            return programDtos;
        }

        public async Task<IEnumerable<TDto>> GetAllByFilterAsync(Expression<Func<TEntity, bool>> filter)
        {
            var programs = await _repo.GetAllByFilterAsync(filter);
            return _mapper.Map<IEnumerable<TDto>>(programs);
        }

        public async Task<TDto?> GetByIdAsync(Guid id)
        {
            var entity = await _repo.GetByIdAsync(id);
            var dto = _mapper.Map<TDto>(entity);
            return dto;
        }


        public async Task UpdateAsync(TDto dto)
        {
            var entity = await _repo.GetByIdAsync(dto.Id);
            if (entity == null) return;

            _mapper.Map(dto, entity);
            await _repo.UpdateAsync(entity);
        }

        Task IBaseService<TEntity, TDto>.DeleteAsync(Guid id)
        {
            return _repo.DeleteAsync(id);
        }
    }
}