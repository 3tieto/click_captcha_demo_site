import {API} from '~/conf.js'
import fMsg from '@w5/fetch/fMsg.js'

export default new Proxy(
  {},
  {
    get:(_, url)=>(body, opt)=> {
      var opt = opt || {};
      opt.method = opt.method || 'POST';
      if(body !== undefined){
        opt.body = JSON.stringify(body)
      }
      return fMsg(API + url, opt)
    }
  }
)

