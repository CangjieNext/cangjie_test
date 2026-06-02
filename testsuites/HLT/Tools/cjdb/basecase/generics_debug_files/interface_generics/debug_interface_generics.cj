/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import p2.*

// 调用泛型子类的override方法，override方法里显式调用父类方法
let top_c = CHC1<Int64>(20)
let topc_f = top_c.foo1(0)

main() {
    // 单类型泛型class实现两个泛型接口，调用其中一个接口的泛型方法
    let m_1 = C1<Int64>(19,11)
    m_1.foo1(0)

    // 继承泛型class的子泛型class继承另外一个泛型接口，调用重写的泛型方法
    let m_2 = CHC1<Int64>(20)
    m_2.foo1(0)

    // 继承泛型class的子泛型class继承另外一个泛型接口，调用新泛型接口的泛型方法
    let m_3 = CHC1<Int64>(21)
    m_3.foo3(0)

    // 继承同包不同文件泛型类的子泛型类继承另外本文件定义的泛型接口，调用父类的init方法
    let m_4 = C102_1<Int64>(22)

    // 继承同包不同文件泛型类的子泛型类继承另外本文件定义的泛型接口，调用重写的泛型方法
    m_4.foo1(0)

    // 继承同包不同文件泛型类的子泛型类继承另外本文件定义的泛型接口，调用父类的泛型方法
    m_4.foo2(0)

    // 继承同包不同文件泛型类的子泛型类继承另外本文件定义的泛型接口，调用本文件定义的泛型接口方法
    m_4.foo4(0)

    // 继承不同包文件泛型类及泛型接口的泛型子类，调用父类的init方法
    let m_5 = C201_1<Int64>(22)
    
    // 继承不同包文件泛型类及泛型接口的泛型子类，调用重写的泛型方法
    m_5.foo1(0)

    // 继承不同包文件泛型类及泛型接口的泛型子类，调用不同包接口定义的泛型方法
    m_5.foo3(0)

    // 单类型泛型struct实现一个泛型接口，调用接口的泛型方法
    let m_struct = R1<Int64>(20,30)
    m_struct.foo1(0)

    // 单类型泛型enum实现一个泛型接口，调用接口的泛型方法
    let m_enum = TimeUnit1<Int64>.Year(2020)
    m_enum.foo1(0)

    return 0
}




