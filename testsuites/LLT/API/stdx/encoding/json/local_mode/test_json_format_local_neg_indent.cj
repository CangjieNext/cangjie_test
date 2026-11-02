/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %local %import-cangjie-stdx %cmp_opt %stdx-package -o %n.%suffix %f
// T536: a fully local receiver must reject a fully local indent.
// The valid shared-receiver case is covered in test_json_format_local.cj.

import stdx.encoding.json.*

main(): Int64 {
    let array: JsonArray @local! = JsonArray() @local!
    let indent: String @local! = "  "
    let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
    return 0
}

/* SCAN
error: mismatched types
  ==> test_json_format_local_neg_indent.cj:17:32:
   | 
17 |     let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected 'Struct-String @local!', found 'Struct-String'
   | 

error: no matching function declaration for function call 'toJsonString'
  ==> test_json_format_local_neg_indent.cj:17:38:
   | 
17 |     let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
   |                                      ^ 
   | 
note: found function member of 'Class-JsonArray'
   ==> (package stdx.encoding.json)json_object.cj:819:25:
note: found function member of 'Class-JsonArray'
   ==> (package stdx.encoding.json)json_object.cj:823:17:

2 errors generated, 2 errors printed.
*/
