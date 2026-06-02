// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default3addHllCNY_1CIlE
// (CJNATIVE) ASSERT: scan define i64 @_CPI7default3addHllCNY_1CIlEE1aHv
// (CJNATIVE) ASSERT: scan define i64 @_CPI7default3addHllCNY_1CIlEE1bHl
// (CJNATIVE) ASSERT: scan @_CPI7default3addHllCNY_1CIlEE1cHll

class C<T> {}

func add(a!: Int64 = 1, b!: Int64 = 1, c!: C<Int64> = C<Int64>()): Int64 {
    return a + b
}
