// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// Licensed under Apache-2.0 with Runtime Library Exception.
package aspect_v4_external_app
public func business(value: Int64): Unit { println("external-body:${value}") }
main() { business(5); 0 }
