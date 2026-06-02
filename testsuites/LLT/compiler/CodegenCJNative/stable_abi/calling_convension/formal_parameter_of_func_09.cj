// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default2SAIG_E3fooIG0_G1_Hl(i64 %x, %TypeInfo* %ti.T1, %TypeInfo* %ti.T2, %TypeInfo* %outerTI, %TypeInfo* %thisTI)

struct SA<T> {
    SA(let x: T) {}
    static func foo<T1, T2>(x: Int64): Int64 {
        0
    }
}
