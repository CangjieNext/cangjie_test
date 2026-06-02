/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler  %import-cangjie-stdx  %cmp_opt %stdx-package -o %n.%suffix %f

import stdx.serialization.serialization.*
import stdx.encoding.json.*

main() {
    var str: String = "test String"
    DataModel.fromJson(str)
    0
}

/* SCAN
error: mismatched types
  ==> test_api_02_03.cj:15:24:
   | 
15 |     DataModel.fromJson(str)
   |                        ^^^ expected 'Class-JsonValue', found 'Struct-String'
   | 

1 error generated, 1 error printed.
*/
