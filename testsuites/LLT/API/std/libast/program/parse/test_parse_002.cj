// (not Windows)EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// (not Windows)RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    var seed = quote(
        internal import std.ast.*
        internal import cangjie_try.*

        public func t() {
        }

        main(){
        }
    )
    let program = parseProgram(seed)
    print(program.toTokens())
}

/* SCAN-IN
internal import std.ast.*
internal import cangjie_try.*
public func t() {
}
main() {
}
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
