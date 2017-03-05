# Description:
#   Hello test
#
# Commands:
#   Hello

module.exports = (robot) ->
    robot.hear /hello/i, (msg) ->
        msg.send "わーい！すごーい！"
