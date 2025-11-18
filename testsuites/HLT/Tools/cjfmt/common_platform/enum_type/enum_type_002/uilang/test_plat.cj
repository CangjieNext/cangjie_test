/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform enum E1{
    AB
    public platform func foo(): Unit {}
}
public platform enum E2<T>{
    AB | AB(T)
    public platform func foo2(): Unit {
        println("world")
    }
}

protected platform enum E3<T,R>{
    AB | AB(T,R)
    public platform func foo(): Unit {
        println("nihao")
    }
}
