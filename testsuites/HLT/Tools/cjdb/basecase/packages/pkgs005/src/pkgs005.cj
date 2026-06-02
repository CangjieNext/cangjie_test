/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */






import pkgs2.*

let test1: Int64 = varpkg1
let test2: Int64 = varpkg2

func run(): Int64 {
    var res1: Int64 = funpkg1() //20
    var res2: Int64 = funpkg2() //40
    if (  res1 + res2 ==  60) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}



