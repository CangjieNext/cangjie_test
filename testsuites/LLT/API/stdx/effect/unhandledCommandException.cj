/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// RUN-EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan Pre perform
// ASSERT: scan UnhandledCommand: Unhandled command
// ASSERT: scan Post perform
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


import stdx.effect.{Command, UnhandledCommandException}

class Get <: Command<Unit> {}

main() {
    println("Pre perform")
    try {
        perform Get()
    } catch (e: UnhandledCommandException) {
        println(e)
    }
    println("Post perform")
    ()
}
