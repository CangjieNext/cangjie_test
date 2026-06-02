/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan classb

class A<T> {
    public func test(a: T) {
        print("classa")
    }
}

class B<T> {
    public init(input: T) {
        a = input
    }
    public func test(a: T) {
        print("classb")
    }
    public var a: T
    public func i() {
        var b = test(a)
    }
}

main(): Int64 {
    B<Int64>(1).i()
    return 0
}
