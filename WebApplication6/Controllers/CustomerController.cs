﻿using FFPT_Project.Data.Entity;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Service;
using Google.Apis.Auth;
using Google.Apis.Auth.AspNetCore3;
using Google.Apis.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Project.Service.DTO.Request;
using System;
using System.Threading.Tasks;

namespace FFPT_Project.API.Controllers
{
    [Route(Helpers.SettingVersionApi.ApiVersion)]
    [ApiController]
    public class CustomerController : Controller
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        /// <summary>
        /// Get Customer
        /// </summary>
        /// <param name="request"></param>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<PagedResults<CustomerResponse>>> GetCustomers([FromQuery] CustomerResponse request, [FromQuery] PagingRequest paging)
        {
            var rs = await _customerService.GetCustomers(request, paging);
            return Ok(rs);
        }
        [HttpGet("FindCustomer")]
        public async Task<ActionResult<CustomerResponse>> FindCustomer([FromQuery] CreateCustomerRequest request)
        {
            var rs = await _customerService.FindCustomer(request);
            return Ok(rs);
        }
        [HttpGet("FindCustomerWeb")]
        public async Task<ActionResult<CustomerResponse>> FindCustomerWeb([FromQuery] CreateCustomerWebRequest request)
        {
            var rs = await _customerService.FindCustomerWeb(request);
            return Ok(rs);
        }

        /// <summary>
        /// Update Customer
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut("{id}")]
        public async Task<ActionResult<CustomerResponse>> UpdateCustomer(int id, [FromBody] UpdateCustomerRequest request)
        {
            var rs = await _customerService.UpdateCustomer(id, request);
            return Ok(rs);
        }
        [HttpPost("CreateCustomer")]
        public async Task<ActionResult<CustomerResponse>> CreateCustomer([FromBody] CreateCustomerRequest request)
        {
            var rs = await _customerService.CreateCustomer(request);
            return Ok(rs);
        }
        [HttpPost("CreateCustomerWeb")]
        public async Task<ActionResult<CustomerResponse>> CreateCustomerWeb([FromBody] CreateCustomerWebRequest request)
        {
            var rs = await _customerService.CreateCustomerWeb(request);
            return Ok(rs);
        }
        /// <summary>
        /// Login
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        /// [AllowAnonymous]

    }
}
