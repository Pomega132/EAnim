using System;

namespace EAnim.Models
{
	public class ProtoLieu
	{
		public int Id { get; set; }
		public string Nom { get; set; }
		public string Adresse1 { get; set; }
		public string Adresse2 { get; set; }
		public string Ville { get; set; }
		public string Zip { get; set; }
		public string URL { get; set; }

		/// <summary>
		/// Transformer un Lieu de la base de donnée en ProtoLieu sérialisable par les API.
		/// </summary>
		/// <param name="lieu">Lieu de la base de donnée.</param>
		public static explicit operator ProtoLieu(Lieu lieu) => lieu is null ? null : new ProtoLieu
		{
			Id = lieu.Id,
			Nom = lieu.Nom,
			Adresse1 = lieu.Adresse1,
			Adresse2 = lieu.Adresse2,
			Ville = lieu.Ville,
			Zip = lieu.Zip,
			URL = lieu.URL,
		};

		/// <summary>
		/// Transformer un ProtoLieu sérialisable par les API en Lieu de la base de donnée.
		/// </summary>
		/// <param name="protoLieu">ProtoLieu sérialisable par les API.</param>
		public static explicit operator Lieu(ProtoLieu protoLieu) => protoLieu is null ? null : new Lieu
        {
			Id = protoLieu.Id,
			Nom = protoLieu.Nom,
			Adresse1 = protoLieu.Adresse1,
			Adresse2 = protoLieu.Adresse2,
			Ville = protoLieu.Ville,
			Zip = protoLieu.Zip,
			URL = protoLieu.URL,
		};
	}
}
