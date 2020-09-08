<template>
<div>
  <ItemHeader
    @data-table="handleShowItemDataTable"
    />
  <ItemList
    @detail-item="handleShowItemDetailModal"
    :items="allItems"
    />
  <modal name="item-create-modal"
         :adaptive="true"
         height="auto"
         >
    <ItemCreateModal
      v-if="isVisibleItemCreateModal"
      @create-item="handleCreateItem"
      />
  </modal>
  <modal name="item-detail-modal"
         :adaptive="true"
         height="auto"
         >
    <ItemDetailModal
      v-if="isVisibleItemDetailModal"
      :item="itemDetail"
      />
  </modal>
  <modal name="item-data-table-modal"
         height="auto"
         width="80%"
         :scrollable="true">
    <ItemDataTable
      v-if="isVisibleItemDataTable"
      :items="allItems"
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
import ItemDetailModal from './components/ItemDetailModal'
import ItemDataTable from './components/ItemDataTable'
import TheFooter from 'components/shared/TheFooter'


export default {
  name: 'ItemIndex',
  components: {
    ItemHeader,
    ItemList,
    ItemExhibitButton,
    ItemCreateModal,
    ItemDetailModal,
    ItemDataTable,
    TheFooter
  },
  data(){
    return {
      itemDetail: {},
      isVisibleItemCreateModal: false,
      isVisibleItemDetailModal: false,
      isVisibleItemListModal: false,
      isVisibleItemDataTable: false,
    }
  },
  computed:{
    ...mapGetters('items', ['items']),
    allItems(){
      return this.items
    }
  },
  created(){
    this.fetchItems();
  },
  methods: {
    ...mapActions(
      'items',
      [
        'createItem',
        'fetchItems'
      ]),
    handleShowItemCreateModal(){
      this.isVisibleItemCreateModal = true;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemCardsListModal = false;
      this.isVisibleItemDataTable = false;
      this.$modal.show('item-create-modal');
    },
    handleCloseItemCreateModal(){
      this.isVisibleItemCreateModal = false;
      this.$modal.hide('item-create-modal');
    },
    handleShowItemDetailModal(item){
      this.isVisibleItemDetailModal = true;
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemCardsListModal = false;
      this.isVisibleItemDataTable = false;
      this.itemDetail = item;
      this.$modal.show('item-detail-modal');
    },
    // handleCloseItemDetailModal(){
    //   this.isVisibleItemDetailModal = false;
    //   this.$modal.hide('item-create-modal');
    // },
    handleShowItemDataTable(){
      this.isVisibleItemDataTable = true;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemCardsListModal = false;
      this.$modal.show('item-data-table-modal');
    },
    async handleCreateItem(item) {
      try {
        await this.createItem(item);
        this.handleCloseItemCreateModal();
      } catch (error) {
        console.log(error);
      }
    },
  },
  mount (){
    this.show()
  }
}
</script>

<style scoped>
</style>