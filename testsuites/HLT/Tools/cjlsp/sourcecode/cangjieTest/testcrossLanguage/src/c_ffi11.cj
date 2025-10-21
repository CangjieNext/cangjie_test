/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
enum testenum {
    | Var1(Int8)
    | Var2(CPointer<CString>)
    | Var3(UInt8)
}

foreign func testfuncpara2(): CPointer<CString>

unsafe func test11(): Int64 {
    var pstr = testenum.Var2(testfuncpara2())

    var res = match (pstr) {
        case Var2(x) => 0
        case _ => 1
    }

    return res
}
