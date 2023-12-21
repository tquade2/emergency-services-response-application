using System.Net;
using System;

namespace EsraApi.Models
{
    public class ServiceRequest
    {
        public int Id { get; set; }
        public int CallerId { get; set; }
        public DateTime DateTime { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string Priority { get; set; }
        public string Description { get; set; }
    }
}
