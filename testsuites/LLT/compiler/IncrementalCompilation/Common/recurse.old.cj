func goo() {2}

func test() {
    11
}

func foo() {
    test() + 3
}

main() : Int64 {
    foo()
}

interface IK {
    func zoo(): Int64
}

extend Int64 <: IK {
    public func zoo(): Int64 {
        this+test()
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
