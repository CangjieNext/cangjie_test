package upstream

@Annotation
public class Tag { public const init() {} }

public enum EtiOtherEnum {
    | OA
    | OB(Int64)
}

@Annotation
public class Dup { public const init() {} }

@Annotation
public class CTag <: Equatable<CTag> & ToString {
    public const CTag(public let d: String) {}
    public operator func ==(another: CTag): Bool { this.d == another.d }
    public operator func !=(another: CTag): Bool { !(this == another) }
    public func toString(): String { "CTag" }
}
