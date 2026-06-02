/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import pkgs.*

var top_C = C1(5, 6)

class C2 <: MyInterface {
    public func f(): Unit {
        return
    }
}

main() {
    var newc = C1(100, 200)
    var main_c_area: Int32 = newc.area()
    var mian_time = newc.time
    var main_Rect = newc.newRectangle1
    var main_re_area = newc.c_area

    var newit = C2().f()

    return 1
}



