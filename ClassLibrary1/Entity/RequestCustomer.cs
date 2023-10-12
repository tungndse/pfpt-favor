using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Project.Data.Entity
{
    public partial class RequestCustomer
    {
        [Required]
        public int Id { get; set; }
        [MaxLength(255)]
        public string Name { get; set; }
        [MaxLength(255)]
        public string Phone { get; set; }
        [MaxLength(255)]
        public string Adress { get; set; }
        public DateTime Date { get; set; }
        [MaxLength(255)]
        public string Material { get; set; }
        [MaxLength(255)]
        public string Color { get; set; }
        [MaxLength(255)]
        public string Prices { get; set; }
        [MaxLength(255)]
        public string Description { get; set; }
        [MaxLength(255)]
        public string Img { get; set; }
    }
}
