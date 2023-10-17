> ~/Box.coffee
  ~/lib/S.js
  @8n/tag0
  @w5/msgpack > unpack

LOADING = '加载中 ···'
WAIT = 'var(--svgWait) 50% 50% / 180px no-repeat'

bind = (args...)=>
  _bind(
    await S.captcha()
    ...args
  )
  return

_bind = (s, box, req, resolve)=>
  h = '请依次点击下图中的'
  for d from s.slice(0,3)
    h += """<svg style="width:16px;margin-left:8px" viewBox="0 0 1024 1024"><path d="#{d}"></path></svg>"""
  h5 = tag0(box,'h5')
  h5.innerHTML = h
  a = document.createElement 'a'
  a.className = 'refresh'
  a.style = """background:var(--svgRefresh) 0 0 / cover;"""

  [img, id] = s.slice(3)
  b = tag0(box,'b')
  b.style.background = 'url("'+URL.createObjectURL(new Blob([new Uint8Array(img)])).toString()+'") 0 0 / 390px no-repeat'

  clear = =>
    b.innerHTML = ''
    h5.innerHTML = LOADING
    b.style.background = WAIT
    a.remove()
    return

  a.onclick = =>
    clear()
    bind(box, req, resolve)
    return
  h5.after a
  id_li = [3,2,1]
  xy = []
  b.onclick = (e)=>
    {target} = e
    if target.tagName == 'I'
      id_li.push +target.innerHTML
      target.remove()
      return
    n = Math.min ...id_li
    id_li.splice(id_li.indexOf(n),1)
    i = document.createElement 'i'
    i.innerHTML = n
    {layerY,layerX} = e
    p = (n-1)*2
    xy[p] = layerX
    xy[1+p] = layerY
    i.style="top:#{layerY-15}px;left:#{layerX-15}px"
    b.appendChild(i)
    if not id_li.length
      clear()
      try
        r = await req [
          Number.parseInt(id)
          ...xy
        ]
        box.onclose = =>
          resolve(r)
          return
        box.close()
      catch r
        if r.status == 412
          clear()
          _bind(
            unpack await r.arrayBuffer()
            box, req, resolve
          )
        else
          a.click()
    return
  return

< new Proxy(
  {}
  get:(_,name)=>
    (body)=>
      new Promise (resolve, reject)=>
        box = Box """<style>.uBox b i{user-select:none;position:absolute;background:rgba(255,0,0,.9);width:24px;height:24px;font-weight:300;font-style:normal;color:#fff;border-radius:15px;border:3px solid #fff;box-shadow:0 0 7px rgba(0,0,0,.5) inset;font-family:h;align-items:center;display:flex;justify-content:center;cursor:var(--svgXs) 10 10,pointer}.uBox a.refresh{width:20px;height:20px;display:flex;opacity:.4;}.uBox a.refresh:hover{opacity:1;filter:invert(42%) sepia(1) saturate(47)}</style><i style="display:flex;justify-content:space-between;align-items:center;padding:16px"><h5 style="font-style:normal;user-select:none;margin:0">#{LOADING}</h5></i><b style="width:390px;height:390px;display:flex;background:#{WAIT};position:relative;cursor:cell"></b>"""
        bind(
          box
          (captcha)=>
            S[name](body, headers:'Content-Type':JSON.stringify(captcha))
          resolve
        )
        box.onclose = =>
          reject()
          return
        return
)
