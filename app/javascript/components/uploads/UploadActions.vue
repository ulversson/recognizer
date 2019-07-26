<template>
  <div class="custom-actions">
    <a class="btn btn-xs btn-warning text-white" style="cursor: pointer" @click="itemAction('edit-item', rowData, rowIndex)"><i class="edit fas fa-edit"></i></a>
    <a class="btn btn-xs btn-primary text-white" style="cursor: pointer" @click="itemAction('process-item', rowData, rowIndex)"><i class="edit fas fa-cog"></i></a>
    <a class="btn btn-xs btn-danger text-white" style="cursor: pointer" @click="itemAction('delete-item', rowData, rowIndex)"><i class="delete fas fa-ban"></i></a>
  </div>	
</template>

<script>
import axios from 'axios'
import Api from '../../requests/api'

export default {
  props: {
    rowData: {
      type: Object,
      required: true
    },
    rowIndex: {
      type: Number
    },
    dropdownOptions: {
      type: Array
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
        case "delete-item":
          this.deleteItem(data, index)
        break;
      }
    },
    editItem(data, index) {
      this.$parent.$parent.showModal = true
      this.$parent.$parent.itemId = data.id
      this.$parent.$parent.pipelineToSelect = data.processing_pipeline_id
    },
    processItem(data, index) {
      let component = this
      this.$swal({
        title: 'Are you sure you want to process this file',
        type: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes'
      })
      .then((result) => {
        if (result.value) {
          Api.processUploadedItem(data.id).then(r =>{
            window.location.reload(true)
          })
        }
      })
    },
    deleteItem(data, index) {
      const component = this
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
            let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')  
            let headers =  {
              'X-CSRF-Token' : csrfToken
            } 
            axios.delete(`uploaded_items/${data.id}`, {headers: headers}).then((res) => {
              component.$parent.refresh()
              this.$swal(
                'Deleted!', 'Your file has been deleted.', 'success')
              })
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