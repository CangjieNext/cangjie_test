/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testInout

struct Dataa2 {
    var n: Int32 = 0
}

struct AA2 {
    var data = Dataa2()
    var num:Int32 =0

}

foreign func foo12(ptr: CPointer<Int32>): Unit

func test12(){
    var n: Int32 = 0
    var data = Dataa2().n
    var a = AA2()
    unsafe {
        foo12(inout a.num)
        foo12(inout a.data.n) 
    }
}
