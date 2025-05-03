import './assets/style.css'
import Main from './src/Main.elm'

const app = Main.init({
  node: document.getElementById('app'),
  flags: parseInt(localStorage.getItem('count')) || 0
})


//handle a message from elm
if (app.ports?.sendCounterValue?.subscribe) {
  app.ports.sendCounterValue.subscribe(
    (msg) => {
      localStorage.setItem('count', JSON.stringify(msg));
      console.log("msg from ELM", msg)
    }
  )
}

//create a button to test sending a sendMsgFromJs msg to Elm
const but = document.createElement('button')

but.innerText = "Send a message to Elm"
but.className = "btn btn-accent"

but.addEventListener("click", function () {
  if (app.ports?.sendMsgFromJs?.send) {
    app.ports.sendMsgFromJs.send("Just pressed the button in Javascript side")
  } else {
    alert('I can\'t send a message to Elm!')
  }
});

//add the button to the div with id="js"
document.getElementById('js').appendChild(but)
