using FitFlow.API.Dtos;
using FitFlow.API.Request;

namespace FitFlow.API.Services
{
    public interface IAuthService
    {
        Task<UserDto?> AuthenticateWithProviderAsync(SocialLoginRequest request);
    }
}