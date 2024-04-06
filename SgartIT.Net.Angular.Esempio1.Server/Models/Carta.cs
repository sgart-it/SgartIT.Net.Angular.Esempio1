namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class Carta
{
    public int CartaId { get; set; }
    public string Descrizione { get; set; } = string.Empty;
    public bool Modificabile { get; set; }
    public bool Selected { get; set; }
}
