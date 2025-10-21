/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

struct C2{
    C2(){}
    init(s:Bool) {}
    static func sf1(){}
    func sf2(x:Int64){}
    mut func sf3(x:Int64){}
}

func test15(){
    var e1 = C2.sf1()
    var e2 = C2().sf2(23)
}

