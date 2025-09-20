using FitFlow.API.Data;
using FitFlow.API.Entities;

namespace FitFlow.API.Repositories
{
    public class SessionRepository : BaseRepository<SessionEntity>
    {
        public SessionRepository(AppDbContext dbContext) : base(dbContext)
        {
        }
    }
};
