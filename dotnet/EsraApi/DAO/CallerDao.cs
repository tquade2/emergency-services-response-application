using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using EsraApi.Exceptions;
using EsraApi.Models;
using EsraApi.Security;
using EsraApi.Security.Models;

namespace EsraApi.DAO
{
    public class CallerDao : ICallerDao
    {
        private readonly string connectionString;

        public CallerDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public IList<Caller> GetCallers()
        {
            IList<Caller> callers = new List<Caller>();

            string sql = "SELECT * FROM callers";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Caller caller = MapRowToCaller(reader);
                        callers.Add(caller);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return callers;
        }

        public Caller GetCallerById(int callerId)
        {
            Caller caller = null;

            string sql = "SELECT * FROM callers WHERE caller_id = @caller_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@caller_id", callerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        caller = MapRowToCaller(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }
            return caller;
        }

        public Caller GetCallerByName(string firstName, string lastName)
        {
            Caller caller = null;

            string sql = "SELECT * FROM callers WHERE first_name = @first_name AND last_name = @last_name";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@first_name", firstName);
                    cmd.Parameters.AddWithValue("@last_name", lastName);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        caller = MapRowToCaller(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return caller;
        }

        public Caller CreateCaller(Caller caller)
        {
            Caller newCaller = null;

            string sql = @"INSERT INTO callers (first_name,last_name, phone, street, city, state, zip, latitude, longitude)
                         OUTPUT INSERTED.caller_id
                         VALUES (@first_name, @last_name, @phone, @street, @city, @state, @zip, @latitude, @longitude)";

            int newCallerId = 0;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@first_name", caller.FirstName);
                    cmd.Parameters.AddWithValue("@last_name", caller.LastName);
                    cmd.Parameters.AddWithValue("@phone", caller.Phone);
                    cmd.Parameters.AddWithValue("@street", caller.Street);
                    cmd.Parameters.AddWithValue("@city", caller.City);
                    cmd.Parameters.AddWithValue("@state", caller.State);
                    cmd.Parameters.AddWithValue("@zip", caller.Zip);
                    cmd.Parameters.AddWithValue("@latitude", caller.Latitude);
                    cmd.Parameters.AddWithValue("@longitude", caller.Longitude);

                    newCallerId = Convert.ToInt32(cmd.ExecuteScalar());

                }
                newCaller = GetCallerById(newCallerId);
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return newCaller;
        }

        public Caller UpdateCaller(Caller caller)
        {
            string sql = "UPDATE callers SET first_name = @first_name, last_name = @last_name, phone = @phone, street = @street, city = @city, state = @state, zip = @zip, latitude = @latitude, longitude = @longitude WHERE caller_id = @caller_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@caller_id", caller.Id);
                    cmd.Parameters.AddWithValue("@first_name", caller.FirstName);
                    cmd.Parameters.AddWithValue("@last_name", caller.LastName);
                    cmd.Parameters.AddWithValue("@phone", caller.Phone);
                    cmd.Parameters.AddWithValue("@street", caller.Street);
                    cmd.Parameters.AddWithValue("@city", caller.City);
                    cmd.Parameters.AddWithValue("@state", caller.State);
                    cmd.Parameters.AddWithValue("@zip", caller.Zip);
                    cmd.Parameters.AddWithValue("@latitude", caller.Latitude);
                    cmd.Parameters.AddWithValue("@longitude", caller.Longitude);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        caller = GetCallerById(caller.Id);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return caller;
        }

        public bool DeleteCaller(int callerId)
        {
            bool result = false;

            string sql = "DELETE FROM callers WHERE caller_id = @caller_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@caller_id", callerId);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        result = true;
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return result;
        }

        private Caller MapRowToCaller(SqlDataReader reader)
        {
            Caller caller = new Caller();

            caller.Id = Convert.ToInt32(reader["caller_id"]);
            caller.FirstName = Convert.ToString(reader["first_name"]);
            caller.LastName = Convert.ToString(reader["last_name"]);
            caller.Phone = Convert.ToString(reader["phone"]);
            caller.Street = Convert.ToString(reader["street"]);
            caller.City = Convert.ToString(reader["city"]);
            caller.State = Convert.ToString(reader["state"]);
            caller.Zip = Convert.ToString(reader["zip"]);
            caller.Latitude = Convert.ToDecimal(reader["latitude"]);
            caller.Longitude = Convert.ToDecimal(reader["longitude"]);

            return caller;
        }
    }
}
