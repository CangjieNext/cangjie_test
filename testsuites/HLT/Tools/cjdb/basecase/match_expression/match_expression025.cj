/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum E1{
    AB | CD
}

main() {
    let tv = (E1.AB, E1.CD)
    let s = match (tv) {
        case (AB, CD) => "matched"
        case (Alice, age) => "old"
        case (_, _) => "someone"
    }
    println(s)
}
