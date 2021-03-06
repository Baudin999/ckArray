

describe 'A test suite for the CkArray class', () ->

  a = undefined

  it 'should be able to be required', () ->
    CkArray = require './../src/CkArray'
    expect(CkArray).not.toBeNull()
    expect(CkArray).not.toBeUndefined()

  it 'should be able to create an Array which acts like an Array', () ->
    CkArray = require './../src/CkArray'
    a = new CkArray()
    expect(a).not.toBeNull()
    expect(a).not.toBeUndefined()
    expect(a instanceof Array).toMatch(/true/)

  it 'should be able to initialize from array', () ->
    CkArray = require './../src/CkArray'
    testArray = new CkArray([1,2,3,4,5,6,7,8,9])
    expect(testArray.length).toEqual(9)

  it 'should have a length property', () ->
    expect(a.length).toBeDefined()
    expect(a.length).toEqual(0)

  it 'should have a push function which pushes an item onto the
      array and increments the length property by one', () ->
    expect(a.push).toBeDefined('CkArray does not have a push method')
    expect(typeof a.push).toEqual('function','The push method on the CkArray is not a function')
    expect(a.push 12).toEqual(1)

  it 'should be able to observe changes and handle push messages', () ->
    expect(a.observe).toBeDefined('CkArray does not have a pushObserve member')
    expect(typeof a.observe).toEqual('function', 'The pushObserve member of CkArray is not a function')

    preItem = undefined
    postItem = undefined
    a.observe {
      prePush:  (item) -> preItem = item
      postPush: (item) -> postItem = item
    }
    a.push 13

    expect(preItem).toEqual(13)
    expect(postItem).toEqual(13)


  # testing "slice"
  it 'should be able to observe changes from slice', () ->

    CkArray = require './../src/CkArray'
    a = new CkArray()

    [1,2,3,4,5,6,7,8,9].forEach (n) -> a.push n

    preSlice = undefined
    postSlice = undefined

    a.observe {
      preSlice: () -> preSlice = {}
      postSlice: (items) -> postSlice = items
    }

    a.slice 4, 6

    expect(preSlice).not.toBeUndefined()
    expect(postSlice).not.toBeUndefined()
    expect(postSlice instanceof Array).toMatch(/true/)
    expect(postSlice.length).toEqual(2, 'length is not correct')


  # testing "splice"
  it 'should be able to observe changes from splice', () ->

    CkArray = require './../src/CkArray'
    a = new CkArray()

    [1,2,3,4,5,6,7,8,9].forEach (n) -> a.push n

    preSplice = undefined
    postSplice = undefined

    a.observe {
      preSplice: () -> preSplice = {}
      postSplice: (items) -> postSplice = items
    }

    a.splice 4, 3

    expect(preSplice).not.toBeUndefined()
    expect(postSplice).not.toBeUndefined()
    expect(postSplice instanceof Array).toMatch(/true/)
    expect(postSplice.length).toEqual(3, 'length is not correct')
    expect(a.length).toEqual(6, 'the original array is not modified, it\'s length should be 6')


