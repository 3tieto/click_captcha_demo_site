<script lang="coffee">
> ~/lib/fTxtMd.js
  ./Wait.svelte
  @8n/mark
  @8p/title
  @8p/lang
  @8n/tag0
  svelte > tick

+ h,m

< url

onMount =>
  if url.endsWith '/'
    url += 'README.md'
    if url.startsWith '/'
      url = url.slice(1)
  md = await fTxtMd lang()+'/'+url
  h = mark md
  await tick()
  title tag0(m,'h1')?.innerText
  return
</script>

<template lang="pug">
+if h===undefined
  Wait
  +else
    b.m(@&m)
      | {@html h}
</template>

<style lang="stylus">
b.m
  display block

  b, strong
    font-weight 500
</style>

