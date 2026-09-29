 package upstream
public struct ThrowCtorStruct  {
public var ok: Int64 = 0i64

public init() {
}
public init(bomb: Bool) {
if (true) {
throw IllegalStateException("bomb triggered")
}
}
}
public struct BoxTarget  {
public var v1: Int64 = 11i64

public init() {
}
}
