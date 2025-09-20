using AutoMapper;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;

namespace FitFlow.API
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Utilisateur
            CreateMap<UserEntity, UserDto>().ReverseMap();
            CreateMap<UserEntity, UserCreateDto>().ReverseMap();

            CreateMap<ProgramEntity, ProgramDto>()
                        .ForMember(dest => dest.SessionCount,
                                opt => opt.MapFrom(src => src.Sessions.Count)
                        )
                        .ReverseMap();

            CreateMap<SessionEntity, SessionDto>().ReverseMap();
            CreateMap<BlocEntity, BlocDto>().ReverseMap();
            CreateMap<BlocVariantEntity, BlocVariantDto>().ReverseMap();
            CreateMap<ExerciceBlocEntity, ExerciceBlocDto>().ReverseMap();
        }
    }
    /*
    Exemples d'utilisation :
    🔁 Convertir un modèle vers un DTO :
    var utilisateur = await _context.Utilisateurs.FirstOrDefaultAsync();
    var dto = _mapper.Map<UtilisateurDto>(utilisateur);

    🔁 Convertir un DTO vers un modèle :
    var utilisateur = _mapper.Map<Utilisateur>(utilisateurCreateDto);

    🔁 Mapper une liste :
    var utilisateurs = await _context.Utilisateurs.ToListAsync();
    var dtos = _mapper.Map<List<UtilisateurDto>>(utilisateurs);
    */
}