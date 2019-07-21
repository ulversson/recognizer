import axios from 'axios' 

export default {
  requestPipeline(pipelineId) {
    return axios.get(`pipelines/${pipelineId}.json`).then((response) => {
        return response
    }).catch(function (error) {
      console.log(error);
    }).finally(function () {
      // always executed
    })
  }
}