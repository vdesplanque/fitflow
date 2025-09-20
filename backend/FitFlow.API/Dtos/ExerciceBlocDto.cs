namespace FitFlow.API.Dtos
{
    public class ExerciceBlocDto
    {
        public Guid Id { get; set; }

        public Guid ExerciceId { get; set; }
        public string ExerciceName { get; set; } = string.Empty;
        public string? ExerciceDescription { get; set; }
        public string? VideoUrl { get; set; }

        // Paramètres spécifiques au bloc
        public int? Repetitions { get; set; }
        public TimeSpan? Duration { get; set; }
    }
}