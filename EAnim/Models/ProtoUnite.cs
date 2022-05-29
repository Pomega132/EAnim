using System;

namespace EAnim.Models
{
	public class ProtoUnite
	{
		public int Id { get; set; }
		public string Nom { get; set; }

		/// <summary>
		/// Transformer un Unite de la base de donnée en ProtoUnite sérialisable par les API.
		/// </summary>
		/// <param name="unite">Unite de la base de donnée.</param>
		public static explicit operator ProtoUnite(Unite unite) => unite is null ? null : new ProtoUnite
		{
			Id = unite.Id,
			Nom = unite.Nom,
		};

		/// <summary>
		/// Transformer un ProtoUnite sérialisable par les API en Unite de la base de donnée.
		/// </summary>
		/// <param name="protoUnite">ProtoUnite sérialisable par les API.</param>
		public static explicit operator Unite(ProtoUnite protoUnite) => protoUnite is null ? null : new Unite
        {
			Id = protoUnite.Id,
			Nom = protoUnite.Nom,
		};
	}
}
