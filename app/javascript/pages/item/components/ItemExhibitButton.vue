<template>
<div
  class="exhibit_btn"
  @click="handleCreateItem">
  <div class="icon-field">
    <div class="text">登録</div>
    <v-icon>mdi-hanger</v-icon>
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
  right: 2rem;
  bottom: 2rem;
  height: 10rem;
  width: 10rem;
  font-size: 1.375rem;
  text-decoration: none;
  position: fixed;
  z-index: 100;
  background-color:rgba(70,70,70);
  border-radius: 50%;
}

.exhibit_btn:hover{
    opacity: 0.8;
}
.exhibit_btn:active{
  -webkit-transform: translateY(4px);
  transform: translateY(4px);
  box-shadow: 0px 0px 1px rgba(0, 0, 0, 0.2);
  border-bottom: none;
}

.icon-field{
  text-align: center;
  margin-top: 1.4rem;
}

.text{
  color:rgba(245, 245, 245);
}

.mdi:before, .mdi-set{
  color:rgba(245, 245, 245);
  font-size: 4.8rem;
}

@media screen and (max-width: 1050px){
  .exhibit_btn {
  cursor: pointer;
  bottom: 1.4rem;
  font-size: 0.95rem;
  text-decoration: none;
  height: 7rem;
  right: 1.4rem;
  width: 7rem;
  position: fixed;
  z-index: 100;
  background-color:rgba(70,70,70);
  border-radius: 50%;
  }

  .icon-field{
    text-align: center;
    margin-top: 1rem;
  }

  .text{
    color:rgba(245, 245, 245);
  }

  .mdi:before, .mdi-set{
    color:rgba(245, 245, 245);
    font-size: 3.6rem;
  }
}
</style>