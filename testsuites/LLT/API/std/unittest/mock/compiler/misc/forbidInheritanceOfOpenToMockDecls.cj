/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./declsToOpenToMock %n.info
// EXEC: %compiler %cmp_opt -Woff=all -p declsToOpenToMock %compile_lib_opt --mock=on --output p.%middle
// (not CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-1: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output 2>&1 | compare %n.info
import declsToOpenToMock.*

class MyFoo1 <: Foo1 {}

class MyFoo2 <: Foo2 {}

class MyFoo3 <: Foo3 {
    public override func foo() {}
}

class MyFoo4 <: Foo4 {
    public override func foo() {}
}

class MyFoo6 <: Foo5 {
    public override func foo() {}
}

class MyFoo10 <: Foo6 {
    public override func foo() {} // shouldn't be error
    public override func foo2() {}
}

class MyFoo11 <: Foo6 {
    public override func foo() {} // shouldn't be error
    public override func foo2() {}
}

class MyFoo13 <: Foo7 {
    public override func foo() {}
}

class MyFoo18 <: Foo8 {
    public override func foo(): Int64 {
        1
    } // shouldn't be error
    public override func foo2() {}
}

class MyFoo19 <: Foo8 {
    public override func foo(): Int64 {
        1
    } // shouldn't be error
    public override func foo2() {}
}

class MyFoo20 <: Foo9 {
    public override func foo() {} // shouldn't be error
    public override func foo2() {}
}

class MyFoo21 <: Foo10 {}

class MyFoo22 <: Foo10 {
    public override func foo(): Int64 {
        1
    }
}

public class MyFoo34 <: Foo17<String> {}

public class MyFoo35 <: Foo17<String> {
    public override func foo(x: String) {
        1
    }
}

public class MyFoo36<K> <: Foo17<K> {}

public class MyFoo37<K> <: Foo17<K> {
    public override func foo(x: K) {
        1
    }
}

public class MyFoo40 <: Foo18<String> {
    public override func foo(x: String) {
        1
    }
    public override func foo2(x: String) {
        1
    }
}

public open class MyFoo41<K> <: Foo18<K> {
    public override func foo2(x: K) {
        1
    }
}

public class MyFoo44 <: Foo19<String> {
    public override func foo(x: String) {
        1
    }
    public override func foo2(x: String) {
        1
    }
}

public open class MyFoo45<K> <: Foo19<K> {
    public override func foo2(x: K) {
        1
    }
}

public open class MyFoo46 <: Foo20<String> {
    public func foo<K>(x: String, y: K): Int64 {
        1
    }
}

public open class MyFoo47<T> <: Foo20<T> {
    public func foo<K>(x: T, y: K): Int64 {
        1
    }
}

main() {
    0
}
