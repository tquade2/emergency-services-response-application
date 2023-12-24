import axios from 'axios';

const http = axios.create({ baseURL: "https://localhost:44315" });

export default {
  getAllServiceRequests() {
    return http.get('/serviceRequest');
  },
  getServiceRequestById(id) {
    return http.get(`/serviceRequest/${id}`);
  },
  postServiceRequest(serviceRequest) {
    return http.post('/serviceRequest', serviceRequest);
  },
  putServiceRequest(serviceRequest) {
    return http.put(`/serviceRequest/${serviceRequest.id}`, serviceRequest);
  },
  deleteServiceRequestById(id) {
    return http.delete(`/serviceRequest/${id}`);
  },
}