// LEVEL: 0
// (DEBUG_OPTION) EXEC-PIPE-1: %compiler %disableSemaConstCheck %cmp_opt %f -o %output 2>&1 | compare %f

let g1: Int8 = 1
let g2: UInt8 = 1
var g3: Int16 = 1
let g4: UInt16 = 1
let g5: Int32 = 1
var g6: UInt32 = 1
let g7: Int64 = 1
var g8: UInt64 = 1

public func shiftOverflow01() {
    var a1 = g1 << 8
    var a2 = g2 << 8
    var a3 = g3 << 16
    var a4 = g4 << 16
    var a5 = g5 << 32
    var a6 = g6 << 32
    var a7 = g7 << 64
    var a8 = g8 << 64
}

public func shiftOverflow02() {
    var a1 = g1 >> 8
    var a2 = g2 >> 8
    var a3 = g3 >> 16
    var a4 = g4 >> 16
    var a5 = g5 >> 32
    var a6 = g6 >> 32
    var a7 = g7 >> 64
    var a8 = g8 >> 64
}

main() {}

/* SCAN
warning: unused variable:'a1'
  ==> shiftOverflow01.cj:14:9:
   | 
14 |     var a1 = g1 << 8
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:14:14:
   | 
14 |     var a1 = g1 << 8
   |              ^^^^^^^ attempt to shift 8 bits on Int8 type
   | 
   # note: the type of left operand is Int8, the most bits that expected to shift are 7

warning: unused variable:'a2'
  ==> shiftOverflow01.cj:15:9:
   | 
15 |     var a2 = g2 << 8
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:15:14:
   | 
15 |     var a2 = g2 << 8
   |              ^^^^^^^ attempt to shift 8 bits on UInt8 type
   | 
   # note: the type of left operand is UInt8, the most bits that expected to shift are 7

warning: unused variable:'a3'
  ==> shiftOverflow01.cj:16:9:
   | 
16 |     var a3 = g3 << 16
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:16:14:
   | 
16 |     var a3 = g3 << 16
   |              ^^^^^^^^ attempt to shift 16 bits on Int16 type
   | 
   # note: the type of left operand is Int16, the most bits that expected to shift are 15

warning: unused variable:'a4'
  ==> shiftOverflow01.cj:17:9:
   | 
17 |     var a4 = g4 << 16
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:17:14:
   | 
17 |     var a4 = g4 << 16
   |              ^^^^^^^^ attempt to shift 16 bits on UInt16 type
   | 
   # note: the type of left operand is UInt16, the most bits that expected to shift are 15

warning: unused variable:'a5'
  ==> shiftOverflow01.cj:18:9:
   | 
18 |     var a5 = g5 << 32
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:18:14:
   | 
18 |     var a5 = g5 << 32
   |              ^^^^^^^^ attempt to shift 32 bits on Int32 type
   | 
   # note: the type of left operand is Int32, the most bits that expected to shift are 31

warning: unused variable:'a6'
  ==> shiftOverflow01.cj:19:9:
   | 
19 |     var a6 = g6 << 32
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:19:14:
   | 
19 |     var a6 = g6 << 32
   |              ^^^^^^^^ attempt to shift 32 bits on UInt32 type
   | 
   # note: the type of left operand is UInt32, the most bits that expected to shift are 31

warning: unused variable:'a7'
  ==> shiftOverflow01.cj:20:9:
   | 
20 |     var a7 = g7 << 64
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:20:14:
   | 
20 |     var a7 = g7 << 64
   |              ^^^^^^^^ attempt to shift 64 bits on Int64 type
   | 
   # note: the type of left operand is Int64, the most bits that expected to shift are 63

warning: unused variable:'a8'
  ==> shiftOverflow01.cj:21:9:
   | 
21 |     var a8 = g8 << 64
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:21:14:
   | 
21 |     var a8 = g8 << 64
   |              ^^^^^^^^ attempt to shift 64 bits on UInt64 type
   | 
   # note: the type of left operand is UInt64, the most bits that expected to shift are 63

warning: unused variable:'a1'
  ==> shiftOverflow01.cj:25:9:
   | 
25 |     var a1 = g1 >> 8
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:25:14:
   | 
25 |     var a1 = g1 >> 8
   |              ^^^^^^^ attempt to shift 8 bits on Int8 type
   | 
   # note: the type of left operand is Int8, the most bits that expected to shift are 7

warning: unused variable:'a2'
  ==> shiftOverflow01.cj:26:9:
   | 
26 |     var a2 = g2 >> 8
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:26:14:
   | 
26 |     var a2 = g2 >> 8
   |              ^^^^^^^ attempt to shift 8 bits on UInt8 type
   | 
   # note: the type of left operand is UInt8, the most bits that expected to shift are 7

warning: unused variable:'a3'
  ==> shiftOverflow01.cj:27:9:
   | 
27 |     var a3 = g3 >> 16
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:27:14:
   | 
27 |     var a3 = g3 >> 16
   |              ^^^^^^^^ attempt to shift 16 bits on Int16 type
   | 
   # note: the type of left operand is Int16, the most bits that expected to shift are 15

warning: unused variable:'a4'
  ==> shiftOverflow01.cj:28:9:
   | 
28 |     var a4 = g4 >> 16
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:28:14:
   | 
28 |     var a4 = g4 >> 16
   |              ^^^^^^^^ attempt to shift 16 bits on UInt16 type
   | 
   # note: the type of left operand is UInt16, the most bits that expected to shift are 15

warning: unused variable:'a5'
  ==> shiftOverflow01.cj:29:9:
   | 
29 |     var a5 = g5 >> 32
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:29:14:
   | 
29 |     var a5 = g5 >> 32
   |              ^^^^^^^^ attempt to shift 32 bits on Int32 type
   | 
   # note: the type of left operand is Int32, the most bits that expected to shift are 31

warning: unused variable:'a6'
  ==> shiftOverflow01.cj:30:9:
   | 
30 |     var a6 = g6 >> 32
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:30:14:
   | 
30 |     var a6 = g6 >> 32
   |              ^^^^^^^^ attempt to shift 32 bits on UInt32 type
   | 
   # note: the type of left operand is UInt32, the most bits that expected to shift are 31

warning: unused variable:'a7'
  ==> shiftOverflow01.cj:31:9:
   | 
31 |     var a7 = g7 >> 64
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:31:14:
   | 
31 |     var a7 = g7 >> 64
   |              ^^^^^^^^ attempt to shift 64 bits on Int64 type
   | 
   # note: the type of left operand is Int64, the most bits that expected to shift are 63

warning: unused variable:'a8'
  ==> shiftOverflow01.cj:32:9:
   | 
32 |     var a8 = g8 >> 64
   |         ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

error: shift operation overflow
  ==> shiftOverflow01.cj:32:14:
   | 
32 |     var a8 = g8 >> 64
   |              ^^^^^^^^ attempt to shift 64 bits on UInt64 type
   | 
   # note: the type of left operand is UInt64, the most bits that expected to shift are 63

16 errors generated, 16 errors printed.
16 warnings generated, 16 warnings printed.
*/


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
