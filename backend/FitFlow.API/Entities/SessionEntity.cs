namespace FitFlow.API.Entities
{
    public class SessionEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? VideoUrl { get; set; }
        public int DurationSeconds { get; set; }
        public int Order { get; set; }
        public List<string>? TypeIds { get; set; }
        public int EstimatedCalories { get; set; }
        public int RequiredTokens { get; set; }
        public bool IsFree { get; set; }
        public bool PreviewAvailable { get; set; }
        public string? ImageUrl { get; set; }
        public List<string>? Goals { get; set; }
        public List<string>? TagIds { get; set; }

        public ICollection<BlocEntity> Blocs { get; set; } = new List<BlocEntity>();
        public Guid ProgramId { get; set; }
    }
}