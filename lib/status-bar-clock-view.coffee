class StatusBarClockView extends HTMLElement
  init: ->
    @classList.add('status-bar-clock', 'inline-block', 'icon-clock')
    @activate()

  activate: ->
    @intervalId = setInterval @updateClock.bind(@), 100

  deactivate: ->
    clearInterval @intervalId

  getTime: ->
    date = new Date

    seconds = date.getSeconds()
    minutes = date.getMinutes()
    hour = date.getHours()
    
    suffix = 'pm' if hour = >= 12
    suffix = 'am' if hour  < 12
    hour = hour-12 if hour = > 12
    hour = 12 if hour == 0

    minutes = '0' + minutes if minutes < 10
    seconds = '0' + seconds if seconds < 10

    "#{hour}:#{minutes}:#{seconds} #{suffix}"

  updateClock: ->
    @textContent = @getTime()

module.exports = document.registerElement('status-bar-clock', prototype: StatusBarClockView.prototype, extends: 'div')
