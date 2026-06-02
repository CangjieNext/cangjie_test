/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface I {}

main() {
    var b = R<Int64>(6)
    b.c(7)
    return b.a - 7
}

struct R<T> <: I {
    public R(var a: T) {
    }

    public mut func c(b: T) {
        this()

        let f1 = {
            => let f2 = {
                => a
            }
        }
        return
    }
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
// ASSERT: scan sema_capture_this_or_instance_field_in_func
