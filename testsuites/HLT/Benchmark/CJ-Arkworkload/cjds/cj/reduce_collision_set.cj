/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class MyBool1 {
    var b: Bool = true
}

let RADIUS_DIVISOR: Float64 = 2.0

func drawMotionOnVoxelMap(voxelMap: RedBlackTree, motion: Motion) {
    let voxelSize = Constants.GOOD_VOXEL_SIZE
    let horizontal = Vector2D(voxelSize, 0.0)
    let vertical = Vector2D(0.0, voxelSize)
    
    
    func voxelHash(position: Vector3D): Vector2D {
        let xDiv = Int64(position.x / voxelSize) | 0
        let yDiv = Int64(position.y / voxelSize) | 0
     
        let result = Vector2D(voxelSize * Float64(xDiv), voxelSize * Float64(yDiv))

        if (position.x < 0.0) {
            result.x -= voxelSize
        }
        if (position.y < 0.0) {
            result.y -= voxelSize
        }
        
        return result
    }
    
    let seen: RedBlackTree = RedBlackTree()
    
    func putIntoMap(voxel: Vector2D) {
        var array = ArrayList<Motion>([])
        if (voxelMap.get(voxel).isSome()) {
            array = (voxelMap.get(voxel).getOrThrow() as ArrayList<Motion>).getOrThrow()
        }
        array.add(motion)
        voxelMap.put(voxel, array)
    }
    
    func isInVoxel(voxel: Vector2D): Bool {
        return inVoxelByCondition(voxel, motion, voxelSize)
    }
    
    func recurse(nextVoxel: Vector2D): Unit {   
        if (!isInVoxel(nextVoxel)) {
            return
        }
        if (seen.put(nextVoxel, MyBool1()).isSome()) {
            return
        }
        putIntoMap(nextVoxel)
        recurse(nextVoxel.minus(horizontal))
        recurse(nextVoxel.plus(horizontal))
        recurse(nextVoxel.minus(vertical))
        recurse(nextVoxel.plus(vertical))        
        recurse(nextVoxel.minus(horizontal).minus(vertical))
        recurse(nextVoxel.minus( horizontal).plus(vertical))
        recurse(nextVoxel.plus(horizontal).minus(vertical))
        recurse(nextVoxel.plus(horizontal).plus(vertical))
    }

    recurse(voxelHash(motion.posOne))
}

func inVoxelByCondition(voxel: Vector2D, motion: Motion, voxelSize: Float64): Bool {
    if (voxel.x > Constants.MAX_X || voxel.x < Constants.MIN_X || voxel.y > Constants.MAX_Y || voxel.y < Constants.MIN_Y) {
        return false
    }
    let ini = motion.posOne;
    let fin = motion.posTwo;
    
    let v_s = voxelSize
    let r = Constants.PROXIMITY_RADIUS / RADIUS_DIVISOR;
    
    let v_x = voxel.x
    let x0 = ini.x
    let xv = fin.x - ini.x
    
    let v_y = voxel.y
    let y0 = ini.y
    let yv = fin.y - ini.y
    
    var low_x: Float64 = (v_x - r - x0) / xv;
    var high_x: Float64 = (v_x + v_s + r - x0) / xv;
    
    if (xv < 0.0) {
        let tmp = low_x
        low_x = high_x
        high_x = tmp
    }
    var low_y: Float64 = (v_y - r - y0) / yv;
    var high_y: Float64 = (v_y + v_s + r - y0) / yv;
    
    if (yv < 0.0) {
        let tmp = low_y
        low_y = high_y
        high_y = tmp
    }
    
    let condition1 = xv == 0.0 && v_x <= x0 + r && x0 - r <= v_x + v_s
    let condition2 = (low_x <= 1.0 && 1.0 <= high_x) || (low_x <= 0.0 && 0.0 <= high_x) || (0.0 <= low_x && high_x <= 1.0)
    let condition3 = yv == 0.0 && v_y <= y0 + r && y0 - r <= v_y + v_s
    let condition4 = getCondition4(low_y, high_y)
    let condition5 = getCondition5(xv, yv, low_x, high_x, low_y, high_y)

    return (condition1 || condition2) && (condition3 || condition4) && condition5
}

func getCondition4(low_y: Float64, high_y: Float64): Bool {
  return (low_y <= 1.0 && 1.0 <= high_y) || (low_y <= 0.0 && 0.0 <= high_y) || (0.0 <= low_y && high_y <= 1.0);
}

func getCondition5(xv: Float64, yv: Float64, low_x: Float64, high_x: Float64, low_y: Float64, high_y: Float64): Bool {
  return xv == 0.0 || yv == 0.0 || (low_y <= high_x && high_x <= high_y) || (low_y <= low_x && low_x <= high_y) || (low_x <= low_y && high_y <= high_x);
}

func reduceCollisionSet(motions: ArrayList<Motion>): ArrayList<ArrayList<Motion>> {
    let voxelMap: RedBlackTree = RedBlackTree()
    for (motion in motions) {
        drawMotionOnVoxelMap(voxelMap, motion)
    }

    let result: ArrayList<ArrayList<Motion>> = ArrayList<ArrayList<Motion>>()
    voxelMap.forEach{ key: Object, value: Object => let newValue = (value as ArrayList<Motion>).getOrThrow()
    if (newValue.size > 1) {
        result.add(newValue)
    }}
    return result
}
