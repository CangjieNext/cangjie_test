/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_extend_function_cannot_overridden

interface A {
    func f1() {
        return 1
    }
    static func g1() {
        return 1
    }
    mut prop a1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
    mut static prop b1: Int64 {
        get() {
            1
        }
        set(v) {
            v
        }
    }
}

open class B {}

extend B <: A {}

class C <: B {
    public override func f1() {
        return 0
    }
    public static redef func g1() {
        return 0
    }
    public mut override prop a1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    public mut static redef prop b1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
}

main() {
    var a = C()
    return a.f1() + C.g1() + a.a1 + C.b1
}
