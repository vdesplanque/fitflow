using AutoMapper;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;

namespace FitFlow.API.Services
{
    public class BlocService : BaseService<BlocEntity, BlocDto>
    {

        public BlocService(IBaseRepository<BlocEntity> repo, IMapper mapper) : base(repo, mapper)
        {
        }
    }
}
