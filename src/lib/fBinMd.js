import {MD} from '~/conf.js'
import fBin from '@w5/fetch/fBin.js'

export default (url, ...args)=> fBin(MD + url, ...args)
