/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





import pkgs.varpkg1_001
import pkgs.funpkg1001 as f1

let test: Int8 = varpkg1_001
 var test1: Int8 = 1

func funpkg1001(): Int8 {
    var a: Int8 = 20
    var b: Int8 = 20
    return a + b
}

func run(): Int64 {
    var res1: Int8 = varpkg1_001
    var res2: Int8 = f1()
    var res3: Int8 = funpkg1001()
    if (  res3 >= res2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    var res11: Int8 = varpkg1_001
    var res22: Int8 = f1()
    var res33: Int8 = 10
    return run()
}
