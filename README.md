# Elm with vite 6 and taiwindcss 4 Starter Template

I recently created the [Elm with webpack 5 and taiwindcss 4 Starter Template](https://github.com/stratis-vip/webpack-elm-tailwind-4)
but it looks like, vite is much simpler solution.

So i will not update the webpack template any more!

## Sample Elm app included

Elm web application, is a simple counter with these extra:

  1. Uses [flags](https://guide.elm-lang.org/interop/flags) to
  get the counter from localStorage of js host, using the
  [Storage:getItem()](https://developer.mozilla.org/en-US/docs/Web/API/Storage/getItem)
  function.

  2. Uses [ports](https://guide.elm-lang.org/interop/ports.html)
  to

      * send a `String` message from javascript host.

      * send the counter value to javascript host.
  Javascript saves the value with
  [Storage:setItem()](https://developer.mozilla.org/en-US/docs/Web/API/Storage/setItem)
  function.

  3. Demonstrate the `onMouseEnter` and `onMouseLeave`
  [events](https://package.elm-lang.org/packages/elm/html/latest/Html.Events)
  over an image element.

## Sample Html page included

  1. Index html has all of
  [Favicons](https://developer.mozilla.org/en-US/docs/Glossary/Favicon) available

  2. Uses tailwindcss 4 classes and FlyonUI buttons.

  3. Has 2 `div` elements to show the Host(js) - Client(elm) model

## This template is using

* vite 6.3.4
* vite-plugin-elm-watch 1.4.3::
* elm 0.19.1
* tailwindcss 4.1.4
* FlyonUI 2.1.0

Images are at public/images folder

Tree is like this

```text
.
├── assets
│   └── style.css
├── elm.json
├── index.html
├── main.js
├── package.json
├── public
│   ├── apple-touch-icon.png
│   ├── favicon-96x96.png
│   ├── favicon.ico
│   ├── favicon.svg
│   ├── images
│   │   ├── athena.png
│   │   └── placeholder.png
│   ├── site.webmanifest
│   ├── web-app-manifest-192x192.png
│   └── web-app-manifest-512x512.png
├── README.md
├── src/
│   └── Main.elm
└── vite.config.js
```

## Instructions

1. Clone the git
2. Run `elm reactor` to download all packages (if needed)
3. Run `npm i`  to install all other dependencies
4. `npm start` run the vite server.
5. Change the `public/favicons` etc with your favicons.
[Favicon generator](https://realfavicongenerator.net) does this job.

## References

### CSS - Bundler - UI

* [Tailwindcss 4 documentation](https://tailwindcss.com/docs/installation/using-postcss)
* [Vite 6 documentation](https://vite.dev/guide/)
* [Flyon documentation](https://flyonui.com/docs/getting-started/quick-start/)

### Elm

* [Elm guides](https://guide.elm-lang.org/)
* [Elm packages](https://package.elm-lang.org/)
* [Ryan Haskell's excellent "Welcome to elm" videos on youtube](https://www.youtube.com/playlist?list=PLuGpJqnV9DXq_ItwwUoJOGk_uCr72Yvzb)
