<template>
<div class="modal-wrapper">
<h1>Great！</h1>
</div>
</template>

<script>
export default {
  name: 'CongratulationsModal'
}
</script>

<style scoped>
.modal-wrapper {
  display: flex;
  align-items: center;
  background-color: #141414;
}

h1 {
  font-size: 9vw;
  font-weight: 700;
  font-family: 'Rubik', sans-serif;
  flex: 1;
  position: relative;
  text-align: center;
  margin: 0;
  color: transparent;
  background-image: url('/assets/gradation.jpg');
  background-size: cover;
  background-clip: text;
  background-repeat: no-repeat;
}
 

</style>