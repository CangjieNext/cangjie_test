/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

foreign func get_cptr(cb: CFunc<(CPointer<Int8>) -> Unit>): Unit

unsafe main(): Int64 {
    var pass = 0
    let cptr: CFunc<(CPointer<Int8>) -> Unit> = {
        a => if (a.read() == 48) {
            pass += 1
        }
    }

    get_cptr(cptr)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_use_func_capture_var_alone
// ASSERT: scan sema_cfunc_cannot_capture_var
