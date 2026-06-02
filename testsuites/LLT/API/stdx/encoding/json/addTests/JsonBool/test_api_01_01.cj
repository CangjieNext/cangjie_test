/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler  %import-cangjie-stdx  %cmp_opt %stdx-package  -o %n.%suffix %f

import stdx.encoding.json.*

main(): Int64 {
    //init 传入不是Bool
    var jsonBool = JsonBool(1)
    return 0
}

/* SCAN-IN
error: cannot convert an integer literal to type 'Bool'
  ==> test_api_01_01.cj:14:29:
   | 
14 |     var jsonBool = JsonBool(1)
   |                             ^ 
   | 

1 error generated, 1 error printed.
*/
