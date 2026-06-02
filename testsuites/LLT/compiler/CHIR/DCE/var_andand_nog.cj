// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %compile_lib_opt 2>&1 | compare %f
// EXEC-PIPE: %compiler %f %compile_lib_opt -g 2>&1 | compare %f

func bar() {
    false
}

func handle() {
    let gitFlag = bar()
    let commitFlag = bar()

    if (gitFlag && commitFlag) {
        println(1)
    }
}

main() {}

// ASSERT: scan-not unused variable
