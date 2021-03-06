﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using PressNews.Api.Models;

namespace PressNews.Api.Controllers
{
    
    public class AccountController : ApiController
    {
        private db_pressnewsEntities1 db = new db_pressnewsEntities1();

      
        [ResponseType(typeof(TB_USERS))]
        [HttpPost]
        [Route("api/Account")]
        public IHttpActionResult Login(LoginDTO login)
        {
           

            if (db.TB_USERS.Any(e=> e.nm_lgnusr == login.Username && e.ds_pwdusr == login.Password))
            {
                return StatusCode(HttpStatusCode.NoContent);
            }

            return Unauthorized();
        }


        // POST: api/Users
        [ResponseType(typeof(TB_USERS))]
        [HttpPost]
        [Route("api/Register")]
        public IHttpActionResult Register(TB_USERS tB_USERS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            tB_USERS.dt_icl = DateTime.Now;

            db.TB_USERS.Add(tB_USERS);
            db.SaveChanges();

            return StatusCode(HttpStatusCode.NoContent);
        }

        // DELETE: api/Users/5
        [ResponseType(typeof(TB_USERS))]
        public IHttpActionResult DeleteTB_USERS(int id)
        {
            TB_USERS tB_USERS = db.TB_USERS.Find(id);
            if (tB_USERS == null)
            {
                return NotFound();
            }

            db.TB_USERS.Remove(tB_USERS);
            db.SaveChanges();

            return Ok(tB_USERS);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TB_USERSExists(int id)
        {
            return db.TB_USERS.Count(e => e.id_usr == id) > 0;
        }
    }
}