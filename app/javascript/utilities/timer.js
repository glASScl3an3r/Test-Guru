class Timer {
  static setRedirectTimerTo(elementId) {
    const element = document.getElementById(elementId)
    if (!element) return

    const linkToRedirect = element.dataset.linkToRedirect
    const endTime = new Date(element.dataset.endTime)
    const time = endTime - Date.now()

    let timer = setInterval(() => {
      const timeLeft = endTime - Date.now()

      element.textContent = `${Timer.timeFormat(timeLeft)} left`
    }, 1000)

    setTimeout(() => {
      clearInterval(timer)
      alert('Time is gone')
      window.location.href = linkToRedirect
    }, time)
  }

  static timeFormat(ms) {
    const mins = Math.floor(ms / 60000)
    const secs = ((ms % 60000) / 1000).toFixed(0)
    return mins + ':' + ((secs < 10) ? '0' : '') + secs
  }
}

export default Timer
