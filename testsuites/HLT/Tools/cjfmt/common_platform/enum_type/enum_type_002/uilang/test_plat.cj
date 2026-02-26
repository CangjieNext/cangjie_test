/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific enum E1{
    AB
    public specific func foo(): Unit {}
}
public specific enum E2<T>{
    AB | AB(T)
    public specific func foo2(): Unit {
        println("world")
    }
}

protected specific enum E3<T,R>{
    AB | AB(T,R)
    public specific func foo(): Unit {
        println("nihao")
    }
}
