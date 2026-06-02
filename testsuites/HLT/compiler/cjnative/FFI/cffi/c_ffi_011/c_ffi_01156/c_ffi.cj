/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main() {
    let a = 0
    let f = {
        =>
        a
        let f1: CFunc<() -> Unit> = {
            => a
        }
        unsafe { f1() }
    }
    f()
}
// ASSERT: scan sema_cfunc_cannot_capture_var
