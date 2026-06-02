// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan class cannot be modified with '@Frozen'
// ASSERT: scan variable cannot be modified with '@Frozen'
// ASSERT: scan struct cannot be modified with '@Frozen'
// ASSERT: scan variable cannot be modified with '@Frozen'
// ASSERT: scan enum cannot be modified with '@Frozen'
// ASSERT: scan interface cannot be modified with '@Frozen'
// ASSERT: scan extend cannot be modified with '@Frozen'

@Frozen
class TestClass {
    @Frozen
    public var a = 1
}

@Frozen
struct TestStruct {
    @Frozen
    public var a = 1
}

@Frozen
enum TestEnum {
    | ENUM1
    | ENUM2
}

@Frozen
interface TestInterface {}

@Frozen
extend TestClass {}

main() {}
