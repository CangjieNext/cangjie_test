// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    let clsDecl = parseDecl(
        quote(
            class Demo {
            func getThis(): This {
                this
            }
        }))

    var body = (clsDecl as ClassDecl).getOrThrow().body
    for (node in body.decls) {
        if (node is FuncDecl) {
            if (let Some(fd) <- (node as FuncDecl)) {
                var funcType = fd.declType
                if (funcType is ThisType) {
                    if ((funcType as ThisType).getOrThrow().keyword.value == "This") {
                        return 0
                    }
                }
            }
        }
    }

    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
