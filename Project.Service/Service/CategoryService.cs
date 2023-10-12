using AutoMapper;
using AutoMapper.QueryableExtensions;
using FFPT_Project.Data.Entity;
using FFPT_Project.Data.UnitOfWork;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Exceptions;
using FFPT_Project.Service.Helpers;
using Project.Service.DTO.Request;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using static FFPT_Project.Service.Helpers.Enum;

namespace FFPT_Project.Service.Service
{
    public interface ICategoryService
    {
        Task<CategoryResponse> CreateCatagory(CreateCatagoryRequest request);
        Task<PagedResults<CategoryResponse>> GetListCategory(PagingRequest paging);

        Task<CategoryResponse> DeleteCatagory(int productId);

        Task<CategoryResponse> UpdateCatagory(int productId, UpdateCatagoryRequest request);
    }
    public class CategoryService : ICategoryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CategoryService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }

        public async Task<PagedResults<CategoryResponse>> GetListCategory(PagingRequest paging)
        {
            try
            {
                var list = _unitOfWork.Repository<Category>().GetAll()
                                .ProjectTo<CategoryResponse>(_mapper.ConfigurationProvider)
                                .ToList();
                List<CategoryResponse> list1 = new List<CategoryResponse>();

                foreach (var item in list)
                {
                    if(item.Status == 1)
                    {
                        list1.Add(item);    
                    }

                }
                var result = PageHelper<CategoryResponse>.Paging(list1, paging.Page, paging.PageSize);

                return result;
            }
            catch(CrudException e)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Get category list error!!!!!", e.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
        public async Task<CategoryResponse> CreateCatagory(CreateCatagoryRequest request)
        {
            try
            {
                var checkProduct = _unitOfWork.Repository<Category>().Find(x => x.CategoryName.ToLower().Trim().Contains(request.CategoryName.ToLower().Trim()) );
                if (checkProduct != null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Category all ready exist!!!!!", request.CategoryName);
                }
                var product = _mapper.Map<CreateCatagoryRequest, Category>(request);

                product.Status =request.Status;
                product.CreateAt = DateTime.Now;
                product.CategoryName = request.CategoryName;
                product.Description = request.Description;
                product.UpdateAt = null;
                await _unitOfWork.Repository<Category>().InsertAsync(product);
                await _unitOfWork.CommitAsync();

                return _mapper.Map<Category, CategoryResponse>(product);
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
        public async Task<CategoryResponse> DeleteCatagory(int productId)
        {
            try
            {
                Category product = null;
                product = _unitOfWork.Repository<Category>()
                    .Find(p => p.Id == productId);
                if (product == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Not found Catagory with id","a");
                }
                product.Status = 2;
                product.UpdateAt = DateTime.Now;
                await _unitOfWork.Repository<Category>().UpdateDetached(product);
                await _unitOfWork.CommitAsync();
                return _mapper.Map<Category, CategoryResponse>(product);
            }
            catch (Exception ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Update product error!!!!", ex?.Message);
            }
        }
        public async Task<CategoryResponse> UpdateCatagory(int productId, UpdateCatagoryRequest request)
        {
            try
            {
                Category product = null;
                product = _unitOfWork.Repository<Category>()
                    .Find(p => p.Id == productId);
                if (product == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Not found Category with id", productId.ToString());
                }
                _mapper.Map<UpdateCatagoryRequest, Category>(request, product);        
                product.UpdateAt = DateTime.Now;
                await _unitOfWork.Repository<Category>().UpdateDetached(product);
                await _unitOfWork.CommitAsync();
                return _mapper.Map<Category, CategoryResponse>(product);
            }
            catch (Exception ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Update product error!!!!", ex?.Message);
            }
        }
    }
}
