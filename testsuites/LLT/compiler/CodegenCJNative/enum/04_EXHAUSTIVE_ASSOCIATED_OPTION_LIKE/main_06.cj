// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan One(Two(Day(x)))=333

enum OptionLike_Ref<T> {
    Two(CommonEnum<T>) | Day
}

enum CommonEnum<T> {
    One(OptionLike_Ref<T>) | Day(T)
}

main(): Int64 {
    var CommonEnum_Day = Day<Int32>(333)
    var OptionLike_Ref_Two = Two<Int32>(CommonEnum_Day)
    var CommonEnum_One = CommonEnum<Int32>.One(OptionLike_Ref_Two)
    var res: Int64 = match (CommonEnum_One) {
        case One(Two(Day(x))) =>
            println("One(Two(Day(x)))=${x}");
            0
        case _ => 1
    }
    return res
}
