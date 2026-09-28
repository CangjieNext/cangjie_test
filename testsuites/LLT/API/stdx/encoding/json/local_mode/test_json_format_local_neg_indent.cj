/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt %stdx-package -o %n.%suffix %f
//
// LM-DOC-20260910 LEGIT-NEG (T536): static provenance constraint on the
// formatted serializer.  A local! receiver takes its indent as
// `String @~local`, so passing a local! indent is a mode mismatch and must be
// rejected at compile time.  This is deliberately the only invalid operation in
// this file; the local? receiver + local! indent combination is valid and is
// covered positively in test_json_format_local.cj.
//
// Verified 2026-09-21 with the rebuilt stdx: cjc reports
// `expected 'Struct-String @local!', found 'Struct-String'` at the indent
// argument.  Written as ERRCHECK + SCAN so the harness compiles it and asserts
// the diagnostic instead of skipping it.

import stdx.encoding.json.*

main(): Int64 {
    let array: JsonArray @local! = JsonArray() @local!
    let indent: String @local! = "  "
    let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
    return 0
}

/* SCAN
error: mismatched types
  ==> test_json_format_local_neg_indent.cj:27:32:
   | 
27 |     let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected 'Struct-String @local!', found 'Struct-String'
   | 

error: no matching function declaration for function call 'toJsonString'
  ==> test_json_format_local_neg_indent.cj:27:38:
   | 
27 |     let text: String @local! = array.toJsonString(2, bracketInNewLine: false, indent: indent)
   |                                      ^ 
   | 
note: found function member of 'Class-JsonArray'
   ==> (package stdx.encoding.json)json_object.cj:861:17:
note: found function member of 'Class-JsonArray'
   ==> (package stdx.encoding.json)json_object.cj:865:25:
note: found function member of 'Class-JsonArray'
   ==> (package stdx.encoding.json)json_object.cj:870:17:

2 errors generated, 2 errors printed.
*/
