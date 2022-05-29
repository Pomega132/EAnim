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
    }
}
