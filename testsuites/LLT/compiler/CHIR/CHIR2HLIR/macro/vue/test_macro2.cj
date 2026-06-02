// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: test_macro1.cj
// EXEC:%compiler test_macro1.cj %cmp_macro
// EXEC:%pwd_to_ld_path %compiler %cmp_opt_chir2hlir %n.cj -o %output
// EXEC-PIPE:%run %output | compare %f
// ASSERT: regex Hello Macro!

import view.*

main(): Int64 {
    @callView(print("Hello Macro!"))
    return 0
}
