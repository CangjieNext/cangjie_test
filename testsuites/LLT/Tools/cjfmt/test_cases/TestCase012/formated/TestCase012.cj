// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import module031001.pkgs031001a.*

main(): Int64 {
    let a = alias031001.one
    let b = alias031001.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
