// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f

// EXEC: %run %run_opt %n.%suffix

open class RootException <: Exception {}
open class MiddleException <: RootException {}
class LeafException <: MiddleException {}

main() {
    try {
        throw LeafException()
    } catch (_: RootException) {
        print("caught")
    } catch (_: MiddleException) {
        print("middle")
    } catch (_: LeafException) {
        print("leaf")
    }
}

/* SCAN
warning: useless exception type
  ==> try58.cj:21:17:
   | 
21 |     } catch (_: MiddleException) {
   |                 ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: useless exception type
  ==> try58.cj:23:17:
   | 
23 |     } catch (_: LeafException) {
   |                 ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
