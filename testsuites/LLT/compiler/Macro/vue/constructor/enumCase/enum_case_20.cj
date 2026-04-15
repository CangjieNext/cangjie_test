// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 macro_expect_one_enum_constructor
// ASSERT: scan the error originates in the macro `AA3` (consider using `--debug-macro` for more info)

import view.*

enum Eb1 {
    | Red
    | Red(Int64)
    | @AA3[Red(Int64, Int64)]
    gggsss2(Int64)
}

main() {}
