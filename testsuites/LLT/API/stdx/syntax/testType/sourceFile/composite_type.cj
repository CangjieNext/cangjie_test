func testFunc(): A<B, C> {}
let a: A = 1
let b: A<B> = 1
let c: A<B, C> = 1
let d: A<Int32> = 1
let e: A<String, ?B, ((C), T.D)> = 1
let a: T.A = 1
let b: T.S.A<T.S.B> = 1
let c: T.A<T.B, (T.C, T.D)> = 1