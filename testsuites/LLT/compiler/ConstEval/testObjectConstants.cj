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

// Tests constant evaluation producing class, generic class, enum, option, tuple, string and VArray constants.

open class Animal { let legs: Int64; public const init(l: Int64) { legs = l } }
class Dog <: Animal { let name: Int64; public const init() { super(4); name = 1 } }
class Box<T> { let v: T; public const init(x: T) { v = x } }
enum Shape { Circle(Int64) | Rect(Int64, Int64) | Empty }
struct Pt { let x: Int64; const init(a: Int64) { x = a } }
const ANIMAL = Animal(2)
const DOG = Dog()
const ASBASE: Animal = Dog()
const BOX = Box<Int64>(3)
const BOXS = Box<Pt>(Pt(1))
const SH1 = Shape.Circle(3)
const SH2 = Shape.Rect(1, 2)
const SH3 = Shape.Empty
const OPT: Option<Int64> = Some(5)
const OPTN: Option<Int64> = None
const TUP = (1, true, r'x', 2.5, ())
const STR = "abc"
const VA: VArray<Pt, $2> = [Pt(1), Pt(2)]
main() {
    println(ANIMAL.legs); println(DOG.legs); println(ASBASE.legs); println(BOX.v); println(BOXS.v.x)
    match (SH2) { case Rect(a, b) => println(a + b) case _ => () }
    println(OPT.getOrThrow()); println(TUP[2]); println(STR); println(VA[1].x)
}
