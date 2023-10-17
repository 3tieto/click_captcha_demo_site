<template lang="pug">
Topbar
Scroll
  b
    +if M
      <svelte:component this="{M}" {...A}/>
    Foot
</template>

<script lang="coffee">
> ./Foot.svelte
  ./PAGE.coffee
  ./Topbar.svelte
  ./com/Wait.svelte
  @8p/h404
  @8p/nav:Nav
  @8p/scroll:Scroll
  @w5/fetch/fTxt
  svelte > tick

A = {}
M = Wait

page = (m,a)=>
  M = undefined
  A = a
  await tick()
  M = m
  return

[
  route
  routeClear
  routeSetNoFound
] = Nav(
  (_, func, url)=>
    page func, {url}
    return
)

onI18n (_, {url})=>
  routeClear()
  for [func, li] from Object.entries url
    for u from li
      if u.endsWith '/'
        url = u.slice(0,-1)
      route url, PAGE[func], u
  routeSetNoFound =>
    page h404,{}
    return
  return
</script>

<style lang="stylus">
:global(body>.scroll)
  background #fff
  justify-content center
  position absolute
  width 100%

b
  width 100%
</style>

