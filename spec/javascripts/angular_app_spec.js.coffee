#= require angular_app
#= require angular-mocks

describe 'Post', ->
  beforeEach module('angularApp')

  beforeEach inject ((Post, $httpBackend) ->
    @post        = new Post()
    @httpBackend = $httpBackend
  )

  describe '$saveOrUpdate', ->
    beforeEach ->
      @fakeResponse = id: 2

    it "should invoke save for new resource", ->
      @httpBackend.whenPOST('posts').respond(@fakeResponse)
      @post.$saveOrUpdate()

    it "should invoke update for existing resource", ->
      @post.id = 2
      @httpBackend.whenPUT('posts/2').respond(@fakeResponse)
      @post.$saveOrUpdate()
