using System;

namespace EAnim.Models
{
	public class ProtoPrestationContact : ProtoContact
	{
		public string Type { get; set; }

		/// <summary>
		/// Transformer un PrestationContact de la base de donnée en ProtoPrestationContact sérialisable par les API.
		/// </summary>
		/// <param name="prestationContact">PrestationContact de la base de donnée.</param>
		public static explicit operator ProtoPrestationContact(PrestationContact prestationContact) => prestationContact is null ? null : new ProtoPrestationContact
		{
			Id = prestationContact.Id,
			Nom = prestationContact.Nom,
			Prenom = prestationContact.Prenom,
			Mail = prestationContact.Mail,
			Tel = prestationContact.Tel,
			Type = prestationContact.Type,
		};

		/// <summary>
		/// Transformer un ProtoPrestationContact sérialisable par les API en PrestationContact de la base de donnée.
		/// </summary>
		/// <param name="protoPrestationContact">ProtoPrestationContact sérialisable par les API.</param>
		public static explicit operator PrestationContact(ProtoPrestationContact protoPrestationContact) => protoPrestationContact is null ? null : new PrestationContact
		{
			Id = protoPrestationContact.Id,
			Nom = protoPrestationContact.Nom,
			Prenom = protoPrestationContact.Prenom,
			Mail = protoPrestationContact.Mail,
			Tel = protoPrestationContact.Tel,
			Type = protoPrestationContact.Type,
		};
	}
}
