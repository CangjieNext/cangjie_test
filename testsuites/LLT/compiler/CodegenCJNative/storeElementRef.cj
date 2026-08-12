// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan this.name=101

class Inner {
    var name: Int64
    init(name: Int64) { this.name = name }
    func greet(): Unit { println("this.name=${this.name}") }
}

struct GenericStruct<T> {
    var inner: Inner
    var data: T

    init(inner: Inner, data: T) {
        this.inner = inner
        this.data = data
    }

    func timeLoopOnce() {
        var f = { => this.inner.greet() }
        doMeasure(f) 
    }
}

func doMeasure(f: () -> Unit) { f() }

main() {
    let gs = GenericStruct<Int64>(Inner(101), 42)
    gs.timeLoopOnce()
    return 0
}