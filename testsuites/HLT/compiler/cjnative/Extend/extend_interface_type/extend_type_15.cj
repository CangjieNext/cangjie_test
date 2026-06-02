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
open class A {
    public func test(): Int64 {
        return 1
    }
}

class B <: A {}

interface I1 {
    func test(): Int64
}

extend B <: I1 {}

main() {
    let b: I1 = B()
    return b.test() - 1
}
