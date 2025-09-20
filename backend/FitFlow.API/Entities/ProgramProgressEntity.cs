namespace FitFlow.API.Entities
{
    public class ProgramProgressEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public int UtilisateurId { get; set; }
        public int ProgrammeId { get; set; }

        public int NombreSeancesTerminees { get; set; }
        public DateTime DerniereSeanceEffectuee { get; set; }
        public DateTime StartDate { get; set; }

        public bool IsCompleted { get; set; }
        public int CurrentSeanceIndex { get; set; } // si ordre imposé

        // Navigation
        public UserEntity Utilisateur { get; set; }
        public ProgramEntity Programme { get; set; }
    }
}