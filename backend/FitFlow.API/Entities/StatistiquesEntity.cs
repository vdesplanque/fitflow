namespace FitFlow.API.Entities
{
    public class StatistiquesEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public int UtilisateurId { get; set; }
        public int TotalSeancesTerminees { get; set; }
        public TimeSpan TempsTotalPasse { get; set; }
        public int CaloriesBrulees { get; set; }
        public DateTime? DerniereSeance { get; set; }

        // Navigation
        public UserEntity Utilisateur { get; set; }
    }
}