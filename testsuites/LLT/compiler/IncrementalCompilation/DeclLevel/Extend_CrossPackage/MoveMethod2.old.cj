package inc

public interface I1 {}
public interface I2 {}

main() {

}

public class A {}
extend A <: I1 {
    public func arm2() {}
}

extend A <: I2 {
    public func foo() {}

    public func arm1() {}
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
