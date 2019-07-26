import Dashboard from '../components/Dashboard'
import Uploader from '../components/Uploader'
import PipelineList from '../components/pipelines/List'
import UploadList from '../components/uploads/UploadList'
import MedicoLegalCasesList from '../components/medico_legal_cases/MedicoLegalCasesList'

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
  },
  {
    path: '/cases',
    name: 'MedicoLegalCasesList',
    component: MedicoLegalCasesList
  }
];
export default routes