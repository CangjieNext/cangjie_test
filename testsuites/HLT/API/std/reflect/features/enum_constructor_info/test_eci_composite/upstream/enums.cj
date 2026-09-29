package upstream

import std.core.*

@Annotation
public class Tag { public const init() {} }

public class HelperC {
    public var w: Int64 = 0
    public init() {}
    public init(x: Int64) { this.w = x }
}

public enum EciComp  {
| T1((Int64, String))
| F1((Int64) -> Bool)
| O1(Option<Int64>)
| U1(HelperC)
}

