namespace FitFlow.API.Dtos
{
    public class BlocVariantDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;   // "Débutant", "Avancé"
        public string Description { get; set; } = string.Empty;
    }
}