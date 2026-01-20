/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1{
    AB
    func test1() {
        let x = -1
        var a = match {
            case x > 0 => print("x > 0")
            case x < 0 => print("x < 0")
            case _ => print("x = 0")
        }
    }
    static func test2(){
        let score = 80
        var result:String = match{
            case score < 60 => "fail"
            case score < 70 => "pass"
            case score < 90 => "good"
            case _ => "excellent"
        }
    }
}

main() {
    var a = E1.AB
    var b = a.test1()
    var c = E1.test2()
    0
}
