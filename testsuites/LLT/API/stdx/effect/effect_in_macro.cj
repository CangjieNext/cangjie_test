/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: effect_in_macro_define.cj 
// EXEC: %compiler %cmp_macro effect_in_macro_define.cj
// EXEC: %run_macro %compiler %enableEH %cmp_opt %macro_lib %f -o %output
// EXEC: %run %set_stdx_path %run_opt %output %run_args 2>&1 | compare %f
import stdx.effect.Command


import AAA.*

class Eff <: Command<String> {}

@NN
main() {
    try {
        perform Eff()
        ()
    } handle (c: Command<String>) {
        resume with "Hello, World!"
        ()
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
