package upstream

import std.core.*

@Annotation
public class Tag { public const init() {} }

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}

public func ftiIdentity<T>(v: T): T { v }

public func ftiPair<T0, T1>(a: T0, b: T1): T1 { b }

