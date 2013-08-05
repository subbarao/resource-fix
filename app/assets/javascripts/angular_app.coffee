#= require angular
#= require angular-resource

angular.
  module('angularApp', ['ngResource']).
  config(["$httpProvider", ($httpProvider) ->
    meta = document.getElementsByTagName('meta')
    angular.forEach meta, (token) ->
      if token.name == 'csrf-token'
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = token.content
  ]).factory('bgResource', ['$resource', ($resource) ->
    (url, paramDefaults, actions)  ->
      defaults =
        create:
          method: 'post'
        update:
          method: 'put'
          isArray: false

      bgResource = $resource(url, paramDefaults, angular.extend(defaults, actions))
      bgResource.prototype.$save = ->
        if @id then @$update() else @$create()

      bgResource
  ]).factory('Post', ['bgResource', ($resource) ->
    $resource('posts/:id', id: '@id')
  ])
