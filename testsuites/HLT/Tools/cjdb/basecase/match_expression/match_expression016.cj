/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(UInt64,Int64)
    | Month(UInt64,Int64)
}

main() {
    let x = Year(2,3)
    let s = match (x) {
        case Year(2,3) => "1:OK"
        case Month(m,n) => "2:OK"
        case Year(_,_) => "3:OK"
        case Month(_,_) => "4:OK"
    }
    println(s)
}
