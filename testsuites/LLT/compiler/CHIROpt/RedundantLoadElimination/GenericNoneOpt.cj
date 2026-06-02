// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %cmp_opt %debugCHIROpt %enableO2 %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE: %run %run_opt %output

// ASSERT: scan [RLE] The usages of the result of Load at [57,13] have been replaced by the value at [57,13]
// ASSERT: scan [RLE] The usages of the result of Load at [60,16] have been replaced by the value at [57,13]

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
