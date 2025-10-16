// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_a`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_b`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with `Tuple` type.

const a: (Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64, Bool, Unit, Rune, String, VArray<Int8, $3>) = (1, 2, 3, 4, 5, 6, 7, 8, true, (), r'a', "aa", [ 1, 2, 3 ])

const func realistic_tuple(): (Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64, Bool, Unit, Rune, String, VArray<Int8, $3>) {
  (1, 2, 3, 4, 5, 6, 7, 8, true, (), r'a', "aa", [ 1, 2, 3 ])
}

const b = realistic_tuple()

main() {}
