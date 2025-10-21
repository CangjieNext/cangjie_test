/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

enum E1 {
    XY | XY(Array<String>)
}

func test7() {
    var c1 = E1.XY(["1: Invalid"])
    var c2 = XY(["dfff"])
}
