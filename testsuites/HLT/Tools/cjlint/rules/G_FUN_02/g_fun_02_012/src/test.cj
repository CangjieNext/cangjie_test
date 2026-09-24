/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Counter {
    var count = 0
    mut func add(step: Int64, extra: Int64): Unit {
        count += step
    }
}

main() {
    var c = Counter()
    c.add(1, 2)
    println(c.count)
}
