using System;

namespace EAnim.Models
{
	public class ProtoDevisArticle
	{
		public int Id { get; set; }
		public string Quantite { get; set; }
		public string Description { get; set; }
		public string PrixUnitaire { get; set; }

		/// <summary>
		/// Transformer un DevisArticle de la base de donnée en ProtoDevisArticle sérialisable par les API.
		/// </summary>
		/// <param name="devisArticle">DevisArticle de la base de donnée.</param>
		public static explicit operator ProtoDevisArticle(DevisArticle devisArticle) => devisArticle is null ? null : new ProtoDevisArticle
		{
			Id = devisArticle.Id,
			Quantite = devisArticle.Quantite,
			Description = devisArticle.Description,
			PrixUnitaire = devisArticle.PrixUnitaire,
		};

		/// <summary>
		/// Transformer un ProtoDevisArticle sérialisable par les API en DevisArticle de la base de donnée.
		/// </summary>
		/// <param name="protoDevisArticle">ProtoDevisArticle sérialisable par les API.</param>
		public static explicit operator DevisArticle(ProtoDevisArticle protoDevisArticle) => protoDevisArticle is null ? null : new DevisArticle
        {
			Id = protoDevisArticle.Id,
			Quantite = protoDevisArticle.Quantite,
			Description = protoDevisArticle.Description,
			PrixUnitaire = protoDevisArticle.PrixUnitaire,
		};
	}
}
