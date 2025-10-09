// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class C {

    func sub(x: Int64): Int64 {
        return x
    }

    // 反例二
    func logInfo3(fileName: String, lineNo: Int64, fileName2: String, lineNo2: Int64): Unit {
        let c = fileName
        let b = sub(lineNo)
    }

}