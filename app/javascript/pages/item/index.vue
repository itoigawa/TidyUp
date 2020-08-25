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
         :resizable="true"
         :width="700"
         :height="750"
      >
    <ItemCreateModal
      v-if="isVisibleItemCreateModal"
      />
  </modal>
  <modal name="item-detail-modal"
         :resizable="true"
         :width="600"
         :height="750"
         >
    <ItemDetailModal
      v-if="isVisibleItemDetailModal"
      />
  </modal>
  <modal name="item-data-table-modal"
         :resizable="true"
         :width="950"
         :height="660">
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
      // overlay: {
      //   top: 0,
      //   left: 0,
      //   right: 0,
      //   bottm: 0,
      //   filter: 'brightness(50%) opacity(60%)'
      // }
    }
  },
  methods: {
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
  },
  mount (){
    this.show()
  }
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}

.modal-header, .modal-body {
  padding: 5px 25px;
}
</style>