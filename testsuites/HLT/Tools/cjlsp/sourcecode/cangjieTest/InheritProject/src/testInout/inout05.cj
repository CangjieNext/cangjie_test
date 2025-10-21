/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testInout


@C
func foo5(ptr: CPointer<Float32>): Unit {
    let n = unsafe { ptr.read() }
    println("*ptr = ${n}")
}

struct SS{
    var num:Float32 = 1.0
}
func test06(){
    var aa = SS().num
    unsafe {
        foo5(inout aa)
    }
}
