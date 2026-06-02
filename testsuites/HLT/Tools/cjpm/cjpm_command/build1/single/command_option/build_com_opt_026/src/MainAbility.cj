/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

foreign func testfunc(cb: CFunc<(Int16, Int16) -> Int16>): Int16

foreign func testfunc1(cb: CFunc<(Int16, Int16) -> Int16>): Int16

var add_i16: CFunc<(Int16, Int16) -> Int16> = {a: Int16, b: Int16 => return a + b}

unsafe main(): Int64 {
    if ((testfunc(add_i16) == -3) && (testfunc1(add_i16) == 3)) {
        print("pass\n")
    } else {
        print("fail\n")
    }
    return 0
}
