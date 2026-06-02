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
    let p1 = 2
    var pass = 0

    let f1: CFunc<(CPointer<Float64>) -> Unit> = {
        ptr => if (p1 == 2) {
            pass += 1
        }
    }

    return 0
}
// ASSERT: scan sema_use_func_capture_var_alone
// ASSERT: scan sema_cfunc_cannot_capture_var
