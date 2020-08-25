<template>
<div
  class="exhibit_btn"
  @click="handleCreateItem">
  <div class="icon-field">
    <div class="text">登録</div>
    <v-btn icon>
      <v-icon>mdi-hanger</v-icon>
    </v-btn>
  </div>
</div>
</template>

<script>
export default {
  name: 'ItemExhibitButton',
  methods: {
    handleCreateItem() {
      this.$emit('create-item', this.item)
    }
  }
}
</script>

<style scoped>
.exhibit_btn {
  cursor: pointer;
  bottom: 2rem;
  font-size: 1.375rem;
  text-decoration: none;
  height: 10rem;
  right: 2rem;
  width: 10rem;
  position: fixed;
  z-index: 100;
  background-color:rgba(70,70,70);
  border-radius: 50%;
}

.icon-field{
  text-align: center;
  margin-top: 1.4rem;
}

.text{
  color:rgba(245, 245, 245);
  margin-bottom: 0.6rem;
}

.mdi-hanger::before{
  color:rgba(245, 245, 245);
  font-size: 4.8rem;
}
</style>