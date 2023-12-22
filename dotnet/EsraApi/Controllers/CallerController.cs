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
        private readonly ICallerDao callerDao;

        public CallerController(ICallerDao callerDao)
        {
            this.callerDao = callerDao;
        }

        [HttpGet]
        public ActionResult<List<Caller>> Get()
        {
            return Ok(callerDao.GetCallers());
        }

        [HttpGet("{id}")]
        public ActionResult<Caller> GetById(int id)
        {
            return Ok(callerDao.GetCallerById(id));
        }

        [HttpPost]
        public ActionResult Post(Caller caller)
        {
            Caller newCaller = callerDao.CreateCaller(caller);

            if (newCaller.Id == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(newCaller);
            }
        }

        [HttpPut("{id}")]
        public ActionResult<Caller> Put(int id, Caller caller)
        {
            Caller newCaller = callerDao.UpdateCaller(caller);

            if (newCaller.Id == 0)
            {
                return BadRequest();
            }
            else
            {
                return Ok(newCaller);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
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
