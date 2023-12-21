using System.Collections.Generic;
using EsraApi.Models;

namespace EsraApi.DAO
{
    public interface IUserDao
    {
        IList<User> GetUsers();
        User GetUserById(int id);
        User GetUserByUsername(string username);
        User CreateUser(string username, string password, string role);
    }
}
