 package upstream
public struct SimpleStruct  {
public var x: Int64 = 0i64

public var y: Int64 = 0i64

public init() {
}
}
public struct MultiCtorStruct  {
public var name: String = ""

public var value: Int64 = 0i64

public init() {
}
public init(name: String) {
this.name = name
}
public init(name: String, value: Int64) {
this.name = name
this.value = value
}
}
public struct RichMemberStruct  {
public var counter: Int64 = 0i64

public let label: String = "default"

public static var instanceCount: Int64 = 0i64

public static let structName: String = "RichMemberStruct"

public init() {
}
}
public struct NoCtorStruct  {
public var x: Int64 = 0i64

private init() {
}
}
