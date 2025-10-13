package inc

public class A {}
public interface IA {}
public interface IB {}
extend A <: IA & IB {
    public func foo(): Int64 {
        0
    }
}
main(): Unit {

}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
