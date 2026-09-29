package upstream

@Annotation
public class Tag { public const init() {} }

public enum EtiOtherEnum {
    | OA
    | OB(Int64)
}

public struct HelperS {
    public var v: Int64 = 0
    public init() {}
}

public class HelperC {
    public var w: Int64 = 0
    public init() {}
    public init(x: Int64) { this.w = x }
}

public struct ZeroS {
    public init() {}
}
