// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_earth` of 6 expressions to one of 6 expressions.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const G = 6.674e-11

class Planet {
    const Planet(let mass: Float64, let radius: Float64) {}

    const func gravity(m: Float64, r: Float64) {
        G * mass * m / r**2
    }
}

main() {
    const myMass = 71.0
    const earth = Planet(5.972e24, 6.378e6)
    println(earth.gravity(myMass, earth.radius))
}
