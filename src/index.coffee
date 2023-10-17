> ./conf.js:
  @8p/font:
  @8p/nav/a.js:
  ./styl/site.styl

# > @8n/idb
#
# TABLE_URI_VER_BIN = 1
# EXT = 'e'
# PATH = 'p'
#
# await idb.vf(
#   1 # version
#   {
#     upgrade: (db)=>
#       db.createObjectStore TABLE_URI_VER_BIN, {
#         keyPath: [EXT, PATH]
#       }
#       return
#   }
# )

if not window.orientation # 桌面端
  (await import("@8p/mouse")).default()

> ./Index.svelte

new Index({
  target: document.body
})
