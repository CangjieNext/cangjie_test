/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


extend Int64{
    public func isClosed():Bool{print("A!");true}
    public func close():Unit{}
}


main() {
    try (x : Int64 = 1)
    {
    } finally {}
    print("success!\n")
    return 0
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_expected_character
