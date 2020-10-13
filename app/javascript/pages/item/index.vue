<template v-if="isAuthUserItem">
<div>
  <ItemHeader
    @data-table="handleShowItemDataTableModal"
    @calendar="handleShowItemCalendarModal"
    @today-weather="handleShowTodayWeatherModal"
    @all-items-list="handleShowAllItemsList"
    @tops-list="handleShowTopsList"
    @outor-list="handleShowOutorList"
    @pants-list="handleShowPantsList"
    @shoes-list="handleShowShoesList"
    />
  <template v-if="isVisibleLoginAlert">
    <div class="login-alert">
      <v-alert
        outlined
        text
        dense
        type="success"
      >
        ログインしました
      </v-alert>
    </div>
  </template>
  <template v-if="isVisibleAllItems">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @item-addCount="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      :items="allItems"
      />
  </template>
  <template  v-if="isVisibleTops">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @item-addCount="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      :items="tops"
      />
  </template>
  <template v-if="isVisibleOutor">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @item-addCount="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      :items="outor"
      />
  </template>
  <template v-if="isVisiblePants">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @item-addCount="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      :items="pants"
      />
  </template>
  <template v-if="isVisibleShoes">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @item-addCount="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      :items="shoes"
      /> 
  </template>
  <modal name="item-create-modal"
         :adaptive="true"
         height="auto">
    <ItemCreateModal
      v-if="isVisibleItemCreateModal"
      @create-item="handleCreateItem"
      @close-modal="handleCloseItemCreateModal"
      />
  </modal>
  <modal name="item-edit-modal"
         :adaptive="true"
         height="auto">
    <ItemEditModal 
      @v-if="isVisibleItemEditModal"
      :item="itemEdit"
      @update-item="handleUpdateItem"
      @close-modal="handleCloseItemEditModal"
      />
  </modal>
  <modal name="item-detail-modal"
         :adaptive="true"
         height="auto"
         >
    <ItemDetailModal
      v-if="isVisibleItemDetailModal"
      :item="itemDetail"
      @close-modal="handleCloseItemDetailModal"
      />
  </modal>
  <modal name="item-data-table-modal"
         height="auto"
         width="80%"
         :scrollable="true">
    <ItemDataTableModal
      v-if="isVisibleItemDataTableModal"
      :items="allItems"
      @close-modal="handleCloseItemDataTableModal"
      />
  </modal>
  <modal name="item-calendar-modal"
         :adaptive="true"
         height="auto">
    <ItemCalendarModal
      v-if="isVisibleItemCalendarModal"
      />
  </modal>
  <modal name="today-weather-modal"
         :adaptive="true"
         :minHeight= 400>
    <TodayWeatherModal
      v-if="isVisibleTodayWeatherModal"
      @close-modal="handleCloseTodayWeatherModal"
    />
  </modal>
  <ItemExhibitButton
    @create-item="handleShowItemCreateModal"
    />
  <TheFooter />
</div>
</template>

<style scoped>
</style>

<script>
import axios from '../../plugins/axios'
import { mapGetters, mapActions } from 'vuex'
import ItemHeader from './components/ItemHeader'
import ItemList from './components/ItemList'
import ItemExhibitButton from './components/ItemExhibitButton'
import ItemCreateModal from './components/ItemCreateModal'
import ItemEditModal from './components/ItemEditModal'
import ItemDetailModal from './components/ItemDetailModal'
import ItemDataTableModal from './components/ItemDataTableModal'
import ItemCalendarModal from './components/ItemCalendarModal'
import TodayWeatherModal from './components/TodayWeatherModal'
import TheFooter from 'components/shared/TheFooter'


export default {
  name: 'ItemIndex',
  components: {
    ItemHeader,
    ItemList,
    ItemExhibitButton,
    ItemCreateModal,
    ItemEditModal,
    ItemDetailModal,
    ItemDataTableModal,
    ItemCalendarModal,
    TodayWeatherModal,
    TheFooter
  },
  data() {
    return {
      itemDetail: {},
      itemEdit: {},
      isVisibleLoginAlert: false,
      isVisibleItemCreateModal: false,
      isVisibleItemEditModal: false,
      isVisibleItemDetailModal: false,
      isVisibleItemDataTableModal: false,
      isVisibleItemCalendarModal: false,
      isVisibleTodayWeatherModal: false,
      isVisibleAllItems: true,
      isVisibleTops: false,
      isVisibleOutor: false,
      isVisiblePants: false,
      isVisibleShoes: false
    }
  },
  computed: {
    ...mapGetters('items', ['items']),
    allItems(){
      return this.items
    },
    tops(){
      return this.items.filter(item => {
        return item.category == 'トップス'
      })
    },
    outor(){
      return this.items.filter(item => {
        return item.category == 'アウター'
      })
    },
    pants(){
      return this.items.filter(item => {
        return item.category == 'パンツ'
      })
    },
    shoes(){
      return this.items.filter(item => {
        return item.category == 'シューズ'
      })
    },
    isAuthUserItem() {
      return this.item.user_id === this.authUser.id
    }
  },
  created(){
    this.fetchItems();
  },
  methods: {
    ...mapActions(
      'items',
      [
        'fetchItems',
        'createItem',
        'updateItem'
      ]),
    handleShowLoginAlert(){
      this.isVisibleLoginAlert = true;
      setTimeout(this.handleCloseLoginAlert, 2000)
    },
    handleCloseLoginAlert(){
      this.isVisibleLoginAlert = false;
    },
    handleShowItemCreateModal(){
      this.isVisibleItemCreateModal = true;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
      this.isVisibleTodayWeatherModal = false;
      this.$modal.show('item-create-modal');
    },
    handleCloseItemCreateModal(){
      this.isVisibleItemCreateModal = false;
      this.$modal.hide('item-create-modal');
    },
    handleShowItemEditModal(item){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = true;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
      this.isVisibleTodayWeatherModal = false;
      this.itemEdit = Object.assign({}, item);
      this.$modal.show('item-edit-modal');
    },
    handleCloseItemEditModal(){
      this.isVisibleItemEditModal = false;
      this.itemEdit = {};
      this.$modal.hide('item-edit-modal');
    },
    handleShowItemDetailModal(item) {
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = true;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
      this.isVisibleTodayWeatherModal = false;
      this.itemDetail = item;
      this.$modal.show('item-detail-modal');
    },
    handleCloseItemDetailModal(){
      this.isVisibleItemDetailModal = false;
      this.$modal.hide('item-detail-modal');
    },
    handleShowItemDataTableModal(){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = true;
      this.isVisibleItemCalendarModal = false;
      this.isVisibleTodayWeatherModal = false;
      this.$modal.show('item-data-table-modal');
    },
    handleCloseItemDataTableModal(){
      this.isVisibleItemDataTableModal = false;
      this.$modal.hide('item-data-table-modal');
    },
    handleShowItemCalendarModal(){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = true;
      this.isVisibleTodayWeatherModal = false;
      this.$modal.show('item-calendar-modal');
    },
    handleCloseItemCalendarModal(){
      this.isVisibleItemCalendarModal = false;
      this.$modal.hide('item-calendar-modal');
    },
    handleShowTodayWeatherModal(){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
      this.isVisibleTodayWeatherModal = true;
      this.$modal.show('today-weather-modal');
    },
    handleCloseTodayWeatherModal(){
      this.isVisibleTodayWeatherModal = false;
      this.$modal.hide('today-weather-modal');
    },
    handleShowAllItemsList(){
      this.isVisibleAllItems = true;
      this.isVisibleTops = false;
      this.isVisibleOutor = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowTopsList(){
      this.isVisibleAllItems = false;
      this.isVisibleTops = true;
      this.isVisibleOutor = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowOutorList(){
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = true;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowPantsList(){
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = false;
      this.isVisiblePants = true;
      this.isVisibleShoes = false;
    },
    handleShowShoesList(){
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = true;
    },
    async handleCreateItem(formData) {
      try {
        await this.createItem(formData);
        this.handleCloseItemCreateModal();
      } catch (error) {
        console.log(error);
      }
    },
    async handleUpdateItem(formData) {
      try {
        await this.updateItem(formData);
        this.handleCloseItemEditModal();
      } catch (error) {
        console.log(error);
      }
    },
    async handleAddCountItem(item) {
      const AddCountItem = confirm('今日、アイテムを着用しますか？');
      try {
        if( AddCountItem == true ){
          axios.post(`items/${item.id}/wearing_times`, item)
        } 
      } catch (error) {
        console.log(error);
      }
    }
  },
  mount (){
    this.show()
  }
}
</script>

<style scoped>
.login-alert{
  margin-top: 0.5rem;
}
</style>
