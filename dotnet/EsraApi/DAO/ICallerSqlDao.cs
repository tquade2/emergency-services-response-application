using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.DAO
{
    interface ICallerSqlDao
    {
        IList<Caller> GetCallers();
        Caller GetCallerById(int id);
        Caller GetCallerByName(string firstName, string lastName);
        Caller CreateCaller(Caller caller);
        Caller UpdateCaller(Caller caller);
        bool DeleteCaller(int id);
    }
}
