/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let grandTotal = 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 +
    777 + 777 + 777 + 777 + 777 + 777 + 777 + 777

func boundaries(): Int64 {
    let edge120 = 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777
    let edge121abcd = 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 + 777 +
        777
    return edge120 + edge121abcd
}

main() {
    println(boundaries())
}
