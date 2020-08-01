<template>
<v-app-bar
  color="#717278"
  dark
>
  <v-app-bar-nav-icon></v-app-bar-nav-icon>

  <router-link to="/" class="title">TidyUP</router-link>

  <v-spacer></v-spacer>

  <v-btn icon>
    <v-icon>mdi-wardrobe-outline</v-icon>
  </v-btn>

  <v-btn icon>
    <v-icon>mdi-calendar-month-outline</v-icon>
  </v-btn>

  <v-btn icon>
    <v-icon>mdi-archive-outline</v-icon>
  </v-btn>

  <v-btn icon>
    <v-icon>mdi-weather-partly-cloudy</v-icon>
  </v-btn>

  <v-menu
    left
    bottom
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        icon
        v-bind="attrs"
        v-on="on"
      >
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </template>

    <v-list>
      <v-list-item
        v-for="n in 5"
        :key="n"
        @click="() => {}"
      >
        <v-list-item-title>Option {{ n }}</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-menu>
</v-app-bar>
</template>

<style scoped>
.title{
  text-decoration: none;
  color: white;
  font-weight: 400;
}
</style>