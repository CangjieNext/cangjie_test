// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -O2 %debugCHIROpt -Woff unused %cmp_opt 2>&1 | compare %f

internal import std.console.*
internal import std.convert.Parsable

main() {
    let index = Int64.parse(Console.stdIn.readln().getOrThrow())
    let b: VArray<Int64, $5> = [1, 18, -3, 4, 0]
    println(b[0].toString()) // good access
    if (index > 6) {
        print(b[index].toString()) // bad access
    } else {
        println(b[index].toString()) // unsure access, no diagnostics required
    }
    nestedVArray()
    varr2()
    0
}

func nestedVArray() {
    let index = Int64.parse(Console.stdIn.readln().getOrThrow())
    var a = VArray<Int32, $5>() { i => Int32(i+2) }
    var b = VArray<VArray<Int32, $5>, $12>(repeat: a)
    let temp = b[0] // good access
    println(b[0][3]) // good access
    if (index > 6) {
        let idofb = b[index] // unsure access
        print(idofb[index].toString()) // bad access
    } else if (index >= 0) {
        println(b[index][index]) // good access
    }
}

struct G {
    var b: Int64 = 1
}

func varr2() {
    var p = VArray<G, $5>() { i => G() }
    p[1] = G()
    let index = Int64.parse(Console.stdIn.readln().getOrThrow())
    if (index > 6) {
        print(p[index].b.toString()) // bad access
    } else {
        println(p[index].b.toString()) // unsure access, no diagnostics required
    }
}

// ASSERT: scan RangeAnalysis: syscall/varrayGet at (9,13) is valid
// ASSERT: scan-not RangeAnalysis: syscall/varrayGet at (13,17) is
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (24,16) is valid
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (25,13) is valid, valid
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (11,15) is invalid
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (30,17) is valid, unknown
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (28,15) is invalid
// ASSERT: scan-not RangeAnalysis: syscall/varrayGet at (27,21) is
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (43,15) is invalid
// ASSERT: scan-not RangeAnalysis: syscall/varrayGet at (45,17) is 

// ASSERT: scan error: array index is out of bounds
// ASSERT: scan   ==> VArray.cj:12:15:
// ASSERT: scan    | 
// ASSERT: scan 11 |         print(b[index].toString()) // bad access
// ASSERT: scan    |               ^^^^^^^^ varray index out of range 0..5
// ASSERT: scan 
// ASSERT: scan    | 
// ASSERT: scan 
// ASSERT: scan error: array index is out of bounds
// ASSERT: scan   ==> VArray.cj:29:15:
// ASSERT: scan    | 
// ASSERT: scan 28 |         print(idofb[index].toString()) // bad access
// ASSERT: scan    |               ^^^^^^^^^^^^ varray index out of range 0..5
// ASSERT: scan 
// ASSERT: scan    | 
// ASSERT: scan 
// ASSERT: scan error: array index is out of bounds
// ASSERT: scan   ==> VArray.cj:44:15:
// ASSERT: scan    | 
// ASSERT: scan 43 |         print(p[index].b.toString()) // bad access
// ASSERT: scan    |               ^^^^^^^^ varray index out of range 0..5
// ASSERT: scan 
// ASSERT: scan    | 
// ASSERT: scan 
// ASSERT: scan 3 errors generated, 3 errors printed.

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
