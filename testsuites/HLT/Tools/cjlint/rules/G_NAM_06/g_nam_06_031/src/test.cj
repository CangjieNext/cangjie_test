/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class MyMap<key, val> {
    var k: key
    var v: val
    init(k: key, v: val) {
        this.k = k
        this.v = v
    }
}

main() {
    let m = MyMap<String, Int64>("a", 1)
    println(m.k)
}
