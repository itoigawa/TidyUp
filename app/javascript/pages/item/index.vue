<template v-if="isAuthUserItem">
<div>
  <ItemHeader
    @data-table="handleShowItemDataTable"
    @all-items-list="handleShowAllItemsList"
    @all-tops-list="handleShowAllTopsList"
    @all-outor-list="handleShowAllOutorList"
    @all-pants-list="handleShowAllPantsList"
    @all-shoes-list="handleShowAllShoesList"
    />
  <template v-if="isVisibleAllItems">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      :items="allItems"
      />
  </template>
  <template  v-if="isVisibleAllTops">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      :items="allTops"
      />
  </template>
  <template v-if="isVisibleAllOutor">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      :items="allOutor"
      />
  </template>
  <template v-if="isVisibleAllPants">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      :items="allPants"
      />
  </template>
  <template v-if="isVisibleAllShoes">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      :items="ollShoes"
      /> 
  </template>
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
      isVisibleItemDataTable: false,
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
        'createItem',
        'fetchItems'
      ]),
    handleShowItemCreateModal(){
      this.isVisibleItemCreateModal = true;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTable = false;
      this.$modal.show('item-create-modal');
    },
    handleCloseItemCreateModal(){
      this.isVisibleItemCreateModal = false;
      this.$modal.hide('item-create-modal');
    },
    handleShowItemDetailModal(item){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemDetailModal = true;
      this.isVisibleItemDataTable = false;
      this.itemDetail = item;
      this.$modal.show('item-detail-modal');
    },
    // handleCloseItemDetailModal(){
    //   this.isVisibleItemDetailModal = false;
    //   this.$modal.hide('item-create-modal');
    // },
    handleShowItemDataTable(){
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemDataTable = true;
      this.$modal.show('item-data-table-modal');
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