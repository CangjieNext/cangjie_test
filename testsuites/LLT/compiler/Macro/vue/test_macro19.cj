// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: defineA.cj  defineB.cj
// EXEC: %compiler %cmp_opt defineA.cj %cmp_macro
// EXEC: %compiler %cmp_opt defineB.cj %cmp_macro
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package use

import a.*

main() {
    @A[0](0) - 1
}
