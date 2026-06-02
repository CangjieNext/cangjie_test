/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %conditional_compilation_config_opt="TEST=true" %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    func test(): Int64
}

@When[TEST == "true"]
class X <: I {
    public func test() {
        0
    }
}

@When[TEST == "true"]
main() {
    return X().test()
}
