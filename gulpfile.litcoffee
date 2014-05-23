Build font files into css importable snippets, one per font.

    gulp = require 'gulp'
    rename = require 'gulp-rename'
    es = require 'event-stream'
    fs = require 'fs'
    handlebars = require 'handlebars'
    path = require 'path'

    gulp.task 'build', ->
      gulp.src '*.woff', {cwd: 'fonts'}
        .pipe do ->
          es.map (file, callback) ->
            fs.readFile path.join(__dirname, '/src/font.css'), (err, data) ->
              file.contents = new Buffer(handlebars.compile(data.toString('utf8')) {
                name: path.basename(file.path, '.woff')
                content: file.contents.toString('base64')
              })
              callback undefined, file
        .pipe rename(extname: '.css')
        .pipe gulp.dest('build')
