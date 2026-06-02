/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

var m: Int32 = 0

func run(): Int64 {
    var x: Int32 = 10
    var y = 10
    var a1: (Int32) -> Int32 = foo1
    var a2: () -> Int32 = foo2
    var a3: () -> Unit = foo3
    var a4: (Unit) -> Unit = foo4
    var a5: (() -> Unit) -> () -> Unit = foo5
    var a6: ((() -> Unit) -> () -> Unit) -> (() -> Unit) -> () -> Unit = foo6
    var a7: () -> Unit = foo7
    var a8: (() -> Unit) -> () -> Unit = foo8
    var a9: ((Int32, Int32)) -> Unit = foo9
    var a10: ((Int32, Int32)) -> Unit = foo9

    if (a1(x) != 10) {
        return 1
    }
    if (a2() != 10) {
        return 1
    }
    a3()
    if (m != 1) {
        return 1
    }
    a4(a3())
    if (m != 2) {
        return 1
    }
    a5(a3)()
    if (m != 3) {
        return 1
    }
    a6(a5)(a3)()
    if (m != 4) {
        return 1
    }
    a7()
    if (m != 5) {
        return 1
    }
    a8(foo3)()
    if (m != 6) {
        return 1
    }
    return 0
}

func foo9(a: Int32, b: Int32): Unit {
    m = a + b
}

func foo8(a!: () -> Unit = foo3): () -> Unit {
    return a
}

func foo7() {
    m = m + 1
}

func foo6(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
    return a
}

func foo5(a: () -> Unit): () -> Unit {
    return a
}

func foo4(a: Unit): Unit {
    return a
}

func foo3(): Unit {
    m = m + 1
}

func foo2(): Int32 {
    return 10
}

func foo1(a: Int32): Int32 {
    return a
}
// ASSERT: scan sema_no_match_function_declaration_for_ref
