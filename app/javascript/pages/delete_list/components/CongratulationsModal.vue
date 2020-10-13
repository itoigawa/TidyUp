<template>
<div class="wrapper">
  <span class="design_sample1">アイテムを削除しました</span>
  <span class="design_sample2">Congratulations！</span>
</div>
</template>

<script>
export default {
  name: 'CongratulationsModal'
}
</script>

<style scoped>
.wrapper {
  background-color: #000;
  text-align: center;
}

.design_sample1 {
    font-size: 38px;
    text-align: center;
    line-height: 50px;
    font-weight: bold;
    color: #FFF;
    text-shadow: 
        0 0 0.10em gray,
        0 0 0.20em gray,
        0 0 0.30em gray,
        0 0 0.40em gray;
    filter: saturate(80%);
}

.design_sample2 {
    font-size: 40px;
    text-align: center;
    font-weight: bold;
    color: #FFF;
    text-shadow: 
        0 0 0.20em gray,
        0 0 0.30em gray,
        0 0 0.40em gray,
        0 0 0.50em gray;
    filter: saturate(80%);
}

</style>