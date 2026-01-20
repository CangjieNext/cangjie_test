/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let x = -1
var y = match {
    case x > 0 => print("x > 0")
    case x < 0 => print("x < 0")
    case _ => print("x = 0")
}

main() {
    let x = -1
    var a = match {
        case x > 0 => print("x > 0")
        case x < 0 => print("x < 0")
        case _ => print("x = 0")
    }
    0
}
