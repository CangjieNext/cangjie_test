public interface PrintAble {
    static func test():Int64 {
        1
    }
}

public open class Parent <: PrintAble {
    public redef static func test():Int64 {
        2
    }
}

public class Child <: Parent {
    public redef static func test():Int64 {
        3
    }
}

public func test2<T>() where T <: PrintAble {
    T.test()
}

main():Int64 {
    test2<Child>()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
