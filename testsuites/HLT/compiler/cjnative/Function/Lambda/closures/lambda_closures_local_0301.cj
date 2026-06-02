/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func case10() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    var r1 = {
        =>
        var s = a.a;
        s
    }
    var r2 = {
        =>
        var s = a.b;
        s
    }
    var r3 = {
        =>
        var s = b.a;
        s
    }
    var r4 = {
        =>
        var s = b.b;
        s
    }
    var r5 = {
        =>
        var s = m;
        s
    }
    var r6 = {
        =>
        var s = a;
        s
    }
    var r7 = {
        =>
        var s = b;
        s
    }
}

func case11() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    func foo(x: () -> Int32) {
        return x
    }
    var r1 = foo(
        {
            =>
            var s = a.a;
            s
        }
    )
    var r2 = foo(
        {
            =>
            var s = a.b;
            s
        }
    )
    var r3 = foo(
        {
            =>
            var s = b.a;
            s
        }
    )
    var r4 = foo(
        {
            =>
            var s = b.b;
            s
        }
    )
    var r5 = foo(
        {
            =>
            var s = m;
            s
        }
    )
    var r6 = foo(
        {
            =>
            var s = a;
            s
        }
    )
    var r7 = foo(
        {
            =>
            var s = b;
            s
        }
    )
}

func case01() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = a.a;
        s
    }
}

func case02() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = a.b;
        s
    }
}

func case03() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = b.a;
        s
    }
}

func case04() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = b.b;
        s
    }
}

func case05() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = m;
        s
    }
}

func case06() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    return {
        =>
        var s = a;
        s
    }
}

func case07() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = b;
        s
    }
}

func case11() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = a.a;
        s
    }
}

func case12() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = a.b;
        s
    }
}

func case13() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = b.a;
        s
    }
}

func case14() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = b.b;
        s
    }
}

func case15() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = m;
        s
    }
}

func case16() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = a;
        s
    }
}

func case17() {
    var a: Coo = Coo()
    var b: Roo = Roo()
    var m: Int32 = 1
    {
        =>
        var s = b;
        s
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_use_func_capture_var_alone
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_overload_conflicts
