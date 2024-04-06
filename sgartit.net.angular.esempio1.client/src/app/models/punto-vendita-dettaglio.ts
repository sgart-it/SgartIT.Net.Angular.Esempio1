import { Carta } from './carta';
import { Prodotto } from './prodotto';
import { PuntoVendita } from './punto-vendita';
import { Servizio } from './servizio';
export interface PuntoVenditaDettaglio extends PuntoVendita {
  email: string;
  telefono: string;
  abilitato: boolean;
  dataUltimaModifica: Date;

  prodotti: Prodotto[];
  servizi: Servizio[];
  carte: Carta[];
}
