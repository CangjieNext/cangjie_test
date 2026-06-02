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

func f(a: ??Int64): ?Int64 {
    throw Exception("func f()")
    None<Int64>
}

main() {
    let a0: ??Int64 = Some(1) ?? f(Some(1))
    if (a0 == 1 && a0 is ??Int64) {
        return 0
    }
    1
}
