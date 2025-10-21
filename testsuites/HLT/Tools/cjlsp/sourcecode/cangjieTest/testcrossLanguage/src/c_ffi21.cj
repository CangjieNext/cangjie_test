/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
//CFun类型

foreign func testCFun(cb: CFunc<(Int32, Int32)->Int32>): Int32

@C
func add_i32(a: Int32, b: Int32): Int32 {
    var c: Int32 = a + b
    return a + b 
}

unsafe func test21():Int64 {
    if ( testCFun(add_i32) == -2147483648 ){
        return 0
    } else {
        return 1
    }
}
