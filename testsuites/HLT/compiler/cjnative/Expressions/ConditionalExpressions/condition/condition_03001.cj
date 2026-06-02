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

class A {
    public var test: Any = "any"
    public var value: Int64 = 0
    public init() {
        super()
    }
}

main() {
    var testA: Option<A> = A()
    if (let Some(v: String) <- testA?.test) {
        return 0
    }
    return 1
}
