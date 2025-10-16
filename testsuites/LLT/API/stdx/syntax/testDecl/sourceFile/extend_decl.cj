extend A {}

extend B {
    func a() {}
}

extend C <: B {}

extend<T> D where T <: B {}

extend<S, V> E <: ToString & Inter<S, V> where S <: B, V <: ToString {}

extend F {
    func testFunc(c: Int64, d: UInt32) {}

    prop e: String {
        get() { return "hello" }
    }
}