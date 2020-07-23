<template>
  <v-card class="overflow-hidden">
    <v-app-bar
      absolute
      color="#aaacb5"
      dark
      shrink-on-scroll
      prominent
      src="/assets/header_image.png"
      fade-img-on-scroll
      scroll-target="#scrolling-techniques-3"
    >
      <template v-slot:img="{ props }">
        <v-img
          v-bind="props"
          gradient="to top right, rgba(90,90,90), rgba(25,32,72,.7)"
        ></v-img>
      </template>

      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>TidyUp</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-hanger</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-calendar-month</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-archive</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-weather-partly-cloudy</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>

      <template v-slot:extension>
        <v-tabs align-with-title>
          <v-tab>全て</v-tab>
          <v-tab>トップス</v-tab>
          <v-tab>アウター</v-tab>
          <v-tab>パンツ</v-tab>
          <v-tab>シューズ</v-tab>
        </v-tabs>
      </template>
    </v-app-bar>
    <v-sheet
      id="scrolling-techniques-3"
      class="overflow-y-auto"
      max-height="600"
    >
      <v-container style="height: 1000px;"></v-container>
    </v-sheet>
  </v-card>
</template>

<script>
  export default {
    data: () => ({
      items: [
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me 2' },
      ],
    }),
  }
</script>

<style>
v-toolbar-title{
  font-size: 40px
}
</style>