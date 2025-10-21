/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

struct SS {
    let data: Float32
    let size: Int32
    init(data: Float32, size: Int32) {
        this.data = data
        this.size = size
    }
    init(a:Int32){
        this.data = 1.0
        this.size = a
    }
}

func ff31(input0: SS, input1: SS){}

func test31() {
    let input0 = SS(1.0, 1)
    let letinput1 = SS(2.0, 1)
    let g1 = ff31(input0,letinput1)
}
