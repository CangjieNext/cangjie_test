// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) ERRCHECK: %compiler %cmp_opt %f -o %output %target=%host_arch-%host_os-fakeenv
// (CJNATIVE) ASSERT: regex-auto The environment "fakeenv" is not found or supported!

main() {
    print("Everything is great")
}
