using FitFlow.API.Data;
using FitFlow.API.Entities;

namespace FitFlow.API.Repositories
{
    public class UserRepository : BaseRepository<UserEntity>
    {

        public UserRepository(AppDbContext context) : base(context)
        {

        }
    }
}
