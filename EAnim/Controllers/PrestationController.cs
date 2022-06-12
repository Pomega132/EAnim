using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using EAnim.Models;

using Tools.API;

namespace EAnim.Controllers
{
    public class PrestationController : ApiController
    {
        DatasContainer _Db { get; } = new DatasContainer();
        public Response<IEnumerable<ProtoPrestation>> Get()
        {
            try
            {
                return Response.Success(from prestation in (from prestation in _Db.Prestation
                                                            where ((int)prestation.Etat & 0xC0) == 0x00
                                                            orderby prestation.HoraireDebut
                                                            select prestation).Concat(from prestation in _Db.Prestation
                                                                                      where ((int)prestation.Etat & 0xC0) != 0x00
                                                                                      orderby prestation.HoraireDebut descending
                                                                                      select prestation).ToList()
                                        select (ProtoPrestation)prestation);
            }
            catch (Exception e)
            {
                return Response<IEnumerable<ProtoPrestation>>.Fail(e);
            }
        }

        public Response<IEnumerable<ProtoPrestation>> Post(ProtoPrestation prestation)
        {
            try
            {
                _Db.Prestation.AddOrUpdate((Prestation)prestation);
                _Db.SaveChanges();
                return Get();
            }
            catch (Exception e)
            {
                return Response<IEnumerable<ProtoPrestation>>.Fail(e);
            }
        }

        [HttpGet, Route("api/PrestationTypes")]
        public Response<IEnumerable<ProtoTypePrestation>> GetPrestationTypes()
        {
            try
            {
                return Response.Success(from type in _Db.TypePrestation.ToList()
                                        select (ProtoTypePrestation)type);
            }
            catch (Exception e)
            {
                return Response<IEnumerable<ProtoTypePrestation>>.Fail(e);
            }
        }

        [HttpGet, Route("api/PrestationType/{nom}")]
        public Response<ProtoTypePrestation> AddPrestationType(string nom)
        {
            try
            {
                TypePrestation typePrestation = new TypePrestation
                {
                    Nom = nom
                };

                _Db.TypePrestation.Add(typePrestation);
                _Db.SaveChanges();

                return Response.Success((ProtoTypePrestation)typePrestation);
            }
            catch (Exception e)
            {
                return Response<ProtoTypePrestation>.Fail(e);
            }
        }
    }
}
