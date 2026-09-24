/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let addAll = {
    base: Int64, bonus: Int64 =>
        base + bonus
}

class Box
{
    private var v: Int64 = 0
    public mut prop value: Int64
    {
        get()
        {
            return v
        }
        set(p)
        {
            v = p
        }
    }
}

func unsafeBlock(): Int64
{
    var r = 0
    unsafe
    {
        r = 42
    }
    return r
}

main()
{
    println(addAll(3, 4))
    let b = Box()
    b.value = 9
    println(b.value)
    println(unsafeBlock())
}
