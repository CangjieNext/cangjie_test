/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.exception

func test(a: Int64) {}
func test1(a: Int64): Int64 {
    a
}

func main1() {
    try {
        1
    } finally {} |> test
    try {
        test1
    } finally {} ~> test1
}
