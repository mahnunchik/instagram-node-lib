
class InstagramTags
  constructor: (parent) ->
    @parent = parent

  info: (params) ->
    credentials = @parent._credentials {}
    params['path'] = "/#{@parent._api_version}/tags/#{params['name']}?#{@parent._to_querystring(credentials)}"
    @parent._request params

  recent: (params) ->
    to_querystring = @parent._credentials {}
    to_querystring['min_id'] = params['min_id'] if params['min_id']?
    to_querystring['max_id'] = params['max_id'] if params['max_id']?
    params['path'] = "/#{@parent._api_version}/tags/#{params['name']}/media/recent?#{@parent._to_querystring(to_querystring)}"
    @parent._request params

  search: (params) ->
    params = @parent._credentials params
    params['path'] = "/#{@parent._api_version}/tags/search?#{@parent._to_querystring(params)}"
    @parent._request params

  subscribe: (params) ->
    params['object'] = 'tag'
    @parent.subscriptions._subscribe params

  unsubscribe: (params) ->
    @parent.subscriptions._unsubscribe params

  unsubscribe_all: (params) ->
    params['object'] = 'tag'
    @parent.subscriptions._unsubscribe params

module.exports = InstagramTags
