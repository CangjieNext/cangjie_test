// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    r1.reserve(5)
    r2.reserve(14)
    r3.reserve(13)
    r4.reserve(3)
    r5.reserve(11)
    if(r1.capacity()!=16)//计算之后不超过16
    {
        return 1
    }
    if(r2.capacity()!=32)//超过16
    {
        return 2
    }
    if(r3.capacity()!=16)//计算之后等于16
    {
        return 3
    }
    if(r4.capacity()!=16)//初始化设置容量，加容量
    {
        return 4
    }
    if(r5.capacity()!=16)//初始化设置容量，加容量,计算之后不超过16
    {
        return 5
    }
     print("success1\n")
    return 0
}