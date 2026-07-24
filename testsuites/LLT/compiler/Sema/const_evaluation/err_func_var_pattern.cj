// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot define 'var' variable in 'const' function
// ASSERT: scan-not Internal Compiler Error

struct Planet {
    const Planet(let mass: Float64, let radius: Float64) {}

    const func gravity(m: Float64, r: Float64): Float64 {
        var (cx, cy) = (1, 2)
        return mass * m / (r * r)
    }
}

main(): Int64 {
    const earth = Planet(5.972e24, 6.378e6)
    return Int64(earth.gravity(71.0, earth.radius))
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
