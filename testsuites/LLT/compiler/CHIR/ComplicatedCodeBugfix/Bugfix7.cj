// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func av(aw : Unit) {
    func az() : Unit {
        if (true) { aw } else { aw }
    }
    try {
        az()
    } catch (e: Exception) {
    }
    az
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
