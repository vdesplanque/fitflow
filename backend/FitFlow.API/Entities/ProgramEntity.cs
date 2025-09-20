namespace FitFlow.API.Entities
{
    public class ProgramEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? ShortDescription { get; set; }
        public List<string>? TypeIds { get; set; }
        public string? Level { get; set; }
        public int DurationWeeks { get; set; }
        public bool PreviewAvailable { get; set; }
        public int RequiredTokens { get; set; }
        public bool IsFree { get; set; }
        public string? ImageUrl { get; set; }
        public int EstimatedCalories { get; set; }
        public string? Prerequisites { get; set; }
        public List<string>? Goals { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<string>? TagIds { get; set; }

        public ICollection<SessionEntity> Sessions { get; set; } = new List<SessionEntity>();
    }

}