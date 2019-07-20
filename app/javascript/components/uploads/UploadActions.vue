<template>
  <div class="custom-actions">
    <a class="btn btn-xs btn-warning text-white" style="cursor: pointer" @click="itemAction('edit-item', rowData, rowIndex)"><i class="edit fas fa-edit"></i></a>
    <a class="btn btn-xs btn-primary text-white" style="cursor: pointer" @click="itemAction('process-item', rowData, rowIndex)"><i class="edit fas fa-cog"></i></a>
    <a class="btn btn-xs btn-danger text-white" style="cursor: pointer" click="itemAction('delete-item', rowData, rowIndex)"><i class="delete fas fa-ban"></i></a>
  </div>	
</template>

<script>
export default {
  props: {
    rowData: {
      type: Object,
      required: true
    },
    rowIndex: {
      type: Number
    }
  },
  methods: {
    itemAction (action, data, index) {
      switch(action) {
        case "edit-item":
          this.editItem(data, index)
        break;
        case "process-item":
          this.processItem(data, index)
        break;
        case "process-item":
          this.deleteItem(data, index)
        break;
      }
    },
    editItem(data, index) {
      
    },
    processItem(data, index) {

    },
    deleteItem(data, index) {
      this.$swal({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
           confirmButtonText: 'Yes, delete it!'
        })
        .then((result) => {
          if (result.value) {
            this.$swal(
              'Deleted!',
              'Your file has been deleted.',
              'success')
          }
        })
    }
  }
}
</script>

<style>
  .custom-actions button.ui.button {
    padding: 8px 8px;
  }
  .custom-actions button.ui.button > i.icon {
    margin: auto !important;
  }
</style>