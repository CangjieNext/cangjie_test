/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type Point2D = (Float64, Float64)

type Point3D = (Float64, Float64, Float64)

main() {
    let point1: Point2D = (0.5, 0.8)
    let point2: Point3D = (0.5, 0.8, 1.1)
    return 0
}
