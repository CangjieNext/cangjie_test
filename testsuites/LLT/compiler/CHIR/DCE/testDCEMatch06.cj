// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not unreachable pattern

func foo<T>(v: T): Int64 {
    match (v) {
        case a: Int64 => return 1
        case _ => return 0
    }
}

main() {
    foo<Int64>(2)
    foo<Int32>(Int32(2))
}