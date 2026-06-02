/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package declsToOpenToMock

public class Foo1 {}

public class Foo2 {
    func foo() {}
}

public class Foo3 {
    public func foo() {}
}

public open class Foo4 {
    public func foo() {}
}

public abstract class Foo5 {
    public func foo() {}
}

public open class Foo6 {
    public open func foo() {}
    public func foo2() {}
}

public abstract class Foo7 {
    public func foo() {}
}

public abstract class Foo8 {
    public func foo(): Int64
    public func foo2() {}
}

public abstract class Foo9 {
    public open func foo() {}
    public func foo2() {}
}

public abstract class Bar {
    public func foo(): Int64
}

public class Foo10 <: Bar {
    public override func foo(): Int64 {
        1
    }
}

public abstract class Foo11 <: Bar {
    public override func foo(): Int64
}

public open class Foo12 <: Bar {
    public open override func foo(): Int64 {
        1
    }
}

public open class Bar2 {
    public func foo() {}
}

public open class Foo13 <: Bar2 {
    public open func foo2() {}
}

public interface Foo14 {}

public interface Foo15 {
    func foo(): Int64
}

public interface Foo16 {
    func foo() {}
}

public class Foo17<T> {
    public func foo(x: T): Int64 {
        1
    }
}

public open class Foo18<T> {
    public open func foo(x: T): Int64 {
        1
    }
    public func foo2(x: T): Int64 {
        1
    }
}

public abstract class Foo19<T> {
    public func foo(x: T): Int64
    public func foo2(x: T): Int64 {
        1
    }
}

public abstract class Foo20<T> {
    public func foo<K>(x: T, y: K): Int64 {
        1
    }
}
