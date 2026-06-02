// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan redefined property 'y' should be marked with @Deprecated

open class A {
    @Deprecated
    public mut static prop y: Bool {
        get() {
            false
        }
        set(_) {}
    }
}

class C <: A {
    public mut static redef prop y: Bool {
        get() {
            false
        }
        set(_) {}
    }
}

open class AA {
    @Deprecated[strict: true]
    public static prop Y: Bool {
        get() {
            false
        }
    }
}

class CC <: AA {
    public static redef prop Y: Bool {
        get() {
            false
        }
    }
}

main() {}


