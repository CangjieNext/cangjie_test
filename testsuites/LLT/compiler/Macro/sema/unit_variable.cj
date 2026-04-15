// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_cstruct_cannot_have_unit_fields
// ASSERT: scan-1 sema_class_uninitialized_field
// ASSERT: scan the error originates in the macro `UnitVariable` (consider using `--debug-macro` for more info)

import define.*

func foo(): Unit {}

@C
struct X {
    @UnitVariable(var a)
    var b = foo()
}

main() {}
