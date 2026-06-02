/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package frozen

class Rectangles {
    let width = 10
    //有诊断提示“xxx cannot be modified with '@Frozen’”，xxx根据被修饰元素的类型决定
    @Frozen
    let height: Int64
    
    init(h: Int64) {
        height = h
    }
}

func testcase30() {
    // test
    let rec = Rectangles(20)
    let l = rec.height
}
