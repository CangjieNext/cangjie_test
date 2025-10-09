// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package macro_calling

internal import macro_calling.macro_definition.*

main(){
    @M[0](0)
    println("pass")
    // https://cangjie-lang.cn/pages/LICENSE2
    return 0
}