
package upstream

public class HelperA {
    public init() {}
}

public interface IProbe {
    func ping(): Int64
}

public struct Point {
    public var x: Int64
    public var y: Int64
    public init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}

public func probeAdd(a: Int64, b: Int64): Int64 {
    return a + b
}

public func probeMul(a: Int64, b: Int64): Int64 {
    return a * b
}

public var probeCounter: Int64 = 42

public let probeLabel: String = "upstream"
