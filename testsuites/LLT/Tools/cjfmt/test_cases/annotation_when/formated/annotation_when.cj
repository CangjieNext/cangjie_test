// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %conditional_compilation_config_opt="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@When[test == "true"]
public enum A<T> {
    i

    prop a: Int64 {
        get() {
            0
        }
    }
}

@When[test == "true"]
main() {
    A<Int64>.i.a
}

@When[test != "true"]
main() {
    1
}
