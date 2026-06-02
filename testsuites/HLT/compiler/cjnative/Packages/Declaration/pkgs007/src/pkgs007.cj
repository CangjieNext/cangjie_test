/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %n.%middle 2>&1 | compare %f




public let one : Int32 = 1
public let two : Int32 = 2
public let pi : Float32 = 3.1415

package pkgs007
// ASSERT: scan parse_expected_decl
