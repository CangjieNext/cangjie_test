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

package packageTest

public class A {
    public let value = 0
}

public struct B {
    public var value2 = A().value
    public init() {}
}

func foo() {
    if (B().value2 == 0) {
        return 0
    }

    return 1
}

main(): Int64 {
    return foo()
}
