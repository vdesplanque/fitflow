using AutoMapper;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;

namespace FitFlow.API.Services
{
    public class SessionService : BaseService<SessionEntity, SessionDto>
    {

        public SessionService(IBaseRepository<SessionEntity> repo, IMapper mapper) : base(repo, mapper)
        {
        }
    }
}
