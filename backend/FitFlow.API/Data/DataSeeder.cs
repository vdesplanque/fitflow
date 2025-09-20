using FitFlow.API.Data;
using FitFlow.API.Entities;
using Microsoft.Azure.Cosmos;

public static class DataSeeder
{
    public static void SeedDatabase(AppDbContext context)
    {
        if (!context.Utilisateurs.Any())
        {
            context.Utilisateurs.AddRange(
                new UserEntity
                {
                    Id = Guid.NewGuid(),
                    DisplayName = "Jean Dupont",
                    Email = "jean.dupont@example.com"
                },
                new UserEntity
                {
                    Id = Guid.NewGuid(),
                    DisplayName = "Sophie Martin",
                    Email = "sophie.martin@example.com"
                }
            );
            context.SaveChanges();
        }
    }
}
