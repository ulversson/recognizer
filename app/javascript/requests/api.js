import axios from 'axios' 
const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')  

export default {
  pipelines() {
    return axios.get(`pipelines.json`).then((response) => {
      return response
    }).catch(function (error) {
      console.log(error);
    }).finally(function () {
    })
  },
  requestPipeline(pipelineId) {
    return axios.get(`pipelines/${pipelineId}.json`).then((response) => {
      return response
    }).catch(function (error) {
      console.log(error);
    }).finally(function () {
    })
  },
  updateUploadedItems(uploadedItemId, pipelineId) {
    return axios.patch(`/uploaded_items/${uploadedItemId}.json`,{
    uploaded_item:   {
      processing_pipeline_id: pipelineId,
      status: "ready"
    }}, {
      headers: {'X-CSRF-Token' : csrfToken}
    }).then((r) => {
      return r
    }).catch(function (error) {
      console.log(error);
    }).finally(function () {
    })
  }
}