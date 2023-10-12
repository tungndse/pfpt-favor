﻿using static FFPT_Project.Service.Helpers.SortType;

namespace FFPT_Project.Service.DTO.Request
{
    public class PagingRequest
    {
        public int Page { get; set; } = 1;
        public int PageSize { get; set; } = 30;
        public string KeySearch { get; set; } = "";
        public string SearchBy { get; set; } = "";
        public SortOrder SortType { get; set; } = SortOrder.Ascending;
        public string ColName { get; set; } = "Id";
    }
}