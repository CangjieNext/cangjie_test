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
    // init() 非法参数
    var initFunc = JsonArray([1, 2, 3])
    return 0
}

/* SCAN
error: cannot convert an integer literal to type 'Class-JsonValue'
  ==> test_api_01_01.cj:14:31:
   | 
14 |     var initFunc = JsonArray([1, 2, 3])
   |                               ^ 
   | 

1 error generated, 1 error printed.
*/
