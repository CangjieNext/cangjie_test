// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(): Int64 {
    var result = match (80) {
        case 60 => "pass"
        case 70 | 80 => return 0
        case _ => "other"
        //ABC
    }
    var a: Bool = true
    var i: Int64 = 1
    var opt: Option<Bool> = Option<Bool>.None
    var res: Bool = match (opt) {
        case Some(x) => true
        case None => false
    }
    var y: Int64 = match (i) {
        case _ where (res) => i
        case _ => throw NoneValueException()
    }
    return 1
}

main(): Int64 {
    let i = 2
    match {
        case i > 0 => println("i>0")
        case i < 0 => println("i<0")
        case _ => println("i==0")
    }
    return test()
}
