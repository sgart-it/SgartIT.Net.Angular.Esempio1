namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class PuntoVenditaDettaglio : PuntoVendita
{
    public string Email { get; set; } = string.Empty;
    public string Telefono { get; set; } = string.Empty;
    public bool Abilitato { get; set; }
    public DateTime DataUltimaModifica { get; set; }

    public List<Prodotto> Prodotti { get; set; } = [];
    public List<Servizio> Servizi { get; set; } = [];
    public List<Carta> Carte { get; set; } = [];
}
