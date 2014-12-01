---

---
# body = docElem = window.document.documentElement
wrap = document.querySelector '.header--main'
mockup = wrap.querySelector '.header-wrapper'
mockupWidth = mockup.offsetWidth

scaleMockup = ->
  wrapWidth = wrap.offsetWidth
  val = wrapWidth / mockupWidth
  
  mockup.style['-webkitTransform'] = 'scale3d(' + val + ', ' + val + ', 1)'
  mockup.style['-mozTransform'] = 'scale3d(' + val + ', ' + val + ', 1)'
  mockup.style['-msTransform'] = 'scale3d(' + val + ', ' + val + ', 1)'
  mockup.style['-oTransform'] = 'scale3d(' + val + ', ' + val + ', 1)'
  mockup.style['transform'] = 'scale3d(' + val + ', ' + val + ', 1)'

resizeHandler = ->
  delayed = ->
    scaleMockup()
    resizeTimeout = null
        
  clearTimeout resizeTimeout if typeof resizeTimeout isnt 'undefined'
  resizeTimeout = setTimeout delayed, 50

scaleMockup()      
window.addEventListener 'resize', resizeHandler
