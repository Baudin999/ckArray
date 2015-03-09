

# Trying to create an observer pattern for arrays

class CkArray extends Array
  constructor: () ->
    this.observers = []

    # the push handler. This function decorates the 'push' method of
    # the array on which my CkArray is based.
    this.push = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.prePush?.apply null, args
      result = Array.prototype.push.call(this, args)
      this.observers.map (observer) -> observer.postPush?.apply null, args
      result

    this.splice = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.preSplice?.apply null, args
      result = Array.prototype.splice.call(this, args)
      this.observers.map (observer) -> observer.postSplice?.apply null, args
      result

    this.slice = () ->
      args = Array.prototype.slice.call(arguments)
      this.observers.map (observer) -> observer.preSplice?.apply null, args
      result = Array.prototype.slice.call(this, args)
      this.observers.map (observer) -> observer.postSlice?.apply null, args
      result




  observe: (observer) ->
    this.observers.push observer



module.exports = CkArray