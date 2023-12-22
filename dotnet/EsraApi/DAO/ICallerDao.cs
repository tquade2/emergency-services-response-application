using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.DAO
{
    public interface ICallerDao
    {
        IList<Caller> GetCallers();
        Caller GetCallerById(int id);
        Caller CreateCaller(Caller caller);
        Caller UpdateCaller(Caller caller);
        bool DeleteCaller(int id);
    }
}
