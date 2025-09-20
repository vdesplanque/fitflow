using System.ComponentModel.DataAnnotations;

namespace FitFlow.API.Dtos
{
    public class UserCreateDto
    {
        [Required]
        public string Nom { get; set; }

        [EmailAddress]
        public string Email { get; set; }
    }
}