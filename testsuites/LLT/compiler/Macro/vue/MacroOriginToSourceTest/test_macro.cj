// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public macro view(input: Tokens) : Tokens {
    let a = A()
    let b = b()
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    return token
}

public macro view(input: Tokens) : Tokens {
    input
}

public macro test(input: Tokens) : Tokens {
    let token = cangjieLex("var c:Int64 = 3")
    token.dump()
    let a = true ? 1 : 2
    return quote(
        $token
        $(token)
        $(x+1)
        main(): Int64 {
           var c = 1 + 3
        }
    )
}