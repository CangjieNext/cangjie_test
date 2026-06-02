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

open class A<X, Y> {
    public func test(a: X, b: X) {}
    public func test(a: Y, b: X) {}
}

func test(a: A<Int16, Int32>) {}

main(): Int64 {
    return 0
}
