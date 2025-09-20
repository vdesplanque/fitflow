using FitFlow.API.Entities;

namespace FitFlow.API.Dtos
{
    public class ProgramDto : IEntity
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Level { get; set; }
        public int EstimatedDuration { get; set; }
        public Guid TypeProgrammeId { get; set; }
        public int SessionCount { get; set; }

        public List<SessionDto> Sessions { get; set; } = new();
    }
}