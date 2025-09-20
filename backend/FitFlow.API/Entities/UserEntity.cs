namespace FitFlow.API.Entities
{

    public class UserEntity : AuthBaseModel
    {
        public DateTime CreatedAt { get; set; }
        public bool SubscriptionActive { get; set; }
        public DateTime? SubscriptionEndsAt { get; set; }
        public int Tokens { get; set; }
        public int TotalTime { get; set; } // en secondes
        public int SessionsCompleted { get; set; }

        public List<string>? CompletedProgramIds { get; set; }
        public List<string>? FavoriteTypes { get; set; }

        public List<ProgramProgressEntity>? ProgrammesSuivis { get; set; }
    }
}