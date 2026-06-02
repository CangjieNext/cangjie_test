// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

open class Boo {
    public var a: Int64 = 1
    public static var b: Int64 = 1
    @callTest
    public mut prop c: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }
    @callTest
    protected mut open prop d: Int64 {
        get() {
            return (a + 1)
        }
        set(v) {
            a = v
        }
    }
}

@callTest
class Coo <: Boo {
    public mut override prop d: Int64 {
        get() {
            return (a + 2)
        }
        set(v) {
            a = v
        }
    }
}

class A {
    @callTest
    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

struct B {
    @callTest
    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

extend A {
    @callTest
    public prop s: String {
        get() {
            return ""
        }
    }
}

main(): Int64 {
    var a = Coo()
    a.d = 1
    if (a.d != 3) {
        return 1
    }
    return 0
}
