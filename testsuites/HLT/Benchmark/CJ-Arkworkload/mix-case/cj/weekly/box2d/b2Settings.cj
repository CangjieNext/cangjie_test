/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

public let float2: Float64 = 2.0
public let angle180: Float64 = 180.0
public let half: Float64 = 0.5
public let float8: Float64 = 8.0
public let float10: Float64 = 10.0
public let int4: Int64 = 4
public let int16: Int64 = 16
public let float3: Float64 = 3.0
public let float025: Float64 = 0.25
public let indexTwo: Int64 = 2
public let indexThr: Int64 = 3
public let posIter: Int64 = 20
public let floopCount: Int64 = 50
public let b2MinFloat: Float64 = 2.2250738585072014e-308
public let b2MaxFloat : Float64 = 1.7976931348623157e308
public let b2Epsilon: Float64 = 2.220446049250313e-16
public let b2PI: Float64 = Float64.GetPI()
public let b2MaxManifoldPoints = 2
public let b2MaxPolygonVertices = 8
public let B2AaBbExtension: Float64 = 0.1
public let B2AaBbMultiplier: Float64 = 2.0
public let b2LinearSlop: Float64 = 0.005
public let b2AngularSlop: Float64 = (float2 / angle180 * b2PI)
public let b2PolygonRadius: Float64 = float2 * b2LinearSlop
public let b2MaxSubSteps = 8
public let b2MaxTOIContacts = 32
public let b2VelocityThreshold: Float64 = 1.0
public let b2MaxLinearCorrection: Float64 = 0.2
public let b2MaxAngularCorrection: Float64 = (float8 / angle180 * b2PI)
public let b2MaxTranslation: Float64 = 2.0
public let b2MaxTranslationSquared: Float64 = b2MaxTranslation * b2MaxTranslation
public let b2MaxRotation: Float64 = half * b2PI
public let b2MaxRotationSquared: Float64 = b2MaxRotation * b2MaxRotation
public let b2Baumgarte: Float64 = 0.2
public let b2ToiBaugarte: Float64 = 0.75
public let b2TimeToSleep: Float64 = 0.5
public let b2LinearSleepTolerance: Float64 = 0.01
public let b2AngularSleepTolerance: Float64 = (float2 / angle180 * b2PI)

public let hex1 = 0x0001
public let hex2 = 0x0002
public let hex4 = 0x0004
public let hex8 = 0x0008
public let hex10 = 0x0010
public let hex20 = 0x0020
public let hex40  = 0x0040
