// (not Windows)EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// (not Windows)RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Unit {
    var content = quote(
foreign func set_callback(a:Int32, cb:CFunc<(Int32) -> Unit>) :Unit

main(){
	0
})
    let program = parseProgram(content)
    print(program.toTokens().toString())
}
/* SCAN-IN
foreign func set_callback(a: Int32, cb: CFunc <(Int32) -> Unit >): Unit
main() {
    0
}*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
