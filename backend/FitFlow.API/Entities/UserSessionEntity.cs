namespace FitFlow.API.Entities
{
    public class UserSessionEntity : IEntity
    {
        public Guid Id { get; set; }
        public Guid UserID { get; set; }
        public Guid SessionID { get; set; }
        public DateTime StartDate { get; set; }
        public TimeSpan Duration { get; set; }
        public bool Finished { get; set; }
        public string? Comment { get; set; }

        // Navigation
        public UserEntity? User { get; set; }
        public SessionEntity? Session { get; set; }
    }
}