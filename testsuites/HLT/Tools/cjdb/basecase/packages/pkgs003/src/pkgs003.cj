/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */






import {pkgs1, pkgs2}
import {pkgs1.funpkg1001 as f1, pkgs2.funpkg1001 as f2}

let test1: Int64 = pkgs1.varpkg1_001
let test2: Int64 = pkgs2.varpkg1_001

func run(): Int64 {
    var res1: Int64 = f1() //20
    var res2: Int64 = f2() //40
    if (  res1 + res2 ==  60) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
