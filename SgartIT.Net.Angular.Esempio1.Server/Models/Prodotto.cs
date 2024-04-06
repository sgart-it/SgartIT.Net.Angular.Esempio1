namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class Prodotto
{
    public int ProdottoId { get; set; }
    public string Descrizione { get; set; } = string.Empty;
    public bool Modificabile { get; set; }
    public bool Selected { get; set; }

}
