// Generated by CoffeeScript 1.9.1
(function() {
  var CkArray,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  CkArray = (function(superClass) {
    extend(CkArray, superClass);

    function CkArray(items) {
      this.observers = [];
      this.push = function() {
        var args, result;
        args = Array.prototype.slice.call(arguments);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.prePush) != null ? ref.apply(null, args) : void 0;
        });
        result = Array.prototype.push.call(this, args);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.postPush) != null ? ref.apply(null, args) : void 0;
        });
        return result;
      };
      this.splice = function() {
        var args, result;
        args = Array.prototype.slice.call(arguments);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.preSplice) != null ? ref.apply(null, args) : void 0;
        });
        result = Array.prototype.splice.apply(this, args);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.postSplice) != null ? ref.call(null, result) : void 0;
        });
        return result;
      };
      this.slice = function() {
        var args, result;
        args = Array.prototype.slice.call(arguments);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.preSlice) != null ? ref.apply(null, args) : void 0;
        });
        result = Array.prototype.slice.apply(this, args);
        this.observers.map(function(observer) {
          var ref;
          return (ref = observer.postSlice) != null ? ref.call(null, result) : void 0;
        });
        return result;
      };
    }

    CkArray.prototype.observe = function(observer) {
      return this.observers.push(observer);
    };

    return CkArray;

  })(Array);

  (function() {
    var definition;
    definition = function() {
      return CkArray;
    };
    if (typeof module !== void 0) {
      return module.exports = definition();
    } else if (typeof define === 'function' && typeof define.amd === 'object') {
      return define(definition);
    }
  })();

}).call(this);

//# sourceMappingURL=CkArray.js.map
