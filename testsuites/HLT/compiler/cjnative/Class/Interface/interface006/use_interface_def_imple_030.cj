/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public interface MyInterface1<T> {
    prop b1: Int64 {
        get() {
            1
        }
    }
}

public interface MyInterface2<T> {
    prop b2: Int64 {
        get() {
            2
        }
    }
}

public interface MyInterface3<T> {
    prop b3: Int64 {
        get() {
            3
        }
    }
}

enum myEnum {
    A
}

extend myEnum <: MyInterface1<Int64> & MyInterface2<Int64> & MyInterface3<Int64> {}

main() {
    var en1: MyInterface1<Int64> = myEnum.A
    var en2: MyInterface2<Int64> = myEnum.A
    var en3: MyInterface3<Int64> = myEnum.A
    var en4: myEnum = myEnum.A

    if (en1.b1 == 1 && en2.b2 == 2 && en3.b3 == 3) {
        return 0
    }
    return 1
}
