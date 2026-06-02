/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    var test_lambda = {
        a: Int64,
        b: String =>
        var c: Int64 = 3
    }
    var a1 = test_lambda(1, "lambda\n")
    return 0
}
