// LEVEL: 0
// EXEC-PIPE-1: %compiler %f -O2 %debugCHIROpt -Woff unused %cmp_opt 2>&1 | compare %f

internal import std.console.*
internal import std.convert.Parsable

main() {
    let index = Int64.parse(Console.stdIn.readln().getOrThrow())
    var lev1: VArray<Int64, $5> = [1, 18, -3, 4, 0]
    lev1[index] = 7
    var lev2 = VArray<VArray<Int64, $5>, $10>(repeat: lev1)
    var lev3 = VArray<VArray<VArray<Int64, $5>, $10>, $5>(repeat: lev2)
    var lev4 = VArray<VArray<VArray<VArray<Int64, $5>, $10>, $5>, $3>(repeat: lev3)
    if (index > 6) {
        print(lev4[2][index-4][index-1][index]) // good, unknown, unknown, bad
    }
    // if (index >= 0 && index <= 5) { // VRA cannot analyse this yet due to implementation issues
    if (index>=0) { if(index<=5) {
        print(lev4[index][index/2][index+3][index-1]) // unknown, good, good, unknown
        print(lev4[1][index-6][8-index][0]) // good, bad
    }}
    0
}

// ASSERT: scan RangeAnalysis: syscall/varrayGet at (14,15) is invalid at level 4
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (18,15) is unknown, valid, valid, unknown
// ASSERT: scan RangeAnalysis: syscall/varrayGet at (19,15) is invalid at level 2
// ASSERT: scan error: array index is out of bounds
// ASSERT: scan   ==> VArray2.cj:15:15:
// ASSERT: scan 14 |         print(lev4[2][index-4][index-1][index]) // good, unknown, unknown, bad
// ASSERT: scan    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ varray index out of range 0..5 at rank 4
// ASSERT: scan   ==> VArray2.cj:20:15:
// ASSERT: scan    | 
// ASSERT: scan 19 |         print(lev4[1][index-6][8-index][0]) // good, bad
// ASSERT: scan    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ varray index out of range 0..5 at rank 2
// ASSERT: scan 
// ASSERT: scan    | 
// ASSERT: scan 
// ASSERT: scan 2 errors generated, 2 errors printed.


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
