/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Struct

struct RR9 {
    init(a: Int32) {}
    RR9(a: Int32, b!: Int32) {}
}
extend RR9 {
    func test() {}
}

var aab1 = RR9(1).test()
var aab3 = RR9(1, b: 2)
