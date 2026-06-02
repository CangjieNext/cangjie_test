/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Result is 1
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Get <: Command<Int64> {}

main() {
    let w: Int64 = try {
        (perform Get())
    } handle (_: Get) {
        resume with 1
    }
    println("Result is ${w}")
    0
}
