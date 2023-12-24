import axios from "axios";

const http = axios.create({ baseURL: "https://localhost:44315" });

export default {
  getAllCallers() {
    return http.get("/caller");
  },
  getCallerById(id) {
    return http.get(`/caller/${id}`);
  },
  postCaller(caller) {
    return http.post("/caller", caller);
  },
  putCaller(caller) {
    return http.put(`/caller/${caller.id}`, caller);
  },
  deleteCallerById(id) {
    return http.delete(`/caller/${id}`);
  },
};
