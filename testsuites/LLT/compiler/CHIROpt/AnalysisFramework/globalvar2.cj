// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var g1: UInt16 = UInt16(155)
let g5: (IA, CA) = (CB(), CA())

interface IA {}

class CA {
    var x = 1
}

class CB <: IA {}

func foo(): Int64 {
    var ca = try {
        g1 >>= 1
        g5[1]
    } catch (_) {
        CA()
    }
    ca.x
}

main() {
    0
}
