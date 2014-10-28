servicesModule = require './_index'

# ---
# @ngInject
# ---
ProjectService = ($q, $http) ->
  service = {}

  service.get = ->
    deferred = $q.defer()

    $http.get '/assets/mockJson/data.json'
      .success (data) ->
        deferred.resolve data
      .error (err, status) ->
        deferred.reject err, status

    return deferred.promise

  return service


# ---
# Add to the module
# ---
servicesModule.service 'ProjectService', ProjectService