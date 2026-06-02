/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public class ArrayList<E> {
    public var myData2: Array<Option<E>> = [Option<E>.None];
    public var c = match (myData2[0]) {
        case Some(x) => "1";
        case _ => "3";
    }
}

main() {
    var a = ArrayList<Float32>();
    var b = ArrayList<Int8>();
    0
}
