/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package %f -o %output

import stdx.actors.*
import stdx.actors.macros.*

@Actor
class MyActor {
    private let x: Int64
    public let y: Int64
    init() {
        x = 0
        y = 1
    }

    init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}

main() {}
