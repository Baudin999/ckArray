

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


