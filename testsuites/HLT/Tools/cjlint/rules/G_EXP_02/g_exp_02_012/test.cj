import std.math.*

func isEqual(a: Float64, b: Float64): Bool {
    return abs(a - b) <= 1e-6
}
func compare(x: Float64) {
    if (isEqual(x, 3.14)) {
        print(1)
    } else {
        print(2)
    }
}
main() {
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
