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

main(): Int64 {
    let a0: ??Int64 = Some(10)
    let b0: ?Int64 = a0 ?? None

    let a: ??????Int64 = Some(1)
    let c: Int64 = (((((a ?? None) ?? None) ?? None) ?? None) ?? None) ?? 0
    if (c != 1) {
        return 1
    }
    return 0
}
