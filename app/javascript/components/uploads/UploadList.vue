<template>
  <div>
  <h3>Uploaded Files</h3>
  <vuetable ref="vuetable"
    api-url="/uploaded_items.json"
    :fields="['id', 'filename', 'uploaded_at', 'file_type' ,'__component:upload-actions']"
    @vuetable:cell-clicked="onCellClicked"
    :css="css"
  ></vuetable>
  </div>
</template>

<script>
import Vuetable from 'vuetable-2'
import Vue from 'vue'
import UploadActions from './UploadActions'

Vue.component('upload-actions', UploadActions)

export default {
  props: {
    rowData: {
      type: Object,
      required: true
    },
    rowIndex: {
      type: Number
    },
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
      }
    }
  },  
  components: {
    Vuetable
  },
  methods: {
    onCellClicked (data, field, event) {
      console.log('cellClicked: ', field.name)
      this.$refs.vuetable.toggleDetailRow(data.id)
    }
  }
}
</script>