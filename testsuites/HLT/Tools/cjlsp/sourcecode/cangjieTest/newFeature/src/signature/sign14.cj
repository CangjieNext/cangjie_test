/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

class C1{
    C1(){}
    init(s:Bool) {}
    static func sf1(){}
    func sf2(x:Int64){}
}

func test14(){
    var e1 = C1.sf1()
    var e2 = C1().sf2(23)
    var e3 = C1(true).sf2(11)
}
