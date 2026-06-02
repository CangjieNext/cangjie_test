// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) EXEC: %compiler --output-type=cbclib %f -o lib.cbc
// (not CJNATIVE) EXEC-PIPE: ls lib.cbc | compare %f
// (not CJNATIVE) ASSERT: regex-auto lib.cbc

package pkg

public func GetValue() {
    return 42
}
