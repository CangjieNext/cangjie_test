// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan overridden property 'a' should be marked with @Deprecated

open class A {
    @Deprecated
    public open prop a: Bool {
        get() {
            true
        }
    }
}

class C <: A {
    public override prop a: Bool {
        get() {
            true
        }
    }
}

open class AA {
    @Deprecated[strict: true]
    public mut open prop a: Bool {
        get() {
            true
        }
        set(_) {}
    }
}

class CC <: AA {
    public mut override prop a: Bool {
        get() {
            true
        }
        set(_) {}
    }
}

main() {}


