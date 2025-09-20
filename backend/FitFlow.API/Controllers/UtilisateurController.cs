using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Services;
using Microsoft.AspNetCore.Mvc;

namespace FitFlow.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UtilisateurController : BaseController<UserEntity, UserDto>
    {
        public UtilisateurController(IBaseService<UserEntity, UserDto> userService) : base(userService)
        {
        }
    }
}