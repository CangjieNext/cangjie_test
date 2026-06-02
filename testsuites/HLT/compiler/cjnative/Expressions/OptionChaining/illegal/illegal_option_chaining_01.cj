/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
class A {
    public var b: Int64 = 1
}

func test() {
    let a: ?A = Some(A())
    a?.b
    a?.b?
    return 1
}

main(): Int64 {
    test()
    return 0
}
// ASSERT: scan parse_expected_character_after
