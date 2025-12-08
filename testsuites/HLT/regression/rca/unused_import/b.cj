package b

import a.A

public interface I {
    func testFunc(): Unit
}

extend A <: I {
    public func testFunc(): Unit {
    }
}
