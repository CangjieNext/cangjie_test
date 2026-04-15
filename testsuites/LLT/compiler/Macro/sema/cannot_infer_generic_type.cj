// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_pointer_unknow_generic_type
// ASSERT: scan-1 sema_mismatched_types
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)

import define.*

interface I2 {}

extend Int32 <: I2 {}

extend Unit <: I2 {}

extend<T> CPointer<T> <: I2 where T <: I2 {}

@M1
var node19: I2 = CPointer()

@M1
var node20: I2 = CPointer<Int64>()

@M1
var node21: I2 = CPointer(CPointer<Int64>())

main() {}
