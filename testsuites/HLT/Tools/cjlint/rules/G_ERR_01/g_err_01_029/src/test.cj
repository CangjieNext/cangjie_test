/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func divide(a: Int64, b: Int64): Int64 {
    try {
        return a / b
    } catch (e: Exception) {
    }
    return 0
}

main() {
    println(divide(6, 2))
}
