// @ts-check
class HomeBar extends HTMLElement {
    constructor() {
      super();
      const heading = this.getAttribute("heading") || "";
      const crumb = this.getAttribute("crumb") || "";
      const username = this.getAttribute("username") || "";
      this._info = {};
      let now = new Date();
      let datestr = now.toDateString();
      this._root = this.attachShadow({ mode: "open" });
      this._root.innerHTML = `
        
        <div id="home">
          <div id="menu" tabindex="0">
              <ul class="topnav">
                <li><a href="/index.html">Hjem</a></li>
                <li><a href="/om.html">Om</a></li>
                <li><a href="/iPhone.html">iPhone</a></li>
                <li><a href="/iPad.html">iPad</a></li>
                <li><a href="/macbook.html">Macbook</a></li>
                <li><a href="/watch.html">Apple Watch</a></li>
                <li><a href="plan.html">Plan</a></li>
                <li class="right"><a href="/kontakt.html">Kontakt oss</a></li>
                <li class="right"><a href="/users/login.html">Logg inn</a></li>
                <li class="right"><a href="/users/signup.html">Registrer deg</a></li>
                <li class="right"><a href="/admin/bestilling.html">admin</a></li>

                
                <div id="crumb">${crumb}</div>
                <div id="username">${username}</div>
                <div id="info">${datestr}</div>
            </ul>
              
          </div>
        </div>

        <style>

#username {
    color: white;
    text-align: center;
}

#info {
    color: white;
    text-align: center;  
}

body {
    margin: 0;
    padding: 0;
}

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

ul.topnav li {
    float: left;
}

ul.topnav li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

ul.topnav li a:hover:not(.active) {
    background-color: #111;
}

ul.topnav li a.active {
    background-color: #333(255, 0, 0)(138, 117, 117);
}

ul.topnav li.right {
    float: right;
}

body {
    font-family: sans-serif;
}

@media screen and (max-width: 1000px) {
    ul.topnav li.right, ul.topnav li {
        float: none;
    }
}
        </style> `
  
      this._root
        .querySelector("#crumb")
        .addEventListener("click", () => this.dispatchEvent(new Event("crumb")));
      this._root.querySelector("#menu").addEventListener("click", e => {
        let t = e.target;
        this._info.target = t;
        if (t.localName === "li" && t.dataset.link) {
          let link = t.dataset.link;
          location.href = `${link}.html`;
        } else this.dispatchEvent(new Event("menu"));
      });
      this._root.querySelector("#info").addEventListener("click", e => {
        let t = e.target;
        this._info.target = t;
        this.dispatchEvent(new Event("info"));
      });
      this._root
        .querySelector("#username")
        .addEventListener("click", () =>
          this.dispatchEvent(new Event("username"))
        );
    }
  
    /*
    // TODO ikke vits i da jeg ikke vet hvordan jeg
    // kan trigge click inne i menyen når tab -> focus
    connectedCallback() {
      setTimeout(() => {
        // set tabindex on assigned menu items
        let items = Array.from(this._root.querySelectorAll("#menu slot"));
        if (items && items.length) {
          items[0].assignedElements().forEach((e, i) => {
            e.setAttribute("tabindex", String(i + 1));
          });
        }
      }, 1000);
    }
    */
  
    get info() {
      return this._info;
    }
  
    static get observedAttributes() {
      return ["username", "heading", "info", "crumb", "getlinks"];
    }
  
    attributeChangedCallback(name, oldValue, newValue) {
      if (name === "username") {
        fetch(newValue)
          .then(r => r.json())
          .then(({ username }) => {
            this._root.querySelector("#username").innerHTML = username;
          })
          .catch(e => console.log("Dette virka ikke."));
          return;
      } 
      if (name === "getlinks") {
        // links can be got by fetch
        fetch(newValue)
          .then(r => r.json())
          .then(({ items }) => {
            let html = items
              .filter(e => e.endsWith(".html"))
              .map(e => e.replace(".html", ""));
            this._root.querySelector("#menu ul").innerHTML += html
              .map(e => `<li data-link="${e}">${e}</li>`)
              .join("");
          })
          .catch(e => console.log("Dette virka ikke."));
          return;
      } 
      this._root.querySelector("#" + name).innerHTML = newValue;
      
    }
  }
  
  window.customElements.define("home-bar", HomeBar);
  
  