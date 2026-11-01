/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-INSTANTIATION-TARGET | 实例化指向具体实例化声明 | P0 External | 白盒口径
 * 需求 design-spec §7: 泛型实例化后函数指向具体实例化版本(LazyNode_String.map)。
 * 预期: 编译、链接、运行成功;实例化指向的具体声明身份由白盒或专项 fixture 观察。
 * 需求文档明示"对执行结果无影响,但影响运行性能"—语义不可区分,无可断言运行时差异,
 * 故本用例仅验证编译链接运行成功,不设 trace 断言。
 */
// Level: 1
// Description:
// 泛型实例化指向具体实例化声明 | 白盒口径,语义不可区分,仅验证编译链接运行成功。
// 预期编译链接运行成功(语义不可区分,无可断言运行时差异),退出码 0。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class LazyNode<T> {
    func map<U>(body: (T) -> U): LazyNode<U> {
        LazyNode<U>()
    }
}

public class LazySeq<T> {
    let a = LazyNode<T>()
    public func map<U>(body: (T) -> U): LazySeq<U> {
        LazyNode<T>().map<U>(body)
        LazySeq<U>()
    }
}

main() {
    var a = LazySeq<String>()
    0
}

/*
// 重构后:旧版本指向泛型 LazyNode<T> 的 map,新版本指向 LazyNode_String 的 map。
class LazyNode_String {
    func map<U>(body: (String) -> U): LazyNode<U> {
        LazyNode<U>()
    }
}
public class LazySeq_String {
    let a = LazyNode<String>()
    public func map<U>(body: (String) -> U): LazySeq<U> {
        LazyNode<String>().map<U>(body)
        LazySeq<U>()
    }
}
*/
