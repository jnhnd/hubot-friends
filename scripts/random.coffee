# Description:
#   特定のワードに反応する
# Commands:
#   matsuya / gatya
childProcess = require 'child_process'

module.exports = (robot) ->
    robot.hear /matsuya|松屋|まつや/i, (msg) ->
        childProcess.exec "matsuya", (error, stdout, stderr) ->
            msg.reply stdout

    robot.hear /gacha|gatya|ガチャ|がちゃ/i, (msg) ->
        childProcess.exec "takarabako", (error, stdout, stderr) ->
            msg.reply stdout
