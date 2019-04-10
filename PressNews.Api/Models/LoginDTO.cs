using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PressNews.Api.Models
{
    public class LoginDTO
    {
        [Required]
        [MaxLength(15)]
        public string Username { get; set; }

        [Required]
        [MinLength(4)]
        [MaxLength(8)]
        public string Password { get; set; }
    }
}