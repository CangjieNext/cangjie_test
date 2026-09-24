/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func repeatCall(times: Int64, action: (Int64) -> Unit): Unit {
    for (i in 0..times) {
        action(i)
    }
}

main() {
    repeatCall(3) { item: Int64 => println("hi") }
}
