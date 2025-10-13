package inc

public open class A {}
public interface I2 {}
extend A <: I2 {
    public prop k: Int64 {
        get() {
            2
        }
    }
}

main() {
    let b = B()
    b.k
}

public class B <: A {}
public interface I1 {
    prop k: Int64 {
        get() {
            1
        }
    }
}
extend B <: I1 {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
