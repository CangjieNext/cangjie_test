 package upstream
public class SimpleCtorClass {
public var name: String = ""

public init() {
}
public init(name: String) {
this.name = name
}
}
public class MultiCtorClass {
public var x: Int64 = 0i64

public var y: Int64 = 0i64

public init() {
}
public init(x: Int64) {
this.x = x
}
public init(x: Int64, y: Int64) {
this.x = x
this.y = y
}
}
public class NoCtorClass {
private init() {
}
}
public abstract class AbstractCtorShape {
public init() {
}
}
