package test.parent



public open class U1 {}

public class U2 <: U1 {}

public func f(a: U1): S2

public func g(a: U2): S1

public func call1()

public func h(lam: (U2) -> S1): S1

public func call2()