<template>
  <div class="service-request">
    <h1>Service Request</h1>
    <form v-on:submit.prevent="postServiceRequest">
      <label for="callerId">Caller ID:</label>
      <input type="number" id="callerId" v-model="serviceRequest.callerId" />
      <label for="dateTime">Date and Time:</label>
      <input
        type="datetime-local"
        id="dateTime"
        v-model="serviceRequest.dateTime"
      />
      <label for="street">Street:</label>
      <input type="text" id="street" v-model="serviceRequest.street" />
      <label for="city">City:</label>
      <input type="text" id="city" v-model="serviceRequest.city" />
      <label for="state">State:</label>
      <input type="text" id="state" v-model="serviceRequest.state" />
      <label for="zip">Zip:</label>
      <input type="text" id="zip" v-model="serviceRequest.zip" />
      <label for="latitude">Latitude:</label>
      <input type="number" id="latitude" v-model="serviceRequest.latitude" />
      <label for="longitude">Longitude:</label>
      <input type="number" id="longitude" v-model="serviceRequest.longitude" />
      <label for="type">Type:</label>
      <input type="text" id="type" v-model="serviceRequest.type" />
      <label for="status">Status:</label>
      <input type="text" id="status" v-model="serviceRequest.status" />
      <label for="priority">Priority:</label>
      <input type="text" id="priority" v-model="serviceRequest.priority" />
      <label for="description">Description:</label>
      <textarea
        id="description"
        v-model="serviceRequest.description"
      ></textarea>
      <button type="submit">Submit</button>
    </form>
  </div>
  <table>
    <thead>
      <tr>
        <th>Caller ID</th>
        <th>Date and Time</th>
        <th>Street</th>
        <th>City</th>
        <th>State</th>
        <th>Zip</th>
        <th>Latitude</th>
        <th>Longitude</th>
        <th>Type</th>
        <th>Status</th>
        <th>Priority</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody
      v-for="serviceRequest in serviceRequests"
      v-bind:key="serviceRequest.id"
    >
      <td>{{ serviceRequest.callerId }}</td>
      <td>{{ serviceRequest.dateTime }}</td>
      <td>{{ serviceRequest.street }}</td>
      <td>{{ serviceRequest.city }}</td>
      <td>{{ serviceRequest.state }}</td>
      <td>{{ serviceRequest.zip }}</td>
      <td>{{ serviceRequest.latitude }}</td>
      <td>{{ serviceRequest.longitude }}</td>
      <td>{{ serviceRequest.type }}</td>
      <td>{{ serviceRequest.status }}</td>
      <td>{{ serviceRequest.priority }}</td>
      <td>{{ serviceRequest.description }}</td>
    </tbody>
  </table>
</template>

<script>
import serviceRequestService from "../services/ServiceRequestService";

export default {
  data() {
    return {
      serviceRequests: [],
      serviceRequest: {},
    };
  },
  methods: {
    getAllServiceRequests() {
      serviceRequestService
        .getAllServiceRequests()
        .then((response) => {
          this.serviceRequests = response.data;
        })
        .catch((error) => {
          if (error.response) {
            console.log(
              "Error loading service requests: ",
              error.response.status,
            );
          } else if (error.request) {
            console.log(
              "Error loading service requests: unable to communicate to server",
            );
          } else {
            console.log("Error loading service requests: make request");
          }
        });
    },
    postServiceRequest() {
      serviceRequestService
        .postServiceRequest(this.serviceRequest)
        .then(() => {
          this.serviceRequest = {};
          this.$router.push({ name: "serviceRequest" });
          this.getAllServiceRequests();
        })
        .catch((error) => {
          if (error.response) {
            console.log(
              "Error posting service request: ",
              error.response.status,
            );
          } else if (error.request) {
            console.log(
              "Error posting service request: unable to communicate to server",
            );
          } else {
            console.log("Error posting service request: make request");
          }
        });
    },
  },
  created() {
    this.getAllServiceRequests();
  },
};
</script>
