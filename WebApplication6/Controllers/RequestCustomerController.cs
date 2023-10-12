using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using Microsoft.AspNetCore.Mvc;
using Project.Data.Entity;
using Project.Service.Service;
using System.Threading.Tasks;
using System;
using Azure.Core;

namespace WebApplication6.Controllers
{
    [Route(FFPT_Project.API.Helpers.SettingVersionApi.ApiVersion)]
    [ApiController]
    public class RequestCustomerController : Controller
    {
        private readonly IRequestCustomerService _requestCustomerService;
        public RequestCustomerController(IRequestCustomerService requestCustomerService)
        {
            _requestCustomerService = requestCustomerService;
        }
        /// <summary>
        /// Get List Category
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet("GetRequestCustomer")]
        public async Task<ActionResult<PagedResults<RequestCustomer>>> GetRequestCustomer([FromQuery] PagingRequest paging)
        {
            try
            {
                var rs = await _requestCustomerService.GetRequestCustomer(paging);
                return Ok(rs);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpPost("CreateRequestCustomer")]
        public async Task<ActionResult<RequestCustomer>> CreateRequestCustomer([FromBody] RequestCustomer request)
        {
            var rs = await _requestCustomerService.CreateRequestCustomer(request);
            return Ok(rs);
        }
    }
}
