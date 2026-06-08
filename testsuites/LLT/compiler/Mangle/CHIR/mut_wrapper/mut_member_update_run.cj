// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: a generic mut default method must call through to concrete mut
// methods correctly and update struct fields after wrapper generation.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan count: 3

interface I {
    mut func add<T>(value: T): Unit {
        consume(value)
        setCount(getCount() + 1)
    }

    mut func setCount(value: Int64): Unit
    func getCount(): Int64
}

func consume<T>(_: T) {}

struct C <: I {
    var count = 0

    public mut func setCount(value: Int64): Unit {
        count = value
    }

    public func getCount(): Int64 {
        count
    }
}

main(): Int64 {
    var x = C()
    x.add<Int64>(1)
    x.add<String>("value")
    x.add<Bool>(true)
    println("count: ${x.getCount()}")
    return 0
}
