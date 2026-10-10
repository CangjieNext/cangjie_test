/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo(): Unit {
    try {
        println("try")
    } catch (e: Exception) {
        println("catch")
    } finally {
        throw Exception("in finally")
    }
}

main() {
    foo()
}
