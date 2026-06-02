// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %dump-ast %cmp_opt %f -o %output
// EXEC: %cat trailing_desugar_pos_AST/8_mangle_ast.txt 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

func foo(a: ()->Unit): Unit {

}

main() {
    foo() {
        =>
    }
    foo {
        =>
    }
}

/* SCAN-IN
            CallExpr {
              curFile: trailing_desugar_pos.cj
              position: (1, 16, 5) (1, 18, 6)
*/
/* SCAN-IN
            CallExpr {
              curFile: trailing_desugar_pos.cj
              position: (1, 19, 5) (1, 21, 6)
*/
