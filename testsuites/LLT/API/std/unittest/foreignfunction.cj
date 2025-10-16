/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

import std.unittest.*
import std.unittest.testmacro.*

@TestCase // EXPECT: scan '@TestCase modified foreign function'
foreign func case02(): Unit

foreign func case01(): Unit

/* SCAN
error: macro using error, '@TestCase modified top level function'
  ==> foreignfunction.cj:13:1:
   | 
13 | @TestCase // EXPECT: scan '@TestCase modified foreign function'
   | ^ 
   | 

1 error generated, 1 error printed.
*/
