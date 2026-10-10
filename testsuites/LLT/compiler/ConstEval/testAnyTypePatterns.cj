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

// Tests constant evaluation of values boxed into `Any` and matched with type patterns, recursive enums, and allocations inside `try`.

struct Pt { let x: Int64; const init(a: Int64) { x = a } }
class K { let v: Int64; public const init(a: Int64) { v = a } }
enum L { Nil | Cons(Int64, L) }
const func kind(x: Any): Int64 {
    match (x) {
        case f: (Int64) -> Int64 => f(10)
        case p: Pt => p.x * 100
        case k: K => k.v * 1000
        case o: Option<Int64> => match (o) { case Some(v) => v case None => -7 }
        case r: Rune => if (r == r'q') { 5 } else { 6 }
        case b: Bool => if (b) { 1 } else { 0 }
        case f: Float32 => if (f > 1.0) { 3 } else { 4 }
        case u: Unit => 77
        case _ => 0
    }
}
const func sumL(l: L): Int64 {
    match (l) { case Nil => 0 case Cons(h, t) => h + sumL(t) }
}
const func tryAlloc(a: Int64): Int64 {
    try { K(a).v + Pt(a).x } catch (e: Exception) { -1 }
}
const func tryStr(a: String, b: String): Bool {
    try { a == b } catch (e: Exception) { false }
}
const LST = L.Cons(1, L.Cons(2, L.Cons(3, L.Nil)))
const R = (kind({ x: Int64 => x * 2 }), kind(Pt(2)), kind(K(3)), kind(Some(4)), kind(Option<Int64>.None),
    kind(r'q'), kind(true), kind(2.0f32), kind(()), kind(1u8), sumL(LST), tryAlloc(4), tryStr("ab", "ab"))
main() { println("${R[0]} ${R[1]} ${R[2]} ${R[3]} ${R[4]} ${R[5]} ${R[6]} ${R[7]} ${R[8]} ${R[9]} ${R[10]} ${R[11]} ${R[12]}") }
