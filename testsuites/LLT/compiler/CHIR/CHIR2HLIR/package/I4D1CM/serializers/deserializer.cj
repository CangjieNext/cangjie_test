// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package serializers

internal import std.convert.*
internal import std.convert.*
internal import stdx.encoding.json.*
internal import std.io.*
internal import std.collection.*
internal import types.*
internal import types.LinkedListNode as TLinkedListNode

public func deserialize_int64(str: String): Int64 {
    if (str.get(0).getOrThrow() == UInt8(UInt32(r'-'))) {
        return -(Int64.tryParse(str[1..]).getOrThrow())
    }
    return Int64.tryParse(str).getOrThrow()
}

public func deserialize_float64(str: String): Float64 {
    return Float64.tryParse(str).getOrThrow()
}

public func deserialize_bool(str: String): Bool {
    return Bool.tryParse(str).getOrThrow()
}

public func deserialize_string(str: String): String {
    return JsonValue.fromStr("[${str}]").asArray().getItems().get(0).getOrThrow().asString().getValue()
}

public func deserialize_char(str: String): Rune {
    let byte = JsonValue
        .fromStr("[${str}]")
        .asArray()
        .getItems()
        .get(0)
        .getOrThrow()
        .asString()
        .getValue()
        .get(0)
        .getOrThrow()
    return Rune(UInt32(byte))
}

func json_value_to_int64_list(jv: JsonValue): ArrayList<Int64> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<Int64>(arr.size)
    for (i in 0..arr.size) {
        res.add(arr.get(i).getOrThrow().asInt().getValue())
    }
    return res
}

func json_value_to_int64_array(jv: JsonValue): Array<Int64> {
    let arr = jv.asArray().getItems()
    let res = Array<Int64>(arr.size, {i => 0})
    for (i in 0..arr.size) {
        res[i] = arr.get(i).getOrThrow().asInt().getValue()
    }
    return res
}

public func deserialize_int64_list(str: String): ArrayList<Int64> {
    return json_value_to_int64_list(JsonValue.fromStr(str))
}

public func deserialize_int64_2d_list(str: String): ArrayList<ArrayList<Int64>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<Int64>>(arr.size)
    for (i in 0..arr.size) {
        res.add(json_value_to_int64_list(arr.get(i).getOrThrow()))
    }
    return res
}

public func deserialize_int64_array(str: String): Array<Int64> {
    return json_value_to_int64_array(JsonValue.fromStr(str))
}

public func deserialize_int64_2d_array(str: String): Array<Array<Int64>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = Array<Array<Int64>>(arr.size, {i => Array<Int64>()})
    for (i in 0..arr.size) {
        res[i] = json_value_to_int64_array(arr.get(i).getOrThrow())
    }
    return res
}

func json_value_to_float64_list(jv: JsonValue): ArrayList<Float64> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<Float64>(arr.size)
    for (i in 0..arr.size) {
        res.add(arr.get(i).getOrThrow().asFloat().getValue())
    }
    return res
}

func json_value_to_float64_array(jv: JsonValue): Array<Float64> {
    let arr = jv.asArray().getItems()
    let res = Array<Float64>(arr.size, {i => 0.0})
    for (i in 0..arr.size) {
        res[i] = arr.get(i).getOrThrow().asFloat().getValue()
    }
    return res
}

public func deserialize_float64_list(str: String): ArrayList<Float64> {
    return json_value_to_float64_list(JsonValue.fromStr(str))
}

public func deserialize_float64_2d_list(str: String): ArrayList<ArrayList<Float64>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<Float64>>(arr.size)
    for (i in 0..arr.size) {
        res.add(json_value_to_float64_list(arr.get(i).getOrThrow()))
    }
    return res
}

public func deserialize_float64_array(str: String): Array<Float64> {
    return json_value_to_float64_array(JsonValue.fromStr(str))
}

public func deserialize_float64_2d_array(str: String): Array<Array<Float64>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = Array<Array<Float64>>(arr.size, {i => Array<Float64>()})
    for (i in 0..arr.size) {
        res[i] = json_value_to_float64_array(arr.get(i).getOrThrow())
    }
    return res
}

public func deserialize_bool_list(str: String): ArrayList<Bool> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<Bool>(arr.size)
    for (i in 0..arr.size) {
        res.add(arr.get(i).getOrThrow().asBool().getValue())
    }
    return res
}

public func deserialize_bool_array(str: String): Array<Bool> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = Array<Bool>(arr.size, {i => false})
    for (i in 0..arr.size) {
        res[i] = arr.get(i).getOrThrow().asBool().getValue()
    }
    return res
}

func json_value_to_string_list(jv: JsonValue): ArrayList<String> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<String>(arr.size)
    for (i in 0..arr.size) {
        res.add(arr.get(i).getOrThrow().asString().getValue())
    }
    return res
}

func json_value_to_string_array(jv: JsonValue): Array<String> {
    let arr = jv.asArray().getItems()
    let res = Array<String>(arr.size, {i => ""})
    for (i in 0..arr.size) {
        res[i] = arr.get(i).getOrThrow().asString().getValue()
    }
    return res
}

public func deserialize_string_list(str: String): ArrayList<String> {
    return json_value_to_string_list(JsonValue.fromStr(str))
}

public func deserialize_string_2d_list(str: String): ArrayList<ArrayList<String>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<String>>(arr.size)
    for (i in 0..arr.size) {
        res.add(json_value_to_string_list(arr.get(i).getOrThrow()))
    }
    return res
}

public func deserialize_string_array(str: String): Array<String> {
    return json_value_to_string_array(JsonValue.fromStr(str))
}

public func deserialize_string_2d_array(str: String): Array<Array<String>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = Array<Array<String>>(arr.size, {i => Array<String>()})
    for (i in 0..arr.size) {
        res[i] = json_value_to_string_array(arr.get(i).getOrThrow())
    }
    return res
}

func json_value_to_char_list(jv: JsonValue): ArrayList<Rune> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<Rune>(arr.size)
    for (i in 0..arr.size) {
        let byte = arr.get(i).getOrThrow().asString().getValue().get(0).getOrThrow()
        res.add(Rune(UInt32(byte)))
    }
    return res
}

func json_value_to_char_array(jv: JsonValue): Array<Rune> {
    let arr = jv.asArray().getItems()
    let res = Array<Rune>(arr.size, {i => r'\0'})
    for (i in 0..arr.size) {
        let byte = arr.get(i).getOrThrow().asString().getValue().get(0).getOrThrow()
        res[i] = Rune(UInt32(byte))
    }
    return res
}

public func deserialize_char_list(str: String): ArrayList<Rune> {
    return json_value_to_char_list(JsonValue.fromStr(str))
}

public func deserialize_char_2d_list(str: String): ArrayList<ArrayList<Rune>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<Rune>>(arr.size)
    for (i in 0..arr.size) {
        res.add(json_value_to_char_list(arr.get(i).getOrThrow()))
    }
    return res
}

public func deserialize_char_array(str: String): Array<Rune> {
    return json_value_to_char_array(JsonValue.fromStr(str))
}

public func deserialize_char_2d_array(str: String): Array<Array<Rune>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = Array<Array<Rune>>(arr.size, {i => Array<Rune>()})
    for (i in 0..arr.size) {
        res[i] = json_value_to_char_array(arr.get(i).getOrThrow())
    }
    return res
}

public func deserialize_listnode(str: String): ?TLinkedListNode {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    return array_to_listnode(arr)
}

func json_value_to_listnode_list(jv: JsonValue): ArrayList<?TLinkedListNode> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<?TLinkedListNode>(arr.size)
    for (i in arr) {
        res.add(array_to_listnode(i.asArray().getItems()))
    }
    return res
}

func json_value_to_listnode_array(jv: JsonValue): Array<?TLinkedListNode> {
    return json_value_to_listnode_list(jv).toArray()
}

public func deserialize_listnode_list(str: String): ArrayList<?TLinkedListNode> {
    return json_value_to_listnode_list(JsonValue.fromStr(str))
}

public func deserialize_listnode_2d_list(str: String): ArrayList<ArrayList<?TLinkedListNode>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<?TLinkedListNode>>(arr.size)
    for (i in arr) {
        res.add(json_value_to_listnode_list(i))
    }
    return res
}

public func deserialize_listnode_array(str: String): Array<?TLinkedListNode> {
    return json_value_to_listnode_array(JsonValue.fromStr(str))
}

public func deserialize_listnode_2d_array(str: String): Array<Array<?TLinkedListNode>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<Array<?TLinkedListNode>>(arr.size)
    for (i in arr) {
        res.add(json_value_to_listnode_array(i))
    }
    return res.toArray()
}

public func deserialize_TreeNodeSer(str: String): ?TreeNodeSer {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    return array_to_TreeNodeSer(arr)
}

func json_value_to_TreeNodeSer_list(jv: JsonValue): ArrayList<?TreeNodeSer> {
    let arr = jv.asArray().getItems()
    let res = ArrayList<?TreeNodeSer>(arr.size)
    for (i in arr) {
        res.add(array_to_TreeNodeSer(i.asArray().getItems()))
    }
    return res
}

func json_value_to_TreeNodeSer_array(jv: JsonValue): Array<?TreeNodeSer> {
    return json_value_to_TreeNodeSer_list(jv).toArray()
}

public func deserialize_TreeNodeSer_list(str: String): ArrayList<?TreeNodeSer> {
    return json_value_to_TreeNodeSer_list(JsonValue.fromStr(str))
}

public func deserialize_TreeNodeSer_2d_list(str: String): ArrayList<ArrayList<?TreeNodeSer>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<ArrayList<?TreeNodeSer>>(arr.size)
    for (i in arr) {
        res.add(json_value_to_TreeNodeSer_list(i))
    }
    return res
}

public func deserialize_TreeNodeSer_array(str: String): Array<?TreeNodeSer> {
    return json_value_to_TreeNodeSer_array(JsonValue.fromStr(str))
}

public func deserialize_TreeNodeSer_2d_array(str: String): Array<Array<?TreeNodeSer>> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<Array<?TreeNodeSer>>(arr.size)
    for (i in arr) {
        res.add(json_value_to_TreeNodeSer_array(i))
    }
    return res.toArray()
}

public func deserialize_nested_integer(str: String): NestedInteger {
    return json_value_to_nested_integer(JsonValue.fromStr(str))
}

public func deserialize_nested_integer_list(str: String): ArrayList<NestedInteger> {
    let arr = JsonValue.fromStr(str).asArray().getItems()
    let res = ArrayList<NestedInteger>(arr.size)
    for (i in arr) {
        res.add(json_value_to_nested_integer(i))
    }
    return res
}

public func deserialize_nested_integer_array(str: String): Array<NestedInteger> {
    return deserialize_nested_integer_list(str).toArray()
}
