import {MD} from '~/conf.js'
import fTxt from '@w5/fetch/fTxt.js'

export default (url, ...args)=> fTxt(MD + url, ...args)
