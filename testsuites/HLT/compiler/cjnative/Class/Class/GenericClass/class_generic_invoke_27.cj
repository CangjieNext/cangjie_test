/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




open class Base{
    public var a: Int32 = 3
}

class Data<T> <: Base{
    public var a: Int32 = 2
    public var b: Int32
    public init(){
        b = 5
    }
    public init(x: T){
        init()
        super 
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(45)
    var res1: Int32 = data.a
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_expr_or_decl_in
