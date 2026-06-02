// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @_CN7default4Base2f1HT1_ldE
// (CJNATIVE) ASSERT: scan define void @_CN7default4Base2f3HT2_ldCNY_1CEE

class C {}

open class Base {
    public func f1(a: (Int64, Float64)): Unit {
    }
    public func f3(a: (Int64, Float64, C)): Unit {
    }
}
