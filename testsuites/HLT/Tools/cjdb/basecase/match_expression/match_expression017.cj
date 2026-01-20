/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit<T> {
    | Year(T)
    | Month(T,T)
}

main() {
    let x = TimeUnit<Int64>.Year(2)
    let s = match (x) {
        case Year(2) => "1:OK"
        case Month(m,n) => "2:OK"
        case _ => "3:OK"
    }
    println(s)
}
