should    = require 'should'
AngelList = require 'index'

accessToken = process.env.DF_ANGEL_ACCESS_TOKEN

describe 'get company for slug', () ->
  angel = new AngelList accessToken
  slug  = 'angellist'
  id    = 6702

  it 'should get the correct company', (done) ->
    angel.getStartupForSlug slug, (err, startup) ->
      should.not.exist err
      startup.should.have.property 'name', 'AngelList'
      startup.should.have.property 'angellist_url', "https://angel.co/#{slug}"
      startup.should.have.property 'id', id
      done()

  it 'should get the correct company', (done) ->
    angel.getStartupForId id, (err, startup) ->
      should.not.exist err
      startup.should.have.property 'name', 'AngelList'
      startup.should.have.property 'angellist_url', "https://angel.co/#{slug}"
      startup.should.have.property 'id', 6702
      done()
