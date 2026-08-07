// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the stack frame size wrap-around: 16 VArrays, each with a
// distinct size of 2^63 bits (2^60 bytes), accumulate in one function's frame.
// Their total byte size is
//   16 * 2^60 + 8 * (0 + ... + 15) = 2^64 + 960
// which would wrap around uint64 to 960 bytes, so the backend stacksize guard
// (`StackSize >= 2GB` in X86FrameLowering) would see a tiny frame and let the
// build succeed, producing a binary that crashes at run time. CJIRVerifier
// rejects the function at IR level long before that: it sums static alloca
// sizes in checked arithmetic, and the cumulative frame size overflows
// uint64. Large-but-representable frames (e.g. varray_size_overflow_large02)
// do not overflow and flow downstream to the backend guard.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan The accumulated stack frame size exceeds the maximum representable size

main(): Int64 {
    let a0 = VArray<Int64, $144115188075855872> { i => i }
    let a1 = VArray<Int64, $144115188075855873> { i => i }
    let a2 = VArray<Int64, $144115188075855874> { i => i }
    let a3 = VArray<Int64, $144115188075855875> { i => i }
    let a4 = VArray<Int64, $144115188075855876> { i => i }
    let a5 = VArray<Int64, $144115188075855877> { i => i }
    let a6 = VArray<Int64, $144115188075855878> { i => i }
    let a7 = VArray<Int64, $144115188075855879> { i => i }
    let a8 = VArray<Int64, $144115188075855880> { i => i }
    let a9 = VArray<Int64, $144115188075855881> { i => i }
    let a10 = VArray<Int64, $144115188075855882> { i => i }
    let a11 = VArray<Int64, $144115188075855883> { i => i }
    let a12 = VArray<Int64, $144115188075855884> { i => i }
    let a13 = VArray<Int64, $144115188075855885> { i => i }
    let a14 = VArray<Int64, $144115188075855886> { i => i }
    let a15 = VArray<Int64, $144115188075855887> { i => i }
    return a0[0]+a1[0]+a2[0]+a3[0]+a4[0]+a5[0]+a6[0]+a7[0]+a8[0]+a9[0]+a10[0]+a11[0]+a12[0]+a13[0]+a14[0]+a15[0]+0
}
