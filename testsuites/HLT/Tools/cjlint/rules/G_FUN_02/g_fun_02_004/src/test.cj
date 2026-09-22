/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Config {
    func load(path: String, encoding!: String = "utf-8"): Int64 {
        println(path)
        println(encoding)
        return 0
    }
}

func transform(data: Int64, _: String): Int64 {
    return data
}

main() {
    let c = Config()
    c.load("a.conf")
    let n = transform(1, "x")
    println(n)
}
