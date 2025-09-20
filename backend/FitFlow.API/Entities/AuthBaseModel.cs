namespace FitFlow.API.Entities
{
    public class AuthBaseModel : IEntity
    {
        public Guid Id { get; set; }
        public string Email { get; set; }
        public string? DisplayName { get; set; }
        public string? PhotoUrl { get; set; }
        public string? Provider { get; set; } // "google", "facebook", etc.
        public string? ProviderId { get; set; } // ID unique du provider (sub pour Google)s
    }
}