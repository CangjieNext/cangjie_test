// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let retToken = quote(
      public class A <K,V>  where K <: Hashable & Equatable<K> {}
    )

    var classDecl = (parseDecl(retToken) as ClassDecl).getOrThrow()
    var constraints = classDecl.genericConstraint
    var ret = constraints[0].upperBounds

    for (i in 0..ret.size) {
        match (ret[i] as RefType) {
            case Some(v) =>
                var a = v.identifier.value
                if (a != "Hashable" && a != "Equatable") {
                    return 1
                }
            case None => return 2
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
