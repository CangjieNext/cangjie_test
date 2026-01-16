/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common enum E1{
    AB
    public common func foo(): Unit
}
public common enum E2<T>{
    AB | AB(T)
    public common func foo(): Unit {
        println("hello")
    }
    public common func foo2(): Unit
}

protected common enum E3<T,R>{
    AB | AB(T,R)
    public common func foo(): Unit
}
