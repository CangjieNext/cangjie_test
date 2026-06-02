/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

@C
public func foo<T>(a: T): T {
    return a
}

@C
func hoo<T>(a: T): T {
    return a
}

class TEST<T> {
    var a: T

    init(a: T) {
        this.a = a
    }

    @C
    private func goo<T>(a: T): T {
        return a
    }
}

main() {}
// ASSERT: scan sema_cffi_cannot_have_type_param
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
// ASSERT: scan sema_illegal_scope_use_of_annotation
