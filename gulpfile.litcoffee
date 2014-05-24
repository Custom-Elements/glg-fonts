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
            name = path.basename(file.path, '.woff')
            fs.exists path.join(__dirname, 'src', "#{name}.css"), (exists) ->
              if exists
                template = path.join(__dirname, 'src', "#{name}.css")
              else
                template = path.join(__dirname, '/src/font.css')
              fs.readFile template, (err, data) ->
                file.contents = new Buffer(handlebars.compile(data.toString('utf8')) {
                  name: name
                  content: file.contents.toString('base64')
                })
                callback undefined, file
        .pipe rename(extname: '.less')
        .pipe gulp.dest('build')
