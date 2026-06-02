/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = Coo()
    var b = Boo()
    a.a1 = 1
    if (a.a1 != 2) {
        return 1
    }
    if (a.goo() != 0) {
        return 2
    }
    if (b.foo() != 0) {
        return 3
    }
    Boo.a4 = 4
    if (Boo.a4 != 5) {
        return 4
    }
    Coo.a4 = 4
    if (Coo.a4 != 5) {
        return 4
    }
    a.a5 = 5
    if (a.a5 != 6) {
        return 5
    }
    a.a6 = 6
    if (a.a6 != 7) {
        return 6
    }
    a.a7 = 7
    if (a.a7 != 8) {
        return 7
    }
    return 0
}

open class Boo {
    public var a: Int64 = 1
    public static var b: Int64 = 1
    public mut prop a1: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }

    private mut prop a2: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }

    protected mut prop a3: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }

    public mut static prop a4: Int64 {
        get() {
            return (b + 1)
        }
        set(v) {
            b = v
        }
    }

    public mut open prop a5: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }

    public mut prop a6: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }

    public mut prop a7: Int64 {
        get() {
            return (b + 1)
        }
        set(v) {
            b = v
        }
    }

    public func foo() {
        var a = Boo()
        a.a2 = 1
        if (a.a2 != 2) {
            return 1
        } else {
            return 0
        }
    }
}

class Coo <: Boo {
    public func goo() {
        var a = Boo()
        a.a3 = 1
        if (a.a3 != 2) {
            return 1
        } else {
            return 0
        }
    }
}
