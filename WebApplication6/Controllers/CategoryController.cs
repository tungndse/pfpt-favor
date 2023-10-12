using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Service;
using Microsoft.AspNetCore.Mvc;
using Project.Service.DTO.Request;
using System;
using System.Threading.Tasks;

namespace FFPT_Project.API.Controllers
{
    [Route(Helpers.SettingVersionApi.ApiVersion)]
    [ApiController]
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }


        /// <summary>
        /// Get List Category
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet("GetListCategory")]
        public async Task<ActionResult<PagedResults<CategoryResponse>>> GetListCategory([FromQuery] PagingRequest paging)
        {
            try
            {
                var rs = await _categoryService.GetListCategory(paging);
                return Ok(rs);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        [HttpPost("CreateCategory")]
        public async Task<ActionResult<CategoryResponse>> CreateCatagory([FromBody] CreateCatagoryRequest request)
        {
            var rs = await _categoryService.CreateCatagory(request);
            return Ok(rs);
        }
        [HttpDelete("DeleteCategory")]
        public async Task<ActionResult<CategoryResponse>> UpdateProduct([FromQuery] int categoryId)
        {
            var rs = await _categoryService.DeleteCatagory(categoryId);
            return Ok(rs);
        }
        [HttpPut("UpdateProduct")]
        public async Task<ActionResult<CategoryResponse>> UpdateProduct([FromQuery] int categoryId, [FromBody] UpdateCatagoryRequest request)
        {
            var rs = await _categoryService.UpdateCatagory(categoryId, request);
            return Ok(rs);
        }
    }
}
