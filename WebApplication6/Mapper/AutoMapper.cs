using AutoMapper;
using FFPT_Project.Data.Entity;
using FFPT_Project.Service.DTO.Request;
using FFPT_Project.Service.DTO.Response;
using Project.Data.Entity;
using Project.Service.DTO.Request;
using System.Drawing;

namespace FFPT_Project.API.Mapper
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {           
            #region Category
            CreateMap<Category, CategoryResponse>().ReverseMap();
            CreateMap<CreateCatagoryRequest, Category>().ReverseMap();
            CreateMap<UpdateCatagoryRequest, Category>().ReverseMap();
            #endregion

            #region Customer
            CreateMap<Customer, CustomerResponse>().ReverseMap();
            CreateMap<CreateCustomerRequest, Customer>();
            CreateMap<UpdateCustomerRequest, Customer>();
            CreateMap<CreateCustomerWebRequest, Customer>();
            #endregion

            #region Menu
            CreateMap<Menu, MenuResponse>().ReverseMap();
            CreateMap<CreateMenuRequest, Menu>();
            CreateMap<UpdateMenuRequest, Menu>();
          
            #endregion

            #region Order
            CreateMap<Order, OrderResponse>().ReverseMap();
            CreateMap<OrderDetail, OrderDetailResponse>().ReverseMap();
            CreateMap<OrderDetailRequest, OrderDetail>();
            CreateMap<CreateOrderRequest, Order>();
            CreateMap<CreateOrderRequest, Order>()
            .ForMember(c => c.Customer, option => option.Ignore())
            .ForMember(c => c.Room, option => option.Ignore());
            #endregion

            #region Product
            CreateMap<Product, ProductResponse>().ReverseMap();
            CreateMap<CreateProductRequest, Product>();
            CreateMap<UpdateProductRequest, Product>();
            #endregion

            #region ProductInMenu
            CreateMap<ProductInMenu, ProductInMenuResponse>().ReverseMap();
            CreateMap<CreateProductInMenuRequest, ProductInMenu>();
            CreateMap<UpdateProductInMenuRequest, ProductInMenu>();
            #endregion

            #region settings
            CreateMap<TimeSlot, TimeslotResponse>().ReverseMap();
            #endregion
            #region Blog
            CreateMap<Blog, Blog>().ReverseMap();
            #endregion
            #region RequestCustomer
            CreateMap<RequestCustomer, RequestCustomer>().ReverseMap();
            #endregion
        }
    }
}