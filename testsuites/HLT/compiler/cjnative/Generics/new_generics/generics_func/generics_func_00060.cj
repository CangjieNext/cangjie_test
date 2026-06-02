/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_cannot_instantiated_by_incomplete_type

interface I1 {
    prop p1: Int64 {
        get() {
            1
        }
    }
    static prop p2: Int64 {
        get() {
            1
        }
    }
    func f1() {
        1
    }
    static func f2() {
        1
    }
    static func f3<T>(v: T) {
        v
    }
}

func f() {
    func test<M>() where M <: I1 {
        var v1 = M.p2 + M.f3<Int64>(0)
        if (v1 != 0) {
            throw Exception()
        }
        func inner_test1() {
            M.p2 + M.f3<Int64>(0)
        }
        func inner_test2<N>(y1: N) {
            y1
            M.p2 + M.f3<Int64>(0)
        }
        inner_test1() + inner_test2<Int64>(1)
    }
    var a = test<Nothing>
    if (a() is Nothing) {
        return 0
    }
    return 1
}

extend Nothing <: I1 {
    public prop p1: Int64 {
        get() {
            0
        }
    }
    public static prop p2: Int64 {
        get() {
            0
        }
    }
    public func f1() {
        0
    }
    public static func f2() {
        0
    }
    public static func f3<T>(v: T) {
        v
    }
}

main() {
    return f()
}
