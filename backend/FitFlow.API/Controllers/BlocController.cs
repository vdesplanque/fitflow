using Microsoft.AspNetCore.Mvc;
using FitFlow.API.Services;
using FitFlow.API.Entities;
using FitFlow.API.Dtos;

namespace FitFlow.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BlocController : BaseController<BlocEntity, BlocDto>
    {

        public BlocController(IBaseService<BlocEntity, BlocDto> blocService) : base(blocService)
        {
        }
    }
}
