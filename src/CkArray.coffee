

# Trying to create an observer pattern for arrays

class CkArray extends Array
  constructor: (items) ->

    # we'd like
    self = this
    if items and items instanceof Array then items.forEach (i) -> self.push i

    # initialize the observers
    this.observers = []

    # the push handler. This function decorates the 'push' method of
    # the array on which my CkArray is based.
    this.push = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.prePush?.apply null, args
      result = Array.prototype.push.call(this, args)
      this.observers.map (observer) -> observer.postPush?.apply null, args
      result



    # the observable splice function
    this.splice = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.preSplice?.apply null, args
      result = Array.prototype.splice.apply(this, args)
      this.observers.map (observer) -> observer.postSplice?.call null, result
      result



    # an observable slice method
    this.slice = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.preSlice?.apply null, args
      result = Array.prototype.slice.apply(this, args)
      this.observers.map (observer) -> observer.postSlice?.call null, result
      result


  observe: (observer) ->
    this.observers.push observer


# support both AMD and CommonJS for modularity
do () ->

  # a definition function which when invoked returns the CkArray class
  # because the two patterns, AMD and CommonJS work differently we needed
  # a wrapper function to contain the actual module result
  definition = () -> CkArray

  if typeof module isnt undefined then module.exports = definition()
  else if typeof define is 'function' and typeof define.amd is 'object'
    define(definition)