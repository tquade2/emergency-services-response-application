<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link> &nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'caller' }">Caller</router-link>
      &nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'serviceRequest' }">Service Request</router-link>
      &nbsp;|&nbsp;
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >
    </div>
    <router-view />
  </div>
</template>
