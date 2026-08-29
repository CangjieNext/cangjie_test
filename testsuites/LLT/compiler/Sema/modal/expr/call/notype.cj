
class C {
    init(_: Array<Int64>) {}
    exclave init(this @local!, _: Array<Int64>) {}
}

main() {
    let a:C = C([Int64(UndeclaredType())])
}