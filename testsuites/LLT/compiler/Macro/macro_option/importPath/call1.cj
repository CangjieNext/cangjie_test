// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:./def
// EXEC: %compiler %cmp_macro def/define.cj -o ./def
// EXEC: %run_macro %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan can not find package 'define'

import define.*

main(): Int64 {
    var b = @M(1)
    return 0
}
