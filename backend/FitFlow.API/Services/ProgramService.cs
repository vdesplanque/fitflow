using AutoMapper;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Repositories;

namespace FitFlow.API.Services
{
    public class ProgramService : BaseService<ProgramEntity, ProgramDto>
    {
        private readonly IBaseService<SessionEntity, SessionDto> _sessionService;
        private readonly IBaseService<BlocEntity, BlocDto> _blocService;

        public ProgramService(IBaseRepository<ProgramEntity> repo, IMapper mapper, IBaseService<SessionEntity, SessionDto> sessionService, IBaseService<BlocEntity, BlocDto> blocService) : base(repo, mapper)
        {
            _sessionService = sessionService;
            _blocService = blocService;
        }

        public async Task<ProgramDto?> GetProgramWithDetails(Guid id)
        {
            var program = await _repo.GetByIdAsync(id);
            if (program == null) return null;

            var sessions = await _sessionService.GetAllByFilterAsync(session => session.ProgramId == program.Id); // filtrer par ProgramId si besoin
            foreach (var session in sessions)
            {
                session.Blocs = await _blocService.GetAllByFilterAsync(bloc => bloc.SessionId == session.Id);
            }

            program.Sessions = _mapper.Map<ICollection<SessionEntity>>(sessions);
            return _mapper.Map<ProgramDto>(program);
        }
    }
}