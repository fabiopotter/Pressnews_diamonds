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
    public class CategoriesController : ApiController
    {
        private db_pressnewsEntities1 db = new db_pressnewsEntities1();

        [ResponseType(typeof(IEnumerable<TB_CATEGORIES>))]
        [Route("api/GetCategories")]
        [HttpGet]
        // GET: api/Categories
        public IEnumerable<TB_CATEGORIES> GetAll()
        {
            return db.TB_CATEGORIES.ToList();
        }


        // GET: api/Categories/5
        [HttpGet()]
        public IHttpActionResult Get(int id)
        {
            List<TB_CATEGORIES> list = db.TB_CATEGORIES.ToList();
            TB_CATEGORIES tB_CATEGORIES;

            tB_CATEGORIES = list.Find(c => c.id_cat == id);
            if (tB_CATEGORIES == null)
            {
                return NotFound();
            }

            return Ok(tB_CATEGORIES);
        }

        // PUT: api/Categories/5
        [Route("api/PutCategory/{id}")]
        [HttpPut()]
        public IHttpActionResult Put(int id, TB_CATEGORIES tB_CATEGORIES)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tB_CATEGORIES.id_cat)
            {
                return BadRequest();
            }

            db.Entry(tB_CATEGORIES).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TB_CATEGORIESExists(id))
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

        // POST: api/Categories
        //[HttpPost()]
        //public IHttpActionResult Post(TB_CATEGORIES tB_CATEGORIES)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.TB_CATEGORIES.Add(tB_CATEGORIES);
        //    db.SaveChanges();

        //    return StatusCode(HttpStatusCode.NoContent);
        //}
        [Route("api/PostCategory")]
        [HttpPost()]
        public IHttpActionResult Post(TB_CATEGORIES tB_CATEGORIES)
        {

            int newId = 0;
            List<TB_CATEGORIES> list = db.TB_CATEGORIES.ToList();

            // Get the last id
            newId = list.Max(c => c.id_cat);
            newId++;
            tB_CATEGORIES.id_cat = newId;
           
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TB_CATEGORIES.Add(tB_CATEGORIES);
            db.SaveChanges();

            return StatusCode(HttpStatusCode.NoContent);
        }

        private bool Add(TB_CATEGORIES tB_CATEGORIES)
        {
            int newId = 0;
            List<TB_CATEGORIES> list = db.TB_CATEGORIES.ToList();

            // Get the last id
            newId = list.Max(c => c.id_cat);
            newId++;
            tB_CATEGORIES.id_cat = newId;
            // Add to list
            list.Add(tB_CATEGORIES);

            // TODO: Change this to false to test the NotFound()
            return true;
        }


        // DELETE: api/Categories/5
        [ResponseType(typeof(TB_CATEGORIES))]
        [Route("api/DeleteCategory")]
        public async Task<IHttpActionResult> DeleteTB_CATEGORIES(int id)
        {
            TB_CATEGORIES tB_CATEGORIES = await db.TB_CATEGORIES.FindAsync(id);
            if (tB_CATEGORIES == null)
            {
                return NotFound();
            }

            db.TB_CATEGORIES.Remove(tB_CATEGORIES);
            await db.SaveChangesAsync();

            return StatusCode(HttpStatusCode.NoContent); ;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [Route("api/CategoryExists")]
        private bool TB_CATEGORIESExists(int id)
        {
            return db.TB_CATEGORIES.Count(e => e.id_cat == id) > 0;
        }
    }
}