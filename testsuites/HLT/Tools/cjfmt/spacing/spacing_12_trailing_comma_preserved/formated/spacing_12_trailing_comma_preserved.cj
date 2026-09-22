/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func combiner(a: Int64, b: Int64): Int64 {
    return a + b
}

func use(): Unit {
    var thing = combiner(10, 20,)
    println(thing)
}

main() {
    use()
}
