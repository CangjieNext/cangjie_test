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

open class Boo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

class Aoo <: Boo {
    public var c = if (true) {
        func foo1(x!: Int32 = a) {
            return x
        }
        func foo2() {
            var x = a;
            return x
        }
        func foo3() {
            return a
        }
        func foo4() {
            a;
            return 1
        }
        func foo5() {
            a
        }

        func foo10(x!: Int32 = b) {
            return x
        }
        func foo20() {
            var x = b;
            return x
        }
        func foo30() {
            return b
        }
        func foo40() {
            b;
            return 1
        }
        func foo50() {
            b
        }

        func goo1() {
            var a = foo1
            return a
        }
        func goo2() {
            var a = foo2
            return a
        }
        func goo3() {
            var a = foo3
            return a
        }
        func goo4() {
            var a = foo4
            return a
        }
        func goo5() {
            var a = foo5
            return a
        }
    }
}
// ASSERT: scan sema_illegal_usage_of_super_member
