namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class PuntoVenditaUpdate
{

    public string Email { get; set; } = string.Empty;
    public string Telefono { get; set; } = string.Empty;
    public bool Abilitato { get; set; }

    /// <summary>
    /// id prodotti attivi
    /// </summary>
    public List<int> Prodotti { get; set; } = [];

    /// <summary>
    /// id servizi attivi
    /// </summary>
    public List<int> Servizi { get; set; } = [];
}
