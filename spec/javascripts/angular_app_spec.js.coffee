#= require angular_app
#= require angular-mocks

describe 'Post', ->
  beforeEach module('angularApp')

  beforeEach inject ((Post, $httpBackend) ->
    @post        = new Post()
    @httpBackend = $httpBackend
  )

  describe '$save', ->
    beforeEach ->
      @fakeResponse = id: 2

    it "should post to create resource", ->
      @httpBackend.whenPOST('posts').respond(@fakeResponse)
      @post.$save()

    it "should put to update resource", ->
      @post.id = 2
      @httpBackend.whenPUT('posts/2').respond(@fakeResponse)
      @post.$save()
