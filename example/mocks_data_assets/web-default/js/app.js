function switchContext() {
    fetch(`http://${location.host}/switch`).then(() => {
        document.querySelector('p').innerText = "Context switched! Now please reload the page ;)"
    })
}