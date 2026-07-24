package pkgA

public func invoke(f: () -> Int64): Int64 {
    f()
}

public struct Wrapper<T> {
    let input: T
    let m: Int64
    let f: (T) -> Int64

    public init(input: T, m: Int64, f: (T) -> Int64) {
        this.input = input
        this.m = m
        this.f = f
    }

    public func run(): Int64 {
        // lambda 捕获 this（访问 f、input）；invoke 强制闭包实体化
        invoke({ => f(input) })
    }
}

