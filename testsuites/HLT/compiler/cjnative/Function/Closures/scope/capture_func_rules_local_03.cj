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

class Aoo {
    public func foo() {
        func foo1(x!: Int32 = a + b) {
            return x
        }
        func foo2() {
            var x = a + b;
            return x
        }
        var a: Int32 = 1
        let b: Int32 = 1
    }
}
// ASSERT: scan sema_undeclared_identifier
