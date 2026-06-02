/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



interface A{
    let a : Int64 = 1
    static func test():Int64{1}
}

class X <: A{
    public let a : Int64 = 2
    public static func test():Int64{2}
}

abstract class Y <: A{
    public let a : Int64 = 3
    public static func test():Int64{2}
}


main(){
    if (X.a != 2) { 
        return 2
    }
    if (Y.a != 3) { 
        return 3
    }
    if (X.test() != 2) {
        return 4
    }
    if (Y.test() != 3) {
        return 5
    }
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
