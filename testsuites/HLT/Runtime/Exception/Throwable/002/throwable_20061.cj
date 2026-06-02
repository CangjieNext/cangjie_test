/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ccc

open class A <: Exception {
    public open prop message: String {
        get() {
            "aaa"
        }
    }
    public func a():Unit {}
}

open class B <: A {}

open class C <: B {
    public override prop message: String {
        get() {
            "ccc"
        }
    }
    public func c():Unit {}
}

class D <: C {}

func test() {
    try {
        throw C()
    } catch (a: A) {
        print(a.message)
        match (a) {
            case _: D => return 2
            case _: C => return 0
            case _: A => return 1
            case _ => return -1
        }
    }
}

main() {
    test()
}
