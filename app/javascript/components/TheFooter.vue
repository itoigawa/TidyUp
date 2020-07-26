<template>
  <v-card height="13.2rem">
    <v-footer
      absolute
      class="font-weight-medium"
    >
      <v-col
        class="text-center"
      >
      <div class="text">
        {{ new Date().getFullYear() }} — <strong>TidyUp</strong>
      </div>
      </v-col>
    </v-footer>
  </v-card>
</template>

<style scoped>
.text-center{
  text-align: center;
  height: 12rem;
}

.text{
  margin-top: 4.2rem;
}
</style>

