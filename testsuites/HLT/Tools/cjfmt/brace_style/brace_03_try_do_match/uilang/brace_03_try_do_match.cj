/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func risky(n: Int64): Int64
{
    try
    {
        if (n < 0)
        {
            throw Exception("neg")
        }
        return n
    }
    catch (e: Exception)
    {
        return 0
    }
    finally
    {
        println("done")
    }
}

func spin(): Int64
{
    var n = 0
    do
    {
        n = n + 1
    }
    while (n < 3)
    return n
}

func pick(op: Int64): Int64
{
    match (op)
    {
        case 0 =>
            10
        case _ =>
            20
    }
}

main()
{
    println(risky(5))
    println(spin())
    println(pick(1))
}
