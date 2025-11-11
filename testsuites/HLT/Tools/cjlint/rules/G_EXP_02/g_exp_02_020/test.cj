/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func temp(x: Float64) {
    var a : Float16 = 1.1
    match (x) {
        case 1.132145143213213213211321 where (a + 1.1212) < 2.3 => print("x = 1.1")
        case 1.132145143213213213211321 => print("x = 1.2")
        case 1.132145143213213213211321 => print("x = 1.3")
        case _ => print("0")
    }
    return 1
}

main(){

}

