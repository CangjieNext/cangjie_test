// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.runtime

func invoke<T>(f: (T) -> T, v: T): T {
    f(v)
}

func getBlockBox<T>(): (T) -> T {
    return runtime.blackBox<T>
}

let r = invoke<Int64>(runtime.blackBox<Int64>, 42)
let a = runtime.blackBox<Int64>
let b: Array<(Int64)->Int64> = [runtime.blackBox<Int64>]

main() {}

/* SCAN
error: the intrinsic function can only be called rather than as name reference
  ==> intrinsic_check_first_class_ma.cj:16:12:
   | 
16 |     return runtime.blackBox<T>
   |            ^^^^^^^^^^^^^^^^^^ 
   | 

error: the intrinsic function can only be called rather than as name reference
  ==> intrinsic_check_first_class_ma.cj:19:23:
   | 
19 | let r = invoke<Int64>(runtime.blackBox<Int64>, 42)
   |                       ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: the intrinsic function can only be called rather than as name reference
  ==> intrinsic_check_first_class_ma.cj:20:9:
   | 
20 | let a = runtime.blackBox<Int64>
   |         ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: the intrinsic function can only be called rather than as name reference
  ==> intrinsic_check_first_class_ma.cj:21:33:
   | 
21 | let b: Array<(Int64)->Int64> = [runtime.blackBox<Int64>]
   |                                 ^^^^^^^^^^^^^^^^^^^^^^ 
   | 

4 errors generated, 4 errors printed.
*/
