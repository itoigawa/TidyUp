<template>
<div>
  <div class="card">
    <div class="title-box">
      <div class="title">アイテムの情報を入力</div>
    </div>
    <div class="image-box">
      <v-file-input
        class="file-input"
        :rules="rules"
        accept="image/png, image/jpeg, image/bmp"
        placeholder="画像をアップロード"
        prepend-icon="mdi-camera"
      ></v-file-input>
      <div class="upload-box"></div>
    </div>
    <div class="info-box">
      <form class="info-form">
        <v-text-field
          v-model="name"
          :error-messages="nameErrors"
          :counter="10"
          label="商品名"
          required
          @input="$v.name.$touch()"
          @blur="$v.name.$touch()"
          dense
        ></v-text-field>
        <br>
        <v-select
          v-model="select"
          :items="items"
          :error-messages="selectErrors"
          label="タイプ"
          required
          @change="$v.select.$touch()"
          @blur="$v.select.$touch()"
          dense
        ></v-select>
        <br>
        <v-select
          v-model="select"
          :items="items"
          :error-messages="selectErrors"
          label="色"
          required
          @change="$v.select.$touch()"
          @blur="$v.select.$touch()"
          dense
        ></v-select>
        <br>
        <v-select
          v-model="select"
          :items="items"
          :error-messages="selectErrors"
          label="シーン"
          required
          @change="$v.select.$touch()"
          @blur="$v.select.$touch()"
          dense
        ></v-select>
        <br>
        <v-select
          v-model="select"
          :items="items"
          :error-messages="selectErrors"
          label="着用回数の初期値"
          required
          @change="$v.select.$touch()"
          @blur="$v.select.$touch()"
          dense
        ></v-select>
        <br>
          <v-text-field
          label="購入日"
          required
          dense
        ></v-text-field>
        <v-btn x-large width="100%" color="deep-orange darken-3" right dark  @click="submit" class="register-btn">登録</v-btn>
      </form>
    </div>
  </div>
</div>
</template>

<script>
import { validationMixin } from 'vuelidate'
import { required, maxLength, email } from 'vuelidate/lib/validators'

export default {
  name: "ItemCreateModal",
  mixins: [validationMixin],

  validations: {
    name: { required, maxLength: maxLength(10) },
    select: { required },
    checkbox: {
      checked (val) {
        return val
      },
    },
  },

  data(){
    return{
      name: '',
      select: null,
      dialog: false,
      items: [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
      ],
    }
  },

  computed: {
    selectErrors () {
      const errors = []
      if (!this.$v.select.$dirty) return errors
      !this.$v.select.required && errors.push('タイプを選択して下さい')
      return errors
    },
    nameErrors () {
      const errors = []
      if (!this.$v.name.$dirty) return errors
      !this.$v.name.maxLength && errors.push('10文字以内で商品名を入力してください')
      !this.$v.name.required && errors.push('商品名を入力してください')
      return errors
    }
  },

  methods: {
    submit () {
      this.$v.$touch()
    },
    clear () {
      this.$v.$reset()
      this.name = ''
      this.select = null
      this.checkbox = false
    },
  },
}
</script>

<style scoped>
.card{
  grid-area: card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  background-color: white;
  display: grid;
  grid-template: "........." 0.6rem
                 "title-box" 2.5rem
                 "........." 1rem
                 "image-box" 12rem
                 "........." 1rem
                 "info-box"  31rem
}

.title-box{
  grid-area: title-box;
  border-bottom: 1px solid #eee;
}

.title{
  font-weight: bold;
  text-align: center;
}

.image-box{
  grid-area: image-box;
  display: grid;
  grid-template:"... file-input ... upload-box ..."
                /15% 30% 14% 50% auto;
  position: relative;
  border-bottom: 1px solid #eee;
}

.file-input{
  grid-area: file-input;
  position: absolute;
  bottom: 0;
}

.upload-box{
  grid-area: upload-box;
  height: 10.6rem;
  width: 10.6rem;
  background-color:black;
  margin-top: 0.5rem;
}

.info-box{
  grid-area: info-box;
  display: grid;
  grid-template: "... info-form ..."
                 /auto 80% auto
}

.info-form{
  grid-area: info-form;
}

.register-btn{
  font-weight: bold;
}

</style>