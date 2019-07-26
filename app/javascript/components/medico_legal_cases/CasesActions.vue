<template>
  <div class="custom-actions">
    <a class="btn btn-xs btn-warning text-white" style="cursor: pointer" @click="itemAction('edit-item', rowData, rowIndex)"><i class="edit fas fa-eye"></i></a>
    <a class="btn btn-xs btn-danger text-white" style="cursor: pointer" @click="deleteItem(rowData, rowIndex)"><i class="delete fas fa-ban"></i></a>
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
    }
  },
  methods: {
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
            axios.delete(`medico_legal_cases/${data.id}`, {headers: headers}).then((res) => {
              component.$parent.refresh()
              this.$swal(
                'Deleted!', 'Your item has been deleted.', 'success')
              })
          }
        })
    }
  }
}
</script>
