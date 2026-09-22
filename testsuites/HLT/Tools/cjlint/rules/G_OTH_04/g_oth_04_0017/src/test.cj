/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func getPassword(): String {
    return "secret"
}

func foo() {
    let password: String = getPassword()
    println(password.size)
}

main() {
    foo()
}
