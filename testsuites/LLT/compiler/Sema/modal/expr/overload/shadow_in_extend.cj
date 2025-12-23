

class C {
    init() {}
    init(this @local!) { exclave {} }
    func foo(a: Int) {
        println(a)
    }
}

extend C {
    func bar(this @local!, a: Int) {
        println("local! ${a}")
    }
}

main() {
    let c: C @~local = C()
    c.foo(1)

    let d: C @local! = C()
    d.bar(2)
}