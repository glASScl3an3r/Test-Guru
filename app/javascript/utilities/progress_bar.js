class ProgressBar {
  static setProgressTo(progressId) {
    const progressBar = document.getElementById(progressId)
    if (!progressBar) return

    const progressPercent = progressBar.dataset.progressPercent
    progressBar.style.width = `${progressPercent}%`
  }
}

export default ProgressBar
