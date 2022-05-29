using System;

namespace EAnim.Models
{
	public class ProtoTypePrestation
	{
		public int Id { get; set; }
		public string Nom { get; set; }

		/// <summary>
		/// Transformer un TypePrestation de la base de donnée en ProtoTypePrestation sérialisable par les API.
		/// </summary>
		/// <param name="typePrestation">TypePrestation de la base de donnée.</param>
		public static explicit operator ProtoTypePrestation(TypePrestation typePrestation) => typePrestation is null ? null : new ProtoTypePrestation
		{
			Id = typePrestation.Id,
			Nom = typePrestation.Nom,
		};

		/// <summary>
		/// Transformer un ProtoTypePrestation sérialisable par les API en TypePrestation de la base de donnée.
		/// </summary>
		/// <param name="protoTypePrestation">ProtoTypePrestation sérialisable par les API.</param>
		public static explicit operator TypePrestation(ProtoTypePrestation protoTypePrestation) => protoTypePrestation is null ? null : new TypePrestation
        {
			Id = protoTypePrestation.Id,
			Nom = protoTypePrestation.Nom,
		};
	}
}
