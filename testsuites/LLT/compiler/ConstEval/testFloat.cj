// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// EXEC: %compiler %compile_exe_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const f32lit: Float32 = 20.0
const f32const: Float32 = id32(f32lit)

const f16lit: Float16 = 20.0
const f16const: Float16 = id16(f16lit)

const func id32(x: Float32): Float32 {
    x
}

const func id16(x: Float16): Float16 {
    x
}

main(): Int64 {
    println("${Float64(f32lit)}")
    println("${Float64(f32const)}")
    println("${Float64(f16lit)}")
    println("${Float64(f16const)}")
    return 0
}
