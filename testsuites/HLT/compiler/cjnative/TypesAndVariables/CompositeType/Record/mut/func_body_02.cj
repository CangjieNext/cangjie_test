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
        func f1() {
            this
        }

        func f2() {
            this.a = 2
        }

        func f3() {
            this.a
        }

        func f4() {
            a
        }

        func f5() {
            super()
        }

        func f6(a6: T) {
            a6
        }

        f6(a)

        return this
    }
}
// ASSERT: scan sema_capture_this_or_instance_field_in_func
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_super_use_error_inside_non_class
// ASSERT: scan sema_use_this_as_an_expression_in_func
