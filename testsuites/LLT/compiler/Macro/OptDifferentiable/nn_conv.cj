// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: opt_differentiable.cj
// EXEC: %compiler %cmp_macro opt_differentiable.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package nn

import macros.*

@OptDifferentiable[include: [weight_, bias_]]
public struct Conv2d {
    var in_channels_: Int64 = 0

    init(in_channels__: Int64) {
        in_channels_ = in_channels__
    }
}

main(): Int64 {
    var conv1 = Conv2d(1)
    0
}
