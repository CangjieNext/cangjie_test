// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan overridden setter 'set' should be marked with @Deprecated

open class A {
    public mut open prop y: Bool {
        get() {
            false
        }
        @Deprecated
        set(_) {}
    }
}

class C <: A {
    public mut override prop y: Bool {
        get() {
            false
        }
        set(_) {}
    }
}

open class AA {
    public mut open prop Y: Bool {
        get() {
            false
        }
        @Deprecated[strict: true]
        set(_) {}
    }
}

class CC <: AA {
    public mut override prop Y: Bool {
        get() {
            false
        }
        set(_) {}
    }
}

main() {}

