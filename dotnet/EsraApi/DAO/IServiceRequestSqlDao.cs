using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.DAO
{
    public interface IServiceRequestSqlDao
    {
        IList<ServiceRequest> GetServiceRequests();
        ServiceRequest GetServiceRequestById(int id);
        ServiceRequest CreateServiceRequest(ServiceRequest serviceRequest);
        ServiceRequest UpdateServiceRequest(ServiceRequest seriviceRequest);
        bool DeleteServiceRequest(int id);
    }
}
