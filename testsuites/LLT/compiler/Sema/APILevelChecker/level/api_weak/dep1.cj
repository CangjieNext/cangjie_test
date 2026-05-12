// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package dep

import ohos.labels.APILevel

@!APILevel[since: "22"]
public interface I1 {
	@!APILevel[since: "26"]
	func foo() { println("in I1") }
}


@!APILevel[since: "22"]
public interface I2 <: I1 {
}