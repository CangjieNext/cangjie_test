/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output















main(): Int64 {
    case01()
    case02()
    case03()
    A().case01()
    A().case02()
    A().case03()
    C().case01()
    C().case02()
    C().case03()
    E().case01()
    E().case02()
    E().case03()
    return 0
}

func case01():()->Int64
func case02()
func case03(){}

abstract class A {
    public func case01():()->Int64
    public func case02()
    public func case03(){}
}

interface B {
    func case01():()->Int64
    func case02()
    func case03(){}
}

class E implements B{}

struct C {
    public func case01():()->Int64
    public func case02()
    public func case03(){}
}
// ASSERT: scan parse_missing_body
// ASSERT: scan parse_abstract_func_must_have_return_type
// ASSERT: scan parse_expected_lt_brace
