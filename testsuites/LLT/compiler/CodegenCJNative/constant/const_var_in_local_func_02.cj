// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

main(){
    func func1() {
        const var1: String = "a"
    }

    while (false) {
        func func1() {
            const var1: String = ("a", 1)[0]
        }
    }
    return 0
}