using AutoMapper;
using AutoMapper.QueryableExtensions;
using FFPT_Project.Data.Entity;
using FFPT_Project.Data.UnitOfWork;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Exceptions;
using FFPT_Project.Service.Helpers;
using Project.Data.Entity;
using Project.Service.DTO.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Project.Service.Service
{
    public interface IBlogService
    {
        Task<PagedResults<Blog>> GetListBlog(PagingRequest paging);
        Task<Blog> CreateBlog(Blog request);
        Task<Blog> UpdateBlog(int productId);
    }
    public class BlogService : IBlogService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public BlogService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task<PagedResults<Blog>> GetListBlog(PagingRequest paging)
        {
            try
            {
                var list = _unitOfWork.Repository<Blog>().GetAll()
                                .ProjectTo<Blog>(_mapper.ConfigurationProvider)
                                .ToList();
                List<Blog> list1 = new List<Blog>();

                foreach (var item in list)
                {
                    if (item.Status.Contains("1"))
                    {
                        list1.Add(item);
                    }

                }
                var result = PageHelper<Blog>.Paging(list1, paging.Page, paging.PageSize);

                return result;
            }
            catch (CrudException e)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Get blog list error!!!!!", e.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public async Task<Blog> CreateBlog(Blog request)
        {
            try
            {
                var blog = new Blog();
                blog.Tittle = request.Tittle;
                blog.Date = DateTime.Now;
                blog.Status = request.Status;
                blog.Type = request.Type;
                blog.Short = request.Short;
                blog.Long = request.Long;
                await _unitOfWork.Repository<Blog>().InsertAsync(blog);
                await _unitOfWork.CommitAsync();

                return blog;
            }
            catch (CrudException ex)
            {
                throw new CrudException(ex.Status, ex.Message, ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
        public async Task<Blog> UpdateBlog(int productId)
        {
            try
            {
                Blog product = null;
                product = _unitOfWork.Repository<Blog>()
                    .Find(p => p.Id == productId);
                if (product == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Not found Blog with id", "a");
                }
                product.Status = "2";
                product.Date = DateTime.Now;
                await _unitOfWork.Repository<Blog>().UpdateDetached(product);
                await _unitOfWork.CommitAsync();
                return product;
            }
            catch (Exception ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Update blog error!!!!", ex?.Message);
            }
        }
    }
}
