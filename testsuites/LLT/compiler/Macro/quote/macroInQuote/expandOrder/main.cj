// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: defineM.cj defineN.cj
// EXEC: %compiler defineN.cj %cmp_macro
// EXEC: %compiler %cmp_macro defineM.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan evalute M
// ASSERT: scan evalute N
import defineM.*
import defineN.*

main() {
    @M var b = 1
}
