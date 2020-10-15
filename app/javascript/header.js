function pullDown() {

  const pullDownButton = document.getElementById("lists")
  const pullDownList = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#35C0C2; color:white;")
  })
  
  pullDownButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#35C0C2; color:white;")
  })

  pullDownButton.addEventListener('click', function() {
    if (pullDownList.getAttribute("style") == "display:block;") {
      pullDownList.removeAttribute("style", "display:block;")
      pullDownButton.removeAttribute("style", "background-color:#35C0C2; color:white;")
    } else {
      pullDownList.setAttribute("style", "display:block;")
    }
  })
}
window.addEventListener('load', pullDown)