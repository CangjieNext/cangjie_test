// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Platform-specific code
@NonProduct  // Experimental
// Supports multiple platforms
features {os.linux /* primary */, os.windows}
package pkg

import std.io.*

common func f() {
}