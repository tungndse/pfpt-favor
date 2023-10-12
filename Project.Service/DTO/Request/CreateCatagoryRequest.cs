using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Service.DTO.Request
{
    public class CreateCatagoryRequest
    {
        public string CategoryName { get; set; }
        public int? Status { get; set; }
        public string? Description { get; set; }
    }
}
