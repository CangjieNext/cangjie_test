// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan Hello B!

open class A <: Exception {
    public open func me() {
        print("Hello A!")
    }
}

class B <: A {
    public override func me() {
        print("Hello B!")
    }
}

class C <: A {
    public override func me() {
        print("Hello C!")
    }
}

main() {
    try {
        throw B()
    } catch (a: B | C) {
        a.me();
        return 0
    } finally {}
    return 1
}
