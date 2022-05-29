using System;

namespace EAnim.Models
{
	public class ProtoContact
	{
		public int Id { get; set; }
		public string Nom { get; set; }
		public string Prenom { get; set; }
		public string Mail { get; set; }
		public string Tel { get; set; }

		/// <summary>
		/// Transformer un Contact de la base de donnée en ProtoContact sérialisable par les API.
		/// </summary>
		/// <param name="contact">Contact de la base de donnée.</param>
		public static explicit operator ProtoContact(Contact contact) => contact is null ? null : new ProtoContact
		{
			Id = contact.Id,
			Nom = contact.Nom,
			Prenom = contact.Prenom,
			Mail = contact.Mail,
			Tel = contact.Tel,
		};

		/// <summary>
		/// Transformer un ProtoContact sérialisable par les API en Contact de la base de donnée.
		/// </summary>
		/// <param name="protoContact">ProtoContact sérialisable par les API.</param>
		public static explicit operator Contact(ProtoContact protoContact) => protoContact is null ? null : new Contact
        {
			Id = protoContact.Id,
			Nom = protoContact.Nom,
			Prenom = protoContact.Prenom,
			Mail = protoContact.Mail,
			Tel = protoContact.Tel,
		};
	}
}
