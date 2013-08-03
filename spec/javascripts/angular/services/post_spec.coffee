#= require application
#= require angular-mocks

describe 'Post', ->
  beforeEach module('angularApp')
  beforeEach inject ( (Post, $httpBackend) ->
    @post = new Post()
  )

  it "should save for new records", ->
    @post.$save()


