// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan-not warning

func fn(a: Int64, b: Int64, c!: Int64 = 0): Unit {
    println("${a}${b}${c}")
}

main(): Int64 {
    fn(1, 2, c: 3)
    return 0
}
