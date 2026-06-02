// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic %cmp_opt %n.cj 2>&1 | compare %f

main(): Int64 {
    var n: Nothing
    do {
        var a = 3;
        n = break
    } while (false)
    return n
}

/* SCAN-IN
error: variable 'n' is used before initialization
  ==> nothingType3.cj:15:12:
   | 
15 |     return n
   |            ^ 
   | 

1 error generated, 1 error printed.
*/
