/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func logAll(tag: String, items: Array<Int64>): Unit {
    println(tag)
    for (i in items) {
        println(i)
    }
}

func logErr(tag: String, items: Array<Int64>): Unit {
    logAll(tag)
}

main() {
    logAll("a", 1, 2)
    logErr("b", 3, 4)
}
