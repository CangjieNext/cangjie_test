/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const G = 6.674e-11

struct Planet {
    const Planet(let mass: Float64, let radius: Float64) {}
    const func gravity(m: Float64, r: Float64) {
        G * mass * m / r ** 2
    }
}

main() {
    const myMass = 71.0
    const earth = Planet(5.972e24, 6.378e6)
    return Int64(earth.gravity(myMass, earth.radius) - 695.657257)
}
