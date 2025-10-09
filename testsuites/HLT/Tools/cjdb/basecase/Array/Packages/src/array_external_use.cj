/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import pkgs.*




main() {
    var main_str: String = top_str
    var arraymainrec01 : Array<String> =[main_str]

    var arraymainrec02 : Array<Int8> = arrayTopInt8

    var mian_time = TimeUnit.Year(100)
    var arraymainrec03 : Array<TimeUnit> = [mian_time]

    var newRectangle1 = Rectangle_ex(100, 200)
    var array01 : Array<Rectangle_ex> = [newRectangle1]

    var newc = C1(100, 200)
    var arraytoprec01 : Array<C1> = [newc]


    return 1
}


