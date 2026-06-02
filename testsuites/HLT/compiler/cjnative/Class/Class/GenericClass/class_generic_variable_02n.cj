/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



open class Base<T> {
    public var base: T
    public init(x: T){
        base = x
    }
}

class Data<T> <: Base<Int32> {
    public var a: Int32
    public var f: T
    public init(x: Int32){
        a = x
    }
    public init(){
        init(2)
        f = this.a  
    }

}

main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    return 0
}
// ASSERT: scan parse_expected_expr_or_decl_in
