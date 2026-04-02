package issue

import interoplib.interop

public struct OnlyInit<T> {
    private var value: T

    public init(v: T) {
        this.value = v
    }
    public func getValue(): T {
        return value
    }
}

public class AllSymbols<T> {
    private var value: T

    public init(v: T) {
        this.value = v
    }
    public func getValue(): T {
        return value
    }
    
    public func setValue(v: T): Unit {
        value = v
    }
}
