/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt %f

macro package test

@When[TEST == "true"]
import std.ast.*

@When[TEST == "true"]
public macro M(a: Tokens) {
    a
}

@When[TEST == "true"]
main() {
    return 0
}
