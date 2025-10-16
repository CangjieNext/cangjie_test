// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

func MyLog(info: String) {
    print("${info}\n")
}

public struct Tensor {
    public static var val = 0
    public init() {
        val = val + 1
        MyLog("Tensor::init")
    }
}

public var gTensor = Tensor()
