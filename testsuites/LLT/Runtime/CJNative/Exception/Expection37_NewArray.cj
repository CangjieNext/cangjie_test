// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1  | compare %f
// (O2) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not O2) ASSERT:scan Out of memory
// (O2) ASSERT:scan 6147483648567

struct A {
    let width1: Int32 = 10
    let length1: Int32 = 20
}

main() {
    let array: Array<A> = Array<A>(6147483648567, {i => A()})
    println(array.size)
}
