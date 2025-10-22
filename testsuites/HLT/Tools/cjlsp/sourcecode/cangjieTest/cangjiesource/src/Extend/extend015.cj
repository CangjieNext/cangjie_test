/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Extend

class CC2 {
    var v = 0
    private var b = ""
}

extend CC2 {
    static func ff() {}
    func ff1() {
        print(this.v)
        print(v)
    }
}
