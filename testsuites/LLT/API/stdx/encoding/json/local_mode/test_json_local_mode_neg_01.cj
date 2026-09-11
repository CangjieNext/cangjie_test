/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// EXPECTED-COMPILE-FAIL: T532_heap_array_to_local_array
// DISABLED-EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// DISABLED-EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910 LEGIT-NEG: one illegal heap-to-local assignment only.  The
// heap serializer line is a valid mode control and must not be used to hide a
// second error.  Diagnostic wording/location is not an oracle; the expected
// failure is a mode mismatch at the assignment below.
//
// Verified with the prescribed SDK: cjc exits non-zero and reports
// `expected Class-JsonArray @local!, found Class-JsonArray` at the assignment.

import stdx.encoding.json.*

main(): Int64 {
    let heapValue: JsonValue = JsonValue.fromStr("[1,2]")
    let heapArray: JsonArray = heapValue.asArray()
    let _: String = heapArray.toString()
    let localArray: JsonArray @local! = heapArray
    return 0
}
