# CK Array

I like the Observer pattern. It is clear, it is smooth and it shines when combined with JavaScript and CoffeeScript.
This is why I've created this little library which creates an Observable array, an array into which you can pass
an observer and pass handlers.


The following functionality is supported:

initialize the CkArray:

    var CkArray = require('ck-array')
    var a = new CkArray()

You can now pass in an observable by calling something like:

    var observable = {
        prePush:    function(argument) {},
        postPush:   function(argument) {},
        preSlice:   function(arguments) {},
        postSlice:  function(result) {},
        preSplice:  function(arguments) {},
        postSplice: function(result) {},
    }

The ```argument``` value is of course the argument(s) passed into the function. There is no way to cancel the action
yet in the 'pre' functions. There is no way to rollback yet. The ```result``` value is the result from calling the
function on the array.

## Planned changes
There are a few things which I'd like to add to this observable array implementation, I would like a way to cancel and
rollback a method call. I would also like to add implementations for all of the other array methods.

## What will stay the same?
The 'thoughts' behind this implementation will not break in the coming releases. So most of the future extensions will
be made to the observable object and the implementations of the other methods of the Array prototype. The current
tests will not be broken.