// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler -p . --scan-dependency 2>&1 | compare %f

import std.collection.ArrayList

main() {}

// ASSERT: scan "package":"std.collection","isStd":true,"imports"
