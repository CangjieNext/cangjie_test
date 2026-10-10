/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(flag: Bool): Int64 {
    var temp = 0
    if (flag) {
        temp = 1
        return temp
    }
    return 0
}

main() {
    println(f(true))
}
