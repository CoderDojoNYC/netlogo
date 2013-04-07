$ ->
  $(document).pjax 'a', '#content'
  $(document).on 'pjax:complete', -> initialize()
  initialize()

  clip = new ZeroClipboard $('.copy'), moviePath: '/ZeroClipboard.swf'

initialize = ->
  $('.header').click (event) ->
    target = $(event.currentTarget)
    target.next('.body').toggleClass 'hide'

    button = target.find '.expand'
    symbol = if button.hasClass 'hide' then '+' else '-'
    button.html symbol
