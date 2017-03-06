# Description:
#   キーワードを指定するとhotpepperからお店の情報を取ってきて教えてくれる
# Commands:
#   hotpepper {keyword}
#
# Powered by ホットペッパー Webサービス [http://webservice.recruit.co.jp/]
#
fs = require 'fs'
request = require 'request'

module.exports = (robot) ->
    robot.hear /(hotpepper|ホットペッパー|店探して) (.*)/i, (msg) ->
        obj = JSON.parse(fs.readFileSync('scripts/etc/api.json', 'utf-8'))
        key = obj.hotpepper.key
        keyword = msg.match[2]
        query = encodeURI("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&keyword=#{keyword}&order=4&count=30&format=json")
        request.get(query, (error, response, body) ->
            if error or response.statusCode != 200
                return msg.send('お店検索に失敗しちゃったよ！')
            data = JSON.parse(body)
            idx = Math.floor(data.results.shop.length * Math.random())
            msg.send """
                     あなたはお店を探すのが苦手なフレンズなんだね！
                     このお店はどうかなー？
                     #{data.results.shop[idx].urls.pc}
                     """)
