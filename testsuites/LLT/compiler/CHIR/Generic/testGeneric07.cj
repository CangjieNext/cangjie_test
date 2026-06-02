// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

public interface ListenerInternal {
    func supplyValue(value: Int64): Unit
}

public class ValueListenerImpl<T> <: ListenerInternal {
    public override func supplyValue(value: Int64): Unit {
        var a = 1
    }
}

class A {
    func foo(a: ListenerInternal) {
        a.supplyValue(1)
    }
}

main() {
    0
}
