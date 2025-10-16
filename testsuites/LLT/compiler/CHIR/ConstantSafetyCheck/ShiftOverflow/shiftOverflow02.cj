// LEVEL: 0
// (DEBUG_OPTION) EXEC-PIPE-1: %compiler %disableSemaConstCheck %cmp_opt %f -o %output 2>&1 | compare %f

var g1: Int8 = 1
let g2: UInt8 = 1
let g3: Int16 = 1
let g4: UInt16 = 1
let g5: Int32 = 1
let g6: UInt32 = 1
let g7: Int64 = 1
var g8: UInt64 = 1

public func shiftOverflow01() {
    var a1 = (g1 * 127) << 9
    var a2 = g8 << -3
    var a3 = g2 << (15 - g2 * 7)
}

main() {}

/* SCAN
warning: unused variable:'a1'
  ==> shiftOverflow02.cj:14:9:
   | 
14 |     var a1 = (g1 * 127) << 9
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow02.cj:14:14:
   | 
14 |     var a1 = (g1 * 127) << 9
   |              ^^^^^^^^^^^^^^^ attempt to shift 9 bits on Int8 type
   | 
   # note: the type of left operand is Int8, the most bits that expected to shift are 7

warning: unused variable:'a2'
  ==> shiftOverflow02.cj:15:9:
   | 
15 |     var a2 = g8 << -3
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow02.cj:15:14:
   | 
15 |     var a2 = g8 << -3
   |              ^^^^^^^^ attempt to shift -3 bits on UInt64 type
   | 
   # note: right operand can not be negative

warning: unused variable:'a3'
  ==> shiftOverflow02.cj:16:9:
   | 
16 |     var a3 = g2 << (15 - g2 * 7)
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow02.cj:16:14:
   | 
16 |     var a3 = g2 << (15 - g2 * 7)
   |              ^^^^^^^^^^^^^^^^^^^ attempt to shift 8 bits on UInt8 type
   | 
   # note: the type of left operand is UInt8, the most bits that expected to shift are 7

3 errors generated, 3 errors printed.
3 warnings generated, 3 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
