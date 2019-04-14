using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using PressNews.Api.Models;

namespace PressNews.Api.Controllers
{
    public class CategoriesController : ApiController
    {
        private db_pressnewsEntities1 db = new db_pressnewsEntities1();

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
            
            TB_CATEGORIES tB_CATEGORIES = db.TB_CATEGORIES.Find(id);
            
            if (tB_CATEGORIES == null)
            {
                return NotFound();
            }

            return Ok(tB_CATEGORIES);
        }
       
        [HttpPost()]
        public string UploadFile()
        {
            string message = "";

            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                // Get the uploaded image from the Files collection
                var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];

                if (httpPostedFile != null)
                {
                    // Validate the uploaded image(optional)

                    
                    // Get the complete file path
                    var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/images"), httpPostedFile.FileName);

                    // Save the uploaded file to "UploadedFiles" folder
                    try
                    {
                        httpPostedFile.SaveAs(fileSavePath);
                        message = "Ok"; ;
                        return message;
                    }
                    catch
                    {
                        message = "error"; ;
                        return message;
                    }

                }
            }

            message = "Ok"; ;
            return message;
        }

        // PUT: api/Categories/5
        [Route("api/UpdateCategory")]
        [HttpPost()]
        public IHttpActionResult Put(TB_CATEGORIES tB_CATEGORIES)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entry(tB_CATEGORIES).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TB_CATEGORIESExists(tB_CATEGORIES.id_cat))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(tB_CATEGORIES);
        }

       
        [Route("api/PostCategory")]
        [HttpPost()]
        public IHttpActionResult Post(TB_CATEGORIES tB_CATEGORIES)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            tB_CATEGORIES.dt_icl = DateTime.Now;

            db.TB_CATEGORIES.Add(tB_CATEGORIES);
            db.SaveChanges();

            return Ok(new { id_cat = tB_CATEGORIES.id_cat });
        }

        // Changed to Get because by default ASP.NET does not handle DELETE, PUT, and PATCH verbs 
        //because the WebDAV handler intercepts them. I've tried to change the web.config but still no handling
        // DELETE: api/Categories/5
        [HttpGet()]
        [Route("api/DeleteCategory/{id}")]
        public IHttpActionResult Delete(int id)
        {
            TB_CATEGORIES tB_CATEGORIES = db.TB_CATEGORIES.Find(id);
            if (tB_CATEGORIES == null)
            {
                return NotFound();
            }

            db.TB_CATEGORIES.Remove(tB_CATEGORIES);
            db.SaveChanges();

            return Ok(new { id_cat = tB_CATEGORIES.id_cat }); ;
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