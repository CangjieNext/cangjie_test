

public func M() {
    func test<T>(x: T): T {
        func foo<Y>(y: Y) {
            test(0);
            y
        }
        x
    }
    var x = test(0)
}

main() {
    0
}