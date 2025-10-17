/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    try {
        let packageHeader = PackageHeader()
        packageHeader.accessible = Token(INTERNAL)
        packageHeader.keywordM = quote(macro)[0]
        packageHeader.keywordP = Token(PACKAGE)
        packageHeader.orgName = Token(IDENTIFIER, "orgA")
        packageHeader.orgSeparator = Token(DOUBLE_COLON)
        packageHeader.prefixPaths = quote(pkgA subB)
        packageHeader.prefixDots = quote(.)
        packageHeader.packageIdentifier = Token(IDENTIFIER, "package")
        packageHeader.toTokens().dump()
        println(packageHeader.toTokens().size)
        packageHeader.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    println("cnt = ${cnt}")
    return 0
}
