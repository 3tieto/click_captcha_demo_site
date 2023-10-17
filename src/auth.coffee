> ~/captcha.coffee
  ~/Box.coffee
  @8n/tag0

O = 'o'
ING = 'ing'

sign = (n)=>
  box = Box """<style>#uAuthAgree{margin-right:6px}.uBox h1{background:var(--svgLogo) 50% 50% no-repeat;text-indent:-999px;width:100%;height:42px;margin:24px 0 12px}.uBox form>b>button{flex:1;white-space:nowrap}.uBox form>b>button.o{box-shadow:none;flex:0;border-bottom:5px solid var(--c);padding:16px 0 10px;box-sizing:border-box;background:0 0;color:var(--c)}.uBox form>b>button:first-child{margin-right:16px}.uBox form>b{margin:0 16px 16px;align-self:normal}.uBox b{display:flex;align-items:center;}.uBox form>p,.uBox form footer{padding:16px;display:flex;align-items:center;justify-content:space-between;width:100%;box-sizing:border-box;}.uBox form footer{font-size:14px;border-top:1px solid #eee;color:#999}.uBox footer a{color:#999}.uBox footer b a{margin-left:6px;margin-left:3px;border-bottom:.5px solid #ccc;padding-bottom:3px;margin-bottom:-3px;}.uBox footer b a:hover{color:#f40;border-color:#f40}</style><form><h1></h1><u><input placeholder=" " type="text" id="account" autocomplete="username" required=""><label for="account">邮箱</label></u><u><input placeholder=" " type="password" id="password" autocomplete="current-password" minlength="6" required=""><label for="password">密码</label></u><b><button type="submit">登录</button><button type="submit">注册</button></b><footer><b><input id="uAuthAgree" checked type="checkbox"><label for="uAuthAgree">同意</label><a>用户协议</a></b><a>重设密码</a></footer></form>"""

  input_li = [...box.getElementsByTagName 'input']
  btn = box.getElementsByTagName("button")
  form = tag0(box,'form')
  submit = =>
    form.classList.add ING
    try
      console.log await captcha.auth(
        [n].concat input_li.slice(0,2).map((i)=>i.value)
      )
      box.close()
      alert 'done'
    catch
      form.classList.remove ING
    return

  btn[0].onclick = (e)->
    if @className != O
      n = 0
      submit()
    else
      btn[1].className = O
      btn[0].className = ''
    return false

  btn[1].onclick = ->
    if @className != O
      n = 1
      submit()
    else
      input_li[0].value = ''
      btn[1].className = ''
      btn[0].className = O
    return false

  btn[n].className = O
  box

< signIn = =>
  sign(1)
  return

< signUp = =>
  sign(0)
  return
