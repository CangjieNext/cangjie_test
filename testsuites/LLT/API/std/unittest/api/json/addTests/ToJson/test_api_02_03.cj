/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler    %cmp_opt  -o %n.%suffix %f


package std.unittest.test

import std.unittest.common.*

main() {
    var str: String = "test String"
    DataModel.fromJson(str)
    0
}

/* SCAN
error: mismatched types
  ==> test_api_02_03.cj:17:24:
   | 
17 |     DataModel.fromJson(str)
   |                        ^^^ expected 'Class-JsonValue', found 'Struct-String'
   | 

1 error generated, 1 error printed.
*/
