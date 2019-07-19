<template>
  <div>
    <div class="col-lg-12">
      <div class="card position-relative">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Upload new documents</h6>
        </div>
        <div class="card-body">
          <form id='app' @submit='submitFile' action='' method='post' novalidate='true'>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
              </div>
              <div class="custom-file">
                <input type="file" @change="handleFileUpload()" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" ref="file">
                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
              </div>
            </div>
            <progress max="100" :value.prop="uploadPercentage" style="width: 100%"></progress>
            <button @click="submitFile()">Submit</button>
          </form>
          <br>
          <p class="mb-0 small">
            Note: You can select only Image files (png or jpeg) or PDF documents
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      errors: [],
      title: null,
      description: null,
      picture: null,
      uploadFile: null,
      uploadPercentage: 0
    }
  },
  methods: {
    selectedFile: function (e) {
      e.preventDefault()
      const files = e.target.files
      this.uploadFile = files[0]
    },
    handleFileUpload(){
      this.uploadFile = this.$refs.file.files[0];
    },
    onUploadProgress() {
      this.uploadPercentage = parseInt( Math.round( ( progressEvent.loaded * 100 ) / progressEvent.total ) );
    },
    submitFile(){
      let formData = new FormData();
      let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')   
      formData.append('file', this.uploadFile);
      formData.append('csrfToken', csrfToken)
      axios.post('/upload_items',
        formData,
        {
          headers: {
            'Content-Type': 'multipart/form-data',
            'X-CSRF-Token' : csrfToken
          },
          onUploadProgress: function( progressEvent ) {
            this.uploadPercentage = parseInt( Math.round( ( progressEvent.loaded * 100 ) / progressEvent.total ) );
          }.bind(this)
        }
      ).then(res => {
        console.log('SUCCESS!!');
      })
      .catch(function(){
        console.log('FAILURE!!');
      });
    },
    onSubmit: function (e) {
      e.preventDefault()
      const formData = new FormData()
      formData.append('item[title]', this.title)
      formData.append('item[description]', this.description)
      formData.append('item[picture]', this.uploadFile)
      axios.post('http://127.0.0.1:3000/items', formData)
        .then(res => {
          alert(`
            Request succeeded !\n
            id: ${res.data.id}
            title: ${res.data.title}
            description: ${res.data.description}
            created_at: ${res.data.created_at}
          `)
        })
    }
  }
}
</script>