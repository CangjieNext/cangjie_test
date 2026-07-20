// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime extension type coverage pass

class BaseData {
    var count: Int64

    init(count: Int64) {
        this.count = count
    }
}

class Holder {
    var data: BaseData
    var tag: String

    init(data: BaseData, tag: String) {
        this.data = data
        this.tag = tag
    }
}

extend BaseData {
    public func increment(delta: Int64): Int64 {
        count += delta
        count
    }

    public func describe(): String {
        "BaseData(count=${count})"
    }

    public func reset(): BaseData {
        count = 0
        this
    }
}

extend Holder {
    public func taggedValue(): String {
        "${tag}: ${data.describe()}"
    }

    public func updateTag(newTag: String): Holder {
        tag = newTag
        this
    }
}

func testBasicExtension(): Bool {
    let d = BaseData(10)
    let result = d.increment(5)
    result == 15
}

func testExtensionChain(): Bool {
    let d = BaseData(0)
    d.increment(1)
    d.increment(2)
    d.increment(3)
    d.count == 6
}

func testExtensionOnHolder(): Bool {
    let d = BaseData(42)
    let h = Holder(d, "test")
    let tagged = h.taggedValue()
    tagged.contains("42")
}

func testResetAndRetag(): Bool {
    let d = BaseData(100)
    let h = Holder(d, "original")
    let resetData = d.reset()
    let retagged = h.updateTag("updated")
    resetData.count == 0 && retagged.tag == "updated"
}

main(): Int64 {
    if (!testBasicExtension()) {
        return 1
    }
    if (!testExtensionChain()) {
        return 2
    }
    if (!testExtensionOnHolder()) {
        return 3
    }
    if (!testResetAndRetag()) {
        return 4
    }
    println("runtime extension type coverage pass")
    0
}
