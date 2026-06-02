macro package define

internal import std.ast.*

public macro TEST_ERROR(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input, "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_ERROR2(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input, "test diag report message.", "test diag report hint.")
    return input
}

let tkInDefineFile = cangjieLex("let a = 1")

public macro TEST_ERROR_FILEID(input: Tokens) {
    var tk = Tokens().append(Token(NL))
    diagReport(DiagReportLevel.ERROR, tk + tkInDefineFile, "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_AFTER_ERROR(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input, "test diag report message.", "test diag report hint.")
    println("Test code after report error.")
    return input
}

public macro TEST_ILLEGAL_ERROR(input: Tokens) {
    let tokens = Tokens()
    tokens.append(input[1])
    tokens.append(input[0])
    diagReport(DiagReportLevel.ERROR, tokens, "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_ERROR_SPLIT(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input[1..3], "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_ERROR_WITHOUT_MESSAGE(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input, "", "test diag report hint.")
    return input
}

public macro TEST_ERROR_WITHOUT_HINT(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input, "test diag report message.", "")
    return input
}

public macro TEST_WARNING(input: Tokens) {
    diagReport(DiagReportLevel.WARNING, input, "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_FILEID_ERROR(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, input.append(Token(NL)), "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_RANGE_ERROR(input: Tokens): Tokens {
    var temp = quote(










                                               public var b = 1
    )
    diagReport(ERROR, (temp + input), "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_ERROR_EMPTY(input: Tokens) {
    diagReport(DiagReportLevel.ERROR, Tokens(), "test diag report message.", "test diag report hint.")
    return input
}

public macro TEST_ERROR_EMPTY_WITH_ATTR(_: Tokens, input: Tokens) {
    diagReport(DiagReportLevel.ERROR, Tokens(), "test diag report message.", "test diag report hint.")
    return input
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
