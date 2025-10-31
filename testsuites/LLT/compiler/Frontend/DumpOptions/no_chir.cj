// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo

func foo() {}

// LEVEL: 0
// (Linux) EXEC: %rmdir ./output && %mkdir ./output
// (Linux) EXEC-1: %frontendCompiler %f --dump-all %output_dir_opt output
// (Linux) EXEC: test -f "./output/demo_AST/0_parse_ast.txt"
// (Linux) EXEC-1: test -f "./output/demo_CHIR/0_AST_CHIR.chirtxt"
// (Linux) EXEC-1: test -d "./output/demo_IR"

// DEPENDENCE: expected_ast.txt
// (Linux) EXEC: %rmdir ./output && %mkdir ./output
// (Linux) EXEC-PIPE-1: %compiler %f --dump-ast --dump-to-screen %output_dir_opt output 2>&1 | compare expected_ast.txt
