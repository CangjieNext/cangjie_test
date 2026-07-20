// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime interface default coverage pass

interface Describable {
    func describe(): String
}

interface Countable {
    func countItems(): Int64
    func isEmpty(): Bool {
        countItems() == 0
    }
}

interface Tagged {
    func getTag(): String
    func displayTag(): String {
        let tag = getTag()
        "[${tag}]"
    }
}

class Item <: Describable & Countable & Tagged {
    let name: String
    var items: Int64

    init(name: String, items: Int64) {
        this.name = name
        this.items = items
    }

    public func describe(): String {
        name
    }

    public func countItems(): Int64 {
        items
    }

    public func getTag(): String {
        "item-${name}"
    }
}

class EmptyItem <: Describable {
    init() {}

    public func describe(): String {
        "empty"
    }
}

func testInterfaceBasic(): Bool {
    let item = Item("test", 0)
    item.describe() == "test"
}

func testInterfaceDefaultMethod(): Bool {
    let empty = Item("empty", 0)
    if (!empty.isEmpty()) {
        return false
    }
    let full = Item("full", 5)
    if (full.isEmpty()) {
        return false
    }
    true
}

func testInterfaceMultipleDefaults(): Bool {
    let item = Item("display", 10)
    let tag = item.displayTag()
    tag == "[item-display]"
}

func testPolymorphicCall(): Bool {
    let item = Item("poly", 3)
    let d: Describable = item
    let c: Countable = item
    let t: Tagged = item
    d.describe() == "poly" && c.countItems() == 3 && t.getTag() == "item-poly"
}

func testSimpleInterface(): Bool {
    let e = EmptyItem()
    e.describe() == "empty"
}

main(): Int64 {
    if (!testInterfaceBasic()) {
        return 1
    }
    if (!testInterfaceDefaultMethod()) {
        return 2
    }
    if (!testInterfaceMultipleDefaults()) {
        return 3
    }
    if (!testPolymorphicCall()) {
        return 4
    }
    if (!testSimpleInterface()) {
        return 5
    }
    println("runtime interface default coverage pass")
    return 0
}
