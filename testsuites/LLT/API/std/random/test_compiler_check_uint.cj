/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt  %f

internal import std.random.*

main() {
    var rand = Random()
    var resUInt32_1 = rand.nextUInt32(-1)
    var resUInt32_2 = rand.nextUInt32(4294967296)
    var resUInt64_1 = rand.nextUInt64(-1)
    var resUInt64_2 = rand.nextUInt64(18446744073709551616)
    return 0
}

/* SCAN
error: the number '-1' exceeds the value range of type 'UInt32'
  ==> test_compiler_check_uint.cj:14:39:
   | 
14 |     var resUInt32_1 = rand.nextUInt32(-1)
   |                                       ^^ 
   | 

error: the number '4294967296' exceeds the value range of type 'UInt32'
  ==> test_compiler_check_uint.cj:15:39:
   | 
15 |     var resUInt32_2 = rand.nextUInt32(4294967296)
   |                                       ^^^^^^^^^^ 
   | 

error: the number '-1' exceeds the value range of type 'UInt64'
  ==> test_compiler_check_uint.cj:16:39:
   | 
16 |     var resUInt64_1 = rand.nextUInt64(-1)
   |                                       ^^ 
   | 

error: the number '18446744073709551616' exceeds the value range of type 'UInt64'
  ==> test_compiler_check_uint.cj:17:39:
   | 
17 |     var resUInt64_2 = rand.nextUInt64(18446744073709551616)
   |                                       ^^^^^^^^^^^^^^^^^^^^ 
   | 

4 errors generated, 4 errors printed.
*/