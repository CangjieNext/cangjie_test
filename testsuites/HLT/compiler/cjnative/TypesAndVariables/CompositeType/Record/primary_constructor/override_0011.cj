/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 
open class A {}

class B <: A {}

struct Data {
    var c = 0

    public Data(let a!: A = A()) {
    }

    public init(b!: B = B()) {
        this.a = B()
    }
}

func run(): Int64 {
    return Data(a: B()).c
}

main(): Int64 {
    return run()
}
