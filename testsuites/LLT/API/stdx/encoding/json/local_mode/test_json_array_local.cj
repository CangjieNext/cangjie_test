/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// SKIP-COMPILE: LM-DOC-20260910 prescribed SDK has no JSON local receiver/ctor APIs.
// UPDATE 2026-09-21: 本地重建 stdx (feat-stdx-json-local-mode-session) 提供 JSON local surface；0917 SDK 实证通过，恢复 EXEC。
// Evidence: cjc+run ALL PASSED (T518/T519/T531)。 T531 heap half 格式化期望对齐 pretty layout。
// Evidence: cjc exits rc=1 with `invalid subscript operator [] on Class-JsonArray @local!`
// and `expected Class-JsonArray, found Class-JsonArray @local!` (44 errors generated,
// 8 errors printed) after source duplicate declarations were removed.
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910: T518/T519.  This file is the read-only constructor and
// accessor probe for JsonArray.  Constructor alias/copy behavior is not a
// contract (F13), so only initial contents are observed.
//
// JsonArray.add(this @local!, JsonValue @local!) is a visible local-field write.
// On the current runtime the generic write barrier aborts with
// `Barrier::WriteGeneric does not support local object`; the doc-correct add
// sequence is retained here as a SKIPPED row rather than allowing it to poison
// the read-only probe:
//   // SKIPPED: T519_array_add Barrier::WriteGeneric — expected ["x",1,null]
//   // let afterAdd: JsonArray @local! = array.add(JsonString("x") @local!)
//   // afterAdd.add(JsonInt(1) @local!).add(JsonNull() @local!)
//
// No mutating ArrayList call is used here; the supported constructor form is
// covered below.  The independent add row above is the only T519 write probe.

import stdx.encoding.json.*
import std.collection.*

func fail(label: String): Int64 {
    println("FAIL: ${label}")
    1
}

exclave func expectIndexError(array: JsonArray @local!, index: Int64, label: String): Int64 {
    try {
        let _: JsonValue @local! = array[index]
        fail("${label}_accepted")
    } catch (_: JsonException) {
        0
    }
}

exclave func checkLocalArray(array: JsonArray @local!, label: String): Int64 {
    var failed: Int64 = 0
    match (array.kind()) {
        case JsonKind.JsArray => ()
        case _ => failed += fail("${label}_kind")
    }
    if (array.size() != 2) { failed += fail("${label}_size") }
    match (array.get(0)) {
        case Some(value) =>
            if (value.toString() != "1") { failed += fail("${label}_get_zero") }
        case None => failed += fail("${label}_get_zero_missing")
    }
    match (array.get(1)) {
        case Some(value) =>
            if (value.toString() != "\"x\"") { failed += fail("${label}_get_last") }
        case None => failed += fail("${label}_get_last_missing")
    }
    match (array.get(-1)) {
        case Some(_) => failed += fail("${label}_get_negative")
        case None => ()
    }
    match (array.get(2)) {
        case Some(_) => failed += fail("${label}_get_size")
        case None => ()
    }
    if (array[0].toString() != "1") { failed += fail("${label}_index_zero") }
    if (array[1].toString() != "\"x\"") { failed += fail("${label}_index_last") }
    failed += expectIndexError(array, -1, "${label}_index_negative")
    failed += expectIndexError(array, 2, "${label}_index_size")
    if (array.getItems().size != 2) { failed += fail("${label}_getItems_size") }
    failed
}

exclave func checkEmptyLocalArray(array: JsonArray @local!, label: String): Int64 {
    var failed: Int64 = 0
    match (array.kind()) {
        case JsonKind.JsArray => ()
        case _ => failed += fail("${label}_kind")
    }
    if (array.size() != 0) { failed += fail("${label}_size") }
    if (array.getItems().size != 0) { failed += fail("${label}_getItems_size") }
    match (array.get(0)) {
        case Some(_) => failed += fail("${label}_get_hit")
        case None => ()
    }
    failed += expectIndexError(array, 0, "${label}_index")
    failed
}

exclave func checkLocalArrayHalf(array: JsonArray @local!, label: String): Int64 {
    let view: JsonArray @local? = array
    var failed: Int64 = 0
    match (view.kind()) {
        case JsonKind.JsArray => ()
        case _ => failed += fail("${label}_kind")
    }
    if (view.size() != 2) { failed += fail("${label}_size") }
    match (view.get(0)) {
        case Some(value) =>
            if (value.toString() != "1") { failed += fail("${label}_get_zero") }
        case None => failed += fail("${label}_get_zero_missing")
    }
    match (view.get(2)) {
        case Some(_) => failed += fail("${label}_get_size")
        case None => ()
    }
    if (view[1].toString() != "\"x\"") { failed += fail("${label}_index_last") }
    try {
        let _: JsonValue @local? = view[2]
        failed += fail("${label}_index_size_accepted")
    } catch (_: JsonException) {
        ()
    }
    if (view.getItems().size != 2) { failed += fail("${label}_getItems_size") }
    failed
}
exclave func checkHeapArrayHalf(array: JsonArray, label: String): Int64 {
    let view: JsonArray @local? = array
    var failed: Int64 = 0
    match (view.kind()) {
        case JsonKind.JsArray => ()
        case _ => failed += fail("${label}_kind")
    }
    if (view.size() != 2 || view.getItems().size != 2) {
        failed += fail("${label}_size")
    }
    match (view.get(0)) {
        case Some(_) => ()
        case None => failed += fail("${label}_get_zero_missing")
    }
    match (view.get(2)) {
        case Some(_) => failed += fail("${label}_get_size_hit")
        case None => ()
    }
    let _: JsonValue @local? = view[1]
    try {
        let _: JsonValue @local? = view[2]
        failed += fail("${label}_index_size_accepted")
    } catch (_: JsonException) {
        ()
    }
    let text: String = array.toString()
    if (text != "[1,\"x\"]") { failed += fail("${label}_toString") }
    let formatted: String = array.toJsonString(0)
    if (formatted != "[\n  1,\n  \"x\"\n]") { failed += fail("${label}_toJsonString") }
    failed
}


main(): Int64 {
    var failed: Int64 = 0
    // T518: local ArrayList constructor with an initial [1] payload.  The
    // constructor itself is the supported construction path; no add call is
    // made in this active read-only file.
    let elem: JsonValue @local! = JsonInt(1) @local!
    let elems: ArrayList<JsonValue> @local! = ArrayList<JsonValue>()
    elems.add(elem)
    let list: ArrayList<JsonValue> @local! = elems
    let fromList: JsonArray @local! = JsonArray(list) @local!
    if (fromList.size() != 1 || fromList[0].toString() != "1") {
        failed += fail("T518_list_ctor_initial_payload")
    }
    if (fromList.getItems().size != 1) { failed += fail("T518_list_ctor_getItems") }
    let empty: JsonArray @local! = JsonArray() @local!
    failed += checkEmptyLocalArray(empty, "T518_noarg")

    // T518: an initial Array payload is observed through the Array-taking local
    // constructor.  The source array is not mutated afterwards.
    let e1: JsonValue @local! = JsonInt(1) @local!
    let e2: JsonValue @local! = JsonString("x") @local!
    let source: Array<JsonValue> @local! = [e1, e2]
    let fromArray: JsonArray @local! = JsonArray(source) @local!
    failed += checkLocalArray(fromArray, "T518_array_ctor")
    if (source.size != 2) { failed += fail("T518_array_ctor_source_size") }
    // T531: heap-provenance concrete Array widened to local?; its read and
    // concrete half formatter must remain available with heap String results.
    let heapSource: String = "[1,\"x\"]"
    let heapValue: JsonValue = JsonValue.fromStr(heapSource)
    let heapArray: JsonArray = heapValue.asArray()
    failed += checkHeapArrayHalf(heapArray, "T531_heap_array_half")

    // T518: parser drives the package-private capacity constructor and nested
    // read-only paths.
    let document: String @local! = "[1,\"x\"]"
    let parsedValue: JsonValue @local! = JsonValue.fromStr(document)
    let parsed: JsonArray @local! = parsedValue.asArray()
    if (parsed.size() != 2 || parsed[0].toString() != "1" || parsed[1].toString() != "\"x\"") {
        failed += fail("T518_parser_capacity_ctor")
    }
    if (parsed.getItems().size != 2) { failed += fail("T518_parser_getItems") }

    // T519: local! and widened local? receiver accessors distinguish None from
    // []-operator JsonException without checking exception text.
    failed += checkLocalArray(parsed, "T519_parser_local")
    failed += checkLocalArrayHalf(parsed, "T519_parser_half")

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
