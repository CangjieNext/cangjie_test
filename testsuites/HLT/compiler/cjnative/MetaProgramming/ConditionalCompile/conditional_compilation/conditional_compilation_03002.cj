/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not g)ERRCHECK: %compiler %cmp_opt %f -o %output
// (not g) ASSERT: scan sema_undeclared_identifier
// (g)EXEC: %compiler %cmp_opt %f -o %output
// (g)RUN-EXEC: %run %run_opt %output %run_args 

@When[debug]
func test() {
    return 0
}

main() {
    return test()
}
