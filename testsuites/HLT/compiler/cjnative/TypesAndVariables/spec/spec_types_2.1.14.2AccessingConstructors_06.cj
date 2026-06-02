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

enum E<T> {
    | AA2(T)
    | BB2(T)
}

func fB() {
    let a = AA2(1) // ok, a: E<Int64>
    let b = AA2<Int32>(2) // ok, b: E<Int32>
}

main() {
    fB()
    return 0
}
