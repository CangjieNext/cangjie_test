/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// EXPECTED-COMPILE-FAIL: T533_local_array_to_heap_parameter
// SKIP-SOURCE: T533 target overloads are absent in the prescribed SDK; cjc
// stops at fromStr/asArray before reaching the intended mode mismatch.
// DISABLED-EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// DISABLED-EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910 LEGIT-NEG fragment: pass a local JsonArray to a function
// whose parameter is the heap receiver type.  This is deliberately the only
// invalid operation in this file.  The local parser construction is valid on
// the design SDK and is required to make the target fragment observable.
//
// Current prescribed SDK evidence is SKIP-SOURCE rather than a false negative:
// it has no JsonValue.fromStr(String @local!) / JsonArray.asArray() local
// overloads, so compilation fails before the intended call.  The remaining
// T533 fragments (Q-array add, Q-object put, L-container write of heap payload)
// likewise require independent source files when those overloads are shipped;
// they are not combined here as a whole-file SCAN block (F18).

import stdx.encoding.json.*

func acceptHeapArray(array: JsonArray): Int64 {
    array.size()
}

main(): Int64 {
    let source: String @local! = "[1]"
    let value: JsonValue @local! = JsonValue.fromStr(source)
    let localArray: JsonArray @local! = value.asArray()
    acceptHeapArray(localArray)
}
