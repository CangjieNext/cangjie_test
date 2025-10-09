/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Boo {
    public open func boo<T>(a: T): Int64 {
        return 1
    }
}

class Coo<T> {
    public open func boo<T>(a: T): Int64 {
        return 2
    }
}

abstract class Foo {
    public open func goo<T>(a: T): Int64 {
        return 3
    }
}

abstract class Goo<T> {
    public open func goo<T>(a: T): T {
        return a
    }
    public open func goo2<T>(a: T): Int64
}

class Moo<T> <: Goo<Int64> {
    public open func goo2<T>(a: T): Int64 {
        return 4
    }
}

class Noo<T> <: Foo {}

main() {
    var a1 = Boo().boo<Int64>(3)
    var a2 = Coo<Int64>().boo(1)
    var a3 = Moo<Bool>().goo<Bool>(true)
    var a4 = Moo<Float64>().goo2(1)
    var a5 = Noo<UInt32>().goo<Int64>(4)
    0
}
