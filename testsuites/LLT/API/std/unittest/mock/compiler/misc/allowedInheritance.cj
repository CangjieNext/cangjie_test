/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./declsToOpenToMock
// EXEC: %compiler %cmp_opt -Woff=all -p declsToOpenToMock %compile_lib_opt --mock=on --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj --mock=on -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

internal import declsToOpenToMock.*

class MyFoo5 <: Foo5 {}

class MyFoo7 <: Foo6 {}

class MyFoo8 <: Foo6 {
    public override func foo() {}
}

class MyFoo9 <: Foo6 {
    public open override func foo() {}
}

class MyFoo12 <: Foo7 {}

class MyFoo15 <: Foo8 {
    public override func foo(): Int64 {
        1
    }
}

open class MyFoo16 <: Foo8 {
    public open override func foo(): Int64 {
        1
    }
}

abstract class MyFoo17 <: Foo8 {
    public override func foo(): Int64
}

class MyFoo18 <: Foo8 {
    public override func foo(): Int64 {
        1
    }
}

class MyFoo19 <: Foo8 {
    public override func foo(): Int64 {
        1
    }
}

class MyFoo20 <: Foo9 {
    public override func foo() {}
}

class MyFoo23 <: Foo11 {
    public override func foo(): Int64 {
        1
    }
}

abstract class MyFoo24 <: Foo11 {
    public override func foo(): Int64
}

class MyFoo25 <: Foo12 {
    public override func foo(): Int64 {
        1
    }
}

class MyFoo26 <: Foo13 {
    public override func foo2() {}
}

open class MyFoo27 <: Foo13 {
    public open override func foo2() {}
}

class MyFoo28 <: Foo14 {}

class MyFoo29 <: Foo15 {
    public func foo(): Int64 {
        1
    }
}

class MyFoo30 <: Foo16 {
    public func foo() {}
}

interface MyFoo31 <: Foo16 {
    func foo() {}
}

interface MyFoo32 <: Foo16 {}

interface MyFoo33 <: Foo15 {
    func foo(): Int64
}

public class MyFoo38 <: Foo18<String> {
    public override func foo(x: String) {
        1
    }
}

public open class MyFoo39<K> <: Foo18<K> {
    public open override func foo(x: K) {
        1
    }
}

public class MyFoo42 <: Foo19<String> {
    public override func foo(x: String) {
        1
    }
}

public open class MyFoo43<K> <: Foo19<K> {
    public open override func foo(x: K) {
        1
    }
}

main() {
    MyFoo5()
    MyFoo7()
    MyFoo8()
    MyFoo9()
    MyFoo12()
    MyFoo15()
    MyFoo16()
    MyFoo18()
    MyFoo19()
    MyFoo20()
    MyFoo23()
    MyFoo25()
    MyFoo26()
    MyFoo27()
    MyFoo28()
    MyFoo29()
    MyFoo30()
    MyFoo38()
    MyFoo39<Int64>()
    MyFoo42()
    MyFoo43<Int32>()
    0
}
