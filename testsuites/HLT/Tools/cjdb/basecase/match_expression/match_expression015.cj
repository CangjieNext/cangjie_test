/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(UInt64)
    | Month(UInt64)
}

main() {
    let x = Year(2)
    let s = match (x) {
        case Year(5) => "1:OK"
        case Month(m) => "2:OK"
        case Year(0) | Year(1) | Month(_) => "3:OK"
        case Year(_) => "4:OK"
    }
    println(s)
}
