namespace EsraApi.Models
{
    public class FireStation
    {
        public int FireStationId { get; set; }
        public string Name { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int ResponderCount { get; set; }
    }
}
