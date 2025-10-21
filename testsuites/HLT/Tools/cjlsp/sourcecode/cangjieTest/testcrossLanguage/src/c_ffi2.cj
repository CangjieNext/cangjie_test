/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
foreign func testfuncextern(i8a: Int8, i8b: Int8):Int8

public unsafe func newtestfunc2(i8a: Int8, i8b: Int8):Int8{
    return testfuncextern(i8a, i8b)
}

func test2(){
    unsafe{
        testfuncextern(3,5)
    }
}
