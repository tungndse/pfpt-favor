using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Data.Entity
{
    public partial class Blog
    {
        
        public int Id { get; set; }
        [MaxLength(255)]
        public string Tittle { get; set; }
        public DateTime Date { get; set; }
        [MaxLength(255)]
        public string Type { get; set; }
        [MaxLength(255)]
        public string Status { get; set; }
        [MaxLength(255)]
        public string Short { get; set; }
        [MaxLength(int.MaxValue)]
        public string Long { get; set; }
    }
}
