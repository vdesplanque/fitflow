using FitFlow.API.Entities;

namespace FitFlow.API.Dtos
{
    public class BlocDto : IEntity
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public bool AllowDifficultyAdjustment { get; set; }

        public List<ExerciceBlocDto> Exercices { get; set; } = new();
        public List<BlocVariantDto> Variants { get; set; } = new();
        public Guid SessionId { get; set; }
    }
}