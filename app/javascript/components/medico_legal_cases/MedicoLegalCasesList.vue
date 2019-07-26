<template>
  <div>
  <h3>Medico Legal Cases</h3>
  <p>
    <a class="btn btn-success btn-lg" href='/medico_legal_cases/new'>
      <i class="fas fa-plus"></i>&nbsp;Add
    </a>
  </p>
  <vuetable ref="vuetable"
    api-url="/medico_legal_cases.json"
    :fields="fields"
    pagination-path=""
    :css="css"
  ></vuetable>
  <!--<edit-upload :showModal="showModal" 
               :rowData="rowData" 
               :dropdownOptions="dropdownOptions" 
               :pipelineToSelect="pipelineToSelect"
               ref="editModal"> 
  </edit-upload> !-->
  </div>
</template>

<script>
import Vuetable from 'vuetable-2'
import Vue from 'vue'
import CasesActions from './CasesActions'
import EditCase from './EditCase'
import Api from '../../requests/api'

Vue.component('cases-actions', CasesActions)
Vue.component('edit-case', EditCase)

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
      itemId: 0,
      dropdownOptions: [],
      pipelineToSelect: 0,
      fields: [
        'id', 'name',
         { 
          "name": "files",
          "callback": "badgeDanger",
          titleClass: 'center aligned',
          dataClass: 'center aligned'
        }, 
        {
          "name": "dates",
          "callback": "badgeSecondary",
          titleClass: 'center aligned',
          dataClass: 'center aligned'
        }, 
        ,'__component:cases-actions'
      ]
    }
  },
  components: {
    Vuetable
  },
  created() {
    
  },
  methods: {
    badgeSecondary (value) {
      return `<span class="badge badge-secondary text-white">${value}</span>`
    },
    badgeDanger (value) {
      return `<span class="badge badge-danger text-white">${value}</span>`
    }
  }
}
</script>