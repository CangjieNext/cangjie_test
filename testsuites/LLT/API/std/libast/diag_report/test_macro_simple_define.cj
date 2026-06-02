macro package macro_define

import std.ast.Tokens
import std.ast.diagReport
import std.ast.DiagReportLevel

public macro M(input: Tokens) {
    diagReport(ERROR, input, "this is error 0", "error 1")
    return input
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
