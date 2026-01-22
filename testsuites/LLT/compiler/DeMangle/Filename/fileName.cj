// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan at default::startAbility()

class MainAbility {
    public MainAbility(let context: String) {}
}

// private function
private func startAbility(): String {
    throw Exception()
}

main() {
    var ab = MainAbility("myContext")
    startAbility()
    0
}
