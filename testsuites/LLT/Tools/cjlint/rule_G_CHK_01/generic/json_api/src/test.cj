// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import stdx.encoding.json.*
internal import stdx.net.http.*
internal import std.console.*
internal import std.collection.*
var cond = true
func jsonStringTest<T>() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var json = JsonString(v0)
    var jv: JsonValue = JsonValue.fromStr(v0)
    var v1 = json.getValue()
    var v2 = json.toString()
    var v3 = json.toJsonString()
    if (cond) {
        return v1
    } else if (cond) {
        return v2
    } else if (cond) {
        return v3
    } else {
        return jv.toString()
    }
}

func jsonArrayTest<T>() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var j1 = JsonString(v0)
    var j2 = JsonString("123")
    var v1 : Array<JsonValue> = [j1, j2]
    var json = JsonArray(v1)
    var v2 : Array<JsonValue> = [j1]
    json.add(v2[0])
    var v3 = json.get(2).getOrThrow()
    var v4 = json.getItems()
    if (cond) {
        return v3.toString()
    } else if (cond) {
        return v4[1].toString()
    } else {
        return v1[0].toJsonString()
    }
}

func jsonObjTest<T>() : String {
    var v0 = Console.stdIn.readln().getOrThrow()
    var jv: JsonValue = JsonValue.fromStr(v0)
    var arr: Array<(String, JsonValue)> = [("123", jv)]
    var mp: HashMap<String, JsonValue> = HashMap<String, JsonValue>(arr)
    var jo: JsonObject = JsonObject(mp)
    jo.put("134", jv)
    if (cond) {
        return jo.containsKey("123").toString()
    } else if (cond) {
        return jo.get("123").getOrThrow().toString()
    } else {
        return jo.getFields().toString()
    }
}

main() {}