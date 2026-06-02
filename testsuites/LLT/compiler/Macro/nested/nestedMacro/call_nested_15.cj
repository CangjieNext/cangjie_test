// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan expected expression here

import pkg1.*

main(): Int64 {
    var a = @Foo(@@Foo(123))
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
