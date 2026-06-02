// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 parse_expected_decl
// ASSERT: scan the error originates in the macro `toFloat32` (consider using `--debug-macro` for more info)

import define.*

main(): Unit {
    Assert.isTrue(@toFloat32(56.5758) is Float32)
}
