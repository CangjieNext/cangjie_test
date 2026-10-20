// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Const init diagnostics must keep the expression DebugLocation (Issue #3536):
// global div/mod/unary-neg, tuple-pattern init, and local const promoted to global.
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const badDiv: Int64 = 1 / 0
const badMod: Int64 = 1 % 0
const badNeg: Int8 = -(-128)
const (patA, patB) = (1 / 0, 2)

func useLocalConst(): Int64 {
    const localBad: Int64 = 1 / 0
    return localBad
}

main(): Int64 {
    println(badDiv)
    println(badMod)
    println(badNeg)
    println(patA)
    println(patB)
    println(useLocalConst())
    return 0
}

/* SCAN
error: divide by zero
  ==> divByZero03.cj:12:23:
   | 
12 | const badDiv: Int64 = 1 / 0
   |                       ^^^^^ attempt to divide by zero
   | 

error: modulo by zero
  ==> divByZero03.cj:13:23:
   | 
13 | const badMod: Int64 = 1 % 0
   |                       ^^^^^ attempt to modulo by zero
   | 

error: arithmetic operation '-' overflow
  ==> divByZero03.cj:14:22:
   | 
14 | const badNeg: Int8 = -(-128)
   |                      ^^^^^^^ operation '-Int8(-128)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

error: divide by zero
  ==> divByZero03.cj:15:23:
   | 
15 | const (patA, patB) = (1 / 0, 2)
   |                       ^^^^^ attempt to divide by zero
   | 

error: divide by zero
  ==> divByZero03.cj:18:29:
   | 
18 |     const localBad: Int64 = 1 / 0
   |                             ^^^^^ attempt to divide by zero
   | 

5 errors generated, 5 errors printed.
*/
