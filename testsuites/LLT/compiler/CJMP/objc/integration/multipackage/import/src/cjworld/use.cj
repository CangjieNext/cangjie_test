// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import cjbase.*

@C 
func cangjieMain() {
    let cc = Base().self()
    if (cc is Base) {
        return 0
    } else {
        return 1
    }
}
