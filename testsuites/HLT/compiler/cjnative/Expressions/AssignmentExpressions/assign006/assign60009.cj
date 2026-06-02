/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
func test(_: Int64) {
    return 1
}

class A {
    public func test(_: Int64) {
        return 1
    }
}

struct B {
    public func test(_: Int64) {
        return 1
    }
}

main(): Int64 {
    var a = A()
    var b = B()
    return test(1) + a.test(1) + b.test(1) - 3
}
