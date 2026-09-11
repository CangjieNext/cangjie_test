/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// SKIP-COMPILE: LM-DOC-20260910 prescribed SDK has no JSON local receiver APIs.
// Evidence: cjc exits rc=1 with `invalid subscript operator [] on Class-JsonObject @local!`
// and `expected Class-JsonObject, found Class-JsonObject @local!` (45 errors generated,
// 8 errors printed).
// DISABLED-EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// DISABLED-EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910: T520/T522/T523.  Read-only JsonObject construction and
// lookup are active here.  HashMap alias/copy behavior and duplicate-key
// ordering are intentionally not asserted (F12/F13/F14).
//
// The local `put` overload writes a generic local-object field.  The current
// runtime aborts with Barrier::WriteGeneric; its doc-correct rows stay isolated
// as SKIPPED controls so they cannot mask read behavior:
//   // SKIPPED: T522_object_put_local_key Barrier::WriteGeneric — expected size 2
//   // let key: String @local! = "local"
//   // object.put(key, JsonInt(1) @local!)
//   // let halfKey: String @local? = "half"
//   // object.put(halfKey, JsonInt(2) @local!)

import stdx.encoding.json.*
import std.collection.*

func fail(label: String): Int64 {
    println("FAIL: ${label}")
    1
}

func expectIndexError(object: JsonObject @local!, label: String): Int64 {
    try {
        let _: JsonValue @local! = object["missing"]
        fail("${label}_accepted")
    } catch (_: JsonException) {
        0
    }
}

exclave func checkLocalObject(object: JsonObject @local!, label: String): Int64 {
    var failed: Int64 = 0
    match (object.kind()) {
        case JsonKind.JsObject => ()
        case _ => failed += fail("${label}_kind")
    }
    if (object.size() != 2) { failed += fail("${label}_size") }
    if (!object.containsKey("n") || !object.containsKey("x") || object.containsKey("missing")) {
        failed += fail("${label}_contains")
    }
    match (object.get("n")) {
        case Some(value) =>
            match (value.kind()) {
                case JsonKind.JsNull => ()
                case _ => failed += fail("${label}_null_kind")
            }
        case None => failed += fail("${label}_null_missing")
    }
    match (object.get("x")) {
        case Some(value) =>
            if (value.toString() != "1") { failed += fail("${label}_get_x") }
        case None => failed += fail("${label}_x_missing")
    }
    match (object.get("missing")) {
        case Some(_) => failed += fail("${label}_get_missing_hit")
        case None => ()
    }
    if (object["x"].toString() != "1") { failed += fail("${label}_index_x") }
    failed += expectIndexError(object, "${label}_index_missing")
    if (object.getFields().size != 2) { failed += fail("${label}_getFields_size") }
    failed
}

exclave func checkLocalObjectHalf(object: JsonObject @local!, label: String): Int64 {
    let view: JsonObject @local? = object
    var failed: Int64 = 0
    match (view.kind()) {
        case JsonKind.JsObject => ()
        case _ => failed += fail("${label}_kind")
    }
    if (view.size() != 2) { failed += fail("${label}_size") }
    if (!view.containsKey("n") || !view.containsKey("x") || view.containsKey("missing")) {
        failed += fail("${label}_contains")
    }
    match (view.get("n")) {
        case Some(value) =>
            match (value.kind()) {
                case JsonKind.JsNull => ()
                case _ => failed += fail("${label}_null_kind")
            }
        case None => failed += fail("${label}_null_missing")
    }
    match (view.get("missing")) {
        case Some(_) => failed += fail("${label}_get_missing_hit")
        case None => ()
    }
    if (view["x"].toString() != "1") { failed += fail("${label}_index_x") }
    try {
        let _: JsonValue @local? = view["missing"]
        failed += fail("${label}_index_missing_accepted")
    } catch (_: JsonException) {
        ()
    }
    if (view.getFields().size != 2) { failed += fail("${label}_getFields_size") }
    failed
}

exclave func checkHeapObjectHalf(object: JsonObject, label: String): Int64 {
    let view: JsonObject @local? = object
    var failed: Int64 = 0
    match (view.kind()) {
        case JsonKind.JsObject => ()
        case _ => failed += fail("${label}_kind")
    }
    if (view.size() != 2 || view.getFields().size != 2) {
        failed += fail("${label}_size")
    }
    if (!view.containsKey("n") || !view.containsKey("x") || view.containsKey("missing")) {
        failed += fail("${label}_contains")
    }
    match (view.get("n")) {
        case Some(value) =>
            match (value.kind()) {
                case JsonKind.JsNull => ()
                case _ => failed += fail("${label}_null_kind")
            }
        case None => failed += fail("${label}_null_missing")
    }
    match (view.get("missing")) {
        case Some(_) => failed += fail("${label}_get_missing_hit")
        case None => ()
    }
    let _: JsonValue @local? = view["x"]
    try {
        let _: JsonValue @local? = view["missing"]
        failed += fail("${label}_index_missing_accepted")
    } catch (_: JsonException) {
        ()
    }
    let compact: String = view.toString()
    let compactRoundTrip: JsonObject = JsonValue.fromStr(compact).asObject()
    if (compactRoundTrip.size() != 2 || !compactRoundTrip.containsKey("n") ||
        !compactRoundTrip.containsKey("x")) {
        failed += fail("${label}_toString_shape")
    }
    let pretty: String = view.toJsonString()
    let prettyRoundTrip: JsonObject = JsonValue.fromStr(pretty).asObject()
    if (prettyRoundTrip.size() != 2 || !prettyRoundTrip.containsKey("n") ||
        !prettyRoundTrip.containsKey("x")) {
        failed += fail("${label}_toJsonString_shape")
    }
    failed
}

main(): Int64 {
    var failed: Int64 = 0

    // T520: map-taking local constructor with the documented initial
    // "a":1 and "中":"值" payload.  No post-construction map mutation is used.
    let initialFields: HashMap<String, JsonValue> @local! = HashMap<String, JsonValue>(
        [("a", JsonInt(1) @local!), ("中", JsonString("值") @local!)]) @local!
    let initial: JsonObject @local! = JsonObject(initialFields) @local!
    if (initial.size() != 2 || initial.getFields().size != 2) {
        failed += fail("T520_map_ctor_initial_size")
    }
    if (!initial.containsKey("a") || !initial.containsKey("中") ||
        initial.containsKey("missing")) {
        failed += fail("T520_map_ctor_initial_contains")
    }
    if (initial["a"].asInt().getValue() != 1) {
        failed += fail("T520_map_ctor_initial_int")
    }
    if (initial["中"].asString().getValue() != "值") {
        failed += fail("T520_map_ctor_initial_string")
    }
    match (initial.get("missing")) {
        case Some(_) => failed += fail("T520_map_ctor_missing_some")
        case None => ()
    }
    failed += expectIndexError(initial, "T520_map_ctor_missing_index")

    // T520: heap no-argument control and parser-driven local capacity ctor.
    let heapObject = JsonObject()
    if (heapObject.size() != 0) { failed += fail("T520_heap_noarg_size") }
    let source: String @local! = "{\"n\":null,\"x\":1}"
    let value: JsonValue @local! = JsonValue.fromStr(source)
    let object: JsonObject @local! = value.asObject()
    failed += checkLocalObject(object, "T520_parser_object")
    failed += checkLocalObjectHalf(object, "T520_parser_object_half")

    // T523 explicitly distinguishes missing keys from an explicit JsonNull.
    // T531: heap-provenance concrete Object widened to local?; concrete
    // half-mode formatter results are heap Strings and are reparsed by shape.
    let heapSource: String = "{\"n\":null,\"x\":1}"
    let heapValue: JsonValue = JsonValue.fromStr(heapSource)
    let heapObjectSource: JsonObject = heapValue.asObject()
    failed += checkHeapObjectHalf(heapObjectSource, "T531_heap_object_half")
    match (object.get("n")) {
        case Some(nullValue) =>
            if (nullValue.toString() != "null") { failed += fail("T523_explicit_null") }
        case None => failed += fail("T523_explicit_null_missing")
    }
    match (object.get("missing")) {
        case Some(_) => failed += fail("T523_missing_some")
        case None => ()
    }
    if (object["x"].asInt().getValue() != 1) { failed += fail("T523_index_value") }

    // T522 mutation remains a doc-correct, independently runnable blocked row;
    // no local-object write occurs in this executable read probe.

    if (failed > 0) {
        println("${failed} test(s) FAILED")
        return 1
    }
    println("ALL PASSED")
    return 0
}
