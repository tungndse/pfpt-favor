using FFPT_Project.Service.Commons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project.Service.DTO.Request
{
    public class CreateCustomerWebRequest
    {
        [String]
        public string Name { get; set; }
    }
}
