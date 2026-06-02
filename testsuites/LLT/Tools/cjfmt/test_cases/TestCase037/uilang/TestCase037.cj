// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

    func test(): Unit {
        let onNone = {
             => // 如果未定义RuntimeClass with Overhead，但为Pod设置了Overhead，则拒绝Pod
                        if (!pod.spec.overhead.isEmpty()) {
                throw StatusError.newForbidden(
                    attr,
                    Exception("pod rejected: Pod Overhead set without corresponding RuntimeClass defined Overhead")
                )
            }
        }
    }

