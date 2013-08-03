angular.
  module('angularApp').
  factory('Post', ['$resource', ($resource) ->
    $resource('posts/:id', id: '@id')
  ])
