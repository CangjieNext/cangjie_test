package upstream

import std.core.*

@Annotation
public class Tag { public const init() {} }

public class HelperC {
    public var w: Int64 = 0
    public init() {}
    public init(x: Int64) { this.w = x }
}

public enum EciE  {
| B1
| B2(Int64)
| B3(Int64, String)
}

