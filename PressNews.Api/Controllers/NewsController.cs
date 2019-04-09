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

        [ResponseType(typeof(IEnumerable<TB_NEWS>))]
        [Route("api/GetNews")]
        // GET: api/News
        public IQueryable<TB_NEWS> GetTB_NEWS()
        {
            return db.TB_NEWS;
        }

        // GET: api/News/5
        [ResponseType(typeof(TB_NEWS))]
        [Route("api/GetNew")]
        public async Task<IHttpActionResult> GetTB_NEWS(int id)
        {
            TB_NEWS tB_NEWS = await db.TB_NEWS.FindAsync(id);
            if (tB_NEWS == null)
            {
                return NotFound();
            }

            return Ok(tB_NEWS);
        }

        // PUT: api/News/5
        [ResponseType(typeof(void))]
        [Route("api/PutNew")]
        public async Task<IHttpActionResult> PutTB_NEWS(int id, TB_NEWS tB_NEWS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tB_NEWS.id_new)
            {
                return BadRequest();
            }

            db.Entry(tB_NEWS).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TB_NEWSExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/News
        [ResponseType(typeof(TB_NEWS))]
        [Route("api/PostNew")]
        public async Task<IHttpActionResult> PostTB_NEWS(TB_NEWS tB_NEWS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TB_NEWS.Add(tB_NEWS);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = tB_NEWS.id_new }, tB_NEWS);
        }

        // DELETE: api/News/5
        [ResponseType(typeof(TB_NEWS))]
        [Route("api/DeleteNew")]
        public async Task<IHttpActionResult> DeleteTB_NEWS(int id)
        {
            TB_NEWS tB_NEWS = await db.TB_NEWS.FindAsync(id);
            if (tB_NEWS == null)
            {
                return NotFound();
            }

            db.TB_NEWS.Remove(tB_NEWS);
            await db.SaveChangesAsync();

            return Ok(tB_NEWS);
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
    }
}