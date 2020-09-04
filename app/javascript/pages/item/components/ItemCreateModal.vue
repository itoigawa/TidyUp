<template>
<div id="item-create-modal">
  <ValidationObserver ref="observer" v-slot="{ handleSubmit }">
  <div class="card">
    <div class="title-box">
      <div class="title-name">アイテムの情報を入力</div>
    </div>
      <div class="image-box">
        <div class="file-input">
          <ValidationProvider v-slot="{ errors }" ref="provider"
            name="画像" rules="required|image">
            <v-file-input
              id="image"
              :error-messages="errors"
              label=""
              placeholder="画像をアップロード"
              prepend-icon="mdi-camera"
              @change="handleChange"
              />
              <!-- <v-text-field
                :error-messages="errors"
                label="画像をアップロード"
                prepend-icon="mdi-camera"
                > -->
                <!-- <label
                  for="image"
                >プロフィール画像</label>
                <input
                  id="image"
                  type="file"
                  @change="handleChange"
                > -->
              <!-- </v-text-field> -->
          </ValidationProvider>
        </div>
        <img class="upload-box"
            v-show="uploadImage"
            :src="uploadImage"
            width="200px">
      </div>
      <div class="info-box">
        <div class="info-form">
          <ValidationProvider v-slot="{ errors }" name="商品名" rules="required|max:10">
            <v-text-field
              v-model="item.name"
              :counter="10"
              id="name"
              :error-messages="errors"
              label="商品名"
              required
              dense
            />
          <br>
          </ValidationProvider>
          <ValidationProvider v-slot="{ errors }" name="カテゴリー" rules="required">
            <v-select
              v-model="item.category"
              :items="categories"
              item-text="text"
              item-value="id"       
              id="category"
              :error-messages="errors"
              label="カテゴリー"
              required
              dense
            ></v-select>
          </ValidationProvider>
          <br>
          <ValidationProvider v-slot="{ errors }" name="カラー" rules="required" >
            <v-select
              v-model="item.color"
              :items="colors"
              item-text="text"
              item-value="id"
              id="color"
              :error-messages="errors"
              label="色"
              required
              dense
            ></v-select>
          </ValidationProvider>
          <br>
          <ValidationProvider v-slot="{ errors }" name="シーン" rules="required">
            <v-select
              v-model="item.scene"
              :items="scenes"
              item-text="text"
              item-value="id"
              id="scene"
              :error-messages="errors"
              label="シーン"
              required
              dense
            ></v-select>
          </ValidationProvider>
          <br>
          <ValidationProvider v-slot="{ errors }" name="着用回数" rules="numeric">
            <v-text-field
              v-model="item.count"
              id="count"
              :error-messages="errors"
              label="着用回数の初期値"
              required
              dense
            ></v-text-field>
          </ValidationProvider>
          <br>
          <ValidationProvider v-slot="{ errors }" name="購入日" rules="required">
            <v-text-field
              v-model="item.purchased_at"
              id="purchased_at"
              :error-messages="errors"
              label="購入日"
              required
              dense
            >
              <template v-slot:append-outer>
                <v-date-picker
                  v-model="item.purchased_at"
                  locale="jp-ja"
                  :day-format="date => new Date(date).getDate()"
                  :landscape="true"
                  :width="350"
                  elevation="10"
                  required
                ></v-date-picker>
              </template>
            </v-text-field>
          </ValidationProvider>
          <br>
          <v-btn x-large width="100%" color="deep-orange darken-3" right dark  @click="handleSubmit(handleCreateItem)" class="register-btn">登録</v-btn>
        </div>
      </div>
    </div>
  </ValidationObserver>
</div>
</template>

<script>
export default {
  name: 'ItemCreateModal',

  data() {
    return {
      uploadImage: '',
      item: {
        name: '',
        image: '',
        category: '',
        color: '',
        count: '',
        purchased_at: ''
      },
      categories: [
        { id: 1, text: 'トップス' },
        { id: 2, text: 'アウター' },
        { id: 3, text: 'パンツ' },
        { id: 4, text: 'シューズ' }
      ],
      colors: [
        { id: 1, text: 'レッド' },
        { id: 2, text: 'オレンジ' },
        { id: 3, text: 'イエロー' },
        { id: 4, text: 'グリーン' },
        { id: 5, text: 'ブルー' },
        { id: 6, text: 'パープル' },
        { id: 7, text: 'ブラウン' },
        { id: 8, text: 'ブラック' },
        { id: 9, text: 'ホワイト' },
      ],
      scenes: [
        { id: 1, text: 'ビジネス' },
        { id: 2, text: 'プライベート' },
        { id: 3, text: 'スポーツ' }
      ],
    }
  },
  methods: {
    async handleChange(file) {
      const { valid } = await this.$refs.provider.validate(file)
      const pre = new FileReader()
      pre.readAsDataURL(file)
      if (valid){
        pre.addEventListener('load', () => {
        this.uploadImage = pre.result
        })
      }
    },
    // created() {
    //   const formData = new FormData()
    //   formData.append('item[image]', this.uploadImage)
    // },
    // async handleChange(event) {
    //   const { valid } = await this.$refs.provider.validate(event)
    //   if (valid) this.uploadImage = event.target.files[0]
    // },
    handleCreateItem() {
      const formData = new FormData()
      if (this.uploadImage) formData.append('item[image]', this.uploadImage)
      try {
        this.$emit('create-item', this.item)
      } catch (error) {
        console.log(error);
      }
    }
  }
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
                 "info-box"  47rem
}

.title-box{
  grid-area: title-box;
  border-bottom: 1px solid #eee;
}

.title-name{
  font-size: 1.25rem;
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