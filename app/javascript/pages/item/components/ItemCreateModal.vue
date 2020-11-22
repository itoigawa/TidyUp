<template>
<div id="item-create-modal">
  <div class="wrapper">
    <ValidationObserver ref="observer" v-slot="{ handleSubmit }">
    <div class="card">
      <div class="title-box">
        <div class="title-name">
          アイテムの情報を入力
        </div>
        <v-btn 
          icon
          class="close-btn"
          @click="handleCloseModal">
            <v-icon small>mdi-close</v-icon>
        </v-btn>
      </div>
        <div class="image-box">
          <div class="file-input">
            <ValidationProvider v-slot="{ errors }" ref="provider"
              name="画像" rules="required|image">
              <v-file-input
                id="image"
                :error-messages="errors"
                label=""
                placeholder="画像を選択"
                prepend-icon="mdi-camera"
                @change="handleChange"
                />
            </ValidationProvider>
          </div>
          <v-img v-show="previewImage"
                 :src="previewImage"
                 height="130"
                 width="130"
                 class="upload-box" />
        </div>
        <div class="info-box">
          <div class="info-form">
            <ValidationProvider class="name" v-slot="{ errors }" name="商品名" rules="required|max:12">
              <v-text-field
                v-model="item.name"
                :counter="12"
                id="name"
                :error-messages="errors"
                label="商品名"
                required
                dense
              />
            </ValidationProvider>
            <ValidationProvider class="category" v-slot="{ errors }" name="カテゴリー" rules="required">
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
            <ValidationProvider class="color" v-slot="{ errors }" name="カラー" rules="required" >
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
            <ValidationProvider class="scene" v-slot="{ errors }" name="シーン" rules="required">
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
            <ValidationProvider class="purchased-at" v-slot="{ errors }" name="購入日" rules="required">
              <v-flex xs12 sm6 md4>
                <v-menu
                  v-model="menu"
                  :close-on-content-click="false"
                  transition="scale-transition"
                  offset-y
                >
                  <template v-slot:activator="{ on }">
                    <v-text-field
                      v-model="item.purchased_at"
                      id="purchased_at"
                      :error-messages="errors"
                      label="購入日"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-on="on"
                      required
                    ></v-text-field>
                  </template>
                  <v-date-picker 
                    v-model="item.purchased_at"
                    @input="menu = false"
                    locale="jp-ja"
                    :day-format="date => new Date(date).getDate()"
                  />
                </v-menu>
              </v-flex>
              <v-spacer></v-spacer>
            </ValidationProvider>
            <v-btn x-large block color="deep-orange darken-3" right dark  :disabled="processing" @click.prevent="handleSubmit(handleCreateItem)" class="register-btn">登録</v-btn>
          </div>
        </div>
      </div>
    </ValidationObserver>
  </div>
</div>

</template>

<script>
export default {
  name: 'ItemCreateModal',
  data() {
    return {
      date: new Date().toISOString().substr(0, 10),
      menu: false,
      previewImage: '',
      uploadImage: '',
      processing: false,
      item: {
        name: '',
        image_url: '',
        category: '',
        color: '',
        purchased_at: ''
      },
      categories: [
        'トップス',
        'アウター',
        'パンツ',
        'シューズ'
      ],
      colors: [
        'レッド',
        'オレンジ',
        'イエロー',
        'グリーン',
        'ブルー',
        'パープル',
        'ブラウン',
        'ブラック',
        'ホワイト',
        'その他'
      ],
      scenes: [
        'ビジネス',
        'プライベート',
        'スポーツ'
      ],
    }
  },
  methods: {
    async handleChange(event) {
      const { valid } = await this.$refs.provider.validate(event)
      if (valid) this.uploadImage = event

      const pre = new FileReader()
      pre.readAsDataURL(event)
      pre.onload = () => {
        this.previewImage = pre.result
      }
    },
    handleCreateItem() {
      if (this.processing) return;
      this.processing = true;
      this.doSomething()
      .then(() => {
        this.processing = false;
        const formData = new FormData()
        formData.append('item[name]', this.item.name)
        formData.append('item[category]', this.item.category)
        formData.append('item[color]', this.item.color)
        formData.append('item[scene]', this.item.scene)
        formData.append('item[purchased_at]', this.item.purchased_at)
        if (this.uploadImage) formData.append('item[image]', this.uploadImage)
        try {
          this.$emit('create-item', formData)
        } catch (error) {
          console.log(error);
        }
      });
    },
    doSomething() {
      return new Promise((resolve) => {
        setTimeout(() => {
          console.log(`Submitted on ${new Date()}`);
          resolve();
        }, 1500);
      });
    },
    handleCloseModal(){
      this.$emit('close-modal')
    },
    startProcessing: function () {
      this.processing = true
    },
    endProcessing: function () {
      this.processing = false
    },
    isProcessing: function () {
      return this.processing
    }
  }
}
</script>

<style scoped>
.card{
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  background-color: white;
  display: grid;
  grid-template: "........." 0.6rem
                 "title-box" 2.5rem
                 "........." 1rem
                 "image-box" 12rem
                 "........." 1rem
                 "info-box"  25rem
}

.title-box{
  grid-area: title-box;
  border-bottom: 1px solid #eee;
  display: grid;
  grid-template: "... title-name ... close-btn ..."
                 /25% 50% 17% 5% 3%;
}

.title-name{
  grid-area: title-name;
  font-size: 1.3rem;
  font-weight: bold;
  text-align: center;
}

.close-btn{
  grid-area: close-btn;
}

.image-box{
  grid-area: image-box;
  display: grid;
  grid-template:"... file-input ... upload-box"
                /15% 30% 10% 55%;
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
  position: absolute;
  bottom: 1rem;
  width: 150px
}

.info-box{
  grid-area: info-box;
  display: grid;
  grid-template: "... info-form ..."
                 /auto 60% auto
}

.info-form{
  grid-area: info-form;
  display: grid;
  grid-template:"    name    " 3rem
                "............" 1rem
                "  category  " 3rem
                "............" 1rem
                "    color   " 3rem
                "............" 1rem
                "    scene   " 3rem
                "............" 1rem
                "purchased-at" 3rem
                "............" 1.6rem
                "register-btn" 3rem
}

.name{
  grid-area: name;
}

.category{
  grid-area: category;
}

.color{
  grid-area: color;
}

.scene{
  grid-area: scene;
}

.purchased-at{
  grid-area: purchased-at;
}

.scene{
  grid-area: scene;
}

.register-btn{
  grid-area: register-btn;
  font-weight: bold;
}

@media screen and (max-width: 1050px) {
  .card{
    grid-template:"........." 0.6rem
                  "title-box" 2.5rem
                  "........." 1rem
                  "image-box" 8rem
                  "........." 1rem
                  "info-box"  22.4rem
  }

  .info-box{
  grid-template: "... info-form ..."
                 /auto 80% auto
  }

  .info-form{
    grid-template:"    name    " 3rem
                  "............" 0.6rem
                  "  category  " 3rem
                  "............" 0.6rem
                  "    color   " 3rem
                  "............" 0.6rem
                  "    scene   " 3rem
                  "............" 0.6rem
                  "purchased-at" 3rem
                  "............" 0.8rem
                  "register-btn" 2.5rem
          
  }

  .image-box{
    grid-template:"... .......... ... .........." 0.5rem
                  "... file-input ... upload-box" 7.5rem
                  /3% 30% 13% 53%;
  }

  .upload-box{
    grid-area: upload-box;
    width: 90px;
  }
}
</style>
