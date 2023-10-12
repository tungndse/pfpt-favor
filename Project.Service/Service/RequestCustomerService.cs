using AutoMapper;
using AutoMapper.QueryableExtensions;
using Azure.Core;
using FFPT_Project.Data.Entity;
using FFPT_Project.Data.UnitOfWork;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Exceptions;
using FFPT_Project.Service.Helpers;
using Project.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Project.Service.Service
{
    public interface IRequestCustomerService
    {
        Task<PagedResults<RequestCustomer>> GetRequestCustomer(PagingRequest paging);

        Task<RequestCustomer> CreateRequestCustomer(RequestCustomer request);

    }
    public class RequestCustomerService : IRequestCustomerService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public RequestCustomerService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        public async Task<RequestCustomer> CreateRequestCustomer(RequestCustomer request)
        {
            try
            {
                var recustomer = new RequestCustomer();
                recustomer.Name = request.Name;
                recustomer.Date = DateTime.Now;
                recustomer.Adress = request.Adress;
                recustomer.Phone = request.Phone;
                recustomer.Material = request.Material;
                recustomer.Color = request.Color;
                recustomer.Prices = request.Prices;
                recustomer.Description = request.Description;
                recustomer.Img = request.Img;
                await _unitOfWork.Repository<RequestCustomer>().InsertAsync(recustomer);
                await _unitOfWork.CommitAsync();

                return recustomer;
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

        public async Task<PagedResults<RequestCustomer>> GetRequestCustomer(PagingRequest paging)
        {
            try
            {
                var list = _unitOfWork.Repository<RequestCustomer>().GetAll()
                                .ProjectTo<RequestCustomer>(_mapper.ConfigurationProvider)
                                .ToList();
              

                
                var result = PageHelper<RequestCustomer>.Paging(list, paging.Page, paging.PageSize);

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
    }
}
