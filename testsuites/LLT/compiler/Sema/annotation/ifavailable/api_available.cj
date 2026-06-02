// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package ohos.device_info

public func apiAvailable(level: Int64): Bool {
    level >= 19
}

public func apiAvailable(level: String): Bool {
    level != ""
}
