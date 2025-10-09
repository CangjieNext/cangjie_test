// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func assertThatDate(date: DateTime, formattedDate: String): Unit {
    let fmt = getDefault()
    let date1 = date.inTimeZone(TimeZone.UTC)
    let stringFormattedDate = fmt.format(date1)
    @Assert(stringFormattedDate == formattedDate)
}

main(){}