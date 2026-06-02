// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let retToken = quote(
      public class A <K,V>  where K <: Hashable & Equatable<K> {}
    )

    let classDecl = parseDecl(retToken)
    let gen = classDecl.genericParam
    let typeParameters = gen.parameters

    for (token in typeParameters) {
        if (token.value != "K" && token.value != "V") {
            return 1
        }
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
