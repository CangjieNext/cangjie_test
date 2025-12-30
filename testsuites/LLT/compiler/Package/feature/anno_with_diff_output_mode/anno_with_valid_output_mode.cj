// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-0: %compiler %noColor --experimental anno_with_valid_output_mode.cj --output-type=chir 2>&1 | compare %f
@NonProduct
features { os.linux }
package default

class Person {
    var name_: String = "name"
    var age_: Int64 = 99

    public init(name: String, age: Int64) {
        this.name = name
        this.age = age
    }

    public mut prop name: String {
        get() {
            name_
        }
        set(v) {
            name_ = v
        }
    }
    public mut prop age: Int64 {
        get() {
            age_
        }
        set(v) {
            age_ = v
        }
    }
}
/* SCAN
*/
