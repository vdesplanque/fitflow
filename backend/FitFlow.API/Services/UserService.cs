using AutoMapper;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;

namespace FitFlow.API.Services
{
    public class UserService : BaseService<UserEntity, UserDto>
    {

        public UserService(IBaseRepository<UserEntity> repo, IMapper mapper) : base(repo, mapper)
        {
        }
    }
}
