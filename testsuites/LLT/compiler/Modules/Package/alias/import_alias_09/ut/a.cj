// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../ops
// EXEC: %compiler %pkg_opt ops/ %compile_lib_opt -o ops.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %pkg_opt %diag_json . 2>&1 | compare %f

package ut

import std.math.exp as expStd
import ops.*

func test_expOpGrad(x: Unit) {
    exp(1.0)
}

main() {}

// ASSERT: scan sema_wrong_number_of_arguments
