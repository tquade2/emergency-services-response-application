<template>
  <div class="caller">
    <h1>Caller</h1>
    <form v-on:submit.prevent="postCaller">
      <label for="firstName">First Name</label>
      <input
        v-model="caller.firstName"
        type="text"
        id="firstName"
        name="firstName"
        required autofocus 
      />
      <label for="lastName">Last Name</label>
      <input
        v-model="caller.lastName"
        type="text"
        id="lastName"
        name="lastName"
      />
      <label for="Phone">Phone</label>
      <input v-model="caller.phone" type="text" id="Phone" name="Phone" />
      <label for="Street">Street</label>
      <input v-model="caller.street" type="text" id="Street" name="Street" />
      <label for="City">City</label>
      <input v-model="caller.city" type="text" id="City" name="City" />
      <label for="State">State</label>
      <select
        v-model="caller.state"
        id="State"
        name="State"
        class="rounded border p-2"
      >
        <option value="">Select a state</option>
        <option value="AL">Alabama</option>
        <option value="AK">Alaska</option>
        <option value="AZ">Arizona</option>
        <option value="AR">Arkansas</option>
        <option value="CA">California</option>
        <option value="CO">Colorado</option>
        <option value="CT">Connecticut</option>
        <option value="DE">Delaware</option>
        <option value="FL">Florida</option>
        <option value="GA">Georgia</option>
        <option value="HI">Hawaii</option>
        <option value="ID">Idaho</option>
        <option value="IL">Illinois</option>
        <option value="IN">Indiana</option>
        <option value="IA">Iowa</option>
        <option value="KS">Kansas</option>
        <option value="KY">Kentucky</option>
        <option value="LA">Louisiana</option>
        <option value="ME">Maine</option>
        <option value="MD">Maryland</option>
        <option value="MA">Massachusetts</option>
        <option value="MI">Michigan</option>
        <option value="MN">Minnesota</option>
        <option value="MS">Mississippi</option>
        <option value="MO">Missouri</option>
        <option value="MT">Montana</option>
        <option value="NE">Nebraska</option>
        <option value="NV">Nevada</option>
        <option value="NH">New Hampshire</option>
        <option value="NJ">New Jersey</option>
        <option value="NM">New Mexico</option>
        <option value="NY">New York</option>
        <option value="NC">North Carolina</option>
        <option value="ND">North Dakota</option>
        <option value="OH">Ohio</option>
        <option value="OK">Oklahoma</option>
        <option value="OR">Oregon</option>
        <option value="PA">Pennsylvania</option>
        <option value="RI">Rhode Island</option>
        <option value="SC">South Carolina</option>
        <option value="SD">South Dakota</option>
        <option value="TN">Tennessee</option>
        <option value="TX">Texas</option>
        <option value="UT">Utah</option>
        <option value="VT">Vermont</option>
        <option value="VA">Virginia</option>
        <option value="WA">Washington</option>
        <option value="WV">West Virginia</option>
        <option value="WI">Wisconsin</option>
        <option value="WY">Wyoming</option>
      </select>
      <label for="Zip">Zip</label>
      <input v-model="caller.zip" type="text" id="Zip" name="Zip" />
      <label for="Latitude">Latitude</label>
      <input
        v-model="caller.latitude"
        type="text"
        id="Latitude"
        name="Latitude"
      />
      <label for="Longitude">Longitude</label>
      <input
        v-model="caller.longitude"
        type="text"
        id="Longitude"
        name="Longitude"
      />
      <button type="submit">Submit and Go to Service Request</button>
    </form>
    <div>
      <table>
        <thead>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Phone</th>
            <th>Street</th>
            <th>City</th>
            <th>State</th>
            <th>Zip</th>
            <th>Latitude</th>
            <th>Longitude</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="caller in callers" v-bind:key="caller.id">
            <td>{{ caller.firstName }}</td>
            <td>{{ caller.lastName }}</td>
            <td>{{ caller.phone }}</td>
            <td>{{ caller.street }}</td>
            <td>{{ caller.city }}</td>
            <td>{{ caller.state }}</td>
            <td>{{ caller.zip }}</td>
            <td>{{ caller.latitude }}</td>
            <td>{{ caller.longitude }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import callerService from "../services/CallerService";

export default {
  name: "CallerView",
  data() {
    return {
      callers: [],
      caller: {},
    };
  },
  methods: {
    getAllCallers() {
      callerService
        .getAllCallers()
        .then((response) => {
          this.callers = response.data;
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error loading callers: ", error.response.status);
          } else if (error.request) {
            console.log(
              "Error loading callers: unable to communicate to server",
            );
          } else {
            console.log("Error loading callers: make request");
          }
        });
    },
    postCaller() {
      callerService
        .postCaller(this.caller)
        .then(() => {
          this.caller = {};
          this.$router.push({ name: "serviceRequest" });
          this.getAllCallers();
        })
        .catch((error) => {
          if (error.response) {
            console.log("Error posting caller: ", error.response.status);
          } else if (error.request) {
            console.log(
              "Error posting caller: unable to communicate to server",
            );
          } else {
            console.log("Error posting caller: make request");
          }
        });
    },
  },
  created() {
    this.getAllCallers();
  },
};
</script>
