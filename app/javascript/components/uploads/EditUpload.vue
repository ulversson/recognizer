<template>
  <div v-show="showModal">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">

      <div class="modal-dialog edit-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Assign file to processing pipeline</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" @click="closeModal()">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <label>Select pipeline to process this document.</label>
              <div class='wrapping-select' style='width: 400px'>
                <v-select :options="dropdownOptions" 
                  :value="selectedItem" 
                  ref="select"
                  @input="onSelectChange"></v-select>
              </div>  

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" @click="closeModal()">Close</button>
              <button type="button" class="btn btn-success" @click="saveAndProcess()">Save and process</button>
              <button type="button" class="btn btn-primary" @click="save()">Save</button>
            </div>
          </div>
      </div>

    </div>
    </div>
  </transition>
  </div>
</template>
<script>
import Vue from 'vue'
import Select2 from 'v-select2-component'
import axios from 'axios'
import Api from '../../requests/api'
import Globals from '../../packs/globals'
Vue.component('Select2', Select2)
export default {
  props: {
    showModal: {
      default: true,
      type: Boolean
    },
    rowData: {
      type: Object,
      required: true
    },
    rowIndex: {
      type: Number
    },
    dropdownOptions: {
      type: Array,
      default: []
    },
    pipelineToSelect: {
      type: Number,
      default: 0
    }
  },
  mounted() {
    this.onSelectChange(this.pipelineToSelect)
  },
  data() {
    return {
      selectedValue: null
    }
  },
  methods: {
    closeModal() {
      this.$parent.showModal = false
    },
    onSelectChange(val){
      if (val === null || val == undefined) {
        this.$refs.select.value = null
        this.selectedValue = val
      } else {
        this.selectedValue = val.id
        this.$refs.select.value = val
      }
    },
    removeBorder() {
      Globals.css(document.querySelector("div.wrapping-select"), {'border': 'none'})
    },
    setRedBorder() {
      Globals.css(document.querySelector("div.wrapping-select"), {'border': '1px solid red'})
    },
    save() {
      let component = this
      if (this.selectedValue === null || this.selectedValue === undefined) {
        this.setRedBorder()
      } else {
        this.removeBorder()
        Api.updateUploadedItems(component.$parent.itemId, this.selectedValue).then((r) => {
          if (r.status === 200) {
            component.$parent.showModal = false
            window.location.reload(true)
          }
        }).catch(e => {
        })
      }
    }
  },
  computed: {
    settings() {
      let component = this
      return {
        width: 400
      }
    },
    selectedItem() {
      let found = this.dropdownOptions.find (option => option.id === this.pipelineToSelect)
      return found
    }
  }
}
</script>

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 800;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .7);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.select2-close-mask{
    z-index: 2099;
}
.select2-dropdown{
    z-index: 3051;
}
.select2-container.select2-container--default {
  z-index: 10000;
}
</style>
