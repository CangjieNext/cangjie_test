/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    open func f1() {
        return 1
    }
    static func g1() {
        return 1
    }
    mut open prop a1: Int64 {
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

class B <: A {
    override func f1() {
        return 0
    }
    static redef func g1() {
        return 0
    }
    mut override prop a1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    mut static redef prop b1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
}

main() {
    var a = B()
    return a.f1() + B.g1() + a.a1 + B.b1
}
// ASSERT: scan sema_ignore_open
// ASSERT: scan sema_non_inheritable_super_class
