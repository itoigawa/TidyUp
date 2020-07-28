<template>
  <div id="app">
    <TheHeader />
    <CardsList />
    <ExhibitButton />
    <TheFooter />
  </div>
</template>

<script>
  import TheHeader from 'components/item/TheHeader.vue'
  import CardsList from 'components/item/CardsList.vue'
  import ExhibitButton from 'components/item/ExhibitButton.vue'
  import TheFooter from 'components/shared/TheFooter.vue'

  export default {
    components: {
      TheHeader,
      CardsList,
      ExhibitButton,
      TheFooter
    }
  }
</script>

<style scoped>
</style>