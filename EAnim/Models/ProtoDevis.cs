using System;

namespace EAnim.Models
{
	public class ProtoDevis
	{
		public int Id { get; set; }
		public string Status { get; set; }

		/// <summary>
		/// Transformer un Devis de la base de donnée en ProtoDevis sérialisable par les API.
		/// </summary>
		/// <param name="devis">Devis de la base de donnée.</param>
		public static explicit operator ProtoDevis(Devis devis) => devis is null ? null : new ProtoDevis
		{
			Id = devis.Id,
			Status = devis.Status,
		};

		/// <summary>
		/// Transformer un ProtoDevis sérialisable par les API en Devis de la base de donnée.
		/// </summary>
		/// <param name="protoDevis">ProtoDevis sérialisable par les API.</param>
		public static explicit operator Devis(ProtoDevis protoDevis) => protoDevis is null ? null : new Devis
        {
			Id = protoDevis.Id,
			Status = protoDevis.Status,
		};
	}
}
