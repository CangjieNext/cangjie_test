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
    var resInt8_1 = rand.nextInt8(128)
    var resInt8_2 = rand.nextInt8(-129)
    var resInt16_1 = rand.nextInt16(32768)
    var resInt16_2 = rand.nextInt16(-32769)
    var resInt32_1 = rand.nextInt32(2147483648)
    var resInt32_2 = rand.nextInt32(-2147483649)
    var resInt64_1 = rand.nextInt64(9223372036854775808)
    var resInt64_2 = rand.nextInt64(-9223372036854775809)
    return 0
}

/* SCAN
error: the number '128' exceeds the value range of type 'Int8'
  ==> test_compiler_check_int.cj:14:35:
   | 
14 |     var resInt8_1 = rand.nextInt8(128)
   |                                   ^^^ 
   | 

error: the number '-129' exceeds the value range of type 'Int8'
  ==> test_compiler_check_int.cj:15:35:
   | 
15 |     var resInt8_2 = rand.nextInt8(-129)
   |                                   ^^^^ 
   | 

error: the number '32768' exceeds the value range of type 'Int16'
  ==> test_compiler_check_int.cj:16:37:
   | 
16 |     var resInt16_1 = rand.nextInt16(32768)
   |                                     ^^^^^ 
   | 

error: the number '-32769' exceeds the value range of type 'Int16'
  ==> test_compiler_check_int.cj:17:37:
   | 
17 |     var resInt16_2 = rand.nextInt16(-32769)
   |                                     ^^^^^^ 
   | 

error: the number '2147483648' exceeds the value range of type 'Int32'
  ==> test_compiler_check_int.cj:18:37:
   | 
18 |     var resInt32_1 = rand.nextInt32(2147483648)
   |                                     ^^^^^^^^^^ 
   | 

error: the number '-2147483649' exceeds the value range of type 'Int32'
  ==> test_compiler_check_int.cj:19:37:
   | 
19 |     var resInt32_2 = rand.nextInt32(-2147483649)
   |                                     ^^^^^^^^^^^ 
   | 

error: the number '9223372036854775808' exceeds the value range of type 'Int64'
  ==> test_compiler_check_int.cj:20:37:
   | 
20 |     var resInt64_1 = rand.nextInt64(9223372036854775808)
   |                                     ^^^^^^^^^^^^^^^^^^^ 
   | 

error: the number '-9223372036854775809' exceeds the value range of type 'Int64'
  ==> test_compiler_check_int.cj:21:37:
   | 
21 |     var resInt64_2 = rand.nextInt64(-9223372036854775809)
   |                                     ^^^^^^^^^^^^^^^^^^^^ 
   | 

8 errors generated, 8 errors printed.
*/
