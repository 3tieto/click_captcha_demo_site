> ~/Box.coffee
  ./Auth.svelte

O = 'o'
ING = 'ing'

sign = (n)=>
  new Auth {
    target: Box ""
    props: {
      n
    }
  }
  return

< signIn = =>
  sign(0)
  return

< signUp = =>
  sign(1)
  return
