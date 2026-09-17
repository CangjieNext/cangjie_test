// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ASSERT: scan-not warning: unreachable

// A true guard only completes the matching Red case; sibling sealed subtypes remain reachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

sealed interface Color {}

class Red <: Color {}
class Green <: Color {}

func f(color: Color): Int64 {
    match (color) {
        case _: Red where true => 0
        case _: Green => 1
        case _ => 2
    }
}

main() {
}
