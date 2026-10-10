/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

func isEqual(a: Float64, b: Float64): Bool {
    return abs(a - b) <= 1e-6
}

main() {
    println(isEqual(0.1 + 0.2, 0.3))
}
