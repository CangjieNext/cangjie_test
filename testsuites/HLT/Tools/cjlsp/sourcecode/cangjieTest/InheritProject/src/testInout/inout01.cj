/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testInout


foreign func foo1(ptr: CPointer<Int32>): Unit

func test1(){
    var n:Int32 = 8
    unsafe{
        foo1(inout n)
    }
}
