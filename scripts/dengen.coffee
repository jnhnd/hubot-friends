# Description:
#   Google Maps API を利用して住所から位置情報を取得する
# Commands:
#   dengen {keyword}
#
fs = require 'fs'
request = require 'request'

module.exports = (robot) ->
    robot.hear /(dengen|電源) (.*)/i, (msg) ->
        obj = JSON.parse(fs.readFileSync('scripts/etc/api.json', 'utf-8'))
        key = obj.google.key
        keyword = msg.match[2]
        language = 'ja'
        region = 'ja'
        query = encodeURI("https://maps.googleapis.com/maps/api/geocode/json?address=#{keyword}&language=#{language}&region=#{region}&key=#{key}")
        request.get(query, (error, response, body) ->
            data = JSON.parse(body)
            if data.status != 'OK'
                return msg.send """
                                失敗しちゃった！
                                status: #{data.status}
                                """
            dengenQuery = "http://oasis.mogya.com/api/v0/map?lat=#{data.results[0].geometry.location.lat}&lng=#{data.results[0].geometry.location.lng}"
            request.get(dengenQuery, (error,response, body) ->
                dengenData = JSON.parse(body)
                msg.send "電源が使えるとこ！ #{dengenData.url}"))
