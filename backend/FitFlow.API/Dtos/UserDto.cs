using FitFlow.API.Entities;

namespace FitFlow.API.Dtos
{
    public class UserDto : IEntity
    {
        public Guid Id { get; set; }
        public string Nom { get; set; }
        public string Email { get; set; }
    }
}