# Description:
#   http://tiqav.com/ から画像を取得
# Commands:
#   tiqav {keyword}

module.exports = (robot) ->
    robot.hear /(tiqav|ちくわ) (.*)/i, (msg) ->
        request = require('request')
        request.get("http://api.tiqav.com/search.json?q=#{msg.match[1]}", (error, response, body) ->
            if error or response.statusCode != 200
                return msg.send('画像検索に失敗しちゃったよ！')
            data = JSON.parse(body)[0]
            msg.send "それー！ http://img.tiqav.com/#{data.id}.#{data.ext}")
