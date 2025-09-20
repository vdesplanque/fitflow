namespace FitFlow.API.Entities
{
    public class ContentTagEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Label { get; set; }
        public string Description { get; set; }
        public string IconUrl { get; set; }
        public bool IsActive { get; set; }
    }
}