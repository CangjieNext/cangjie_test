/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    public var a = 0
    public func foo1() {
        return 0
    }
}

extend A {
    public func foo1(a: Int32) {
        return a
    }
}

main(): Int64 {
    return A().foo1() + Int64(A().foo1(5)) - 5
}
