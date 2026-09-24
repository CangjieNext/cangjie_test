/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func throwSensitive(): Unit {
    let password: String = "123456"
    if (password.size < 8) {
        throw Exception("password is too short")
    }
    println("ok")
}

main() {
    throwSensitive()
}
