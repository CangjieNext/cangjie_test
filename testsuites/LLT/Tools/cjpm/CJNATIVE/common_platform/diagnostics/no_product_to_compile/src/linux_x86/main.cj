// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { os.linux, user.no_product_to_compile.arch.x86 }
package no_product_to_compile

public specific func msg(): Unit {
    println("linux_x86")
}
