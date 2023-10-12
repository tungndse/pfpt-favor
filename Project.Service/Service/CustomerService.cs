using AutoMapper;
using AutoMapper.QueryableExtensions;
using FFPT_Project.Data.Entity;
using FFPT_Project.Data.UnitOfWork;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using FFPT_Project.Service.Exceptions;
using FFPT_Project.Service.Helpers;


using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.Identity.Client;
using Microsoft.IdentityModel.Tokens;
using Project.Service.DTO.Request;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Net;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static FFPT_Project.Service.Helpers.Enum;

namespace FFPT_Project.Service.Service
{
    public interface ICustomerService
    {
        Task<PagedResults<CustomerResponse>> GetCustomers(CustomerResponse request, PagingRequest paging);
       
        Task<CustomerResponse> CreateCustomer(CreateCustomerRequest request);
        Task<CustomerResponse> GetCustomerByEmail(string email);
        Task<CustomerResponse> UpdateCustomer(int customerId, UpdateCustomerRequest request);
        Task<CustomerResponse> CreateCustomerWeb(CreateCustomerWebRequest request);
        Task<CustomerResponse> FindCustomer(CreateCustomerRequest request);
        Task<CustomerResponse> FindCustomerWeb(CreateCustomerWebRequest request);
    }
    public class CustomerService : ICustomerService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CustomerService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }

        public async Task<CustomerResponse> CreateCustomer(CreateCustomerRequest request)
        {
            try
            {

                var checkProduct = _unitOfWork.Repository<Customer>().Find(x => x.Name.ToLower().Trim().Contains(request.Name.ToLower().Trim()));
                if (checkProduct != null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Category all ready exist!!!!!", request.Name);
                }
                var customer = _mapper.Map<CreateCustomerRequest, Customer>(request);
                customer.Name = request.Name;
                customer.ImageUrl = request.Url;
                customer.Email = "";
                customer.Phone = "";
                await _unitOfWork.Repository<Customer>().InsertAsync(customer);
                await _unitOfWork.CommitAsync();

                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Create Product Error!!!", ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<CustomerResponse> FindCustomer(CreateCustomerRequest request)
        {
            try
            {

                var checkProduct = _unitOfWork.Repository<Customer>().Find(x => x.Name.ToLower().Trim().Contains(request.Name.ToLower().Trim()) && x.ImageUrl == request.Url);
                if (checkProduct == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Category all ready exist!!!!!", request.Name);
                }
                var customer = _mapper.Map<CreateCustomerRequest, Customer>(request);
                customer.Id = checkProduct.Id;
                customer.Name = request.Name;
                customer.ImageUrl = request.Url;
                customer.Email = "";
                customer.Phone = "";
                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Create Product Error!!!", ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<CustomerResponse> FindCustomerWeb(CreateCustomerWebRequest request)
        {
            try
            {

                var checkProduct = _unitOfWork.Repository<Customer>().Find(x => x.Name.ToLower().Trim().Contains(request.Name.ToLower().Trim()));
                if (checkProduct == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Category all ready exist!!!!!", request.Name);
                }
                var customer = _mapper.Map<CreateCustomerWebRequest, Customer>(request);
                customer.Id = checkProduct.Id;
                customer.Name = request.Name;
                customer.ImageUrl = "";
                customer.Email = "";
                customer.Phone = "";
                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Create Product Error!!!", ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<CustomerResponse> CreateCustomerWeb(CreateCustomerWebRequest request)
        {
            try
            {

                var checkProduct = _unitOfWork.Repository<Customer>().Find(x => x.Name.ToLower().Trim().Contains(request.Name.ToLower().Trim()));
                if (checkProduct != null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Category all ready exist!!!!!", request.Name);
                }
                var customer = _mapper.Map<CreateCustomerWebRequest, Customer>(request);
                customer.Name = request.Name;
                customer.ImageUrl = "";
                customer.Email = "";
                customer.Phone = "";
                await _unitOfWork.Repository<Customer>().InsertAsync(customer);
                await _unitOfWork.CommitAsync();

                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Create Product Error!!!", ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<CustomerResponse> GetCustomerByEmail(string email)
        {
            try
            {
                Customer customer = null;
                customer = _unitOfWork.Repository<Customer>().GetAll()
                    .Where(x => x.Email.Contains(email)).FirstOrDefault();

                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<PagedResults<CustomerResponse>> GetCustomers(CustomerResponse request, PagingRequest paging)
        {
            try
            {
                var customers =  _unitOfWork.Repository<Customer>().GetAll()
                                           .ProjectTo<CustomerResponse>(_mapper.ConfigurationProvider)
                                          
                                           .ToList();
                var result = PageHelper<CustomerResponse>.Paging(customers, paging.Page, paging.PageSize);
                return result;
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Get customer list error!!!!!", ex.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

      

        public async Task<CustomerResponse> UpdateCustomer(int customerId, UpdateCustomerRequest request)
        {
            try
            {
                Customer customer = null;
                customer = _unitOfWork.Repository<Customer>()
                    .Find(c => c.Id == customerId);

                if (customer == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Not found customer with id", customerId.ToString());
                }

                _mapper.Map<UpdateCustomerRequest, Customer>(request, customer);

                await _unitOfWork.Repository<Customer>().UpdateDetached(customer);
                await _unitOfWork.CommitAsync();
                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Update customer error!!!!!", ex.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

    }
}
