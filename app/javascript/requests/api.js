import axios from 'axios' 

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
  }
}