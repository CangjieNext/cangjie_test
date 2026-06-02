// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %enableCompileDebug %sync-link %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 3\n
// ASSERT: scan 7\n
// ASSERT: scan 7\n
// ASSERT: scan 7\n
// ASSERT: scan 5\n
// ASSERT: scan true\n
// ASSERT: scan 8\n
// ASSERT: scan 8\n
// ASSERT: scan 9\n
// ASSERT: scan 10\n
// ASSERT: scan 11\n
// ASSERT: scan 11\n
// ASSERT: scan 12\n
// ASSERT: scan true\n
// ASSERT: scan false\n
// ASSERT: scan 13\n
// ASSERT: scan 13\n
// ASSERT: scan 3\n
// ASSERT: scan true\n
// ASSERT: scan false\n
// ASSERT: scan false\n
// ASSERT: scan true\n
// ASSERT: scan 0\n
// ASSERT: scan 1\n
// ASSERT: scan 22\n
// ASSERT: scan 22\n
// ASSERT: scan 3\n
// ASSERT: scan false\n
// ASSERT: scan true\n
// ASSERT: scan 4\n

internal import std.sync.*

func testInt8(): Unit {
    var x = AtomicInt8(3)
    var y = x.load()
    print(y.toString() + "\n") // 3
    x.store(7)
    print(x.load().toString() + "\n") // 7
    y = x.load()
    print(y.toString() + "\n") // 7
    y = x.swap(5)
    print(y.toString() + "\n") // 7
    y = x.load()
    print(y.toString() + "\n") // 5
    var z = x.compareAndSwap(5, 8)
    print(z.toString() + "\n") // true
    y = x.load()
    print(y.toString() + "\n") // 8
    y = x.fetchAdd(1)
    print(y.toString() + "\n") // 8
    y = x.load()
    print(y.toString() + "\n") // 9
}

func testUInt32(): Unit {
    var x = AtomicUInt32(10)
    var y = x.load()
    print(y.toString() + "\n") // 10
    x.store(11)
    y = x.load()
    print(y.toString() + "\n") // 11
    y = x.swap(12)
    print(y.toString() + "\n") // 11
    y = x.load()
    print(y.toString() + "\n") // 12
    var z = x.compareAndSwap(12, 13)
    print(z.toString() + "\n") // true
    z = x.compareAndSwap(12, 13)
    print(z.toString() + "\n") // false
    y = x.load()
    print(y.toString() + "\n") // 13
    y = x.fetchSub(10)
    print(y.toString() + "\n") // 13
    y = x.load()
    print(y.toString() + "\n") // 3
}

func testBool(): Unit {
    var x = AtomicBool(true)
    var y = x.load()
    print(y.toString() + "\n") // true
    x.store(false)
    y = x.load()
    print(y.toString() + "\n") // false
    y = x.swap(true)
    print(y.toString() + "\n") // false
    y = x.compareAndSwap(true, false)
    print(y.toString() + "\n") // true
}

class A {
    public var a: Int64
    public init(v: Int64) {
        a = v
    }
}

func testReference(): Unit {
    var x = AtomicReference<A>(A(0))
    var y = x.load()
    print(y.a.toString() + "\n") // 0
    var obj = A(1)
    x.store(obj)
    y = x.load()
    print(y.a.toString() + "\n") // 1
    obj.a = 22
    y = x.load()
    print(y.a.toString() + "\n") // 22
    var obj2 = A(3)
    y = x.swap(obj2)
    print(y.a.toString() + "\n") // 22
    y = x.load()
    print(y.a.toString() + "\n") // 3
    var z = x.compareAndSwap(A(3), A(4))
    print(z.toString() + "\n") // false
    z = x.compareAndSwap(obj2, A(4))
    print(z.toString() + "\n") // true
    y = x.load()
    print(y.a.toString() + "\n") // 4
}

main(): Int64 {
    testInt8()
    testUInt32()
    testBool()
    testReference()
    return 0
}
