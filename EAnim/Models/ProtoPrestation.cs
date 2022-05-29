using System;
using System.Collections.Generic;
using System.Linq;

namespace EAnim.Models
{
    public class ProtoPrestation
    {
        public int Id { get; set; }
        public DateTime? HoraireDebut { get; set; }
        public DateTime? HoraireFin { get; set; }
        public E_PrestationEtat Etat { get; set; }
        public string Notes { get; set; }
        public ProtoLieu Lieu { get; set; }
        public IEnumerable<ProtoClient> Clients { get; set; }
        public IEnumerable<ProtoPrestataire> Prestataires { get;  set; }

        /// <summary>
        /// Transformer un Prestation de la base de donnée en ProtoPrestation sérialisable par les API.
        /// </summary>
        /// <param name="prestation">Prestation de la base de donnée.</param>
        public static explicit operator ProtoPrestation(Prestation prestation) => prestation is null ? null : new ProtoPrestation
        {
            Id = prestation.Id,
            HoraireDebut = prestation.HoraireDebut,
            HoraireFin = prestation.HoraireFin,
            Etat = prestation.Etat,
            Notes = prestation.Notes,
            Lieu = (ProtoLieu)prestation.Lieu,
            Clients = from client in prestation.Clients.ToList()
                      select (ProtoClient)client,
            Prestataires = from prestataire in prestation.Prestataires.ToList()
                           select (ProtoPrestataire)prestataire
        };

        /// <summary>
        /// Transformer un ProtoPrestation sérialisable par les API en Prestation de la base de donnée.
        /// </summary>
        /// <param name="protoPrestation">ProtoPrestation sérialisable par les API.</param>
        public static explicit operator Prestation(ProtoPrestation protoPrestation)
        {
            if (protoPrestation is null)
                return null;

            Prestation prestation = new Prestation
            {
                Id = protoPrestation.Id,
                HoraireDebut = protoPrestation.HoraireDebut,
                HoraireFin = protoPrestation.HoraireFin,
                Etat = protoPrestation.Etat,
                Notes = protoPrestation.Notes,
                Lieu = (Lieu)protoPrestation.Lieu
            };

            foreach (ProtoClient client in protoPrestation.Clients)
                prestation.Clients.Add((Client)client);

            foreach (ProtoPrestataire prestataire in protoPrestation.Prestataires)
                prestation.Prestataires.Add((Prestataire)prestataire);

            return prestation;
        }
    }
}
