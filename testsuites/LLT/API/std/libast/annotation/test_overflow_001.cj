// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main(): Int64 {
    let tokens = quote(
        @OverflowWrapping
    )
    let aa = Annotation(tokens)
    aa.dump()
    return 0
}

/* SCAN-IN
Annotation {
  -identifier: OverflowWrapping
}
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
