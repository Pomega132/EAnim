using System;

namespace EAnim.Models
{
	public class ProtoArticle
	{
		public int Id { get; set; }
		public string Ref { get; set; }
		public string Description { get; set; }
		public string Nom { get; set; }
		public string PrixUnitaire { get; set; }

		/// <summary>
		/// Transformer un Article de la base de donnée en ProtoArticle sérialisable par les API.
		/// </summary>
		/// <param name="article">Article de la base de donnée.</param>
		public static explicit operator ProtoArticle(Article article) => article is null ? null : new ProtoArticle
		{
			Id = article.Id,
			Ref = article.Ref,
			Description = article.Description,
			Nom = article.Nom,
			PrixUnitaire = article.PrixUnitaire,
		};

		/// <summary>
		/// Transformer un ProtoArticle sérialisable par les API en Article de la base de donnée.
		/// </summary>
		/// <param name="protoArticle">ProtoArticle sérialisable par les API.</param>
		public static explicit operator Article(ProtoArticle protoArticle) => protoArticle is null ? null : new Article
        {
			Id = protoArticle.Id,
			Ref = protoArticle.Ref,
			Description = protoArticle.Description,
			Nom = protoArticle.Nom,
			PrixUnitaire = protoArticle.PrixUnitaire,
		};
	}
}
