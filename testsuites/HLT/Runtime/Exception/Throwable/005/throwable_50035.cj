/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Exception {}

class B <: Exception {}

class C {
    private func test(x: Bool):Unit {
        if (x) {
            throw A();
            ()
        } else {
            ()
        }
    }
    public func foo(x: Bool):Unit {
        test(x)
    }
}

main() {
    try {
        C().foo(true)
    } catch (a: A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
