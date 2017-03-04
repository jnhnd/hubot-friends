# Description:
#   Hello World test
#
# Commands:
#   friends Hello World - Reply with <Welcome to Underground!>

module.exports = (robot) ->
    robot.respond /hello world$/i, (msg) ->
        msg.send "わーい！すごーい！"
