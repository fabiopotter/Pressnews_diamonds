using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using PressNews.Api.Models;

namespace PressNews.Api.Controllers
{
    public class NewsController : ApiController
    {
        private db_pressnewsEntities1 db = new db_pressnewsEntities1();

       
        [Route("api/GetNews")]
        [HttpGet()]
        // GET: api/News
        public IEnumerable<TB_NEWS> GetAll()
        {   
            return db.TB_NEWS.Include("TB_CATEGORIES");
        }

        // GET: api/News/5
        [HttpGet()]
        public IHttpActionResult Get(int id)
        {
            TB_NEWS tB_NEWS = db.TB_NEWS.Include("TB_CATEGORIES").Where(n=> n.id_new == id).FirstOrDefault();
            if (tB_NEWS == null)
            {
                return NotFound();
            }

            return Ok(tB_NEWS);
        }

        // PUT: api/News/5
        [Route("api/UpdateNews")]
        [HttpPost()]
        public IHttpActionResult Put(TB_NEWS tB_NEWS)
        {
            string erro = "";

            if (!ModelState.IsValid)
            {
                var modelErrors = new List<string>();
                foreach (var modelState in ModelState.Values)
                {
                    foreach (var modelError in modelState.Errors)
                    {
                        modelErrors.Add(modelError.ErrorMessage);
                    }
                }

                erro = modelErrors.First();
            }

            tB_NEWS.dt_icl = DateTime.Now;

            db.Entry(tB_NEWS).State = EntityState.Modified;

            try
            {
                 db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TB_NEWSExists(tB_NEWS.id_new))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }


            var news = db.TB_NEWS.Include("TB_CATEGORIES").SingleOrDefault(n => n.id_new == tB_NEWS.id_new);

            return Ok(news);
        }

        // POST: api/News
        [Route("api/PostNews")]
        [HttpPost()]
        public IHttpActionResult Post(TB_NEWS tB_NEWS)
        {
            string erro = "";

            if (!ModelState.IsValid)
            {
                var modelErrors = new List<string>();
                foreach (var modelState in ModelState.Values)
                {
                    foreach (var modelError in modelState.Errors)
                    {
                        modelErrors.Add(modelError.ErrorMessage);
                    }
                }

                erro = modelErrors.First();

                return BadRequest(erro);

            }
            tB_NEWS.dt_icl = DateTime.Now;

            db.TB_NEWS.Add(tB_NEWS);
            db.SaveChanges();

            var news = db.TB_NEWS.Include("TB_CATEGORIES").SingleOrDefault(n => n.id_new == tB_NEWS.id_new);

            //return Ok( new { id_new = tB_NEWS.id_new });
            return Ok(news);
        }

        // Changed to Get because by default ASP.NET does not handle DELETE, PUT, and PATCH verbs 
        //because the WebDAV handler intercepts them. I've tried to change the web.config but still no handling
        // DELETE: api/News
        [HttpGet()]
        [Route("api/DeleteNews/{id}")]
        public IHttpActionResult Delete(int id)
        {
            TB_NEWS tB_NEWS = db.TB_NEWS.Find(id);
            if (tB_NEWS == null)
            {
                return NotFound();
            }

            db.TB_NEWS.Remove(tB_NEWS);
            db.SaveChanges();

            return Ok(new { id_cat = tB_NEWS.id_cat });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [Route("api/NewExists")]
        private bool TB_NEWSExists(int id)
        {
            return db.TB_NEWS.Count(e => e.id_new == id) > 0;
        }

        [HttpGet()]
        [Route("api/GetNewsByCat/{id}")]
        public IHttpActionResult GetNewsByCat(int id)
        {
            List<TB_NEWS> tB_NEWS = db.TB_NEWS.Include("TB_CATEGORIES").Where(n => n.id_cat == id).ToList();
            if (tB_NEWS == null)
            {
                return NotFound();
            }

            return Ok(tB_NEWS);
        }
    }
}