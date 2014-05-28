#Overview
Fonts, inlined for better speed via less web requests with data-uri.
This provides `less` files, which can simply be imported and there is
no need for you to worry about the font path, which makes it great when
working with [Polymer](http://www.polymer-project.org/).

##Usage
This is provided as npm since it has a build step using
[gulp](http://gulpjs.com/).

```shell
npm install --save wballard/ui-fonts.git
```

In your less source, you just import and this will inline:

```less
@import "<root>/node_modules/ui-fonts/build/font-awesome";
@import "<root>/node_modules/ui-fonts/build/grotesk";
```

##LESS/CSS
Just to be nice, the `less` files in `./build` are valid `css`, so you
can use them without processing, check out it in `demo.html`.

##Important
Grotesk will require you to purchase a license to use on sites other
than GLG licensed domains. Don't be a stealer.
