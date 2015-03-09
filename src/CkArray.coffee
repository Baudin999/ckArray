

# Trying to create an observer pattern for arrays

class CkArray extends Array
  constructor: (items) ->


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



module.exports = CkArray