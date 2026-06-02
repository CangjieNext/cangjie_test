/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
let MAX_YEAR = 999999999
let MIN_YEAR = -999999999
let DAYS_OF_NORMAL_YEAR: Int64 = 365
let DAYS_OF_LEAP_YEAR: Int64 = 366
let DAYS_PER_400YEARS: Int64 = DAYS_OF_NORMAL_YEAR * 400 + 97
let DAYS_PER_100YEARS: Int64 = DAYS_OF_NORMAL_YEAR * 100 + 24
let DAYS_PER_4YEARS: Int64 = DAYS_OF_NORMAL_YEAR * 4 + 1
let HOURS_PER_DAY = 24
let MINUTES_PER_DAY = 24 * 60
let NANOSECONDS_PER_DAY = 24 * 60 * 60 * 10 ** 9
let SECONDS_PER_DAY = 24 * 60 * 60
