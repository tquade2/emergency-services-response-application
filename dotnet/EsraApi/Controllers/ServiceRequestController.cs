using Microsoft.AspNetCore.Mvc;
using EsraApi.Models;
using EsraApi.DAO;
using EsraApi.Exceptions;
using EsraApi.Security;
using Microsoft.AspNetCore.Identity;

namespace EsraApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ServiceRequestController : ControllerBase
    {
        private readonly IServiceRequestDao serviceRequestDao;

        public ServiceRequestController(IServiceRequestDao serviceRequestDao)
        {
            this.serviceRequestDao = serviceRequestDao;
        }

        [HttpGet]
        public ActionResult<List<ServiceRequest>> Get()
        {
            return Ok(serviceRequestDao.GetServiceRequests());
        }

        [HttpGet("{id}")]
        public ActionResult<ServiceRequest> GetById(int id)
        {
            return Ok(serviceRequestDao.GetServiceRequestById(id));
        }

        [HttpPost]
        public ActionResult<ServiceRequest> Post(ServiceRequest serviceRequest)
        {
            ServiceRequest newServiceRequest = serviceRequestDao.CreateServiceRequest(serviceRequest);

            if (newServiceRequest.Id == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(serviceRequest);
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(ServiceRequest serviceRequest)
        {
            ServiceRequest newServiceRequest = serviceRequestDao.UpdateServiceRequest(serviceRequest);

            if (newServiceRequest.Id == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(newServiceRequest);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult<ServiceRequest> Delete(int id)
        {
            bool result = serviceRequestDao.DeleteServiceRequest(id);

            if (result == true)
            {
                return NoContent();
            }
            else
            {
                return NotFound();
            }
        }
    }
}
