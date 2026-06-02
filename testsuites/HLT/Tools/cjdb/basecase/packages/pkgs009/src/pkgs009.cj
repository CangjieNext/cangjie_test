/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import pkgs.fun001

func fun001(a:Int8, b:Int8): Int8 {
    return a + b
}

main() {
    var res1: Int8 = fun001()
    var res2: Int8 = fun001(20, 20)

    var res3: Int8 = fun001(10, 10)
}






