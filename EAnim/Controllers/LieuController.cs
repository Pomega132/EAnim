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
    public class LieuController : ApiController
    {
        DatasContainer _Db { get; } = new DatasContainer();

        // GET: api/Lieu
        public Response<IEnumerable<ProtoLieu>> Get()
        {
            try
            {
                return Response.Success(from lieu in _Db.Lieu.ToList()
                                        select (ProtoLieu)lieu);
            }
            catch (Exception e)
            {
                return Response<IEnumerable<ProtoLieu>>.Fail(e);
            }
        }

        // GET: api/Lieu/5
        public Response<ProtoLieu> Get(int id)
        {
            try
            {
                return Response.Success((ProtoLieu)_Db.Lieu.Find(id));
            }
            catch (Exception e)
            {
                return Response<ProtoLieu>.Fail(e);
            }
        }

        // POST: api/Lieu
        public Response<ProtoLieu> Post(ProtoLieu protoLieu)
        {
            try
            {
                Lieu lieu = (Lieu)protoLieu;
                _Db.Lieu.AddOrUpdate(lieu);
                _Db.SaveChanges();

                return Response.Success((ProtoLieu)lieu);
            }
            catch (Exception e)
            {
                return Response<ProtoLieu>.Fail(e);
            }
        }
    }
}
