/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro Context001(input: Tokens): Tokens {
    getChildMessages("cangjie")
    input
}

public macro Context002(input: Tokens): Tokens {
    setItem("cangjie", true)
    setItem("cangjie", 0)
    setItem("cangjie", "hello")
    setItem("cangjie", quote(let a = 1))
    assertParentContext("Context001")
    diagReport(DiagReportLevel.WARNING, input, "warnings", "---level0---")
    if (!insideParentContext("Context001")) {
        throw Exception("not in the Context001 Macro")
    }

    input
}
