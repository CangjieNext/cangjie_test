/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Struct

struct Test1 {
    init(a: Int32) {}
    Test1(a: Int64, b!: Int32 = 1) {}
}

func test4() {
    var a: Int32 = 1
    var x1 = Test1(a)
    var x2: Test1 = Test1(1)
    
}
