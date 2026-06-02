// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj macroBarAttr.cj
// EXEC: %compiler macroFoo.cj %compile_shared_lib_opt -o macroFoo.%dylib_suffix
// EXEC: %compiler macroBarAttr.cj %compile_shared_lib_opt -o macroBarAttr.%dylib_suffix
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSSERT: scan undeclared identifier 'Baz'

internal import pkg1.*
internal import pkg4.*

main(): Int64 {
    var a = @Bar[(123)](@Baz(123))
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
