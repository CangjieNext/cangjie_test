/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import define.*

@A[]
class Rectangle {
    let name: String

    private Rectangle(name: String, var desc: String, let width: Int64, let height!: Int64 = 1) {
        this.name = name
    }
}

main() {
    println("works!")
    return 0
}

// ASSERT: scan description: private, token_id: 119, token_literal_value: private, fileID: 1, line: 12, column: 5
