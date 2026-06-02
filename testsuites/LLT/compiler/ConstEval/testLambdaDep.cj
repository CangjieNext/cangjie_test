// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: depLambda.cj
// (DEBUG_OPTION)EXEC: %compiler %compile_lib_opt depLambda.cj -o depLambda.%middle
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt depLambda.%middle %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_two_plus_three` with initializer constant(s).
// (CJNATIVE and DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_local_add_three` of 3 expressions to one of 3 expressions.
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_local_two_plus_three` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests constant evaluation with lambdas from dependencies.

internal import lambda.*

const two_plus_three = add_three(2)
const local_add_three = add_three
const local_two_plus_three = local_add_three(2)

main() {}
