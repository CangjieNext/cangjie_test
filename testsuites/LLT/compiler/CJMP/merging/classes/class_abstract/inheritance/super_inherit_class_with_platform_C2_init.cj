// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public open common class C1 {
    public let x: Int64 = 1
    public init() {}
}
public open common class C2 <: C1 {
    public let y : Int64 = 2
    public init() { 
        super() 
    }
}


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p  2>&1 | compare %f
// ASSERT: scan chir_class_uninitialized_field
package cmp

public open platform class C1 {
}

public open platform class C2<:C1{
    public let py:Int64 
    public init(i:Int64){
        super()
        py = i
        
    }
}

