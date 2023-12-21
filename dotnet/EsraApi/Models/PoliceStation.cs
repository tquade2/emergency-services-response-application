namespace EsraApi.Models
{
    public class PoliceStation
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public int ResponderCount { get; set; }
        public int InmateCapacity { get; set; }
    }
}
