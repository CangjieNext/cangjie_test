// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan-not error
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation of Float16/Float32/Float64 literals, arithmetic and comparisons.

const func f16(a: Float16, b: Float16): Float16 { if (a < b && a <= b && b > a && b >= a && a != b) { -(a + b) * a / b - a } else { a } }
const func f32(a: Float32, b: Float32): Float32 { if (a < b && a <= b && b > a && b >= a && a != b && !(a == b)) { -(a + b) * a / b - a } else { a } }
const func f64(a: Float64, b: Float64): Float64 { if (a < b && a <= b && b > a && b >= a && a != b) { -(a + b) * a / b - a } else { a } }
const H1: Float16 = 1.5
const H2 = f16(1.5, 2.25)
const S1: Float32 = 3.25
const S2 = f32(1.5, 2.25)
const D2 = f64(1.5, 2.25)
const H3 = f16(2.0, 1.0)
const S3 = f32(2.0, 1.0)
main() { println("${H1} ${H2} ${S1} ${S2} ${D2} ${H3} ${S3}") }
