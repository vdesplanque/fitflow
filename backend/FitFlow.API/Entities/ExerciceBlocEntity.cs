namespace FitFlow.API.Entities
{
    public class ExerciceBlocEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        public Guid BlocId { get; set; }
        public BlocEntity Bloc { get; set; } = null!;

        public Guid ExerciceId { get; set; }
        public ExerciceEntity Exercice { get; set; } = null!;

        // Paramètres spécifiques dans le cadre du bloc
        public int? Repetitions { get; set; }
        public TimeSpan? Duration { get; set; }
    }

}