// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c
// ASSERT: scan parse_common_function_must_have_return_type
package cmp

class GeneralClass {}

common enum A {
    | TEST_ENUM

    common func testFunc(): GeneralClass {
        GeneralClass()
    }
}

