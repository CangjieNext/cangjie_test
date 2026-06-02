// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

func test(a!: Int8 = 100 + 100): Int8 {
    return a
}

main() {
    var res = Int64(test() - 127)
    print("success")
    return res
}

// LEVEL: 0
// (Linux) EXEC: %rmdir ./output && %mkdir ./output
// (Linux) EXEC: %frontendCompiler %f --dump-all %output_dir_opt output %diag_json 2>&1 | compare %f
// (Linux) ASSERT: scan chir_arithmetic_operator_overflow
// (Linux) EXEC: test -f "./output/demo_AST/0_parse_ast.txt"
// (Linux) EXEC: test -f "./output/demo_CHIR/0_AST_CHIR.chirtxt"
// (Linux) EXEC-1: test -d "./output/demo_IR"