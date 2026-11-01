/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface Greet
{
    func hi(): String
}

extend String <: Greet
{
    public func hi(): String
    {
        "hi"
    }
}

func trail(): Int64 {
    return 1 }

func lc(n: Int64): Int64 { // check n
    return n
}

func dw(): Int64 {
    var n = 0
    do {
        n = n + 1
    }while (n < 2)
    return n
}

func sp(): Int64   {
    return 7
}

func oneline(n: Int64): Int64 {
    if (n > 0) { return 1 }
    return 0
}

func chain(n: Int64): Int64
{
    if (n > 40)
    {
        return 1
    }
    else if (n > 30)
    {
        return 2
    }
    else if (n > 20)
    {
        return 3
    }
    else if (n > 10)
    {
        return 4
    }
    else
    {
        return 5
    }
}

main() {
    println("abc".hi())
    println(trail())
    println(lc(2))
    println(dw())
    println(sp())
    println(oneline(5))
    println(chain(25))
}
