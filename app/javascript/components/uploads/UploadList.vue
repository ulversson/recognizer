<template>
  <div>
  <h3>Uploaded Files</h3>
  <vuetable ref="vuetable"
    api-url="/uploaded_items.json"
    :fields="fields"
    @vuetable:cell-clicked="onCellClicked"
    pagination-path=""
    :css="css"
  ></vuetable>
  <edit-upload :showModal="showModal" :rowData="rowData" ref="editModal"></edit-upload>
  </div>
</template>

<script>
import Vuetable from 'vuetable-2'
import Vue from 'vue'
import UploadActions from './UploadActions'
import EditUpload from './EditUpload'

Vue.component('upload-actions', UploadActions)
Vue.component('edit-upload', EditUpload)

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
  data() {
    return {
      css: {
        tableClass: 'table table-striped table-bordered',
        ascendingIcon: 'glyphicon glyphicon-chevron-up',
        descendingIcon: 'glyphicon glyphicon-chevron-down',
        handleIcon: 'glyphicon glyphicon-menu-hamburger',
        renderIcon: function(classes, options) {
          return `<span class="${classes.join(' ')}"></span>`
        }
      },
      showModal: false,
      fields: [
        'id', 'filename', 
        { 
          "name": "status",
          "callback": "statusBadge",
          titleClass: 'center aligned',
          dataClass: 'center aligned'
        }, 
        {
          "name": "uploaded_at",
          "title": "Uploaded"
        },
        {
          "name": "file_type",
          "title": "File type"
        }
        ,'__component:upload-actions'
      ]
    }
  },  
  components: {
    Vuetable
  },
  methods: {
    onCellClicked (data, field, event) {
      console.log('cellClicked: ', field.name)
      this.$refs.vuetable.toggleDetailRow(data.id)
    },
    statusBadge (value) {
      switch(value) {
        case "pending":
          return `<span class="badge badge-warning text-white">${value.toUpperCase()}</span>`
        case "ready":
          return `<span class="badge badge-secondary text-white">${value.toUpperCase()}</span>`
        case "processing":
          return `<span class="badge badge-info text-white">${value.toUpperCase()}</span>`
        case "processed":
          return `<span class="badge badge-success text-white">${value.toUpperCase()}</span>`
      }
    }
  }
}
</script>