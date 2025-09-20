namespace FitFlow.API.Entities
{
    public class BlocEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Title { get; set; } = string.Empty;

        // Indique si la difficulté peut être ajustée
        public bool AllowDifficultyAdjustment { get; set; }

        // Liste d’exercices avec paramètres (durée, reps…)
        public ICollection<ExerciceBlocEntity> Exercices { get; set; } = new List<ExerciceBlocEntity>();

        // Variantes possibles (ex : “Débutant”, “Intermédiaire”, “Avancé”)
        public ICollection<BlocVariantEntity> Variants { get; set; } = new List<BlocVariantEntity>();

        public Guid SessionId { get; set; }
    }

}