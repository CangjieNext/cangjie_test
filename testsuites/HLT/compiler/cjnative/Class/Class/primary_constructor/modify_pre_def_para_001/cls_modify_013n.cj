/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.sync.*

class A {
    A(
        var a!: Bool = true,
        var mtx!: ReentrantMutex = ReentrantMutex(),
        var b!: Unit = synchronized(mtx) {
            a = false
        }
    ) {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
