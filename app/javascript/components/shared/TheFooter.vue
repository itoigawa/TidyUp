<template>
  <v-card height="12.8rem">
    <v-footer
      absolute
      class="font-weight-medium"
    >
      <v-col
        class="white--text text-center"
      >
      <div class="text">
        <strong>{{ new Date().getFullYear() }} — TidyUp</strong>
      </div>
      </v-col>
    </v-footer>
  </v-card>
</template>

<style scoped>
.v-footer{
  background-color:rgba(0,0,0,.62);
}

.text-center{
  text-align: center;
  height: 12rem;
}

.text{
  margin-top: 4.2rem;
  color: white;
}
</style>

