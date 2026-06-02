/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year
    | Month
}

enum E1<T>{
    AB(T)
}

main() {
    let tv = (Year, E1<Int64>.AB(6))
    let s = match (tv) {
        case (Year, E1<Int64>.AB(6)) => "matched"
        case (_, _) => "d"
    }
    println(s)
}
