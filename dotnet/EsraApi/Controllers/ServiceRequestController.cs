using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.Controllers
{
  [Route("[controller]")]
  [ApiController]
  public class ServiceRequestController : ControllerBase
  {
    private readonly IServiceRequestSqlDao serviceRequestDao;

    public ServiceRequestController(IServiceRequestSqlDao serviceRequestDao)
    {
      this.serviceRequestDao = serviceRequestDao;
    }

    [HttpGet()]
    public ActionResult<List<ServiceRequest>> GetServiceRequests()
    {
      return Ok(serviceRequestDao.GetServiceRequests());
    }

    [HttpGet("{id}")]
    public ActionResult<ServiceRequest> GetServiceRequestById(int id)
    {
      return Ok(serviceRequestDao.GetServiceRequestById(id));
    }

    [HttpGet("byType/{type}")]
    public ActionResult<List<ServiceRequest>> GetServiceRequestByType(string type)
    {
      return Ok(serviceRequestDao.GetServiceRequestByType(type));
    }

    [HttpPost]
    public ActionResult<ServiceRequest> CreateServiceRequest(ServiceRequest serviceRequest)
    {
      ServiceRequest serviceRequest = serviceRequestDao.CreateServiceRequest(serviceRequest);

      if (serviceRequest.Id == 0)
      {
        return BadRequest();
      }
      else
      {
        return Ok(serviceRequest);
      }
    }

    [HttpPut("{id}")]
    public IActionResult UpdateServiceRequest(ServiceRequest serviceRequest)
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
    public ActionResult<ServiceRequest> DeleteServiceRequest(int id)
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
