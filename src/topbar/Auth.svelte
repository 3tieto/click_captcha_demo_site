<script lang="coffee">
> ~/auth.coffee > signUp signIn
</script>

<template lang="pug">
b
  a(@click=signIn) >signIn
  | ⧸
  a(@click=signUp) >signUp
</template>

<style lang="stylus">
b
  align-self stretch
  border-left 1px solid #eee
  color #ccc
  margin-left 24px
  padding-left 24px

  &>a
    color #666
    margin 0 12px

    &:first-child
      margin-left 0

    &:last-child
      margin-right 0

    &:hover
      color #f40
</style>

