<template v-if="isAuthUserItem">
<div>
  <ItemHeader
    @data-table="handleShowItemDataTableModal"
    @calendar="handleShowItemCalendarModal"
    @all-items-list="handleShowAllItemsList"
    @all-tops-list="handleShowAllTopsList"
    @all-outor-list="handleShowAllOutorList"
    @all-pants-list="handleShowAllPantsList"
    @all-shoes-list="handleShowAllShoesList"
    />
  <template v-if="isVisibleAllItems">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @add-count-item="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      @delete-item="handleDeleteItem"
      :items="allItems"
      />
  </template>
  <template  v-if="isVisibleAllTops">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @add-count-item="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      @delete-item="handleDeleteItem"
      :items="allTops"
      />
  </template>
  <template v-if="isVisibleAllOutor">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @add-count-item="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      @delete-item="handleDeleteItem"
      :items="allOutor"
      />
  </template>
  <template v-if="isVisibleAllPants">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @add-count-item="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      @delete-item="handleDeleteItem"
      :items="allPants"
      />
  </template>
  <template v-if="isVisibleAllShoes">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @add-count-item="handleAddCountItem"
      @show-editModal="handleShowItemEditModal"
      @delete-item="handleDeleteItem"
      :items="allShoes"
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
  <ItemExhibitButton
    @create-item="handleShowItemCreateModal"
    />
  <TheFooter />
</div>
</template>

<style scoped>
</style>

<script>
import { mapGetters, mapActions } from "vuex"
import ItemHeader from './components/ItemHeader'
import ItemList from './components/ItemList'
import ItemExhibitButton from './components/ItemExhibitButton'
import ItemCreateModal from './components/ItemCreateModal'
import ItemEditModal from './components/ItemEditModal'
import ItemDetailModal from './components/ItemDetailModal'
import ItemDataTableModal from './components/ItemDataTableModal'
import ItemCalendarModal from './components/ItemCalendarModal'
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
    TheFooter
  },
  data(){
    return {
      itemDetail: {},
      itemEdit: {},
      isVisibleItemCreateModal: false,
      isVisibleItemEditModal: false,
      isVisibleItemDetailModal: false,
      isVisibleItemDataTableModal: false,
      isVisibleItemCalendarModal: false,
      isVisibleAllItems: true,
      isVisibleAllTops: false,
      isVisibleAllOutor: false,
      isVisibleAllPants: false,
      isVisibleAllShoes: false
    }
  },
  computed:{
    ...mapGetters('items', ['items']),
    allItems(){
      return this.items
    },
    allTops(){
      return this.items.filter(item => {
        return item.category == 'トップス'
      })
    },
    allOutor(){
      return this.items.filter(item => {
        return item.category == 'アウター'
      })
    },
    allPants(){
      return this.items.filter(item => {
        return item.category == 'パンツ'
      })
    },
    allShoes(){
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
        'addCountItem', 
        'updateItem',
        'deleteItem'
      ]),
    handleShowItemCreateModal(){
      this.isVisibleItemCreateModal = true;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
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
      this.itemEdit = Object.assign({}, item);
      this.$modal.show('item-edit-modal');
    },
    handleCloseItemEditModal(){
      this.isVisibleItemEditModal = false;
      this.itemEdit = {};
      this.$modal.hide('item-edit-modal');
    },
    handleShowItemDetailModal(item){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemEditModal = false;
      this.isVisibleItemDetailModal = true;
      this.isVisibleItemDataTableModal = false;
      this.isVisibleItemCalendarModal = false;
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
      this.$modal.show('item-calendar-modal');
    },
    handleCloseItemCalendarModal(){
      this.isVisibleItemCalendarModal = false;
      this.$modal.hide('item-calendar-modal');
    },
    handleShowAllItemsList(){
      this.isVisibleAllItems = true;
      this.isVisibleAllTops = false;
      this.isVisibleAllOutor = false;
      this.isVisibleAllPants = false;
      this.isVisibleAllShoes = false;
    },
    handleShowAllTopsList(){
      this.isVisibleAllItems = false;
      this.isVisibleAllTops = true;
      this.isVisibleAllOutor = false;
      this.isVisibleAllPants = false;
      this.isVisibleAllShoes = false;
    },
    handleShowAllOutorList(){
      this.isVisibleAllItems = false;
      this.isVisibleAllTops = false;
      this.isVisibleAllOutor = true;
      this.isVisibleAllPants = false;
      this.isVisibleAllShoes = false;
    },
    handleShowAllPantsList(){
      this.isVisibleAllItems = false;
      this.isVisibleAllTops = false;
      this.isVisibleAllOutor = false;
      this.isVisibleAllPants = true;
      this.isVisibleAllShoes = false;
    },
    handleShowAllShoesList(){
      this.isVisibleAllItems = false;
      this.isVisibleAllTops = false;
      this.isVisibleAllOutor = false;
      this.isVisibleAllPants = false;
      this.isVisibleAllShoes = true;
    },
    async handleCreateItem(formData) {
      try {
        await this.createItem(formData);
        this.handleCloseItemCreateModal();
      } catch (error) {
        console.log(error);
      }
    },
    async handleAddCountItem(item){
      const addItem = confirm("今日着用しますか？");
      try{
        if( addItem == true ) {
          await this.addCountItem(item);
        }
      } catch (error){
        console.log(error);
      }
    },
    async handleUpdateItem(formData) {
      try{
        await this.updateItem(formData);
        this.handleCloseItemEditModal();
      } catch (error) {
        console.log(error);
      }
    },
    async handleDeleteItem(item) {
      const deleteItem = confirm("アイテムを削除しますか？");
      try{
        if( deleteItem == true ) {
          await this.deleteItem(item);
          this.handleCloseItemEditModal();
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
</style>
