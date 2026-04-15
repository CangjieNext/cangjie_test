// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_macro %f 2>&1 | compare %f

package define

import std.ast.*

public macro testMacro(...) {}

/* SCAN-IN
macro declaration's parameter type must be 'Tokens'
*/
