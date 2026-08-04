/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: b2Body.cj b2CollideCircles.cj  b2CollidePolygon.cj  b2Contact.cj b2ContactSolver.cj  b2DynamicTree.cj  b2Island.cj  b2Math.cj  b2Settings.cj  b2TimeOfImpact.cj  b2WorldCallbacks.cj  b2Wrappers.cj
// DEPENDENCE: b2BroadPhase.cj  b2CollideEdge.cj b2Collision.cj b2ContactManager.cj  b2Distance.cj b2Fixture.cj b2Joint.cj b2Rope.cj b2Shape.cj b2TimeStep.cj b2World.cj box2d.cj
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg *.cj -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

main(){
    Benchmark().benchmarkRun()
}
