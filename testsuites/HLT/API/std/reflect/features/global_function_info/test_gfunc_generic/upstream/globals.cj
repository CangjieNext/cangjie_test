package upstream

import std.core.*

import std.reflect.*

@Annotation
public class Tag { public const init() {} }

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}
public interface Iface {}

public func id<T>(v: T): T  {
v
}

public func pick<T>(a: T, b: T): T  where T <: Iface{
a
}

public func zip<A, B>(a: A, b: B): A  {
a
}

public func findGfunc(name: String): GlobalFunctionInfo {
    let arr = PackageInfo.get("upstream").functions.toArray()
    for (f in arr) {
        if (f.name == name) {
            return f
        }
    }
    throw Exception("not found: " + name)
}

