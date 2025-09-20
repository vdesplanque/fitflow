using FitFlow.API.Data;
using FitFlow.API.Entities;

namespace FitFlow.API.Repositories
{
    public class BlocRepository : BaseRepository<BlocEntity>
    {
        public BlocRepository(AppDbContext dbContext) : base(dbContext)
        {
        }
    }
};
