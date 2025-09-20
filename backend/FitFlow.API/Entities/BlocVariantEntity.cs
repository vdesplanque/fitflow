namespace FitFlow.API.Entities
{
    public class BlocVariantEntity : IEntity
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        public Guid BlocId { get; set; }
        public BlocEntity Bloc { get; set; } = null!;

        public string Name { get; set; } = string.Empty; // "Débutant", "Avancé", etc.
        public string Description { get; set; } = string.Empty;
    }

}