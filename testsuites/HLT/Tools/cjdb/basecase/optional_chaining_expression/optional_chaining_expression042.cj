/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct ABC {
    var a = 1
}

func func3(a:ABC){
    a
}

main() {
    var a = Some(ABC())
    var f1 = Option<(ABC)->ABC>.Some(func3)
    var f2 = Option<(ABC)->ABC>.None

    var r1 = a?.a
    var r2 = f1?(ABC())
    var r3 = f2?(ABC())
    0
}
