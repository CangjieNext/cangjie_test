/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_30004.cj main_30004.cj
// EXEC: %compiler define_30004.cj %macro_opt -o define_30004.%test_suffix
// ERRCHECK: %compiler %f %macro_opt -L. -l:define_30004.%test_suffix -o use.%test_suffix


// ASSERT: scan macro's call and definition can not in one package

macro package use

import std.ast.*
import define_30004.*

public macro Y(input: Tokens): Tokens {
    return @Y(1)
}
// ASSERT: regex-not no position error occurred
