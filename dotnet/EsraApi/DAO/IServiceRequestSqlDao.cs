using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.DAO
{
    interface IServiceRequestSqlDao
    {
        IList<ServiceRequest> GetServiceRequests();
        ServiceRequest GetServiceRequestById(int id);
        ServiceRequest GetServiceRequestByType(string type);
        ServiceRequest CreateServiceRequest(ServiceRequest serviceRequest);
        ServiceRequest UpdateServiceRequestr(ServiceRequest seriviceRequest);
        bool DeleteServiceRequest(int id);
    }
}
