// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan illegal attribute tokens in macro call, which is '@'
// ASSERT: scan illegal input tokens in macro call
// ASSERT: scan illegal input tokens in macro call

import define.*

main() {
    @M[@](\@)

    @M[\@](@)

    @M[\@](111 @func A() {})

    @M[r'@'](@sourceLine())
}

