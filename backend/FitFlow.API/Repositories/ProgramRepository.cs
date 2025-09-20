using FitFlow.API.Data;
using FitFlow.API.Entities;

namespace FitFlow.API.Repositories
{
    public class ProgramRepository : BaseRepository<ProgramEntity>
    {
        public ProgramRepository(AppDbContext dbContext) : base(dbContext)
        {
        }
    }
};
