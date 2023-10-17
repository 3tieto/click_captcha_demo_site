<script lang="coffee">
+ I, qHolder, search

onI18n (o)=>
  {qHolder, search} = o
  setTimeout =>
    I.focus()
    return
  return

</script>

<template lang="pug">
+if qHolder
  form
    input(@&I placeholder:qHolder)
    m-c
      button(title:search type="submit")
</template>

<style lang="stylus">
form
  align-self stretch
  border 1px solid #eee
  border-width 0 1px 0 1px
  flex-direction row
  position relative

  input, button
    border 0

  input
    padding-right 48px
    width 250px

  button
    background transparent
    height 48px
    width 48px

  m-c
    background-image var(--svgQ)
    border-radius 24px
    height 48px
    margin 0
    overflow hidden
    position absolute
    right 0
    width 48px
</style>

