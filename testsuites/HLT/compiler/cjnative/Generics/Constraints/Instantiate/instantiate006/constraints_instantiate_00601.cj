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

interface A {}

interface B<X, Y, Z> where X <: A & A & A, Y <: A & A & A, Z <: A & A & A {}

main(): Int64 {
    func test(a: B<A, A, A>) {}
    return 0
}
