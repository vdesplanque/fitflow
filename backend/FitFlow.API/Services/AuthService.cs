using AutoMapper;
using FitFlow.API.Data;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;
using FitFlow.API.Request;
using Google.Apis.Auth;
using Microsoft.EntityFrameworkCore;

//TODO repasser sur l'authentification quand on aura une idée claire des besoins
namespace FitFlow.API.Services
{
    public class AuthService : IAuthService
    {
        private readonly AppDbContext _db;
        private readonly IBaseService<UserEntity, UserDto> _userService;
        private readonly IMapper _mapper;

        public AuthService(AppDbContext db, IBaseService<UserEntity, UserDto> userService, IMapper mapper)
        {
            _db = db;
            _userService = userService;
            _mapper = mapper;
        }

        public async Task<UserDto?> AuthenticateWithProviderAsync(SocialLoginRequest request)
        {
            switch (request.Provider.ToLower())
            {
                case "google":
                    return await AuthenticateWithGoogleAsync(request.AccessToken);
                case "facebook":
                    return await AuthenticateWithFacebookAsync(request.AccessToken);
                case "apple":
                    return await AuthenticateWithAppleAsync(request.AccessToken);
                default:
                    throw new ArgumentException("Provider not supported");
            }
        }

        private async Task<UserDto> AuthenticateWithGoogleAsync(string idToken)
        {
            var payload = await GoogleJsonWebSignature.ValidateAsync(idToken);

            var utilisateur = await _userService.GetByIdAsync(Guid.NewGuid());
            //.FirstOrDefault(u => u.Provider == "google" && u.ProviderId == payload.Subject);

            if (utilisateur == null)
            {
                utilisateur = new UserDto
                {
                    Email = payload.Email/*,
                    DisplayName = payload.Name,
                    PhotoUrl = payload.Picture,
                    Provider = "google",
                    ProviderId = payload.Subject*/
                };
                await _userService.AddAsync(utilisateur);
            }

            return _mapper.Map<UserDto>(utilisateur); ;
        }

        private async Task<UserDto?> AuthenticateWithFacebookAsync(string token)
        {
            throw new NotImplementedException();
        }

        private async Task<UserDto?> AuthenticateWithAppleAsync(string token)
        {
            throw new NotImplementedException();
        }

    }
}