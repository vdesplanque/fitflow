using Microsoft.AspNetCore.Mvc;
using FitFlow.API.Services;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;

namespace FitFlow.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SessionController : BaseController<SessionEntity, SessionDto>
    {

        public SessionController(IBaseService<SessionEntity, SessionDto> sessionService) : base(sessionService)
        {
        }
    }
}
