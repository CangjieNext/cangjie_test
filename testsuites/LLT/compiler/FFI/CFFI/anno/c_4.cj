// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan sema_cffi_cannot_have_type_param
// ASSERT: scan sema_illegal_scope_use_of_annotation
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type

@C
func foo<T>(x: T) {
    x
}

func outer() {
    @C
    func inner() {}

    unsafe { inner() }
}

main() { 0 }
