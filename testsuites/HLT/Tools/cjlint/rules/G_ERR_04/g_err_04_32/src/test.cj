/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo(): Int64 {
    try {
        return 1
    } catch (e: Exception) {
        return 2
    } finally {
        return 3
    }
}

main() {
    println(foo())
}
