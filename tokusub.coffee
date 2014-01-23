# Description:
#   whats today's tokusub?
#
# Commands:
#   得サブ - 今日の得サブは？
module.exports = (robot) ->
  robot.hear /得サブ/i, (msg) ->
    request = robot.http("https://raw.github.com/kyubuns/hubot_tokusub/master/tokusub.json").get()
    request (err, res, body) ->
      tokusubs = JSON.parse body
      d = new Date
      msg.send "今日の得サブは" + tokusubs[d.getDay()] + "だよ！"
