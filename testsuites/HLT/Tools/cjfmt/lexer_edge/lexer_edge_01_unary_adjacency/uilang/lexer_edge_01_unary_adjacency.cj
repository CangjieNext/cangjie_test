/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func adjacent(a: Int64, b: Int64): Int64 {
    let r1=a- -b
    var n=5
    n++
    n--
    let flag=!  !(a>0) && n>0
    if (flag) {
        return r1+n
    }
    return 0
}

main() {
    println(adjacent(1, 2))
}
