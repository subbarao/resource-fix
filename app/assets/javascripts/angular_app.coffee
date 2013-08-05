#= require angular
#= require angular-resource

angular.
  module('angularApp', ['ngResource']).
  config(['$provide', ($provide) ->
    $provide.
      decorator("$resource", ['$delegate', ($delegate) ->
        (url, paramDefaults, actions)  ->
          defaults =
            update:
              method: 'put'
              isArray: false

          resource = $delegate(url, paramDefaults, angular.extend(defaults, actions))
          resource.prototype.$saveOrUpdate = ->
            if @id then @$update() else @$save()

          resource
      ])
  ]).config(["$httpProvider", ($httpProvider) ->
    meta = document.getElementsByTagName('meta')
    angular.forEach meta, (token) ->
      if token.name == 'csrf-token'
        $httpProvider.defaults.headers.common['X-CSRF-Token'] = token.content
  ]).factory('Post', ['$resource', ($resource) ->
    $resource('posts/:id', id: '@id')
  ])
