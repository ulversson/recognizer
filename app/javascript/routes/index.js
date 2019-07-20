import Dashboard from '../components/Dashboard'
import Uploader from '../components/Uploader'
import PipelineList from '../components/pipelines/List'
import UploadList from '../components/uploads/UploadList'

const routes = [
  {
    path: '/Dashboard',
    name: 'Dashboard',
    component: Dashboard
  },
  {
    path: '/Uploader',
    name: 'Uploader',
    component: Uploader
  },
  {
    path: '/pipeline-list',
    name: 'PipelineList',
    component: PipelineList
  },
  {
    path: '/uploads',
    name: 'UploadList',
    component: UploadList
  }
];
export default routes