using System.Text.Json;

namespace FitFlow.API
{
    public static class JsonSettings
    {
        public static readonly JsonSerializerOptions DefaultOptions = new JsonSerializerOptions
        {
            WriteIndented = true,
            PropertyNameCaseInsensitive = true,
            // Tu peux ajouter d’autres options ici, comme des converters custom, etc.
        };
    }
}