/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: mod
// (not iOS) EXEC: %compiler  %cmp_macro mod/define_macro.cj 
// (not iOS) EXEC: %compiler %cmp_opt  %f -o %output

macro package test

public import mod.define_macro.*

@M
main() {
    return 0
}
