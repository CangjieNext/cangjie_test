/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo<T>(para: T) {
    var a: T = para
    a
}

main(): Int64 {
    var x1: Bool = true
    var x2: Rune = r'f'
    var x3: String = "aaa"
    var x4: String = """
Hello,
    Cangjie Lang
"""
    var x5 = (true,false)
    var a1 = foo<Bool>(x1)
    var a2 = foo<Rune>(x2)
    var a3 = foo<String>(x3)
    var a4 = foo<String>(x4)
    var a5 = foo<(Bool,Bool)>(x5)
    return 0
}
