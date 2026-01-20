// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

@NonProduct
features {}
package ot_exe

public common func platformId(): String
public common func withdefault(): String { "default" }

public common func commonMain(): Unit {
    println(platformId())
    println(withdefault())
}
