// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_generic_type_argument_not_match_constraint
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)


import define.*

@M1
@C
func foo0(ptr: CPointer<CType>) {}

@M1
func foo1(ptr: CPointer<CType>) {}

unsafe main() {
    0
}
