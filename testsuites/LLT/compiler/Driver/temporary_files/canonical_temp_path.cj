// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %rmdir temp
// EXEC: %mkdir temp
// (Windows) EXEC-PIPE: %compiler %cmp_opt %f --save-temps=./temp/ -V 2>&1| compare %f
// (Windows) ASSERT: regex-not ".\\temp\\.*"
// (Windows) ASSERT: regex-not "temp\\.*"
// (Windows) ASSERT: regex ".*\\temp\\.*"
// (not Windows) EXEC: ln -s ./temp link_to_temp
// (not Windows) EXEC-PIPE: %compiler %cmp_opt %f --save-temps=./link_to_temp/ -V 2>&1| compare %f
// (not Windows) ASSERT: regex-not './link_to_temp/.*'
// (not Windows) ASSERT: regex-not 'link_to_temp/.*'
// (not Windows) ASSERT: regex-not '.*/link_to_temp/.*'
// (not Windows) ASSERT: regex-not './temp/.*'
// (not Windows) ASSERT: regex-not 'temp/.*'
// (not Windows) ASSERT: regex '.*/temp/.*'

main() {
    return 0
}
