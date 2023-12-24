<template>
  <div id="login">
    <form v-on:submit.prevent="login">
      <h1>Log In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div>
        <label for="username">Username</label>
        <input
          class="ml-3 border border-solid border-black"
          type="text"
          id="username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div>
        <label for="password">Password</label>
        <input
          class="ml-3 border border-solid border-black"
          type="password"
          id="password"
          v-model="user.password"
          required
        />
      </div>
      <button class="bg-black text-white m-3 p-3" type="submit">Log in</button>
      <p>
        <router-link v-bind:to="{ name: 'register' }"
          >Need an account? Sign up.</router-link
        >
      </p>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
