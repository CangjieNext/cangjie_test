/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(): Int64 {
    var x = compute()
    x = 5
    return x
}

func compute(): Int64 {
    return 1
}

main() {
    println(f())
}
