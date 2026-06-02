// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_a`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_b`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_c`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_d`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_e`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_f`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_g`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_h`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_i`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_j`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_k`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_first_numbers_when_counting`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with `Array` type.

const a: VArray<Int8, $3> = [ 1, 2, 3 ]
const b: VArray<UInt8, $3> = [ 1, 2, 3 ]
const c: VArray<Int16, $3> = [ 1, 2, 3 ]
const d: VArray<UInt16, $3> = [ 1, 2, 3 ]
const e: VArray<Int32, $3> = [ 1, 2, 3 ]
const f: VArray<UInt32, $3> = [ 1, 2, 3 ]
const g: VArray<Int64, $3> = [ 1, 2, 3 ]
const h: VArray<UInt64, $3> = [ 1, 2, 3 ]
const i: VArray<Bool, $3> = [ true, false, true ]
const j: VArray<Unit, $3> = [ (), (), () ]
const k: VArray<Rune, $3> = [ r'b', r'a', r't' ]

const func one_two_three(): VArray<Int64, $3> {
  [ 0, 1, 2 ]
}

const first_numbers_when_counting = one_two_three()

main() {}
