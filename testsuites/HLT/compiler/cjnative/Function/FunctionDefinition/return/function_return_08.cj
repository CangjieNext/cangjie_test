/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    case01()
    case02()
    case03()
    return 0
}

func case01() {
    case02()
}

func case02() {
    case01()
}

func case03() {
    case03()
}
// ASSERT: scan sema_unable_to_infer_return_type
