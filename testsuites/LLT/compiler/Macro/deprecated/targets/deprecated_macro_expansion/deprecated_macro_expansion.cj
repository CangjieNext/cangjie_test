// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:deprecated_macro_definition.cj 
// EXEC-PIPE: %compiler %cmp_macro deprecated_macro_definition.cj
// EXEC-PIPE: %run_macro %compiler %cmp_opt %f -o %output %macro_debug  2>&1 | compare %f

// NOTE: This tests checks that @Deprecated is applicable to result of macro expansion 
// ASSERT: scan function 'foo' is deprecated since 1999.

import x.Macro

@Deprecated[since: "1999"]
@Macro
func foo() {}

main(): Unit {
    foo()
}

