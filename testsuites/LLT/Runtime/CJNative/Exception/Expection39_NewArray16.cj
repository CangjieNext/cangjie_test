// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// (not O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1  | compare %f
// (O2) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not O2) ASSERT:scan Out of memory
// (O2) ASSERT:scan 2147483648

main() {
    let array3 = Array<Int16>(2147483648) {i => 1}
    println(array3.size)
}
