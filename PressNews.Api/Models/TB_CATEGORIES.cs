//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PressNews.Api.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_CATEGORIES
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TB_CATEGORIES()
        {
            this.TB_NEWS = new HashSet<TB_NEWS>();
        }
    
        public int id_cat { get; set; }
        public string nm_cat { get; set; }
        public byte[] ds_imgcat { get; set; }
        public string fl_atv { get; set; }
        public System.DateTime dt_icl { get; set; }
        public int cd_usricl { get; set; }
        public Nullable<System.DateTime> dt_dencat { get; set; }
        public int cd_usrden { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TB_NEWS> TB_NEWS { get; set; }
    }
}