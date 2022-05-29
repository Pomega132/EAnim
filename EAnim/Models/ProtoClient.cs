using System;

namespace EAnim.Models
{
	public class ProtoClient : ProtoContact
	{
		public string Adresse1 { get; set; }
		public string Adresse2 { get; set; }
		public string Ville { get; set; }
		public string Zip { get; set; }

		/// <summary>
		/// Transformer un Client de la base de donnée en ProtoClient sérialisable par les API.
		/// </summary>
		/// <param name="client">Client de la base de donnée.</param>
		public static explicit operator ProtoClient(Client client) => client is null ? null : new ProtoClient
		{
			Id = client.Id,
			Nom = client.Nom,
			Prenom = client.Prenom,
			Mail = client.Mail,
			Tel = client.Tel,
			Adresse1 = client.Adresse1,
			Adresse2 = client.Adresse2,
			Ville = client.Ville,
			Zip = client.Zip,
		};

		/// <summary>
		/// Transformer un ProtoClient sérialisable par les API en Client de la base de donnée.
		/// </summary>
		/// <param name="protoClient">ProtoClient sérialisable par les API.</param>
		public static explicit operator Client(ProtoClient protoClient) => protoClient is null ? null : new Client
		{
			Id = protoClient.Id,
			Nom = protoClient.Nom,
			Prenom = protoClient.Prenom,
			Mail = protoClient.Mail,
			Tel = protoClient.Tel,
			Adresse1 = protoClient.Adresse1,
			Adresse2 = protoClient.Adresse2,
			Ville = protoClient.Ville,
			Zip = protoClient.Zip,
		};
	}
}
