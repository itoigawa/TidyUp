<template>
<div>
  <ItemHeader
    @data-table="handleShowItemDataTable"
    />
  <ItemCardsList 
    @detail-item="handleShowItemDetailModal"
    />
  <modal name="item-create-modal"
         :adaptive="true"
         height="auto"
         class="modal"
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
      />
  </modal>
  <modal name="item-data-table-modal"
         height="auto"
         width="80%"
         :scrollable="true">
    <ItemDataTable
      v-if="isVisibleItemDataTable"
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
import ItemCardsList from './components/ItemCardsList'
import ItemExhibitButton from './components/ItemExhibitButton'
import ItemCreateModal from './components/ItemCreateModal'
import ItemDetailModal from './components/ItemDetailModal'
import ItemDataTable from './components/ItemDataTable'
import TheFooter from 'components/shared/TheFooter'


export default {
  name: 'ItemIndex',
  components: {
    ItemHeader,
    ItemCardsList,
    ItemExhibitButton,
    ItemCreateModal,
    ItemDetailModal,
    ItemDataTable,
    TheFooter
  },
  data(){
    return {
      isVisibleItemCreateModal: false,
      isVisibleItemDetailModal: false,
      isVisibleItemCardsListModal: false,
      isVisibleItemDataTable: false,
    }
  },
  computed:{
    ...mapGetters('items', ['items'])
  },
  methods: {
    ...mapActions(
      'items',
      [
        'createItem'
      ]),
    handleShowItemCreateModal(){
      this.isVisibleItemCreateModal = true;
      this.isVisibleItemDetailModal = false;
      this.isVisibleItemCardsListModal = false;
      this.isVisibleItemDataTable = false;
      this.$modal.show('item-create-modal')
    },
    handleCloseItemCreateModal(){
      // this.isVisibleItemCreateModal = false;
      this.$modal.hide('item-create-modal');
    },
    handleShowItemDetailModal(){
      this.isVisibleItemDetailModal = true;
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemCardsListModal = false;
      this.isVisibleItemDataTable = false;
      this.$modal.show('item-detail-modal');
    },
    handleCloseItemDetailModal(){
      // this.isVisibleItemDetailModal = false;
      this.$modal.hide('item-create-modal');
    },
    handleShowItemDataTable(){
      this.isVisibleItemDataTable = true;
      this.isVisibleItemExhibitButton = true;
      this.isVisibleItemCreateModal = false;
      this.isVisibleItemDetailModal = false;
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