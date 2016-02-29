# backlog-hubot

backlog-hubot is a chat bot built on the Hubot framework.  
This bot manages issues on [Backlog](http://www.backlog.jp).  
It can run on [Heroku](http://www.heroku.com).

## Configuration on Heroku

You have to set configuration on the Heroku foloowing commands.

    % git clone https://github.com/Ippey/BacklogHubot.git
    % heroku create [heroku-app-name]
    % heroku addons:create rediscloud --app [heroku-app-name]
    % heroku addons:create scheduler:standard --app [heroku-app-name]
    % heroku config:set BACKLOG_API_KEY=[your-backlog-api-key] --app [heroku-app-name]
    % heroku config:set BACKLOG_PROJECT_ID=[backlog-project-id] --app [heroku-app-name]
    % heroku config:set BACKLOG_SUB_DOMAIN=[backlog-space-id] --app [heroku-app-name]
    % heroku config:set HUBOT_HEROKU_KEEP_ALIVE_URL=[your-heroku-app-url]/ --app [heroku-app-name]
    % heroku config:set HUBOT_HEROKU_SLEEP_TIME=2:00 --app [heroku-app-name]
    % heroku config:set HUBOT_HEROKU_WAKEUP_TIME=8:00 --app [heroku-app-name]
    % heroku config:set HUBOT_SLACK_TOKEN=[your-slack-token] --app [heroku-app-name]


## Deployment

    % git push heroku master

## Author

Ippei Sumida

## License

GPL V3.0
