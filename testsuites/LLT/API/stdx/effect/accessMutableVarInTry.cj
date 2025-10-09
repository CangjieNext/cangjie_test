/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: %compiler %enableEH %core_cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: scan lambda capturing mutable variables needs to be called directly
// ASSERT: scan 2 errors generated, 2 errors printed
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


import stdx.effect.Command

class Eff <: Command<Unit> {}

main() {
    var x: Int64 = 1
    try {
        x += 1
    } handle (e: Eff) {
        x += 1
        resume
    }
}
