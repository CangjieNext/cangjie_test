/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not g)RUN-EXEC: %run %run_opt %output %run_args
// (g)RUN-EXEC-1: %run %run_opt %output %run_args 
func temp() {
    @When[!debug]
    func test() {
        return 2
    }

    @When[debug]
    func test() {
        return 3
    }
    return test()
}

main() {
    return temp() - 2
}
