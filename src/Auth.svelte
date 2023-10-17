<script lang="coffee">
> ./captcha.coffee

< n

+ form, ing, input_li

O = 'o'

focus = =>
  for i from input_li
    if not i.value
      i.focus()
      break
  return

onMount =>
  input_li = [...form.getElementsByTagName 'input'].slice(0,2)
  focus()
  button_li = [...form.getElementsByTagName 'button'].slice(1,3)
  for i from button_li
    i.onclick = (e)->
      for i,pos in button_li
        if i == @
          n = pos
          if i.classList.contains O
            i.classList.remove O
        else
          i.classList.add O
        focus()
      return
  button_li[n].classList.add O
  return

submit = =>
  ing = 1
  try
    console.log await captcha.auth(
      [n].concat input_li.map((i)=>i.value)
    )
    form.parentNode.close()
    alert 'done'
  catch
    ing = 0
  return
</script>

<template lang="pug">
form(@&form @submit|preventDefault=submit class:ing=ing)
  //- 回车始终是点击它
  button
  h1
  u
    input#account(autocomplete="username" placeholder=" " required type="text")
    label(for="account") 邮箱
  u
    input#password(
      autocomplete="current-password"
      minlength="6"
      placeholder=" "
      required
      type="password"
    )
    label(for="password") 密码
  b
    button 注册
    button 登录
  footer
    b
      input#uAuthAgree(checked type="checkbox")
      label(for="uAuthAgree") 同意
      a 用户协议
    a 重设密码
</template>

<style lang="stylus">
#uAuthAgree
  margin-right 6px

h1
  background var(--svgLogo) 50% 50% no-repeat
  height 42px
  margin 24px 0 12px
  text-indent -999px
  width 100%

form
  overflow hidden

  &>button
    left -99px
    position absolute

  & > b
    & > :global(button)
      flex 1

    & > :global(button.o)
      background 0 0
      border-bottom 5px solid var(--c)
      box-shadow none
      box-sizing border-box
      color var(--c)
      flex 0
      padding 16px 0 10px
      white-space nowrap

    & > :global(button:first-child)
      margin-right 16px

  & > b
    align-self normal
    margin 0 16px 16px

b
  align-items center
  display flex

form
  > p, footer
    align-items center
    box-sizing border-box
    display flex
    justify-content space-between
    padding 16px
    width 100%

  footer
    border-top 1px solid #eee
    color #999
    font-size 14px

    a
      color #999

    b
      a
        border-bottom 0.5px solid #ccc
        margin-bottom -3px
        margin-left 6px
        padding-bottom 3px

      a:hover
        border-color #f40
        color #f40
</style>

