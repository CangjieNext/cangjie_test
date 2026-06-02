// EXEC: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

internal import std.collection.*

main() {
    let tempBuffer : ArrayList<CString> = ArrayList([LibC.mallocCString("xxx")])
    0
}

/* SCAN
error: unsafe function or native function should be invoked in unsafe context.
 ==> unsafe_14.cj:6:54:
  | 
6 |     let tempBuffer : ArrayList<CString> = ArrayList([LibC.mallocCString("xxx")])
  |                                                      ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
