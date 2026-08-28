// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression for the stack frame total wrapping uint64. Each of the 8
// distinct giant VArray types occupies 2^61 - 8 - 8i bytes (individually
// representable in uint64 bits, so the IR-level check passes them), and the
// lambda initializer emits two stack objects per declaration. Together with
// the pad VArray the true frame total crosses 2^64, so MachineFrameInfo's
// uint64 stack size wraps to a tiny value both in main and in the synthesized
// type-keeping function. Before the fix the backend 2GB guard read the
// wrapped size and let the program compile; it then crashed at runtime. The
// guard must cross-check with a checked sum of the object sizes and reject.
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var a: VArray<Int64, $288230376151711743> = VArray<Int64, $288230376151711743> {i => i}
    var b: VArray<Int64, $288230376151711742> = VArray<Int64, $288230376151711742> {i => i}
    var c: VArray<Int64, $288230376151711741> = VArray<Int64, $288230376151711741> {i => i}
    var d: VArray<Int64, $288230376151711740> = VArray<Int64, $288230376151711740> {i => i}
    var e: VArray<Int64, $288230376151711739> = VArray<Int64, $288230376151711739> {i => i}
    var f: VArray<Int64, $288230376151711738> = VArray<Int64, $288230376151711738> {i => i}
    var g: VArray<Int64, $288230376151711737> = VArray<Int64, $288230376151711737> {i => i}
    var h: VArray<Int64, $288230376151711736> = VArray<Int64, $288230376151711736> {i => i}
    var p: VArray<Int64, $2> = VArray<Int64, $2> {i => i}
    return a.size + b.size + c.size + d.size + e.size + f.size + g.size + h.size + p.size
}
