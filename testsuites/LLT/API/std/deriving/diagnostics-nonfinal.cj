/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

import std.deriving.*

@Derive[ToString]
open class OC {}

@Derive[ToString]
abstract class AC {}

@Derive[ToString]
sealed class SC {}

@Derive[ToString]
abstract sealed class SC2 {}

/* SCAN-IN
error: Non-final classes are not supported (open, abstract or sealed)
  ==> diagnostics-nonfinal.cj:13:1:
   | 
13 | open class OC {}
   | ^^^^ 
   | 

error: Non-final classes are not supported (open, abstract or sealed)
  ==> diagnostics-nonfinal.cj:16:1:
   | 
16 | abstract class AC {}
   | ^^^^^^^^ 
   | 

error: Sealed classes are not supported
  ==> diagnostics-nonfinal.cj:19:1:
   | 
19 | sealed class SC {}
   | ^^^^^^ 
   | 

error: Non-final classes are not supported (open, abstract or sealed)
  ==> diagnostics-nonfinal.cj:22:1:
   | 
22 | abstract sealed class SC2 {}
   | ^^^^^^^^ 
   | 

error: Sealed classes are not supported
  ==> diagnostics-nonfinal.cj:22:10:
   | 
22 | abstract sealed class SC2 {}
   |          ^^^^^^ 
   | 

5 errors generated, 5 errors printed.
 */
