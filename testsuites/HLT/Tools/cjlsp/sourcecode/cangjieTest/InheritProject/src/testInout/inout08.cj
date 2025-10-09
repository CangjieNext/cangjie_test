/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testInout

@C
struct Data {
    var a: Int32 = 0
    var b: Int32 = 0
}

foreign func ProcessData(d: Data): Data

var aa = Data()

func test11(){
    unsafe{
        ProcessData(inout aa)
    }
}
