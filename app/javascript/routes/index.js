import Dashboard from '../components/Dashboard'
import Uploader from '../components/Uploader'
import PipelineList from '../components/pipelines/List'

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
  }
];
export default routes