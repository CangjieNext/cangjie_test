/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 0 1 2 3 4 5 6
import stdx.encoding.json.*

main() {
    var jv01: JsonValue = JsonNull()
    var jv02: JsonValue = JsonBool(true)
    var jv03: JsonValue = JsonInt(250)
    var jv04: JsonValue = JsonFloat(250.250)
    var jv05: JsonValue = JsonString("test JsonString!")
    var jv06: JsonValue = JsonArray()
    var jv07: JsonValue = JsonObject()
    judgeKind(jv01.kind())
    judgeKind(jv02.kind())
    judgeKind(jv03.kind())
    judgeKind(jv04.kind())
    judgeKind(jv05.kind())
    judgeKind(jv06.kind())
    judgeKind(jv07.kind())
    0
}

func judgeKind(jk: JsonKind) {
    match (jk) {
        case JsNull => print("0 ")
        case JsBool => print("1 ")
        case JsInt => print("2 ")
        case JsFloat => print("3 ")
        case JsString => print("4 ")
        case JsArray => print("5 ")
        case JsObject => print("6 ")
    }
}
