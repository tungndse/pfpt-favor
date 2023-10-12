using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Service;
using Microsoft.AspNetCore.Mvc;
using Project.Data.Entity;
using Project.Service.DTO.Request;
using Project.Service.Service;
using System;
using System.Threading.Tasks;

namespace WebApplication6.Controllers
{
    [Route(FFPT_Project.API.Helpers.SettingVersionApi.ApiVersion)]
    [ApiController]
    public class BlogController : Controller
    {
        private readonly IBlogService _blogService;
        public BlogController(IBlogService blogService)
        {
            _blogService = blogService;
        }

        /// <summary>
        /// Get List Category
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet("GetListBlog")]
        public async Task<ActionResult<PagedResults<Blog>>> GetListBlog([FromQuery] PagingRequest paging)
        {
            try
            {
                var rs = await _blogService.GetListBlog(paging);
                return Ok(rs);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpPost("CreateBlog")]
        public async Task<ActionResult<Blog>> CreateBlog([FromBody] Blog request)
        {
            var rs = await _blogService.CreateBlog( request);
            return Ok(rs);
        }
        [HttpDelete("UpdateBlog")]
        public async Task<ActionResult<Blog>> UpdateProduct([FromQuery] int productId)
        {
            var rs = await _blogService.UpdateBlog(productId);
            return Ok(rs);
        }
    }
}
