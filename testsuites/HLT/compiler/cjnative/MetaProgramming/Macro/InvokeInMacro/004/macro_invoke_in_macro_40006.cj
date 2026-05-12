/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a_40006.cj define_aa_40006.cj

// EXEC-PIPE-1: %compiler define_a_40006.cj define_aa_40006.cj %cmp_macro 2>&1 | compare %f


package use

import A.*

main() {
    return 1
}
// ASSERT: scan macro_unexpect_def_and_call_in_same_pkg
