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
open class C1 {
    public let aa: Int64 = 1
}

class C2 <: C1 {
    public let a: Int64 = 2
    public let lambdaExpression: (Int64) -> Int64 = {a: Int64 => a}
}

func test(): Int64 {
    return 0
}

main(): Int64 {
    return test()
}
