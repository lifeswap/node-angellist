request = require('request').defaults jar: false

API_URL = 'https://api.angel.co/1'

module.exports = class AngelList
  constructor: (@accessToken) ->

  get: (path, query, callback) =>
    query.access_token = @accessToken
    params =
      method: 'GET'
      url: API_URL + path
      qs: query
      json: true
    request params, callback

  getStartupForSlug: (slug, callback) =>
    @get '/startups/search', {slug}, (err, resp, startup) =>
      callback err, startup

  getStartupForId: (id, callback) =>
    @get "/startups/#{id}", {}, (err, resp, startup) =>
      callback err, startup
