/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import define.*

struct A {
    public var a: Int64
    //private let b : Int64 = 1
    //static let c : Int64 = 1
    public init(input: Int32) {
        a = Int64(input)
    }
    //private init(){init(Int32(1))}
    //static func x(){}
    //private func y(){}
    //public func z(){}
    //func test(){}
    //operator func +(a:A,b:A){0}
}

main() {
    //A(Int32(1))
    return 0
}
