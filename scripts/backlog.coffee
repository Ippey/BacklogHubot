# Description:
#  Manage backlog

request = require "request"
class Backlog
  backlogApiKey = process.env.BACKLOG_API_KEY
  backlogProjectId = process.env.BACKLOG_PROJECT_ID
  backlogSubDomain = process.env.BACKLOG_SUB_DOMAIN
  backlogApiDomain = "https://#{backlogSubDomain}.backlog.jp"
  backlogDomain = "https://#{backlogSubDomain}.backlog.jp"

  getUsers: () ->
    new Promise (resolve) ->
      url = "#{backlogApiDomain}/api/v2/users?apiKey=#{backlogApiKey}"
      options =
        url: url
      request options, (err, res, body) ->
        console.log(body)
        json = JSON.parse body
        messages = []
        for row in json
          messages.push("#{row.id} : #{row.name}")
        resolve messages

  getUser: (name) ->
    new Promise (resolve) ->
      url = "#{backlogApiDomain}/api/v2/users?apiKey=#{backlogApiKey}"
      options =
        url: url
      request options, (err, res, body) ->
        json = JSON.parse body
        for row in json
          if row.name == name
            resolve row.id

  getIssues: (params) ->
    new Promise (resolve) ->
      url = "#{backlogApiDomain}/api/v2/issues?apiKey=#{backlogApiKey}"
      options =
        url: url
        qs: params

      request options, (err, res, body) ->
        json = JSON.parse body
        messages = []
        for param in json
          messages.push(param.summary)
          link = "  #{backlogDomain}/view/#{param.issueKey}"
          messages.push(link)

        resolve messages


module.exports = Backlog
