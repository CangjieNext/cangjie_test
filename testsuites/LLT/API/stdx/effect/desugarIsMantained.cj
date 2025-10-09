/* 
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %core_cmp_opt  %f -o %output
// EXEC-PIPE-0: %run %set_stdx_path %output | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.effect.Command

class Cont {
    public prop value: Int64 {
        get() {
            40
        }
    }
}

class Eff <: Command<() -> Int64> {
    Eff(let f: () -> Int64) {} 
}

class MyExc <: Exception {
    MyExc(let f: () -> Int64) {}
}

main() {
    let c = Cont()
    try {
        perform Eff { c.value + 2 }
        13 
    } handle (e: Eff) {
        resume throwing MyExc { c.value }
        15
    } handle (e: Eff) {
        resume with { => c.value }
        14
    }
    0
}
