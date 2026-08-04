/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public interface B2QueryWrapper {
    public func queryCallback(proxyId: Int64) : Bool
}

public interface B2RayCastWrapper {
    public func rayCastCallback(input: B2RayCastInput, proxyId: Int64) : Float64
}

public interface B2BroadPhaseWrapper {
    public func addPair(proxyUserDataA: B2FixtureProxy, proxyUserDataB: B2FixtureProxy):Unit{}
}
