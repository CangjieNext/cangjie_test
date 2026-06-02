/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not arm) EXEC: %compiler %cmp_opt %f -o %output
// (not arm) RUN-EXEC: %run %run_opt %output %run_args


@When[backend == "cjnative" || arch != "aarch64"]
func test() {
    return 0
}

main() {
    return test()
}
