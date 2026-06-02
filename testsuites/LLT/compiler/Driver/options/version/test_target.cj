// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler --version 2>&1 | compare %f
// (Windows) ASSERT: regex Target: (x86_64-unknown-windows-gnu)|(x86_64-w64-mingw32)
// (Linux and x86) ASSERT: scan Target: x86_64-unknown-linux-gnu
// (Linux and arm) ASSERT: scan Target: aarch64-unknown-linux-gnu
// (Darwin and x86) ASSERT: scan Target: x86_64-apple-darwin
// (Darwin and arm) ASSERT: scan Target: arm64-apple-darwin
