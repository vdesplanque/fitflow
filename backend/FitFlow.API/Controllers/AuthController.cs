using FitFlow.API.Request;
using FitFlow.API.Services;
using Microsoft.AspNetCore.Mvc;

namespace FitFlow.API.Controllers
{
    [ApiController]
    [Route("api/auth")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("social")]
        public async Task<IActionResult> SocialLogin([FromBody] SocialLoginRequest request)
        {
            var user = await _authService.AuthenticateWithProviderAsync(request);
            if (user == null)
                return Unauthorized();

            return Ok(user); // Ou un JWT si tu l'implémentes
        }
    }
}