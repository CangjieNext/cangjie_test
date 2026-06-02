// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7default3fooHvEL_E
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7default3fooHvEL0_E
// (CJNATIVE) ASSERT: scan define internal i64 @_CN7default3fooHvE1cHvEL_E

@A[{
    =>
    (3, 4)[0]
}()]
func foo() {
    {
        => // 0          _CN7default3fooHvEL_E
        (3, 4)[0]
    }()
    {
        => // 1          _CN7default3fooHvEL0_E
        (3, 4)[0]
    }()
    func c() {
        {
            => // 0      _CN7default3fooHvE1cHvEL_E
            (3, 4)[0]
        }()
    }
    c()
}

@Annotation
public class A {
    public const A(let a: Int) {}
}
