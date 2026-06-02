// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package types

internal import stdx.encoding.json.*
internal import std.collection.*

public class NestedInteger {
    private var integer: Int64
    private var list: ArrayList<NestedInteger>
    private var is_integer: Bool

    public init() {
        integer = 0
        is_integer = false
        list = ArrayList<NestedInteger>()
    }
    public init(val: Int64) {
        integer = val
        is_integer = true
        list = ArrayList<NestedInteger>()
    }

    public func isInteger(): Bool {
        return is_integer
    }

    public func getInteger(): Int64 {
        return integer
    }

    public func setInteger(i: Int64) {
        integer = i
        is_integer = true
    }

    public func getList(): ArrayList<NestedInteger> {
        return list
    }

    public func add(ni: NestedInteger) {
        list.add(ni)
        is_integer = false
    }
}

public func json_value_to_nested_integer(jv: JsonValue): NestedInteger {
    var root: NestedInteger
    try {
        root = NestedInteger(jv.asInt().getValue())
    } catch (e: JsonException) {
        let arr = jv.asArray().getItems()
        let ni = NestedInteger()
        for (i in arr) {
            ni.add(json_value_to_nested_integer(i))
        }
        root = ni
    }
    return root
}
