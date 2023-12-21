using Microsoft.AspNetCore.Mvc;
using EsraApi.DAO;
using EsraApi.Exceptions;
using EsraApi.Models;
using EsraApi.Security;
using Microsoft.AspNetCore.Identity;

namespace EsraApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CallerController : ControllerBase
    {
        private readonly ICallerSqlDao callerDao;

        public CallerController(ICallerSqlDao callerDao)
        {
            this.callerDao = callerDao;
        }

        [HttpGet()]
        public ActionResult<List<Caller>> GetCallers()
        {
            return Ok(callerDao.GetCallers());
        }

        [HttpGet("{id}")]
        public ActionResult<Caller> GetCallerById(int id)
        {
            return Ok(callerDao.GetCallerById(id));
        }

        [HttpGet("byName/{name}")] // TODO: figure out how to full name to work with this
        public ActionResult<Caller> GetCallerByName(string name)
        {
            return Ok(callerDao.GetCallerByName(name));
        }

        [HttpPost("createCaller")]
        public IActionResult CreateCaller(Caller caller)
        {
            Caller newCaller = callerDao.CreateCaller(caller);

            if (caller.CallerId == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(caller);
            }
        }

        [HttpPut("{id}")]
        public ActionResult<Caller> UpdateCaller(Caller updatedCaller)
        {
            Caller newCaller = callerDao.UpdateCaller(updatedCaller);

            if (newCaller.CallerId == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(newCaller);
            }
        }
        [HttpDelete("{id}")]
        public ActionResult DeleteCaller(int id)
        {
            bool result = callerDao.DeleteCaller(id);

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
