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
    public class ServiceRequestDao : IServiceRequestDao
    {
        private readonly string connectionString;

        public ServiceRequestDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<ServiceRequest> GetServiceRequests()
        {
            List<ServiceRequest> serviceRequests = new List<ServiceRequest>();

            string sql = "SELECT * FROM service_requests";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ServiceRequest serviceRequest = MapRowToServiceRequest(reader);
                        serviceRequests.Add(serviceRequest);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return serviceRequests;
        }
        public ServiceRequest GetServiceRequestById(int serviceRequestId)
        {
            ServiceRequest serviceRequest = null;

            string sql = "SELECT * FROM service_requests WHERE service_request_id = @service_request_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@service_request_id", serviceRequestId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        serviceRequest = MapRowToServiceRequest(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return serviceRequest;
        }
        public ServiceRequest CreateServiceRequest(ServiceRequest serviceRequest)
        {
            string sql = @"INSERT INTO service_requests (caller_id, type, date_time, street, city, state, zip, latitude, longitude, status, priority, description)
                           OUTPUT INSERTED.service_request_id
                           VALUES (@caller_id, @type, @date_time, @street, @city, @state, @zip, @latitude, @longitude, @status, @priority, @description)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@caller_id", serviceRequest.CallerId);
                    cmd.Parameters.AddWithValue("@type", serviceRequest.Type);
                    cmd.Parameters.AddWithValue("@date_time", serviceRequest.DateTime);
                    cmd.Parameters.AddWithValue("@street", serviceRequest.Street);
                    cmd.Parameters.AddWithValue("@city", serviceRequest.City);
                    cmd.Parameters.AddWithValue("@state", serviceRequest.State);
                    cmd.Parameters.AddWithValue("@zip", serviceRequest.Zip);
                    cmd.Parameters.AddWithValue("@latitude", serviceRequest.Latitude);
                    cmd.Parameters.AddWithValue("@longitude", serviceRequest.Longitude);
                    cmd.Parameters.AddWithValue("@status", serviceRequest.Status);
                    cmd.Parameters.AddWithValue("@priority", serviceRequest.Priority);
                    cmd.Parameters.AddWithValue("@description", serviceRequest.Description);

                    serviceRequest.Id = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return serviceRequest;
        }
        public ServiceRequest UpdateServiceRequest(ServiceRequest serviceRequest)
        {
            string sql = "UPDATE service_requests SET caller_id = @caller_id, type = @type, date_time = @date_time, street = @street, city = @city, state = @state, zip = @zip, latitude = @latitude, longitude = @longitude, status = @status, priority = @priority, description = @description WHERE service_request_id = @service_request_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@caller_id", serviceRequest.CallerId);
                    cmd.Parameters.AddWithValue("@type", serviceRequest.Type);
                    cmd.Parameters.AddWithValue("@date_time", serviceRequest.DateTime);
                    cmd.Parameters.AddWithValue("@street", serviceRequest.Street);
                    cmd.Parameters.AddWithValue("@city", serviceRequest.City);
                    cmd.Parameters.AddWithValue("@state", serviceRequest.State);
                    cmd.Parameters.AddWithValue("@zip", serviceRequest.Zip);
                    cmd.Parameters.AddWithValue("@latitude", serviceRequest.Latitude);
                    cmd.Parameters.AddWithValue("@longitude", serviceRequest.Longitude);
                    cmd.Parameters.AddWithValue("@status", serviceRequest.Status);
                    cmd.Parameters.AddWithValue("@priority", serviceRequest.Priority);
                    cmd.Parameters.AddWithValue("@description", serviceRequest.Description);
                    cmd.Parameters.AddWithValue("@service_request_id", serviceRequest.Id);

                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                throw new DaoException("SQL exception occurred", ex);
            }

            return serviceRequest;
        }
        public bool DeleteServiceRequest(int serviceRequestId)
        {
            bool result = false;

            string sql = "DELETE FROM service_requests WHERE service_request_id = @service_request_id";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@service_request_id", serviceRequestId);

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
        public ServiceRequest MapRowToServiceRequest(SqlDataReader reader)
        {
            ServiceRequest serviceRequest = new ServiceRequest();
            serviceRequest.Id = Convert.ToInt32(reader["service_request_id"]);
            serviceRequest.CallerId = Convert.ToInt32(reader["caller_id"]);
            serviceRequest.Type = Convert.ToString(reader["type"]);
            serviceRequest.DateTime = Convert.ToDateTime(reader["date_time"]);
            serviceRequest.Street = Convert.ToString(reader["street"]);
            serviceRequest.City = Convert.ToString(reader["city"]);
            serviceRequest.State = Convert.ToString(reader["state"]);
            serviceRequest.Zip = Convert.ToString(reader["zip"]);
            serviceRequest.Latitude = Convert.ToDecimal(reader["latitude"]);
            serviceRequest.Longitude = Convert.ToDecimal(reader["longitude"]);
            serviceRequest.Status = Convert.ToString(reader["status"]);
            serviceRequest.Priority = Convert.ToString(reader["priority"]);
            serviceRequest.Description = Convert.ToString(reader["description"]);

            return serviceRequest;
        }
    }
}