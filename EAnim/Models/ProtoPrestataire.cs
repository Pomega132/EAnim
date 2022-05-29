using System;

namespace EAnim.Models
{
	public class ProtoPrestataire : ProtoContact
	{
		public string Siret { get; set; }

		/// <summary>
		/// Transformer un Prestataire de la base de donnée en ProtoPrestataire sérialisable par les API.
		/// </summary>
		/// <param name="prestataire">Prestataire de la base de donnée.</param>
		public static explicit operator ProtoPrestataire(Prestataire prestataire) => prestataire is null ? null : new ProtoPrestataire
		{
			Id = prestataire.Id,
			Nom = prestataire.Nom,
			Prenom = prestataire.Prenom,
			Mail = prestataire.Mail,
			Tel = prestataire.Tel,
			Siret = prestataire.Siret,
		};

		/// <summary>
		/// Transformer un ProtoPrestataire sérialisable par les API en Prestataire de la base de donnée.
		/// </summary>
		/// <param name="protoPrestataire">ProtoPrestataire sérialisable par les API.</param>
		public static explicit operator Prestataire(ProtoPrestataire protoPrestataire) => protoPrestataire is null ? null : new Prestataire
		{
			Id = protoPrestataire.Id,
			Nom = protoPrestataire.Nom,
			Prenom = protoPrestataire.Prenom,
			Mail = protoPrestataire.Mail,
			Tel = protoPrestataire.Tel,
			Siret = protoPrestataire.Siret,
		};
	}
}
