// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// --target will trigger a 'failed to detect cangjie modules' error which prints the path of
// `CANGJIE_HOME`. Currently test framework is not able to do a full match on dynamic outputs
// (outputs change depend on cases). We have to use regex here and give up on full match.

// EXEC-PIPE-1: %compiler %cmp_opt %n x86_64-linux-ohos %n x86_64-linux-ohos ./%f 2>&1 | compare ./%f

// ASSERT: regex warning.*: '--target' is specified multiple times. The last one is chosen.

main() {
    return 0
}
