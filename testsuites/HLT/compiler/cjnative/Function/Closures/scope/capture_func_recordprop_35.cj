/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = Aoo()
    if (a.goo2 != 2) {
        return 2
    }
    if (a.goo3 != 2) {
        return 3
    }
    if (a.goo4 != 2) {
        return 4
    }
    if (a.goo5 != 1) {
        return 5
    }
    if (a.goo6 != 1) {
        return 6
    }
    return 0
}

struct Aoo {
    public var a: Int32 = 1
    public static var b: Int32 = 1

    public mut prop foo2: Int32 {
        get() {
            var x = a + b;
            return x
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop foo3: Int32 {
        get() {
            return a + b
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop foo4: Int32 {
        get() {
            a + b;
            return Int32(2)
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop foo5: Int32 {
        get() {
            a
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop foo6: Int32 {
        get() {
            b
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop goo2: Int32 {
        get() {
            var a = foo2
            return a
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop goo3: Int32 {
        get() {
            var a = foo3
            return a
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop goo4: Int32 {
        get() {
            var a = foo4
            return a
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop goo5: Int32 {
        get() {
            var a = foo5
            return a
        }
        set(v) {
            var x = a + b
        }
    }

    public mut prop goo6: Int32 {
        get() {
            var a = foo6
            return a
        }
        set(v) {
            var x = a + b
        }
    }

    public init(a!: Int32 = 1) {
        this.a = a
    }
}
