<template>
<div>
  <TheHeader />
  <CardsList />
  <ExhibitButton />
</div>
</template>

<script>
  import TheHeader from 'components/item/TheHeader.vue'
  import CardsList from 'components/item/CardsList.vue'
  import ExhibitButton from 'components/item/ExhibitButton.vue'

  export default {
    components: {
      TheHeader,
      CardsList,
      ExhibitButton,
    }
  }
</script>

<style scoped>
</style>