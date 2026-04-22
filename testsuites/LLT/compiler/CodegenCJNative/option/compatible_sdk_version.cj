// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that when CompatibleSDKVersion <= 19, the embedded cj.sdk.version
// string does NOT contain a pre-release suffix (e.g. "-beta").

// EXEC-PIPE: %frontendCompiler --dump-ir --dump-to-screen %cmp_opt --cfg=CompatibleSDKVersion=19 %n.cj 2>&1 | compare %f

// The cj.sdk.version global must exist exactly once
// ASSERT: regex-1 @cj.sdk.version = 
// The version string must NOT contain a '-' (no pre-release suffix for old SDK)
// ASSERT: regex-not cj.sdk.version.*c".*-

// Normal compile and run with CompatibleSDKVersion=19
// EXEC: %compiler %cmp_opt --cfg=CompatibleSDKVersion=19 %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    0
}
