// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

public class CA<T> {
    public func foo(x: T, y: T) {
        var k = Option<T>.Some(x)
        match (k) {
            case Some(n) => n
            case _ => y
        }
    }
}

main() {
    var ins = CA<Int64>()
    ins.foo(8, 10) - 8
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
