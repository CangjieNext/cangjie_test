// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E {
    | f1(Int64)
    | f2(Int64, Int64)
    | A
    | B
    | C
    | D
    | F
    | Point2D
    //ABC
}

enum Foo {
    A | B    |    C
    //ABC
}

enum Foo {
    | A | B    |    C
    //ABC
}

enum TimeUnit {
    Year(Float32) |
    Month(Float32, Float32) |
    Day(Float32, Float32, Float32) |
    Hour(Float32, Float32, Float32, Float32)
}

public enum RGBColor1 {




    | Red | Green | Blue |
        ...
}

public enum RGBColor2 {
    | Red | Green | Blue | ...
}

main() {
    return 0
}