/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation

func foo30(): Unit {
    func add(a: Int32, b: Int32) {
        a + b
    }
    let c = 1
    func nest(): Unit {
        print("${c}")
        var b = add(1, 2)
    }
}
