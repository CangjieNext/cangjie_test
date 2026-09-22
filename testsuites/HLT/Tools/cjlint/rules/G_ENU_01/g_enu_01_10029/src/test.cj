/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(Int64)
    | Month(Int64, Int64)
}

class MyYear {
    let a: Int64
    init(a: Int64) {
        this.a = a
    }
}

main() {
    let y1 = Year(100)
    let y2 = MyYear(100)
    println(y2.a)
    let _ = y1
}
