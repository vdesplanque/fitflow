using FitFlow.API.Entities;

namespace FitFlow.API.Dtos
{
    public class SessionDto : IEntity
    {
        public Guid Id { get; set; }
        public string Title { get; set; } = string.Empty;

        public IEnumerable<BlocDto> Blocs { get; set; }
    }
}