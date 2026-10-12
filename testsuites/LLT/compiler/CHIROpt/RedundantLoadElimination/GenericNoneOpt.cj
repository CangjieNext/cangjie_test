// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default1EIRNY_2SAEE11static_testHY2_" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex-begin %(?P<v>\d+): Struct-_CN7default2SAE = Load\(%\d+\) // loc: "GenericNoneOpt.cj"-59-13
// ASSERT: regex-after Store\(%(?P=v), %\d+\)
// ASSERT: regex-not = Load\(%\d+\) // loc: "GenericNoneOpt.cj"-62

interface I1 {
    mut prop p1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
}

struct SA <: I1 {
    var v11 = 0
    public mut prop p1: Int64 {
        get() {
            v11
        }
        set(v) {
            v11 = v
        }
    }
}

struct SC<M> <: I1 {
    var v21 = 0
    public mut prop p1: Int64 {
        get() {
            v21
        }
        set(v) {
            v21 = v
        }
    }
}

enum E<M> where M <: I1 {
    E01(M)

    public func test(x1: M) {
        static_test(x1)
    }
    public static func static_test(x1: M): M {
        var v1: M = x1
        v1.p1 = 1
        if (v1.p1 != 1) {
            throw Exception()
        }
        return v1
    }
}

extend<M> E<M> {}

main() {
    var a = E01(SA())
    var b = E01(SC<Int64>())
    a.test(SA())
    b.test(SC<Int64>())
    return 0
}
