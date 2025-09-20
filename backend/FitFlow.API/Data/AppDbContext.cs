using FitFlow.API.Entities;
using Microsoft.EntityFrameworkCore;

namespace FitFlow.API.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<UserEntity> Utilisateurs { get; set; }
        public DbSet<ProgramEntity> Programmes { get; set; }
        public DbSet<SessionEntity> Seances { get; set; }
        public DbSet<ContentTagEntity> TypesProgramme { get; set; }
        public DbSet<ContentTagEntity> TypesSeance { get; set; }
        public DbSet<StatistiquesEntity> Statistiques { get; set; }
        public DbSet<UserSessionEntity> SeancesUtilisateurs { get; set; }
        public DbSet<ProgramProgressEntity> ProgressionProgrammes { get; set; }
    }
}