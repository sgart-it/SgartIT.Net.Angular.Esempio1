namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class PuntoVendita
{
    public virtual int PuntoVenditaId { get; set; }
    public string Codice { get; set; } = string.Empty;
    public string Descrizione { get; set; } = string.Empty;
    public string Citta { get; set; } = string.Empty;
}
