/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan Primary constructor is required for Shrink deriving
// ASSERT: scan CNoConstructor
// ASSERT: scan SNoConstructor

// ASSERT: scan Primary constructor parameter 'a' has to be field for Shrink deriving
// ASSERT: scan Primary constructor parameter 'b' has to be field for Shrink deriving
// ASSERT: scan Primary constructor parameter 'c' has to be field for Shrink deriving
// ASSERT: scan-not Primary constructor parameter 'd' has to be field for Shrink deriving

import std.deriving.*
import std.unittest.prop_test.*

@Derive[std.unittest.prop_test.Shrink]
class CNoConstructor {}

@Derive[std.unittest.prop_test.Shrink]
struct SNoConstructor {}

@Derive[std.unittest.prop_test.Shrink]
struct SNoField {
    SNoField(a: Int64) {}
}

@Derive[std.unittest.prop_test.Shrink]
struct CNoFields {
    CNoFields(b: Int64, c: Int64, var d: Int64) {}
}

main() {}
