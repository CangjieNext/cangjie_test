// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan property setter of 'y' is deprecated since 1999. JUST BECAUSE))
// ASSERT: scan property 'x' is deprecated.
// ASSERT: scan property setter of 'x' is deprecated.

class Class {
    @Deprecated
    mut prop x: Bool {
        get() {
            false
        }
        @Deprecated
        set(_) {}
    }

    mut prop y: Bool {
        get() {
            false
        }
        @Deprecated["JUST BECAUSE))", since: "1999"]
        set(_) {}
    }
}

main(): Unit {
    Class().y = Class().x || Class().y

    let c = Class()
    c.x = true
}

