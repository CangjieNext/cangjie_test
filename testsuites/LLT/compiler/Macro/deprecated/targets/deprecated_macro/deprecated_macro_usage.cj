// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:deprecated_macro_definition.cj 
// EXEC-PIPE: %compiler %cmp_macro deprecated_macro_definition.cj
// EXEC-PIPE: %run_macro %compiler %cmp_opt %f -o %output %macro_debug 2>&1 | compare %f
// ASSERT: scan macro 'Macro' is deprecated since 1990. DONTUSE.

import x.Macro

@Macro
func foo() {}

main(): Unit {}


