namespace FitFlow.API.Request
{
    public class SocialLoginRequest
    {
        public string Provider { get; set; } // "google", "facebook", "apple"
        public string AccessToken { get; set; } // Token reçu du front
    }
}

