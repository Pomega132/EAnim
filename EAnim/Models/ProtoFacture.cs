using System;

namespace EAnim.Models
{
	public class ProtoFacture
	{

		/// <summary>
		/// Transformer un Facture de la base de donnée en ProtoFacture sérialisable par les API.
		/// </summary>
		/// <param name="facture">Facture de la base de donnée.</param>
		public static explicit operator ProtoFacture(Facture facture) => facture is null ? null : new ProtoFacture
		{
		};

		/// <summary>
		/// Transformer un ProtoFacture sérialisable par les API en Facture de la base de donnée.
		/// </summary>
		/// <param name="protoFacture">ProtoFacture sérialisable par les API.</param>
		public static explicit operator Facture(ProtoFacture protoFacture) => protoFacture is null ? null : new Facture
        {
		};
	}
}
