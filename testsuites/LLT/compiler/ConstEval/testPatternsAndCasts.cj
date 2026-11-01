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

// Tests constant evaluation of match patterns (type, enum, tuple, option, guards) and `as` casts over a class hierarchy.

interface Named { func id(): Int64 }
open class A <: Named {
    public const init() {}
    public func id(): Int64 { 1 }
}
open class B <: A { public const init() { super() } }
class C <: B { public const init() { super() } }
class Z { public const init() {} }
enum E { P(Int64, Bool) | Q((Int64, Int64)) | R }
const func kind(x: Any): Int64 {
    match (x) {
        case _: C => 3
        case _: B => 2
        case _: A => 1
        case _: Z => 9
        case _ => 0
    }
}
const func asTest(a: A): Int64 {
    match (a as C) { case Some(_) => 1 case None => 0 }
}
const func pat(e: E): Int64 {
    match (e) {
        case P(n, true) where n > 10 => n
        case P(n, false) => -n
        case P(_, _) => 0
        case Q((a, b)) => a * b
        case R => 42
    }
}
const func tup(t: (Int64, (Bool, Rune))): Int64 {
    match (t) {
        case (0, (true, _)) => 1
        case (_, (false, r'a')) => 2
        case (x, _) => x
    }
}
const func optPat(o: ?Int64): Int64 { match (o) { case Some(x) where x > 1 => x case Some(_) => -1 case None => 0 } }
const K = (kind(C()), kind(B()), kind(A()), kind(Z()), kind(1))
const AS = (asTest(C()), asTest(B()))
const PT = (pat(E.P(11, true)), pat(E.P(3, false)), pat(E.P(3, true)), pat(E.Q((2, 3))), pat(E.R))
const TP = (tup((0, (true, r'z'))), tup((5, (false, r'a'))), tup((7, (true, r'b'))))
const OP = (optPat(Some(5)), optPat(Some(1)), optPat(None))
main() { println("${K[0]}${K[1]}${K[2]}${K[3]}${K[4]} ${AS[0]}${AS[1]} ${PT[0]} ${PT[1]} ${PT[2]} ${PT[3]} ${PT[4]} ${TP[0]}${TP[1]}${TP[2]} ${OP[0]}${OP[1]}${OP[2]}") }
