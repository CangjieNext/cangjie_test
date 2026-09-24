/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

const func square(x: Int64, unused: Int64): Int64 {
    return x * x
}

main() {
    let r = square(2, 3)
    println(r)
}
