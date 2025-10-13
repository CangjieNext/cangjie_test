package diagnosticsTest.func_error

func test11(a: Int32, b!: Int32): Int32 { a + b }

func tt11() {
    test11(1, 2)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
