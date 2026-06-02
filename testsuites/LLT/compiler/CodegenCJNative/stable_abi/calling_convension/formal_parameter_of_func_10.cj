// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default2CA4foo1Hv(%TypeInfo* %outerTI, %TypeInfo* %thisTI)
// (CJNATIVE) ASSERT: scan define i64 @_CN7default2I14foo2Hv(%TypeInfo* %outerTI, %TypeInfo* %thisTI)
// (CJNATIVE) ASSERT: scan define i64 @_CN7default2CA7caller1Hv(i8 addrspace(1)* %this, %TypeInfo* %outerTI)
// (CJNATIVE) ASSERT: scan define i64 @_CN7default7caller2IG_Hv(%TypeInfo* %ti.T)

interface I1 {
    static func foo1(): Int64
    static func foo2(): Int64 {
        foo1()
    }
}

open class CA <: I1 {
    public static func foo1(): Int64 {
        5
    }
    public open func caller1(): Int64 {
        let res = foo2()
        0
    }
}

func caller2<T>() where T <: I1 {
    let res = T.foo2()
    0
}
