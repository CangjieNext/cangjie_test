package OkHttpIdlingRes

public class OkHttpIdlingResource <: IdlingResource {
    private var name: String

    public static func create(name: String): OkHttpIdlingResource{
        return OkHttpIdlingResource(name)
    }

    private OkHttpIdlingResource(name: String) {
        this.name = name
    }

    public func getName(): String {
        return name
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
