using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Services;
using Microsoft.AspNetCore.Mvc;

namespace FitFlow.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProgramController : BaseController<ProgramEntity, ProgramDto>
    {

        public ProgramController(IBaseService<ProgramEntity, ProgramDto> blocService) : base(blocService)
        {
        }
    }
}