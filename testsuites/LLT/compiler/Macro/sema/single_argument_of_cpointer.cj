// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_pointer_single_element_type_error
// ASSERT: scan-2 sema_pointer_too_much_argument
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)

import define.*

unsafe main() {
    @M1 var ptr1 = CPointer<UInt8>(1)
    @M1 var ptr2 = CPointer<UInt8>(1, 2)
    @M1 var ptr3 = CPointer<UInt8>(CPointer<UInt8>(), 2)
    0
}
