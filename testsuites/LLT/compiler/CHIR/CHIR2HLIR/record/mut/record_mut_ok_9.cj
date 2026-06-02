// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan 37 42 42\n
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

struct R {
    public var x = 37

    public func get() {
        return x
    }
    public mut func set(a: Int64) {
        x = a
    }
}

main() {
    var r = R()
    let v1 = r.get() // 37
    r.set(42)
    let v2 = r.get() // 42
    let v3 = r.x // 42
    print("${v1} ${v2} ${v3}\n")
}
