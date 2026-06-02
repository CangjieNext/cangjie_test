// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

public open class Base<T> {
    public open func test<K>() {}
}

public class Derived<T> <: Base<T> {
    public override func test<K>() {
        super.test<K>()
    }
}

main() {
    let o: Base<String> = Derived<String>()
    o.test<String>()
}
