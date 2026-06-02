// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample0

/*
- class/struct读写成员变量，只需要考虑实例成员变量
- 成员变量的可变性let/var均需要覆盖
- 实例的类型需要带有类型形参，且类型形参的个数需要1个及以上，可以先采用3个
- 必须保证至少存在一个泛型的实例成员变量，使得实例size不确定
 */
public struct S0<T> {
    public let v: T
    public init(v: T) {
        this.v = v
    }
}

public struct S1<T> {
    public let v: S0<T>
    public init(v: S0<T>) {
        this.v = v
    }
}

public struct S2<T> {
    public let v: S1<T>
    public init(v: S1<T>) {
        this.v = v
    }
}

public struct S3<T> {
    public let v: S2<T>
    public init(v: S2<T>) {
        this.v = v
    }
}

// 需要存在复杂，多次的struct/class读写实例成员变量的操作
// 读/写需要穿插进行
// struct/class必须是泛型的，且拥有泛型实例成员变量，目的是使得实例的size不确定
// 写：t1.v = xxx
// 读：xxx = t1.v
public func test<T>(x: S3<T>) {
    let t0 = x.v
    let t1 = t0.v
    let t2 = t1.v
    let t3 = t2.v
    t3
}

main(): Unit {
    println("pass")
}
