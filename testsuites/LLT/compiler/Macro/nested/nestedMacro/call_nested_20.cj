// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj macroBarAttr.cj
// EXEC: %compiler macroFoo.cj %cmp_macro
// EXEC: %compiler macroBarAttr.cj %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import pkg1.*
import pkg4.*

main(): Int64 {
    var a = @Bar[\@Foo(123)](@Baz(123))
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
