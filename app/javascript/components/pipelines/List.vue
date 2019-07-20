<template>
  <div>
  <h3>All system processing pipelines</h3>
  <vuetable ref="vuetable"
    api-url="/pipelines.json"
    :fields="['id', 'name']"
    detail-row-component="detail-row"  
    @vuetable:cell-clicked="onCellClicked"
    :css="css"
  ></vuetable>
  </div>
</template>

<script>
import Vuetable from 'vuetable-2'
import DetailRow from './DetailRow'
import Vue from 'vue'
Vue.component('detail-row', DetailRow)
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