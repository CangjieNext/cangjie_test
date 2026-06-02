// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mod1 mod2
// EXEC: %run_macro %compiler mod1/define.cj %cmp_macro
// EXEC: %run_macro %compiler mod2/define.cj %cmp_macro
// EXEC: %run_macro %compiler %f -o %output | compare %f
// ASSERT: scan macro M in mod2

import mod1.define.*
import mod2.define

main() {
    @define.M(1)
}
