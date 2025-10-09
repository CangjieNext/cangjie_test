/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testInout

foreign func foo6(ptr: CPointer<Int64>,ptr2: CPointer<Int64>): Unit


func test22() {
    var a = 0
    var b = 4
    unsafe { 
        foo6(inout a,inout b)   
     }
}
