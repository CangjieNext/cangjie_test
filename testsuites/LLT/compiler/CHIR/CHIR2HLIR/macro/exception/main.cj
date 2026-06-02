// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: macro_define.cj
// EXEC: %compiler %cmp_opt macro_define.cj %cmp_macro
// EXEC: %pwd_to_ld_path %compiler %cmp_opt_chir2hlir %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex An exception has occurred:

import test.*

@M
func dummy_func() {}
