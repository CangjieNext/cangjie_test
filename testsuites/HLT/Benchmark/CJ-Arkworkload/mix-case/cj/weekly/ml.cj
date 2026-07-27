/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms



import std.collection.*
import std.time.*
import std.convert.*
import std.regex.*
import std.math.*
import std.random.*

let MLINDEX_BYTES_NUM_2 = 2;
let MLINDEX_BYTES_NUM_3 = 3;
let MLINDEX_BYTES_NUM_4 = 4;
let MLINDEX_BYTES_NUM_03 = 0.3;
let MLINDEX_BYTES_NUM_05 = 0.5;
let MLINDEX_BYTES_NUM_06745 = 0.6745;
let MLINDEX_BYTES_NUM_20 = 2.0;
let MLINDEX_BYTES_NUM_100 = 100;
let MLINDEX_BYTES_NUM_52 = -52;
let MLINDEX_BYTES_NUM_0520 = -52.0;
let MLINDEX_BYTES_NUM_1000 = 1000;
let MLINDEX_BYTES_NUM_512 = 512;
let MLINDEX_BYTES_NUM_10 = 10;
let MLINDEX_BYTES_NUM_50 = 50;
let MLINDEX_BYTES_NUM_75 = 75;
let MLINDEX_BYTES_NUM_075 = 0.75;
let MLINDEX_BYTES_NUM_04375 = -0.4375;
let MLINDEX_BYTES_NUM_30 = 30;
let MLINDEX_BYTES_NUM_0964 = 0.964;
let MLINDEX_BYTES_NUM_002 = -2;
let MLINDEX_BYTES_NUM_001 = 0.01;
let MLINDEX_BYTES_NUM_5 = 5;
let MLINDEX_BYTES_NUM_6 = 6;
let MLINDEX_BYTES_NUM_020 = 20;
let MLINDEX_BYTES_NUM_050 = 5.0;
let MLINDEX_BYTES_NUM_40 = 4.0;
let MLINDEX_BYTES_NUM_040 = 40;
let NUM_STIME_CONST = 1000;
let NUM_TIME_LOOP_CONST = 60;
let NUM_TIME_LOOP_5 = 5;



class MlOptions {
    var inPlace = true
    var max = 0
    var min = 0
    var from1: Int64 = 0
    var to: Int64 = 0
    var numberOfPoints: Int64 = 0
    var variant: String = ""
    var computeLeftSingularVectors: Bool = false
    var computeRightSingularVectors: Bool = false
    var autoTranspose: Bool = false
    var hiddenLayers: Array<Int64> = []
    var iterations: ?Int64 = None
    var learningRate: ?Float64 = None
    var dicts: ?NeuralNetworkDict = None
    var model: ?String = None
    var assumeSymmetric: Bool = false
    var inputSize: ?Int64 = None
    var outputSize: ?Int64 = None
    var regularization: ?Float64 = None
    var epsilon: ?Float64 = None
    var activation: ?String = None
    var activationParam: ?Float64 = None
    var layers: ArrayList<MlOptions> = ArrayList<MlOptions>()
    var w: ?Matrix = None
    var b: ?Matrix = None
    var defaultOptions: HashMap<String, Bool>
    init(){
        this.defaultOptions = HashMap<String, Bool>(("assumeSymmetric",false))
    }

}
// ml-stat array.js
class MlStatArrayCls {

    func compareNumbers(a: Int64,b: Int64): Int64 {
        return a - b;
    }

    func sum(values: Array<Int64>): Int64 {
        var sum = 0
        for (i in 0..values.size) {
            sum += values[i];
        }
        return sum
    }

    func max(values: Array<Float64>): Float64 {
        var max = values[0];
        let l = values.size
        for (i in 1..l) {
            if (values[i] > max) {
                max = values[i]
            }
        }
        return max
    }

    func min(values: Array<Float64>): Float64 {
        var min = values[0]
        let l = values.size
        for (i in 1..l) {
            if (values[i] < min) {
                min = values[i]
            }
        }
        return min
    }

    func minMax(values: Array<Float64>): (Float64,Float64) {
        var min = values[0];
        var max = values[0];
        let l = values.size;
        for (i in 1..l) {
            if (values[i] < min) {
                min = values[i]
            }
            if (values[i] > max) {
                max = values[i]
            }
        }
        return (min,max)
    }

    func arithmeticMean(values: Array<Int64>): Float64 {
        var sum = 0;
        let l = values.size;

        for (i in 0..l) {
            sum += values[i];
        }
        return Float64(sum / l);
    }

    func mean(values: Array<Int64>): Float64  {
        return arithmeticMean(values)
    }

    func geometricMean(values:Array<Int64>) : Any {
        var mul = 1;
        let l = values.size;
        for (i in 0..l) {
            mul *= values[i];
        }
        return pow(Float64(mul), Float64(1 / l))
    }

    func logMean(values: Array<Int64>): Float64 {
        var lnsum = 0;
        let l = values.size;
        for (i in 0..l) {
            lnsum += Int64(log(Float64(values[i])));
        }
        return Float64(lnsum / l);
    }

    func grandMean(means: Array<Int64>,samples: Array<Int64>): Float64 {
        var sum = 0;
        var n = 0;
        let l = means.size;
        for (i in 0..l) {
            sum += samples[i] * means[i];
            n += samples[i];
        }
        return Float64(sum / n);
    }

    func truncatedMean(values:  Array<Int64>, percent: Int64, alreadySorted: ?Bool): Float64 {
        var newAlreadySorted = alreadySorted
        var newValues = values

        if (alreadySorted == Option<Bool>.None) {
            newAlreadySorted = false;
        }
        if (!newAlreadySorted.getOrThrow()) {
            newValues=sort(newValues)
        }
        let l = newValues.size;
        let k =  floor(Float64(l * percent));
        var sum = 0;
        for (i in Int64(k)..(l-Int64(k))) {
            sum += newValues[i];
        }
        return Float64(sum / (l - MLINDEX_BYTES_NUM_2 * Int64(k)))
    }

    func harmonicMean(values: Array<Int64>): Float64 {
        var sum = 0;
        let l = values.size;

        for (i in 0..l) {
            if (values[i] == 0) {
                throw Exception("value at index ${i} is zero")
            }
            sum += 1 / values[i];
        }
        return Float64(l / sum);
    }

    func contraHarmonicMean(values: Array<Int64>) : Float64 {
        var r1 = 0;
        var r2 = 0;
        let l = values.size;
        for (i in 0..l) {
            r1 += values[i] * values[i];
            r2 += values[i];
        }
        if (r2 < 0) {
            throw Exception("sum of values is negative")
        }
        return Float64(r1 / r2);
    }

    func median(values: Array<Int64>, alreadySorted: ?Bool): Float64 {
        var newAlreadySorted = alreadySorted
        if (newAlreadySorted == Option<Bool>.None) {
            newAlreadySorted = false
        }
        var newValues = values
        if (!newAlreadySorted.getOrThrow()) {
            newValues=sort(newValues)
        }
        let l = newValues.size;
        let half = floor(Float64(l / MLINDEX_BYTES_NUM_2));
        if (l % MLINDEX_BYTES_NUM_2 == 0) {
            return Float64((newValues[Int64(half) - 1] + newValues[Int64(half)])) * MLINDEX_BYTES_NUM_05;
        } else {
            return Float64(newValues[Int64(half)]);
        }
    }

    func variance(values: Array<Int64>, unbiased: ?Bool): Float64 {
        var newUnbiased = unbiased
        if (unbiased == Option<Bool>.None) {
            newUnbiased = true
        }
        let theMean = mean(values);
        var theVariance = 0;
        let l = values.size;

        for (i in 0..l) {
            let x = values[i] - Int64(theMean);
            theVariance += x * x;
        }
        if (newUnbiased.getOrThrow()) {
            return Float64(theVariance / (l - 1));
        }
        return Float64(theVariance / l);

    }

    func standardDeviation(values: Array<Int64>, unbiased: ?Bool): Float64 {
        return sqrt(this.variance(values, unbiased));
    }

    func standardError(values: Array<Int64>): Float64 {
        return Float64(this.standardDeviation(values, Option<Bool>.None) / sqrt(Float64(values.size)))
    }

    func robustMeanAndStdev(y: Array<Int64>): (Int64,Float64) {
        var mean = 0
        var stdev: Float64 = 0.0
        let length = y.size
        for (i in 0..length) {
            mean += y[i];
        }
        mean /= length
        var averageDeviations: Array<Int64> = Array<Int64>(length,repeat:0)
        for (i in 0..length) {
            averageDeviations[i] = abs(y[i] - mean);
        }
        averageDeviations=sort(averageDeviations)

        if (length % MLINDEX_BYTES_NUM_2 == 1) {
            stdev = Float64(averageDeviations[(length - 1) / MLINDEX_BYTES_NUM_2]) / MLINDEX_BYTES_NUM_06745;
        } else {
            stdev = MLINDEX_BYTES_NUM_05 * Float64((averageDeviations[length / MLINDEX_BYTES_NUM_2] + averageDeviations[length / MLINDEX_BYTES_NUM_2 - 1])) / MLINDEX_BYTES_NUM_06745;
        }
        return (mean,stdev)

    }

    func quartiles(values: Array<Int64>, alreadySorted: ?Bool): (Int64,Float64,Int64) {
        var newAlreadySorted = alreadySorted
        if (alreadySorted == Option<Bool>.None) {
            newAlreadySorted = false
        }
        var newValues = values
        if (!newAlreadySorted.getOrThrow()) {
          newValues=sort(newValues)
        }
        let quart = newValues.size / MLINDEX_BYTES_NUM_4;
        let q1 = newValues[Int64(ceil(Float64(quart)) - 1.0)];
        let q2 = median(newValues, true);
        let q3 = newValues[Int64(ceil(Float64(quart * MLINDEX_BYTES_NUM_3)) - 1.0)];
        return (q1,q2,q3)
    }

    func pooledStandardDeviation(samples:Array<Array<Int64>>, unbiased: Bool): Float64 {
        return sqrt(pooledVariance(samples, unbiased));
    }

    func pooledVariance(samples:Array<Array<Int64>>, unbiased: ?Bool): Float64 {
        var newUnbiased = unbiased
        if  (unbiased == Option<Bool>.None) {
            newUnbiased = true
        }
        var sum = 0
        var count = 0
        let l = samples.size;
        for (i in 0..l) {
            let values = samples[i];
            let vari = this.variance(values, Option<Bool>.None);
            sum += (values.size - 1) * Int64(vari);
            if (newUnbiased.getOrThrow()) {
                count += values.size - 1;
            }else {
                count += values.size;
            }
        }
        return Float64(sum / count)
    }

    func mode(values: Array<Int64>):Int64 {
        let l = values.size
        var itemCount: Array<Int64> = Array<Int64>(l,repeat:0)

        for (i in 0..l) {
            itemCount[i] = 0;
        }
        var itemArray: Array<Int64> =  Array<Int64>( l,repeat:0);
        var count = 0;
        for (i in 0..values.size) {
            var index = indexFirst(itemArray,values[i])
               if (index >= 0) {
                    itemCount[index] += 1;
                }else {
                    itemArray[count] = values[i];
                    itemCount[count] = 1;
                    count += 1;
                }
        }
        var maxValue: Int64 = 0
        var maxIndex: Int64 = 0

        for (i in 0..count) {
            if (itemCount[i] > maxValue) {
                maxValue = itemCount[i];
                maxIndex = i;
            }
        }
        return itemArray[maxIndex];
    }

    func covariance( vector1: Array<Int64>,vector2:Array<Int64>,  unbiased: ?Bool) : Float64 {
        var newUnbiased = unbiased
        if (unbiased == Option<Bool>.None) {
            newUnbiased = true
        }
        let mean1 = mean(vector1);
        let mean2 = mean(vector2);
        if (vector1.size != vector2.size) {
            throw  Exception("Vectors do not have the same dimensions")
        }
        var cov = 0
        let l = vector1.size
        for (i in 0..l) {
            let x = vector1[i] - Int64(mean1);
            let y = vector2[i] - Int64(mean2);
            cov += x * y;
        }
        if (newUnbiased.getOrThrow()) {
            return Float64(cov / (l - 1));
        }else {
            return Float64(cov / l);
        }
    }

    func skewness(values: Array<Int64>, unbiased: ?Bool): Int64 {
        var newUnbiased = unbiased
        if  (unbiased.isNone()) {
            newUnbiased = true
        }

        let theMean = this.mean(values)
        var s2 = 0
        var s3 = 0
        let l = values.size
        for (i in 0..l) {
            let dev = values[i] - Int64(theMean);
            s2 += dev * dev;
            s3 += dev * dev * dev;
        }

        let m2 = s2 / l;
        let m3 = s3 / l;
        let g = m3 / Int64((pow(Float64(m2), Float64(MLINDEX_BYTES_NUM_3) / MLINDEX_BYTES_NUM_20)));
        if (newUnbiased.getOrThrow()) {
            let a = sqrt(Float64(l * (l - 1)));
            let b = l - MLINDEX_BYTES_NUM_2;
            return (Int64(a) / b) * g;
        }
        return g;

    }

    func kurtosis(values: Array<Int64>,unbiased: ?Bool): Int64 {
        var newUnbiased = unbiased
        if ( unbiased.isNone()) {
            newUnbiased = true
        }
        let theMean = mean(values);
        let n = values.size
        var s2 = 0
        var s4 = 0
        for (i in 0..n) {
            let dev = values[i] - Int64(theMean);
            s2 += dev * dev;
            s4 += dev * dev * dev * dev;
        }
        let m2 = s2 / n;
        let m4 = s4 / n;
        if (newUnbiased.getOrThrow()) {
            let v = s2 / (n - 1);
            let a = (n * (n + 1)) / ((n - 1) * (n - MLINDEX_BYTES_NUM_2) * (n - MLINDEX_BYTES_NUM_3));
            let b = s4 / (v * v);
            let c = ((n - 1) * (n - 1)) / ((n - MLINDEX_BYTES_NUM_2) * (n - MLINDEX_BYTES_NUM_3));
            return a * b - MLINDEX_BYTES_NUM_3 * c;
        } else {
            return m4 / (m2 * m2) - MLINDEX_BYTES_NUM_3;
        }
    }

    func entropy(values: Array<Int64>,  eps: ?Int64): Int64 {
        var newEps = eps
        if (eps.isNone()) {
            newEps = 0
        }
        var sum = 0
        let l = values.size
        for (i in 0..l) {
            sum += values[i] * Int64(log(Float64(values[i] + newEps.getOrThrow())));
        }
        return -sum;
    }

    func weightedMean(values:  Array<Int64>, weights:  Array<Int64>): Int64 {
        var sum = 0
        let l = values.size
        for (i in 0..l) {
            sum += values[i] * weights[i];
        }
        return sum;
    }

    func weightedStandardDeviation(values:  Array<Int64>, weights:  Array<Int64>) : Float64 {
        return sqrt(Float64(weightedVariance(values, weights)));
    }

    func weightedVariance( values:  Array<Int64>,  weights:  Array<Int64>): Int64 {
        let theMean = weightedMean(values, weights);
        var vari = 0;
        let l = values.size;
        var a = 0;
        var b = 0;
        for (i in 0..l) {
            let z = values[i] - theMean;
            let w = weights[i];
            vari += w * (z * z);
            b += w;
            a += w * w;
        }
        return vari * (b / (b * b - a));
    }

    func center(values:Array<Int64>,inPlace: ?Bool) {
        var newInPlace = inPlace
        if (inPlace.isNone()) {
            newInPlace = false
        }

        var result = values;
        if (!newInPlace.getOrThrow()) {
            result = values
        }
        let theMean = mean(result)
        let l = result.size;
        for (i in 0..l) {
            result[i] -= Int64(theMean);
        }

    }

    func standardize( values: Array<Int64>, standardDev: ?Float64,  inPlace: ?Bool) : Array<Int64> {
        var newStandardDev = standardDev
        var newInPlace = inPlace
        if (standardDev.isNone()) {
            newStandardDev = standardDeviation(values, Option<Bool>.None)
        }
        if (inPlace.isNone()) {
            newInPlace = false
        }

        let l = values.size;
        var result: Array<Int64>
        if(newInPlace.getOrThrow()){
            result = values
        }else{
          result =  values
       }
        for (i in 0..l) {
            result[i] = values[i] / Int64(newStandardDev.getOrThrow());
        }
        return result;
    }

    func cumulativeSum(array:Array<Int64>): Array<Int64>{
        let l = array.size;
        var result: Array<Int64> =  Array<Int64>(l,repeat:0)
        result[0] = array[0];
        for (i in 1..l) {
            result[i] = result[i - 1] + array[i];
        }
        return result;
    }
}

let mlStatArray = MlStatArrayCls()

class MlStatMatrixCls {

    func compareNumbers(a: Int64, b: Int64): Int64 {
        return a - b;
    }

    func max(matrix: Array<Array<Float64>>): Float64 {
        var max: Float64 = -Float64.Inf ;

        for (i in 0..matrix.size) {
            for (j in 0..matrix[i].size){
                if (matrix[i][j] > max) {
                    max = matrix[i][j]
                }
            }
        }
        return max
    }

    func min(matrix: Array<Array<Float64>>): Float64 {
        var min: Float64 = Float64.Inf;
        for (i in 0..matrix.size) {
            for (j in 0..matrix[i].size) {
                if (matrix[i][j] < min) {
                    min = matrix[i][j]
                }
            }
        }
        return min;
    }

    func minMax(matrix: Array<Array<Float64>>): (Float64, Float64) {
        var min: Float64 = Float64.Inf;
        var max: Float64 = -Float64.Inf ;

        for (i in 0..matrix.size) {
            for (j in 0..matrix[i].size) {
                if (matrix[i][j] < min) {
                    min = matrix[i][j]
                }
                if (matrix[i][j] > max) {
                    max = matrix[i][j]
                }
            }
        }
        return (min,max)
    }

    func entropy(matrix: Array<Array<Int64>>, eps: ?Int64) : Int64 {
        var newEps = eps
        if (eps.isNone()) {
            newEps = 0
        }
        var sum = 0
        let l1 = matrix.size
        let l2 = matrix[0].size
        for (i in 0..l1) {
            for (j in 0..l2){
                sum += matrix[i][j] * Int64(log(Float64(matrix[i][j] + newEps.getOrThrow())));
            }
        }
        return -sum;
    }

    func mean( matrix: Array<Array<Int64>>,  dimension: ?Int64): Array<Int64> {
        var newDimension = dimension
        if (dimension.isNone()) {
            newDimension  = 0
        }
        let rows = matrix.size;
        let cols = matrix[0].size;
        var theMean: Array<Int64>;
        let n: Int64;

        if (newDimension == -1) {
            theMean = [0];
            n = rows * cols;
            for (i in 0..rows) {
                for (j in 0..cols) {
                    theMean[0] += matrix[i][j];
                }
            }
            theMean[0] /= n
        } else if (newDimension == 0) {
            theMean =  Array<Int64>(cols,repeat:0);
            n = rows;

            for (j in 0..cols) {
                theMean[j] = 0
                for (i in 0..rows) {
                    theMean[j] += matrix[i][j];
                }
                theMean[j] /= n;
            }

        } else if (newDimension == 1) {
            theMean =  Array<Int64>(rows,repeat:0);
            n = cols;
            for (j in 0..rows) {
                theMean[j] = 0;
                for (i in 0..cols) {
                    theMean[j] += matrix[j][i];
                }
                theMean[j] /= n;
            }
        } else {
            throw Exception("Invalid dimension")
        }
        return theMean;
    }

    func sum(matrix: Array<Array<Int64>>, dimension: ?Int64): Array<Int64> {
        var newDimension = dimension
        if (dimension.isNone()) {
            newDimension  = 0
        }

        let rows = matrix.size
        let cols = matrix[0].size
        var theSum: Array<Int64>

        if (newDimension == -1) {
            theSum = [0];
            for (i in 0..rows) {
                for (j in 0..cols){
                    theSum[0] += matrix[i][j];
                }
            }
        } else if (newDimension == 0) {
            theSum = Array<Int64>(cols,repeat:0)
            for (j in 0..cols) {
                theSum[j] = 0;
                for (i in 0..rows) {
                    theSum[j] += matrix[i][j];
                }
            }
        } else if (newDimension == 1) {
            theSum = Array<Int64>(rows,repeat:0);
            for (j in 0..rows) {
                theSum[j] = 0;
                for (i in 0..cols) {
                    theSum[j] += matrix[j][i];
                }
            }
        } else {
            throw Exception("Invalid dimension")
        }
        return theSum;
    }

    func product(matrix: Array<Array<Int64>>, dimension: ?Int64) : Array<Int64> {
        var newDimension = dimension
        if (dimension.isNone()) {
            newDimension = 0
        }

        let rows = matrix.size
        let  cols = matrix[0].size
        var theProduct: Array<Int64>

        if (newDimension == -1) {
            theProduct = [1];
            for (i in 0..rows) {
                for (j in 0..cols) {
                    theProduct[0] *= matrix[i][j];
                }
            }
        } else if (newDimension == 0) {

            theProduct =  Array<Int64>(cols,repeat:0);
            for (j in 0..cols) {
                theProduct[j] = 1;
                for (i in 0..rows) {
                    theProduct[j] *= matrix[i][j];
                }
            }
        } else if (newDimension == 1) {
            theProduct =  Array<Int64>(rows,repeat:0);
            for (j in 0..rows) {
                theProduct[j] = 1;
                for (i in 0..cols) {
                    theProduct[j] *= matrix[j][i];
                }
            }
        } else {
            throw Exception("Invalid dimension")
        }
        return theProduct;
    }


    func standardDeviation(matrix: Array<Array<Int64>>, means: ? Array<Int64>,  unbiased: ?Bool):  Array<Float64> {

        var vari:  Array<Float64> = variance(matrix, means.getOrThrow(),unbiased.getOrThrow())
        let l = vari.size;
        for (i in 0..l) {
            vari[i] = sqrt(vari[i]);
        }
        return vari;
    }

    func variance(matrix: Array<Array<Int64>>, means:? Array<Int64>,  unbiased: ?Bool):  Array<Float64> {
        var newUnbiased = unbiased
        if  (unbiased.isNone()) {
            newUnbiased = true
        }
        var newMeans = means
        if (newMeans.isNone())  {
            newMeans = mean(matrix, Option<Int64>.None)
        }
        let rows = matrix.size;
        if (rows == 0) {
            return Array()
        }
        let cols = matrix[0].size;
        var vari:  Array<Float64> =  Array<Float64>(cols,repeat:0.0);

        for (j in 0..cols) {
            var sum1 = 0
            var sum2 = 0
            var x = 0
            for (i  in 0..rows) {
                x = matrix[i][j] - newMeans.getOrThrow()[j];
                sum1 += x;
                sum2 += x * x;
            }
            if (newUnbiased.getOrThrow()) {
                vari[j] = Float64((sum2 - ((sum1 * sum1) / rows)) / (rows - 1));
            } else {
                vari[j] = Float64((sum2 - ((sum1 * sum1) / rows)) / rows);
            }
        }
        return vari;
    }

    func median(matrix: Array<Array<Int64>>) :Array<Float64> {
        let rows = matrix.size
        let cols = matrix[0].size
        var medians: Array<Float64> = Array<Float64>(cols,repeat:0.0);
        for (i  in 0..cols) {
            var data: Array<Int64> = Array<Int64>(rows,repeat:0);
            for (j  in 0..rows) {
                data[j] = matrix[j][i];
            }
            data=sort(data)

            let n = data.size;
            if (n % MLINDEX_BYTES_NUM_2 == 0) {
                medians[i] = Float64((data[n / MLINDEX_BYTES_NUM_2] + data[(n / MLINDEX_BYTES_NUM_2) - 1])) * MLINDEX_BYTES_NUM_05;
            } else {
                medians[i] = Float64(data[Int64(floor(Float64(n / MLINDEX_BYTES_NUM_2)))]);
            }
        }
        return medians;
    }

    func mode(matrix: Array<Array<Int64>>): Array<Int64> {
        let rows = matrix.size
        let cols = matrix[0].size
        var modes: Array<Int64> = Array<Int64>(cols,repeat:0)
        for (i in 0..cols) {
            var itemCount: Array<Int64> = Array<Int64>(rows,repeat:0);
            for (k in 0..rows) {
                itemCount[k] = 0;
            }
            var itemArray: Array<Int64> = Array<Int64>(rows,repeat:0);
            var count = 0;
            for (j in 0..matrix[i].size) {
                let index = indexFirst(itemArray,matrix[j][i])
                    if (index >= 0) {
                        itemCount[index] += 1;
                    }else {
                        itemArray[count] = matrix[j][i];
                        itemCount[count] = 1;
                        count += 1;
                    }
            }
            var maxValue = 0
            var maxIndex = 0
            for (j in 0..count) {
                if (itemCount[j] > maxValue) {
                    maxValue = itemCount[j];
                    maxIndex = j;
                }
            }
            modes[i] = itemArray[maxIndex];
        }
        return modes;
    }

    func skewness(matrix:Array<Array<Int64>>, unbiased: ?Bool): Array<Float64> {
        var newUnbiased = unbiased
        if  (unbiased.isNone()) {
            newUnbiased = true
        }

        let means = mean(matrix, Option<Int64>.None);
        let n = matrix.size
        let l = means.size;
        var skew: Array<Float64> =  Array<Float64>( l,repeat:0.0);
        for (j in 0..l) {
            var s2 = 0
            var s3 = 0;
            for (i in 0..n) {
                let dev = matrix[i][j] - means[j];
                s2 += dev * dev;
                s3 += dev * dev * dev;
            }

            let m2 = Float64(s2 / n);
            let m3 = Float64(s3 / n);
            let g = m3 / pow(m2, Float64(MLINDEX_BYTES_NUM_3) / Float64(MLINDEX_BYTES_NUM_2));
            skew[j] = g;
            if (newUnbiased.getOrThrow()) {
                let a = sqrt(Float64(n * (n - 1)));
                let b = n - MLINDEX_BYTES_NUM_2;
                skew[j] = (a / Float64(b)) * g;
            }
        }
        return skew;
    }

    func kurtosis(matrix: Array<Array<Int64>>, unbiased: ?Bool): Array<Int64> {
        var newUnbiased = unbiased
        if  (unbiased.isNone()) {
            newUnbiased = true
        }

        let means = mean(matrix,Option<Int64>.None);
        let n = matrix.size
        let m = matrix[0].size;
        var kurt: Array<Int64> =  Array<Int64>( m,repeat:0);

        for (j in 0..m) {
            var s2 = 0
            var s4 = 0;
            for (i in 0..n) {
                let dev = matrix[i][j] - means[j];
                s2 += dev * dev;
                s4 += dev * dev * dev * dev;
            }
            let m2 = s2 / n;
            let m4 = s4 / n;
            kurt[j] = m4 / (m2 * m2) - MLINDEX_BYTES_NUM_3;
            if (newUnbiased.getOrThrow()) {
                let v = s2 / (n - 1);
                let a = (n * (n + 1)) / ((n - 1) * (n - MLINDEX_BYTES_NUM_2) * (n - MLINDEX_BYTES_NUM_3));
                let b = s4 / (v * v);
                let c = ((n - 1) * (n - 1)) / ((n - MLINDEX_BYTES_NUM_2) * (n - MLINDEX_BYTES_NUM_3));
                kurt[j] = a * b - MLINDEX_BYTES_NUM_3 * c;
            }
        }
        return kurt;
    }

    func standardError(matrix: Array<Array<Int64>>) : Array<Int64> {
        let samples: Int64 = matrix.size;
        let standardDeviations: Array<Float64>= standardDeviation(matrix,Option<Array<Int64>>.None,Option<Bool>.None);
        let l: Int64 = standardDeviations.size;
        var standardErrors: Array<Int64> = Array<Int64>(l,repeat:0);
        let sqrtN: Float64 = sqrt(Float64(samples));

        for( i in 0..l) {
            standardErrors[i] = Int64(standardDeviations[i]) / Int64(sqrtN);
        }
        return standardErrors;
    }

    func covariance(matrix:Array<Array<Int64>>, dimension: ?Int64): Array<Array<Int64>> {
        return  scatter(matrix, Option<Int64>.None, dimension.getOrThrow());
    }

    func scatter(matrix: Array<Array<Int64>>, divisor: ?Int64, dimension: ?Int64) :Array<Array<Int64>> {
        var newDimension = dimension
        var newDivisor = divisor
        if (dimension.isNone()) {
            newDimension = 0
        }
        if (divisor.isNone()) {
            if (newDimension == 0) {
                newDivisor = matrix.size - 1;
            } else if (dimension == 1) {
                newDivisor = matrix[0].size - 1;
            }
        }


        let means = mean(matrix, newDimension);
        let rows = matrix.size;
        if (rows == 0) {
            return [[]];
        }
        let cols: Int64 = matrix[0].size
        var cov: Array<Array<Int64>>
        var s: Int64

        if (newDimension == 0) {
            cov =  Array<Array<Int64>>(cols,repeat:[0]);
            for (i in 0..cols) {
                cov[i] =  Array<Int64>(cols,repeat:0);
            }
            for (i in 0..cols) {
                for (j in 0..cols) {
                    s = 0;
                    for (k in 0..rows) {
                        s += (matrix[k][j] - means[j]) * (matrix[k][i] - means[i]);
                    }
                    s /= newDivisor.getOrThrow();
                    cov[i][j] = s;
                    cov[j][i] = s;
                }
            }
        } else if (newDimension == 1) {
            cov = Array<Array<Int64>>(rows,repeat:[0]);
            for (i in 0..rows) {
                cov[i] = Array<Int64>(rows,repeat:0);
            }
            for (i in 0..rows) {
                for (j in i..rows){
                    s = 0;
                    for (k in 0..cols) {
                        s += (matrix[j][k] - means[j]) * (matrix[i][k] - means[i]);
                    }
                    s /= newDivisor.getOrThrow();
                    cov[i][j] = s;
                    cov[j][i] = s;
                }
            }
        } else {
            throw Exception("Invalid dimension'")
        }
        return cov;
    }

    func correlation(matrix: Array<Array<Int64>>): Array<Array<Int64>>{
        let means =  mean(matrix, Option<Int64>.None)
        let standardDeviations = standardDeviation(matrix, means,true)
        let scores = zScores(matrix, means, standardDeviations)
        let rows = matrix.size
        let cols: Int64 = matrix[0].size

        var cor: Array<Array<Int64>> = Array<Array<Int64>>(cols,repeat:[0]);
        for (i in 0..cols) {
            cor[i] =  Array<Int64>(cols,repeat:0);
        }
        for (i in 0..cols) {
            for (j in i..cols) {
                var c = 0;
                for (k in 0..scores.size) {
                    c += scores[k][j] * scores[k][i];
                }
                c /= rows - 1;
                cor[i][j] = c;
                cor[j][i] = c;
            }
        }
        return cor;
    }

    func zScores(matrix:Array<Array<Int64>>, means: ?Array<Int64>, standardDeviations: ?Array<Float64>): Array<Array<Int64>> {
        var newStandardDeviations = standardDeviations
        var newMeans = means
        if (means.isNone())  {
            newMeans =  mean(matrix, Option<Int64>.None)
        }
        if (standardDeviations.isNone()) {
            newStandardDeviations = standardDeviation(matrix, newMeans,true);
        }

        return standardize(center(matrix, newMeans, false), newStandardDeviations, true);
    }

    func center(matrix: Array<Array<Int64>>,  means: ?Array<Int64>, inPlace: Bool): Array<Array<Int64>> {
        var newMeans = means
        if (means.isNone())  {
            newMeans = mean(matrix, Option<Int64>.None)
        }
        var result = matrix
        let l = matrix.size

        if (!inPlace) {
            result = Array<Array<Int64>>( l,repeat:[0]);
            for (i in 0..l) {
                result[i] =  Array<Int64>(matrix[i].size,repeat:0);
            }
        }

        for (i in 0..l) {
            var row = result[i];
            for (j in 0..row.size) {
                row[j] = matrix[i][j] - newMeans.getOrThrow()[j];
            }
        }
        return result;
    }

    func standardize(matrix:Array<Array<Int64>>, standardDeviations: ?Array<Float64>, inPlace: Bool): Array<Array<Int64>> {

        var newStandardDeviations = standardDeviations
        if (standardDeviations.isNone()) {
            newStandardDeviations = standardDeviation(matrix, Option<Array<Int64>>.None, Option<Bool>.None);
        }

        var result = matrix
        let l = matrix.size

        if (!inPlace) {
            result =  Array<Array<Int64>>(l,repeat:[0]);

            for (i in 0..l) {
                result[i] =  Array<Int64>(matrix[i].size,repeat:0);
            }
        }

        for (i in 0..l) {
            var resultRow = result[i];
            let sourceRow = matrix[i];
            for (j in 0..resultRow.size) {
                if (Int64(newStandardDeviations.getOrThrow()[j])!= 0 ) {
                    resultRow[j] = sourceRow[j] / Int64(newStandardDeviations.getOrThrow()[j]);
                }
            }
        }
        return result;
    }

    func weightedVariance(matrix: Array<Array<Int64>>, weights: Array<Int64>) :Array<Int64> {
        let means =  mean(matrix,Option<Int64>.None);
        let rows = matrix.size;
        if (rows == 0) {
            return []
        }
        let cols = matrix[0].size;
        var vari: Array<Int64> = Array<Int64>(cols,repeat:0);

        for (j in 0..cols) {
            var sum = 0
            var a = 0
            var b = 0

            for (i in 0..rows) {
                let z = matrix[i][j] - means[j];
                let w = weights[i];

                sum += w * (z * z);
                b += w;
                a += w * w;
            }

            vari[j] = sum * (b / (b * b - a));
        }

        return vari;
    }

    func weightedMean(matrix: Array<Array<Int64>>, weights: Array<Int64>, dimension: ?Int64) : Array<Int64> {
        var newDimension = dimension
        if (dimension.isNone()) {
            newDimension = 0
        }

        let rows = matrix.size;
        if (rows == 0) {
            return []
        }
        let cols: Int64 = matrix[0].size
        var means: Array<Int64>
        var w: Int64
        var row: Array<Int64>

        if (newDimension == 0) {
            means =  Array<Int64>(cols,repeat:0);
            for (i in 0..cols) {
                means[i] = 0;
            }
            for (i in 0..rows) {
                row = matrix[i];
                w = weights[i];
                for (j in 0..cols) {
                    means[j] += row[j] * w;
                }
            }
        } else if (newDimension == 1) {
            means = Array<Int64>(rows,repeat:0);
            for (i in 0..rows) {
                means[i] = 0;
            }
            for (j in 0..rows) {
                row = matrix[j];
                w = weights[j];
                for (i in 0..cols) {
                    means[j] += row[i] * w;
                }
            }
        } else {
            throw Exception("Invalid dimension")
        }

        let weightSum: Int64 = mlStatArray.sum(weights);
        if (weightSum != 0) {
            for (i in 0..means.size) {
                means[i] /= weightSum;
            }
        }
        return means;
    }


    func weightedCovariance(matrix: Array<Array<Int64>>,weights: Array<Int64>, means: ?Array<Int64>, dimension: ?Int64) : Array<Array<Int64>> {
        var newMeans = means
        var newDimension = dimension
        if (dimension.isNone()) {
            newDimension = 0
        }
        if (newMeans.isNone())  {
            newMeans = weightedMean(matrix, weights, dimension)
        }
        var s1 = 0
        var s2 = 0
        for (i in 0..weights.size) {
            s1 += weights[i];
            s2 += weights[i] * weights[i];
        }
        let factor = s1 / (s1 * s1 - s2);
        return  weightedScatter(matrix, weights, newMeans, factor, newDimension);
    }


    func weightedScatter(matrix: Array<Array<Int64>>,  weights:Array<Int64>,  means: ?Array<Int64>,  factor: ?Int64,  dimension: ?Int64): Array<Array<Int64>> {
        var newDimension = dimension
        var newMeans = means
        var newFactor = factor
        if (newDimension.isNone()) {
            newDimension  = 0
        }
        if (newMeans.isNone())  {
            newMeans =  weightedMean(matrix, weights, newDimension)
        }
        if (factor.isNone()) {
            newFactor = 1
        }
        let rows = matrix.size;
        if (rows == 0) {
            return Array<Array<Int64>>();
        }
        let cols = matrix[0].size
        var cov: Array<Array<Int64>>
        var s: Int64

        if (newDimension == 0) {
            cov =  Array<Array<Int64>>( cols,repeat:[0]);
            for (i in 0..cols) {
                cov[i] =  Array<Int64>( cols,repeat:0);
            }
            for (i in 0..cols) {
                for (j in i..cols) {
                    s = 0;
                    for (k in 0..rows) {
                        s += weights[k] * (matrix[k][j] - newMeans.getOrThrow()[j]) * (matrix[k][i] - newMeans.getOrThrow()[i]);
                    }
                    cov[i][j] = s * factor.getOrThrow();
                    cov[j][i] = s * factor.getOrThrow();
                }
            }
        } else if (newDimension == 1) {
            cov = Array<Array<Int64>>( rows,repeat:[0]);
            for (i in 0..rows) {
                cov[i] = Array<Int64>( rows,repeat:0);
            }
            for (i in 0..rows) {
                for (j in i..rows) {
                    s = 0;
                    for (k in 0..cols) {
                        s += weights[k] * (matrix[j][k] - newMeans.getOrThrow()[j]) * (matrix[i][k] - newMeans.getOrThrow()[i]);
                    }
                    cov[i][j] = s * newFactor.getOrThrow();
                    cov[j][i] = s * newFactor.getOrThrow();
                }
            }
        } else {

            throw Exception("Invalid dimension");
        }
        return cov;
    }
}

let mlStatMatrix = MlStatMatrixCls()

// ml-array-utils getEquallySpaced.js
class MlArrayUtilsGetEquallySpacedCls {

    func getEquallySpacedData(x: Array<Int64>, y:Array<Int64>,  options: ?MlOptions) : Array<Int64>{
        var newOptions = options
        var newX = x
        var newY = y

        if (x.size>1 && x[0]>x[1]) {
            newX = reversed(x)
            newY = reversed(y)
        }
        let xcount = x.size;
        if(xcount != y.size) {
            throw Exception("the x and y vector doesn't have the same size.")
        }
        var from1: Int64
        if (options.isNone()) {
            newOptions = MlOptions()
        }
        if (newOptions?.from1 == 0) {
            from1 = Int64(x[0])
        }else {
            from1 = newOptions.getOrThrow().from1
        }
        var to : Int64
        if( newOptions?.to == 0){
          to = newX [newX.size - 1]
        }else{
          to =  newOptions.getOrThrow().to
        }
        let reverse = from1 > to;
        if(reverse) {
            let temp = from1;
            from1 = to;
            to = temp;
        }
        let numberOfPoints:Int64
        if(newOptions.getOrThrow().numberOfPoints == 0){
            numberOfPoints = MLINDEX_BYTES_NUM_100
        }else{
            numberOfPoints = newOptions.getOrThrow().numberOfPoints
        }
        let algorithm : String
        if(newOptions.getOrThrow().variant == "slot"){
            algorithm = "slot"
        }else{
            algorithm = "smooth"
        }

        let output: Array<Int64>

        if(algorithm == "slot"){
            output = getEquallySpacedSlot(newX, newY, Float64(from1), Float64(to), numberOfPoints)
        }else{
            output =getEquallySpacedSmooth(newX, newY, Float64(from1), Float64(to), numberOfPoints)
        }

        if (reverse) {
            return reversed(output)
        }else {
            return output
        }
    }

    func getSlope(x0: Int64, y0: Int64, x1: Int64,  y1: Int64): Int64 {
        return (y1 - y0) / (x1 - x0);
    }

    func getEquallySpacedSmooth( x: Array<Int64>, y: Array<Int64>, from1: Float64,to: Float64,  numberOfPoints: ?Int ) : Array<Int64> {
        let xLength = x.size;
        let step = (to - from1) / Float64(numberOfPoints.getOrThrow() - 1);
        let halfStep = step / Float64(MLINDEX_BYTES_NUM_2);

        let start = from1 - halfStep;
        var output: Array<Int64> =  Array<Int64>(numberOfPoints.getOrThrow(),repeat:0);

        let initialOriginalStep = x[1] - x[0];
        let lastOriginalStep = x[x.size - 1] - x[x.size - MLINDEX_BYTES_NUM_2];

        var min = start;
        var max = start + step;

        var previousX = Int64.Min;
        var previousY = 0;
        var nextX = x[0] - initialOriginalStep;
        var nextY = 0;

        var currentValue = 0;
        var slope = 0;
        var intercept = 0;
        var sumAtMin = 0;
        var sumAtMax = 0;

        var i = 0;
        var j = 0;
        let mainWhile = true
    while(mainWhile) {
        while (nextX - Int64(max) >= 0) {
            // no overlap with original point, just consume current value
            let add = integral(0.0, Float64(Int64(max) - previousX), Float64(slope), Float64(previousY));
            sumAtMax = currentValue + add;

            output[j] = (sumAtMax - sumAtMin) / Int64(step);
            j += 1;

            if (j == numberOfPoints.getOrThrow()) {
                break;
            }
            min = max;
            max += step;
            sumAtMin = sumAtMax;
        }

        if(previousX <= Int64(min) && Int64(min) <= nextX) {
            let add = integral(0.0, Float64(Int64(min) - previousX), Float64(slope), Float64(previousY));
            sumAtMin = currentValue + add;
        }

        currentValue += integral(Float64(previousX), Float64(nextX), Float64(slope), Float64(intercept));

        previousX = nextX;
        previousY = nextY;
        if (i < xLength) {
            nextX = x[i];
            nextY = y[i];
            i += 1;
        } else if (i == xLength) {
            nextX += lastOriginalStep;
            nextY = 0;
        }
        // updating parameters
        slope = getSlope(previousX, previousY, nextX, nextY);
        intercept = -slope*previousX + previousY;
    }

        return output;
    }

    func getEquallySpacedSlot( x: Array<Int64>,  y: Array<Int64>, from1: Float64,  to: Float64,numberOfPoints: Int64) : Array<Int64> {
        let xcount = x.size;
        let step = (to - from1) / Float64(numberOfPoints - 1);
        let halfStep = step / Float64(MLINDEX_BYTES_NUM_2);
        let lastStep = x[x.size - 1] - x[x.size - MLINDEX_BYTES_NUM_2];

        let start = from1 - halfStep;
        var output:Array<Int64> =  Array<Int64>(numberOfPoints,repeat:0);

        // Init main variables
        var min = start;
        var max = start + step;

        var previousX = -Int64.Max;
        var previousY = 0;
        var nextX = x[0];
        var nextY = y[0];
        var frontOutsideSpectra = 0;
        var backOutsideSpectra = true;

        var currentValue = 0;

        // for slot algorithm
        var currentPoints = 0;

        var i = 1; // index of input
        var j = 0; // index of output
        let mainWhile = true
     while(mainWhile) {
        if (previousX >= nextX) {
            throw Exception("x must be an increasing serie")
        }
        while (previousX - Int64(max) > 0) {
            if (backOutsideSpectra) {
                currentPoints += 1;
                backOutsideSpectra = false;
            }
            output[j] = 0
            if(currentPoints > 0){currentValue / currentPoints}
            j += 1;

            if (j == numberOfPoints) {
                break ;
            }

            min = max;
            max += step;
            currentValue = 0;
            currentPoints = 0;
        }

        if (previousX > Int64(min)) {
            currentValue += previousY;
            currentPoints += 1;
        }

        if (previousX == -Int64.Max || frontOutsideSpectra > 1) {
            currentPoints -= 1;
        }

        previousX = nextX;
        previousY = nextY;
        if (i < xcount) {
            nextX = x[i];
            nextY = y[i];
            i += 1;
        } else {
            nextX += lastStep;
            nextY = 0;
            frontOutsideSpectra += 1;
        }
    }
        return output;
    }

    func integral(x0: Float64, x1: Float64,  slope: Float64,  intercept: Float64): Int64 {
        return Int64( (MLINDEX_BYTES_NUM_05 * slope * x1 * x1) + (intercept * x1) -  (MLINDEX_BYTES_NUM_05 * slope * x0 * x0) + (intercept * x0))
    }
}
let mlArrayUtilsGetEquallySpaced = MlArrayUtilsGetEquallySpacedCls()

// ml-array-utils ArrayUtils.js
class MlArrayUtilsCls {

    func getEquallySpacedData(x: Array<Int64>,  y: Array<Int64>, options: ?MlOptions) : Array<Int64> {
        return mlArrayUtilsGetEquallySpaced.getEquallySpacedData(x, y, options)
    }

    func SNV(data: Array<Int64>): Array<Int64> {
        let mean = mlStatArray.mean(data);
        let std = mlStatArray.standardDeviation(data, Option<Bool>.None);
        var result = data;
        for (i in 0..data.size) {
            result[i] = Int64((Float64(result[i]) - mean) / std);
        }
        return result;
    }
}
let mlArrayUtils = MlArrayUtilsCls()

// ml-array-utils snv.js
class MlArrayUtilsSNVCls {
    func SNV(data: Array<Int64>) :Array<Int64> {
        let mean = mlStatArray.mean(data);
        let std = mlStatArray.standardDeviation(data,Option<Bool>.None);
        var result = data;
        for (i in 0..data.size) {
            result[i] = Int64((Float64(result[i]) - mean) / std);
        }
        return result;
    }
}
let mlArrayUtilsSNV = MlArrayUtilsSNVCls()

// ml-matrix src/util.js
class MlMatrixUtilCls {

    func checkRowIndex(matrix: Matrix, index: Int64,outer: Bool) {
        let max:Int64
        if(outer){
            max = matrix.rows
        } else{
            max =  matrix.rows - 1
        }
        if (index < 0 || index > max) {
            throw Exception("Row index out of range");
        }
    }
    func checkColumnIndex(matrix: Matrix, index: Int64,outer: Bool) {
        let max:Int64
        if(outer){
            max = matrix.columns
        } else{
            max =  matrix.columns - 1
        }
        if (index < 0 || index > max) {
            throw Exception("Column index out of range");
        }
    }
    func checkRowVector( matrix: Matrix, vector: Any) : Array<Float64> {
        if((vector as Matrix).isSome()){
            return (vector as Matrix).getOrThrow().to1DArray()
        }
        if((vector as Array<Any>).isSome()){
            if((vector as Array<Any>).getOrThrow().size != matrix.columns){
                throw Exception("vector size must be the same as the number of columns");
            }
        }
        return (vector as Array<Float64>).getOrThrow();
    }

    func checkColumnVector( matrix: Matrix,  vector: Any): Array<Float64> {
        if((vector as Matrix).isSome()){
            return (vector as Matrix).getOrThrow() .to1DArray()
        }
        if((vector as Array<Any>).isSome()){
            if((vector as Array<Any>).getOrThrow().size != matrix.rows){
                throw Exception("vector size must be the same as the number of rows");
            }
        }
        return (vector as Array<Float64>).getOrThrow();
    }

    func checkIndices( matrix: Matrix,  rowIndices:Array<Int64> , columnIndices: Array<Int64> ): (row:Array<Int64> ,column: Array<Int64> ) {
        let rowOut = rowIndices |> any<Int64> { index => index < 0 || index >= matrix.rows }
        let columnOut = columnIndices |> any<Int64> { index => index < 0 || index >= matrix.columns }

        if (rowOut || columnOut) {
            throw Exception  ("Indices are out of range")
        }
        return (rowIndices,columnIndices)
    }

    func checkRange(matrix: ?Matrix, startRow: ?Int64, endRow: ?Int64, startColumn: ?Int64,  endColumn: ?Int64)  {
        if (matrix.isNone() || startRow.isNone()  || endRow.isNone()  || startColumn.isNone()  || endColumn.isNone() ) {
            throw Exception("Invalid argument type")
        }

    }

    func getRange( from1: Int64,  to: Int64) : Array<Int64>  {
        var arr = Array<Int64>(to - from1 + 1,repeat:0);
        for (i in 0..arr.size) {
            arr[i] = from1 + i;
        }
        return arr;
    }
    func sumByRow( matrix: Matrix) :Matrix {
        let sum = Matrix.zeros(matrix.rows, 1);
        for (i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                _ = sum.set(i, 0,  sum.get(i, 0) + matrix.get(i, j));
            }
        }
        return sum;
    }

    func sumByColumn( matrix: Matrix): Matrix {
        let sum = Matrix.zeros(1, matrix.columns);
        for (i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                _ = sum.set(0, j,  sum.get(0, j) +  matrix.get(i, j));
            }
        }
        return sum;
    }

    func sumAll( matrix: Matrix) : Float64 {
        var v = 0.0;
        for (i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                v +=  matrix.get(i, j);
            }
        }
        return v;
    }
}
let mlMatrixUtil = MlMatrixUtilCls()

// ml-matrix src/dc/util.js
class MlMatrixDCUtilCls {

    func hypotenuse( a: Float64,  b: Float64) : Float64 {
        var r: Float64;
        if (abs(a) > abs(b)) {
            r = b / a
            return abs(a) * sqrt(Float64(1.0 + r * r));
        }
        if (b != 0.0) {
            r =  a / b;
            return abs(b) * sqrt(Float64(1.0 + r * r));
        }
        return 0.0
    }
  
    func getEmpty2DArray( rows: Int64,  columns: Int64) :Array<Array<Float64>> {
        var array = Array<Array<Float64>>(rows,repeat: [0.0])
        for (i in 0..rows) {
            array[i] = Array<Float64>(columns,repeat:0.0)
        }
        return array;
    };


    func getFilled2DArray( rows: Int64,  columns: Int64, value: Float64) :Array<Array<Float64>> {
        var array: Array<Array<Float64>> =Array<Array<Float64>>(rows,repeat: [0.0])
        for (i  in 0..rows) {
            array[i] = Array<Float64>(columns,repeat:0.0)
            for (j in 0..columns) {
                array[i][j] = value
            }
        }
        return array;
    };

}
let mlMatrixDCUtil = MlMatrixDCUtilCls()

// ml-matrix src/dc/lu.js
class MlMatrixDCLU {

    var lu: Matrix
    var matrix: Matrix
    var pivotVector: Array<Int64> = []
    var pivotSign: Float64 = 0.0

    init(matrix: Matrix ) {
        var newMatrix = matrix
        newMatrix = Matrix.checkMatrix(matrix);
        this.matrix = newMatrix
        let lu = newMatrix.clone()
        let rows = lu.rows
        let columns = lu.columns
        var pivotVector = Array<Int64>(rows,repeat:0)
        var pivotSign: Float64 = 1.0
        var p: Int64
        var s: Float64
        var t: Float64
        var v: Int64
        var luRowi: Array<Float64>
        var luColj: Array<Float64>
        var kmax: Int64

        for (i in 0..rows) {
            pivotVector[i] = i;
        }
        luColj = Array<Float64>(rows,repeat:0.0)
        for (j in 0..columns) {
            for (i in 0..rows) {
                luColj[i] = lu.get(i, j)
            }
            for (i in 0..rows) {
                luRowi = lu.getRow(i);
                kmax = min(i, j);
                s = 0.0;
                for (k in 0..kmax){
                    s += luRowi[k] * luColj[k];
                }
                luColj[i] = luColj[i] - s


                luRowi[j] = luColj[i]
            }

            p = j;
            for (i in j+1..rows) {
                if (abs(luColj[i]) > abs(luColj[p])) {
                    p = i;
                }
            }

            if (p != j) {
                for (k in 0..columns) {
                    t = lu.get(p, k)
                    _ = lu.set(p, k, lu.get(j, k))
                    _ = lu.set(j, k, t)
                }

                v = pivotVector[p];
                pivotVector[p] = pivotVector[j];
                pivotVector[j] = v;

                pivotSign = -pivotSign;
            }

            if (j < rows && lu.get(j, j) != 0.0) {
                for (i in j+1..rows) {
                    _ = lu.set(i, j, lu.get(i, j) / lu.get(j, j))
                }
            }
        }

        this.lu = lu;
        this.pivotVector = pivotVector;
        this.pivotSign = pivotSign;
    }

    func isSingular() : Bool {
        let data = this.lu
        let col = data.columns
        for (j in 0..col) {
            if (data.get(j, j) == 0.0) {
                return true;
            }
        }
        return false;
    }

    func determinant(): Float64 {
        let data = this.lu;
        if (!data.isSquare()) {
            throw Exception("Matrix must be square")
        }
        var determinant = this.pivotSign
        let col = data.columns
        for (j in 0..col) {
            determinant *= data.get(j, j)
        }
        return determinant;
    }

    func lowerTriangularMatrix(): Matrix {
        let data = this.lu
        let rows = data.rows
        let columns = data.columns
        let x = Matrix(rows,columns)
        for (i in 0..rows) {
            for (j in 0..columns) {
                if (i > j) {
                    _ = x.set(i, j, data.get(i, j))
                } else if (i == j) {
                    _ = x.set(i, j, 1.0)
                } else {
                    _ = x.set(i, j, 0.0)
                }
            }
        }
        return x;
    }
    func upperTriangularMatrix() : Matrix {
        let data = this.lu
        let rows = data.rows
        let columns = data.columns
        let  X =   Matrix(rows, columns)
        for (i in 0..rows) {
            for (j in 0..columns) {
                if (i <= j) {
                    _ = X.set(i, j, data.get(i, j))
                } else {
                    _ = X.set(i, j, 0.0)
                }
            }
        }
        return X;
    }

    func pivotPermutationVector() : Array<Int64> {
        return this.pivotVector
    }

    func solve( val: Matrix): Matrix {
        var value = Matrix.checkMatrix(val);

        let lu = this.lu
        let rows = lu.rows

        if (rows != value.rows) {
            throw Exception( "Invalid matrix dimensions")
        }
        if (isSingular()) {
            throw Exception("LU matrix is singular")
        }

        let count = value.columns;
        let X =  value.subMatrixRow(this.pivotVector, 0, count - 1);
        let columns = lu.columns;

        for (k in 0..columns) {
            for (i  in k+1..columns) {
                for (j in 0..count) {
                    _ = X.set(i, j, X.get(i, j) - X.get(k, j) * lu.get(i, k))
                }
            }
        }
        for (k in columns-1..0) {
            for (j in 0..count) {
                _ = X.set(k, j, X.get(k, j) / lu.get(k, k))
            }
            for (i in 0..k) {
                for (j in 0..count) {
                    _ = X.set(i, j, X.get(i, j) - X.get(k, j) * lu.get(i, k))
                }
            }
        }
        return X;
    }
}

// ml-matrix src/dc/svd.js
class MlMatrixDCSVD {

    var m: Int64 = 0
    var n: Int64 = 0
    var s: Array<Float64>
    var u: ?Any
    var v: ?Any

    init(val: Matrix, options: MlOptions) {

        var value = Matrix.checkMatrix(val);
        var m = value.rows
        var n = value.columns
        let nu = min(m, n)

        var wantu = true
        var wantv = true
        if (options.computeLeftSingularVectors == false) {
            wantu = false
        }
        if (options.computeRightSingularVectors == false) {
            wantv = false
        }
        let autoTranspose = options.autoTranspose == true;

        var swapped = false;
        var a: Matrix;
        if (m < n) {
            if (!autoTranspose) {
                a = value.clone();
                // eslint-disable-next-line no-console
                println("Computing SVD on a matrix with more columns than rows. Consider enabling autoTranspose")
            } else {
                a = value.transpose();
                m = a.rows;
                n = a.columns;
                swapped = true;
                let aux = wantu;
                wantu = wantv;
                wantv = aux;
            }
        } else {
            a = value.clone();
        }
        var s = Array<Float64>(min(m+1, n),repeat:0.0)
        var u = mlMatrixDCUtil.getFilled2DArray(m, nu, 0.0)
        var v = mlMatrixDCUtil.getFilled2DArray(n, n, 0.0)
        var e =  Array<Float64>(n,repeat:0.0)
        var work =  Array<Float64>(m,repeat:0.0)

        let nct = min(m - 1, n)
        let nrt = max(0, min(n - MLINDEX_BYTES_NUM_2, m))

        var p: Int64
        var t: Float64
        var f: Float64
        var cs: Float64
        var sn: Float64
        var kase: Int64
        var scale: Float64
        var sp: Float64
        var spm1: Float64
        var epm1: Float64
        var sk: Float64
        var ek: Float64
        var b: Float64
        var c: Float64
        var shift: Float64
        var g: Float64
        for (k in 0..max(nct, nrt)) {
            if (k < nct) {
                s[k] = 0.0;
                for (i in k..m) {
                    s[k] = mlMatrixDCUtil.hypotenuse(s[k], a.get(i, k));
                }
                if (s[k] != 0.0) {
                    if (a.get(k, k) < 0.0) {
                        s[k] = -s[k];
                    }
                    for (i in k..m) {
                        _ = a.set(i, k, a.get(i, k) / s[k])
                    }
                    _ = a.set(k, k, a.get(k, k) + 1.0)
                }
                s[k] = -s[k];
            }
            for (j in k+1..n) {
                if (k < nct && s[k] != 0.0) {
                    t = 0.0;
                    for (i in k..m) {
                        t += a.get(i, k) * a.get(i, j)
                    }
                    t = -t / a.get(k, k)
                    for (i in k..m ){
                        _ = a.set(i, j, a.get(i, j) + t * a.get(i, k))
                    }
                }
                e[j] = a.get(k,j)
            }

            if (wantu && k < nct) {
                for (i in k..m) {
                    u[i][k] = a.get(i, k)
                }
            }

            if (k < nrt) {
                e[k] = 0.0;
                for (i in k+1..n) {
                    e[k] =  mlMatrixDCUtil.hypotenuse(e[k], e[i]);
                }
                if (e[k] != 0.0) {
                    if (e[k + 1] < 0.0) {
                        e[k] = 0.0 - e[k];
                    }
                    for (i in k+1..n) {
                        e[i] /= e[k];
                    }
                    e[k + 1] += 1.0;
                }
                e[k] = -e[k];
                if (k + 1 < m && e[k] != 0.0) {
                    for (i in k+1..m) {
                        work[i] = 0.0;
                    }
                    for (j in k+1..n) {
                        for (i in k+1..m) {

                            work[i] += e[j] * a.get(i, j)
                        }
                    }
                    for (j in k+1..n) {
                        t = -e[j] / e[k + 1];
                        for (i in k+1..m) {
                            _ = a.set(i, j, a.get(i, j) + t * work[i])
                        }
                    }
                }
                if (wantv) {
                    for (i in k+1..n) {
                        v[i][k] = e[i];
                    }
                }
            }
        }

        p = min(n, m + 1);
        if (nct < n) {
            s[nct] = a.get(nct, nct)
        }
        if (m < p) {
            s[p - 1] = 0.0;
        }
        if (nrt + 1 < p) {
            e[nrt] = a.get(nrt, p-1)
        }
        e[p - 1] = 0.0;

        if (wantu) {
            for (j in nct..nu) {
                for (i in 0..m) {
                    u[i][j] = 0.0;
                }
                u[j][j] = 1.0;
            }
            for (k in nct - 1..-1:-1){
                if (s[k] != 0.0) {
                    for (j in k+1..nu) {
                        t = 0.0;
                        for (i in k..m) {
                            t += u[i][k] * u[i][j];
                        }
                        t = -t / u[k][k];
                        for (i in k..m) {
                            u[i][j] += t * u[i][k];
                        }
                    }
                    for (i in k..m) {
                        u[i][k] = -u[i][k];
                    }
                    u[k][k] = 1.0 + u[k][k];
                    for (i in 0..k) {
                        u[i][k] = 0.0;
                    }
                } else {
                    for (i in 0..m) {
                        u[i][k] = 0.0;
                    }
                    u[k][k] = 1.0;
                }
            }
        }

        if (wantv) {
            for (k in n-1..-1:-1) {
                if (k < nrt && e[k] != 0.0) {
                    for (j in k+1..n) {
                        t = 0.0;
                        for (i in k+1..n) {
                            t += v[i][k] * v[i][j];
                        }
                        t = -t / v[k + 1][k];
                        for (i in k+1..n) {
                            v[i][j] += t * v[i][k];
                        }
                    }
                }
                for (i in 0..n) {
                    v[i][k] = 0.0;
                }
                v[k][k] = 1.0;
            }
        }

        let pp = p - 1
        var iter = 0
        let eps: Float64 = Float64(pow(Float64(MLINDEX_BYTES_NUM_2), Float64(MLINDEX_BYTES_NUM_52)))
        while (p > 0) {
            var k = p - MLINDEX_BYTES_NUM_2
            for (k in p - MLINDEX_BYTES_NUM_2..-1:-1) {
                if (k == -1) {
                    break;
                }
                if (abs(e[k]) <= (eps * (abs(s[k]) + abs(s[k + 1])))) {
                    e[k] = 0.0;
                    break;
                }
            }
            if (k == p - MLINDEX_BYTES_NUM_2) {
                kase = MLINDEX_BYTES_NUM_4;
            } else {
                let ks = p - 1
                for (ks in p-1..k-1:-1) {
                    if (ks == k) {
                        break;
                    }
                    var t1 = 0.0
                    var t2 = 0.0
                    if(ks != p){
                        t1 =  abs(e[ks])
                    }
                    if(ks != k + 1){
                        t2 = abs(e[ks - 1])
                    }
                    t = t1+t2
                    if (abs(s[ks]) <= eps * t) {
                        s[ks] = 0.0;
                        break;
                    }
                }

                if (ks == k) {
                    kase = MLINDEX_BYTES_NUM_3;
                } else if (ks == p - 1) {
                    kase = 1;
                } else {
                    kase = MLINDEX_BYTES_NUM_2;
                    k = ks;
                }
            }

            k += 1;

            match (kase) {
            case 1 =>
                f = e[p - MLINDEX_BYTES_NUM_2];
                e[p - MLINDEX_BYTES_NUM_2] = 0.0;
                for (j in p - MLINDEX_BYTES_NUM_2..k-1:-1) {
                    t =  mlMatrixDCUtil.hypotenuse(s[j], f);
                    cs = s[j] / t;
                    sn = f / t;
                    s[j] = t;
                    if (j != k) {
                        f = -sn * e[j - 1];
                        e[j - 1] = cs * e[j - 1];
                    }
                    if (wantv) {
                        for (i in 0..n) {
                            t = cs * v[i][j] + sn * v[i][p - 1];
                            v[i][p - 1] = -sn * v[i][j] + cs * v[i][p - 1];
                            v[i][j] = t;
                        }
                    }
                }

            case MLINDEX_BYTES_NUM_2 =>
                f = e[k - 1];
                e[k - 1] = 0.0;
                for (j in k..p) {
                    t = mlMatrixDCUtil.hypotenuse(s[j], f);
                    cs = s[j] / t;
                    sn = f / t;
                    s[j] = t;
                    f = -sn * e[j];
                    e[j] = cs * e[j];
                    if (wantu) {
                        for (i in 0..m) {
                            t = cs * u[i][j] + sn * u[i][k - 1];
                            u[i][k - 1] = -sn * u[i][j] + cs * u[i][k - 1];
                            u[i][j] = t;
                        }
                    }
                }

            case MLINDEX_BYTES_NUM_3 =>
                scale = max(
                    max(
                        max(
                            max(abs(s[p - 1]), abs(s[p - MLINDEX_BYTES_NUM_2])),
                            abs(e[p - MLINDEX_BYTES_NUM_2])
                        ),
                        abs(s[k])
                    ),
                    abs(e[k])
                )
                sp = s[p - 1] / scale;
                spm1 = s[p - MLINDEX_BYTES_NUM_2] / scale;
                epm1 = e[p - MLINDEX_BYTES_NUM_2] / scale;
                sk = s[k] / scale;
                ek = e[k] / scale;
                b = ((spm1 + sp) * (spm1 - sp) + epm1 * epm1) / Float64(MLINDEX_BYTES_NUM_2);
                c = sp * epm1 * (sp * epm1);
                shift = 0.0;
                if (b != 0.0 || c != 0.0) {
                    shift = sqrt(Float64(b * b + c));
                    if (b < 0.0) {
                        shift = -shift;
                    }
                    shift = c / (b + shift);
                }
                f = (sk + sp) * (sk - sp) + shift;
                g = sk * ek;
                for (j in k..p-1) {
                    t = mlMatrixDCUtil.hypotenuse(f, g);
                    cs = f / t;
                    sn = g / t;
                    if (j != k) {
                        e[j - 1] = t;
                    }
                    f = cs * s[j] + sn * e[j];
                    e[j] = cs * e[j] - sn * s[j];
                    g = sn * s[j + 1];
                    s[j + 1] = cs * s[j + 1];
                    if (wantv) {
                        for (i in 0..n) {
                            t = cs * v[i][j] + sn * v[i][j + 1];
                            v[i][j + 1] = -sn * v[i][j] + cs * v[i][j + 1];
                            v[i][j] = t;
                        }
                    }
                    t = mlMatrixDCUtil.hypotenuse(f, g);
                    cs = f / t;
                    sn = g / t;
                    s[j] = t;
                    f = cs * e[j] + sn * s[j + 1];
                    s[j + 1] = -sn * e[j] + cs * s[j + 1];
                    g = sn * e[j + 1];
                    e[j + 1] = cs * e[j + 1];
                    if (wantu && j < m - 1) {
                        for (i in 0..m) {
                            t = cs * u[i][j] + sn * u[i][j + 1];
                            u[i][j + 1] = -sn * u[i][j] + cs * u[i][j + 1];
                            u[i][j] = t;
                        }
                    }
                }
                e[p - MLINDEX_BYTES_NUM_2] = f;
                iter = iter + 1;

            case MLINDEX_BYTES_NUM_4 =>
                if (s[k] <= 0.0) {
                    if(s[k] < 0.0) {
                        s[k] = -s[k]
                    }else{
                        s[k] = 0.0
                    }
                    if (wantv) {
                        for (i in 0..pp+1) {
                            v[i][k] = -v[i][k];
                        }
                    }
                }
                while (k < pp) {
                    if (s[k] >= s[k + 1]) {
                        break;
                    }
                    t = s[k];
                    s[k] = s[k + 1];
                    s[k + 1] = t;
                    if (wantv && k < n - 1) {
                        for (i in 0..n) {
                            t = v[i][k + 1];
                            v[i][k + 1] = v[i][k];
                            v[i][k] = t;
                        }
                    }
                    if (wantu && k < m - 1) {
                        for (i in 0..m) {
                            t = u[i][k + 1];
                            u[i][k + 1] = u[i][k];
                            u[i][k] = t;
                        }
                    }
                    k += 1;
                }
                iter = 0;
                p -= 1;

            }
        }

        if (swapped) {
            let tmp = v;
            v = u;
            u = tmp;
        }

        this.m = m;
        this.n = n;
        this.s = s;
        this.u = u;
        this.v = v;
    }
    func condition() :Float64 {
        return this.s[0] / this.s[min(this.m, this.n) - 1];
    }
    func norm2() :Float64 {
        return this.s[0];
    }
    func rank() : Float64 {
        let eps: Float64 = pow(Float64(MLINDEX_BYTES_NUM_2), Float64(MLINDEX_BYTES_NUM_52))
        let tol: Float64 = Float64(max(m, n)) * this.s[0] * eps
        var  r: Float64 = 0.0
        let  s = this.s
        for (i in 0..s.size) {
            if (s[i] > tol) {
                r += 1.0;
            }
        }
        return r;
    }
    func diagonal() : Array<Float64> {
        return this.s;
    }
    func threshold(): Float64 {
        return pow(Float64(MLINDEX_BYTES_NUM_2), Float64(MLINDEX_BYTES_NUM_52)) / Float64(MLINDEX_BYTES_NUM_2) * Float64(max(this.m, this.n)) * this.s[0];
    }
    func leftSingularVectors() : Any {
        if (!Matrix.isMatrix(this.u)) {
            return  Matrix(this.u,Option<Int64>.None);
        }
        return this.u as Any;
    }

    func rightSingularVectors() :Any {
        if (!Matrix.isMatrix(this.v)) {
            return Matrix(this.v,Option<Int64>.None);
        }
        return this.v as Any
    }
    func diagonalMatrix() : Matrix {
        return Matrix.diagStatic(this.s,Option<Int64>.None,Option<Int64>.None);
    }
    func solve( value: Matrix) : Matrix {
        let y = value
        let e = this.threshold()
        let scols = this.s.size
        let ls = Matrix.zeros(scols, scols)
        for (i in 0..scols) {
            if (abs(this.s[i]) <= e) {
                _ = ls.set(i, i, 0.0)
            } else {
                _ = ls.set(i, i, 1.0/this.s[i])
            }
        }

        let u = (this.u as Array<Array<Float64>>).getOrThrow();
        var v = Option<Matrix>.None
        if((this.rightSingularVectors() as Matrix).isSome()){
            v = (this.rightSingularVectors() as Matrix).getOrThrow()
        }

        let vl =v.getOrThrow().mmul(ls)
        let vrows = v.getOrThrow().rows
        let urows = u.size
        let vlu = Matrix.zeros(vrows, urows)
        var sum: Float64

        for (i in 0..vrows) {
            for (j in 0..urows) {
                sum = 0.0;
                for  (k in 0..scols) {
                    sum += vl.get(i, k)  * u[j][k];
                }
                _ = vlu.set(i, j, sum)
            }
        }

        return  vlu.mmul(y);
    }
    func solveForDiagonal ( value: Array<Float64>) : Matrix {
        return this.solve(Matrix.diagStatic(value, Option<Int64>.None,Option<Int64>.None));
    }

    func inverse () : Matrix {
        let V = (this.v as Array<Float64>).getOrThrow()
        let e = this.threshold()
        let vrows = V.size
        let vcols = V.size
        let X = Matrix(vrows, this.s.size)


        for (i in 0..vrows) {
            for (j in 0..vcols) {
                if (abs(this.s[j]) > e) {
                    _ = X.set(i, j, V[i] / this.s[j])
                } else {
                    _ = X.set(i, j, 0.0)
                }
            }
        }

        let U = (this.u as Array<Array<Float64>>).getOrThrow();

        let urows = U.size
        let ucols = U[0].size
        let Y = Matrix(vrows, urows)
        var sum: Float64

        for (i in 0..vrows) {
            for (j in 0..urows) {
                sum = 0.0;
                for (k in 0..ucols) {

                    sum += X.get(i, k) * U[j][k] ;
                }
                _ = Y.set(i, j, sum)
            }
        }
        return Y;
    }
}

// ml-matric src/decompositions.js
class MlMatrixDecompositionsCls {
    func inverse( mat: Matrix) : Matrix {
        var matrix = Matrix.checkMatrix(mat);
        return solve(matrix, Matrix.eye(matrix.rows,Option<Int64>.None, Option<Float64>.None));
    }
    func solve( leftHand: Matrix, rightHand: Matrix) :Matrix {
        var leftHandSide = Matrix.checkMatrix(leftHand);
        var rightHandSide = Matrix.checkMatrix(rightHand);
        if (leftHandSide.isSquare()) {
            return MlMatrixDCLU(leftHandSide).matrix.solve(rightHandSide)
        }else {
            return  MlMatrixDCQR(leftHandSide).solve(rightHandSide)
        }
    }
}
let mlMatrixDecompositions = MlMatrixDecompositionsCls()

class MlArrayUtilsArrayUtilsCls {

    func coordArrayToPoints( array: Array<Any>,  dimensions: Int64): Array<Any> {
        if (array.size % dimensions != 0) {
            throw Exception ("Dimensions number must be accordance with the size of the array.")
        }
        let count = array.size / dimensions
        var pointsArr: Array<?Any>= Array(count,repeat:Option<Any>.None)
        var k = 0
        for (i in 0..array.size:dimensions) {
            var point:Array<?Any> = Array(dimensions,repeat:Option<Any>.None)
            for (j in 0..dimensions) {
                point[j] = array[i + j]
            }
            pointsArr[k] = point
            k += 1
        }
        return (pointsArr as Array<Any>).getOrThrow()
    }

    func coordArrayToCoordMatrix(array: Array<Any>,  dimensions: Int64): Array<Array<Int64>> {
        if (array.size % dimensions != 0) {
            throw Exception("Dimensions number must be accordance with the size of the array.")
        }

        var coordinatesArray = Array(dimensions,repeat:[0])
        let points = array.size / dimensions
        for (i in 0..coordinatesArray.size) {
            coordinatesArray[i] = Array( points,repeat:0)
        }
        for (i in 0..array.size:dimensions){
            for (j in 0..dimensions) {
                let currentPoint = Int64(floor(Float64(i / dimensions)))
                coordinatesArray[j][currentPoint] = (array[i + j] as Int64).getOrThrow()
            }
        }

        return coordinatesArray
    }

    func coordMatrixToCoordArray( coordMatrix: Array<Array<Int64>>) : Array<Int64> {
        var coodinatesArray = Array(coordMatrix.size * coordMatrix[0].size,repeat:0);
        var k = 0;
        for (i in 0..coordMatrix[0].size) {
            for (j in 0..coordMatrix.size) {
                coodinatesArray[i] = coordMatrix[j][i]
                k += 1
            }
        }

        return coodinatesArray
    }

    func transpose(matrix:Array<Array<Int64>>) : Array<Array<Int64>> {
        var resultMatrix = Array( matrix[0].size,repeat:[0])
        for (i in 0..resultMatrix.size) {
            resultMatrix[i] = Array(matrix.size,repeat:0)
        }

        for (i in 0..matrix.size) {
            for (j in 0..matrix[0].size) {
                resultMatrix[j][i] = matrix[i][j];
            }
        }

        return resultMatrix;
    }

    func pointsToCoordArray( points: Array<Array<Int64>> ) :Array<Int64> {
        var coodinatesArray = Array(points.size * points[0].size,repeat:0)
        var k = 0
        for (i in 0..points.size) {
            for (j in 0..points[0].size) {
                coodinatesArray[k] = points[i][j]
                k += 1
            }
        }

        return coodinatesArray
    }

    func applyDotProduct( firstVector: Array<Int64>,  secondVector: Array<Int64>):Array<Int64> {
        var largestVector: Array<Int64>
        var smallestVector: Array<Int64>
        if (firstVector.size <= secondVector.size) {
            smallestVector = firstVector;
            largestVector = secondVector;
        } else {
            smallestVector = secondVector;
            largestVector = firstVector;
        }

        let difference = largestVector.size - smallestVector.size + 1;
        var dotProductApplied = Array( difference,repeat:0);

        for (i in 0..difference) {
            var sum = 0;
            for (j in 0..smallestVector.size) {
                sum += smallestVector[j] * largestVector[i + j];
            }
            dotProductApplied[i] = sum;
        }

        return dotProductApplied;
    }

    func scale( input: Array<Float64> ,  options: MlOptions) : Any {
        var y: Array<Float64>
        if (options.inPlace) {
            y = input
        }else {
            y = Array(input.size,repeat:0.0)
        }
        return y
    }

}
let mlArrayUtilsArrayUtils = MlArrayUtilsArrayUtilsCls()

// ml-matrix src/abstractMatrix.js
open class Matrix {

    var rows: Int64 = 0

    var columns: Int64 = 0

    var array: Array<Array<Float64>>

    init( nRows: ?Any, nColumns: ?Int64) {
        if ((nRows.getOrThrow() as Matrix).isSome()) {
            var n = (nRows.getOrThrow() as Matrix).getOrThrow()
            array = n.array
            rows = n.rows
            columns = n.columns
        } else if ( ( nRows.getOrThrow() as Int64).isSome() &&  (nRows.getOrThrow() as Int64).getOrThrow() > 0) {
            var n = (nRows.getOrThrow() as Int64).getOrThrow()
            array = Array<Array<Float64>>(n,repeat:[0.0])
            if (nColumns.isSome() && nColumns.getOrThrow() > 0) {
                for (i in 0..n) {
                    array[i] = Array(nColumns.getOrThrow(),repeat:0.0)
                }
                rows = n
                columns = nColumns.getOrThrow()
            } else {
                throw Exception ("nColumns must be a positive integer")
            }
        } else if  ((nRows.getOrThrow() as Array<Array<Float64>>).isSome() && (nRows.getOrThrow() as Array<Array<Float64>>).getOrThrow().size > 0) {
            var n = (nRows.getOrThrow() as Array<Array<Float64>>).getOrThrow()
            array = n
            rows = n.size
            columns = n[0].size
        } else {
            throw Exception("First argument must be a positive number or an array");
        }
    }
    public open func set( rowIndex: Int64,  columnIndex: Int64, value: Float64) {
        this.array[rowIndex][columnIndex] = value
        return this
    }

    public open func get(rowIndex: Int64,  columnIndex: Int64) : Float64 {
        return this.array[rowIndex][columnIndex]
    }

    func clone() : Matrix {
        let newMatrix = Matrix(rows, columns)
        for (row in 0..this.rows) {
            for (column in 0..this.columns) {
                _ = newMatrix.set(row, column, this.get(row, column))
            }
        }
        return newMatrix
    }

    static func from1DArray( newRows: Int64,  newColumns: Int64,  newData:Array<Float64>): Matrix {
        let length = newRows * newColumns
        if (length != newData.size) {
            throw Exception("Data length does not match given dimensions");
        }
        let newMatrix =  Matrix(newRows, newColumns);
        for (row in 0..newRows) {
            for (column in 0..newColumns) {
                _ = newMatrix.set(row, column, newData[row * newColumns + column])
            }
        }
        return newMatrix
    }

    static func rowVector( newData:Array<Float64>) : Matrix {
        let vector = Matrix(1, newData.size);
        for (i in 0..newData.size) {
            _ = vector.set(0, i, newData[i]);
        }
        return vector;
    }

    static func columnVector(newData: Array<Float64>):Matrix {
        let vector =  Matrix(newData.size, 1);
        for (i in 0..newData.size) {
            _ = vector.set(i, 0, newData[i]);
        }
        return vector
    }

    static func empty( rows: Int64,  columns: Int64):Matrix {
        return  Matrix(rows, columns)
    }

    static func zeros( rows: Int64,  columns: Int64) : Matrix {
        return empty(rows, columns).fill(0.0);
    }

    static func ones( rows: Int64, columns: Int64) : Matrix {
        return empty(rows, columns).fill(1.0)
    }

    static func rand( rows: Int64,  columns: Int64, rng:?Float64) : Matrix {
        var _ = Random().nextFloat64()
        if(rng.isSome()){
            _ = rng.getOrThrow()
        }
        let matrix = empty(rows, columns);
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = matrix.set(i, j, Random().nextFloat64());
            }
        }
        return matrix
    }

    static func randInt( rows: Int64,  columns: Int64, maxValue: ?Int64 ,rng: ?Float64) :Matrix {
        let maxV = maxValue ?? MLINDEX_BYTES_NUM_1000
        let matrix = empty(rows, columns);
        for (i in 0..rows) {
            for (j in 0..columns) {
                let value = floor(Random().nextFloat64() * Float64(maxV))
                _ = matrix.set(i, j, value)
            }
        }
        return matrix;
    }

    static func eye( rows: Int64, columns: ?Int64,  value: ?Float64) : Matrix {
        var newColumns = columns;
        var newValue = value;
        if (columns == Option<Int64>.None) {
            newColumns = rows
        }
        if (value == Option<Float64>.None) {
            newValue = 1.0
        }
        let min = min(rows, newColumns.getOrThrow());
        let matrix = zeros(rows, newColumns.getOrThrow());
        for (i in 0..min) {
            _ = matrix.set(i, i, newValue.getOrThrow());
        }
        return matrix;
    }

    static func diagStatic( data: Array<Float64>, rows: ?Int64,  columns: ?Int64): Matrix {
        var newRows = rows
        var newColumns = columns
        let l = data.size;
        if (rows == Option<Int64>.None) {
            newRows = l
        }
        if (columns == Option<Int64>.None) {
            newColumns = rows
        }
        var min1 = min(l, newRows.getOrThrow())
        var min = min(min1,newColumns.getOrThrow())
        let matrix = zeros(newRows.getOrThrow(), newColumns.getOrThrow());
        for (i in 0..min) {
            _ = matrix.set(i, i, data[i]);
        }
        return matrix;
    }

    func minStatic( mat1:Matrix ,  mat2: Matrix) : Matrix {
        var matrix1 = checkMatrix(mat1);
        var matrix2 = checkMatrix(mat2);
        let rows = matrix1.rows;
        let columns = matrix1.columns;
        let result =  Matrix(rows, columns);
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ =   result.set(i, j,min(matrix1.get(i, j), matrix2.get(i, j)));
            }
        }
        return result;
    }

    func maxStatic( mat1: Matrix, mat2: Matrix): Matrix {
        var matrix1 = checkMatrix(mat1);
        var matrix2 = checkMatrix(mat2);
        let rows = matrix1.rows;
        let columns = matrix1.columns;
        let result =  Matrix(rows, columns);
        for( i in 0..rows) {
            for (j in 0..columns) {
                _ =  result.set(i, j, max(matrix1.get(i, j), matrix2.get(i, j)));
            }
        }
        return result;
    }

    static func checkMatrix( value: ?Any) : Matrix {
        if(Matrix.isMatrix(value)){
            return (value as Matrix).getOrThrow()
        }else{
            return Matrix(value, Option<Int64>.None)
        }
    }

    static func isMatrix( value: ?Any) : Bool {
        return (value.isSome()) && value is Matrix
    }

    func size() :Int64 {
        return this.rows * this.columns;
    }

    func apply( callback: (Matrix, Int64, Int64) ->Unit) : Matrix {
        let ii = this.rows;
        let jj = this.columns;
        for (i in 0..ii) {
            for (j in 0..jj ){
                callback(this, i, j)
            }
        }
        return this;
    }

    func to1DArray():Array<Float64> {
        var array :Array<Float64> =  Array(this.size(),repeat:0.0);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                array[i * this.columns + j] = this.get(i, j);
            }
        }
        return array;
    }

    func to2DArray() : Array<Array<Float64>> {
        var copy :Array<Array<Float64>> =  Array(this.rows,repeat:[0.0]);
        for (i in 0..this.rows) {
            copy[i] =  Array(this.columns,repeat:0.0);
            for (j in 0..this.columns) {
                copy[i][j] = this.get(i, j);
            }
        }
        return copy;
    }

    func isRowVector() : Bool {
        return this.rows == 1;
    }

    func isColumnVector() : Bool {
        return this.columns == 1;
    }

    func isVector() : Bool {
        return this.rows == 1 || this.columns == 1;
    }

    func isSquare() : Bool {
        return this.rows == this.columns;
    }

    func isSymmetric() :Bool {
        if (this.isSquare()) {
            for (i in 0..this.rows) {
                for (j in 0..(i+1)){
                    if (this.get(i, j) != this.get(j, i)) {
                        return false;
                    }
                }
            }
            return true;
        }
        return false;
    }

    func `repeat`(row: Int64,  col: Int64) : Matrix {
        var rowRep = max(row,1)
        var colRep = max(col,1)
        let matrix = Matrix(this.rows * rowRep,  this.columns * colRep)

        for (i in 0..rowRep) {
            for (j in 0..colRep) {
                _ = matrix.setSubMatrix(this, this.rows * i, this.columns * j);
            }
        }
        return matrix;
    }

    func fill( value: Float64) : Matrix {

        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, value);
            }
        }
        return this;
    }

    func neg() :Matrix {
        return this.mulS(-1.0);
    }

    func getRow( index: Int64) :Array<Float64> {
        mlMatrixUtil.checkRowIndex(this, index, false)
        var row =  Array(this.columns,repeat:0.0);
        for (i in 0..this.columns) {
            row[i] = this.get(index, i);
        }
        return row;
    }

    func getRowVector( index: Int64) :Matrix {
        return Matrix.rowVector(getRow(index))
    }

    func setRow(index: Int64,  array: Matrix) : Matrix {
         mlMatrixUtil.checkRowIndex(this, index,false);
        for (i in 0..this.columns) {
            _ = set(index, i,  array.get(i, i))
        }
        return this;
    }

    func swapRows( row1: Int64,  row2: Int64) :Matrix {
         mlMatrixUtil.checkRowIndex(this, row1,false);
         mlMatrixUtil.checkRowIndex(this, row2,false);
        for (i in 0..this.columns) {
            let temp = this.get(row1, i);
            _ = this.set(row1, i, this.get(row2, i));
            _ = this.set(row2, i, temp);
        }
        return this;
    }

    func getColumn( index: Int64) :Array<Float64> {
        mlMatrixUtil.checkColumnIndex(this, index,false);
        var column =  Array(this.rows,repeat:0.0);
        for (i in 0..this.rows) {
            column[i] = this.get(i, index);
        }
        return column;
    }

    func getColumnVector( index: Int64) : Matrix {
        return Matrix.columnVector(this.getColumn(index))
    }

    func setColumn( index: Int64, array:Array<Float64>) : Matrix {
         mlMatrixUtil.checkColumnIndex(this, index,false);
        for (i in 0..this.rows) {
            _ = set(i, index, array[i]);
        }
        return this
    }

    func swapColumns( column1: Int64,  column2: Int64) : Matrix {
        mlMatrixUtil.checkColumnIndex(this, column1,false);
        mlMatrixUtil.checkColumnIndex(this, column2,false);
        for (i in 0..this.rows) {
            let temp = this.get(i, column1);
            _ = set(i, column1, this.get(i, column2));
            _ = set(i, column2, temp);
        }
        return this
    }

    func addRowVector(vector: Matrix ) : Matrix {
        let newVector =  mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) + newVector[j]);
            }
        }
        return this;
    }

    func subRowVector(vector: Array<Float64>) : Matrix {
        let newVector = mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) - newVector[j]);
            }
        }
        return this;
    }

    func  mulRowVector(vector: Array<Float64>) : Matrix {
        let newVector =mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) * newVector[j]);
            }
        }
        return this
    }

    func divRowVector(vector: Array<Float64>) : Matrix {
        let newVector = mlMatrixUtil.checkRowVector(this, vector);

        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) / newVector[j]);
            }
        }
        return this
    }

    func addColumnVector( vector: Array<Float64>) :Matrix {
        let newVector =  mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) + newVector[i]);
            }
        }
        return this
    }

    func subColumnVector(vector:Array<Float64>) :Matrix {
        let newVector =  mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) - newVector[i]);
            }
        }
        return this;
    }

    func mulColumnVector( vector: Array<Float64>): Matrix {
        let newVector = mlMatrixUtil.checkRowVector(this, vector);
        for (i in 0..this.rows) {
            for( j in 0..this.columns) {
                _ = set(i, j, this.get(i, j) * newVector[i]);
            }
        }
        return this
    }

    func divColumnVector(vector: Matrix) :Matrix {
        let newVector =  mlMatrixUtil.checkColumnVector(this, vector);
        for (i in 0..this.rows) {
            for (j in 0..this.columns ){
                _ = set(i, j, this.get(i, j) / (newVector[i]));
            }
        }
        return this
    }

    func mulRow( index: Int64,  value: Float64 ) : Matrix {
        mlMatrixUtil.checkRowIndex(this, index,false);
        for (i in 0..this.columns) {
            _ = set(index, i, this.get(index, i) * value);
        }
        return this
    }

    func mulColumn( index: Int64,  value: Float64) : Matrix {
         mlMatrixUtil.checkColumnIndex(this, index,false);
        for (i in 0..this.rows) {
            _ = set(i, index, this.get(i, index) * value);
        }
        return this
    }

    func max() : Float64 {
        var v = this.get(0, 0);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                if (this.get(i, j) > v) {
                    v = this.get(i, j);
                }
            }
        }
        return v;
    }

    func maxIndex()  : Array<Int64> {
        var v = this.get(0, 0);
        var idx = [0, 0];
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                if (this.get(i, j) > v) {
                    v = this.get(i, j);
                    idx[0] = i;
                    idx[1] = j;
                }
            }
        }
        return idx;
    }

    func min() : Float64 {
        var v = this.get(0, 0);
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                if (this.get(i, j) < v) {
                    v = this.get(i, j);
                }
            }
        }
        return v;
    }

    func minIndex() :Array<Int64> {
        var v = this.get(0, 0);
        var idx = [0, 0];
        for( i in 0..this.rows) {
            for (j in 0..this.columns) {
                if (this.get(i, j) < v) {
                    v = this.get(i, j);
                    idx[0] = i;
                    idx[1] = j;
                }
            }
        }
        return idx;
    }

    func maxRow( row: Int64) : Float64 {
        mlMatrixUtil.checkRowIndex(this, row,false);
        var v = this.get(row, 0);
        for (i in 1..this.columns) {
            if (this.get(row, i) > v) {
                v = this.get(row, i);
            }
        }
        return v;
    }

    func maxRowIndex( row: Int64) : Array<Int64>{
        mlMatrixUtil.checkRowIndex(this,row,false);
        var v = this.get(row, 0);
        var idx = [row, 0];
        for (i in 1..this.columns) {
            if (this.get(row, i) > v) {
                v = this.get(row, i);
                idx[1] = i;
            }
        }
        return idx;
    }

    func minRow( row: Int64): Float64 {
        mlMatrixUtil.checkRowIndex(this, row,false);
        var v = this.get(row, 0);
        for (i in 1..this.columns) {
            if (this.get(row, i) < v) {
                v = this.get(row, i);
            }
        }
        return v;
    }

    func minRowIndex( row: Int64): Array<Int64> {
        mlMatrixUtil.checkRowIndex(this, row,false);
        var v = this.get(row, 0);
        var idx = [row, 0];
        for (i in 1..this.columns) {
            if (this.get(row, i) < v) {
                v = this.get(row, i);
                idx[1] = i;
            }
        }
        return idx;
    }

    func maxColumn(column:  Int64):Float64 {
        mlMatrixUtil.checkColumnIndex(this, column, false);
        var v = this.get(0, column);
        for (i in 1..this.rows) {
            if (this.get(i, column) > v) {
                v = this.get(i, column);
            }
        }
        return v;
    }

    func maxColumnIndex(column:  Int64):  Array<Int64> {
        mlMatrixUtil.checkColumnIndex(this, column,false);
        var v = get(0, column);
        var idx = [0, column];
        for (i in 1..this.rows) {
            if (get(i, column) > v) {
                v = get(i, column);
                idx[0] = i;
            }
        }
        return idx;
    }

    func minColumn( column: Int64):Float64 {
        mlMatrixUtil.checkColumnIndex(this, column,false);
        var v = this.get(0, column);
        for( i in 1..this.rows) {
            if (this.get(i, column) < v) {
                v = this.get(i, column);
            }
        }
        return v;
    }

    func minColumnIndex( column :Int64) : Array<Int64> {
        mlMatrixUtil.checkColumnIndex(this, column,false);
        var v = this.get(0, column);
        var idx = [0, column];
        for (i in 1..this.rows ){
            if (this.get(i, column) < v) {
                v = this.get(i, column);
                idx[0] = i;
            }
        }
        return idx;
    }

    func diag() : Array<Float64> {
        let min = min(this.rows, this.columns);
        var diag =  Array(min,repeat:0.0);
        for (i in 0..min) {
            diag[i] = get(i, i);
        }
        return diag;
    }

    func sum( by: String) : Any {
        match (by) {
        case "row" =>
            return mlMatrixUtil.sumByRow(this);
        case "column"=>
            return mlMatrixUtil.sumByColumn(this);
        case _ =>
            return (mlMatrixUtil.sumAll(this)  as Any).getOrThrow();
        }
    }

    func mean() : Float64 {
        return (sum("") as Float64).getOrThrow() / Float64(this.size())

    }

    func prod() : Float64 {
        var prod = 1.0;
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                prod *= this.get(i, j);
            }
        }
        return prod;
    }

    func cumulativeSum() : Matrix {
        var sum = 0.0;
        for (i in 0..this.rows ){
            for (j in 0..this.columns) {
                sum += get(i, j);
                _ = set(i, j, sum);
            }
        }
        return this
    }

    func dot(vector2: Matrix) : Float64 {
        var vector2D1: Array<Float64> = []
        if (Matrix.isMatrix(vector2)) {
            vector2D1 = vector2.to1DArray()
        }
        let vector1D1:  Array<Float64>= this.to1DArray()
        if (vector1D1.size != vector2D1.size) {
            throw Exception("vectors do not have the same size")
        }
        var dot = 0.0;
        for (i in 0..vector1D1.size) {
            dot += vector1D1[i] * vector2D1[i]
        }
        return dot;
    }

    func mmul( oth: Matrix) : Matrix {
        var other = Matrix.checkMatrix(oth);
        if (this.columns != other.rows) {
            throw Exception ("Number of columns of left matrix are not equal to number of rows of right matrix.")
        }
        let m = this.rows;
        let n = this.columns;
        let p = other.columns;

        let result =  Matrix(m, p)

        var bColj = Array( n,repeat:0.0);
        for (j in 0..p) {
            for (k in 0..n ){
                bColj[k] = other.get(k, j);
            }
            for (i in 0..m) {
                var s = 0.0;
                for (k in 0..n) {
                    s += this.get(i, k) * bColj[k];
                }
                _ = result.set(i, j, s);
            }
        }
        return result;
    }

    func strassen2x2(other: Matrix) : Matrix {
        let result =  Matrix(MLINDEX_BYTES_NUM_2, MLINDEX_BYTES_NUM_2)
        let a11 = this.get(0, 0);
        let b11 = other.get(0, 0);
        let a12 = this.get(0, 1);
        let b12 = other.get(0, 1);
        let a21 = this.get(1, 0);
        let b21 = other.get(1, 0);
        let a22 = this.get(1, 1);
        let b22 = other.get(1, 1);

        let m1 = (a11 + a22) * (b11 + b22);
        let m2 = (a21 + a22) * b11;
        let m3 = a11 * (b12 - b22);
        let m4 = a22 * (b21 - b11);
        let m5 = (a11 + a12) * b22;
        let m6 = (a21 - a11) * (b11 + b12);
        let m7 = (a12 - a22) * (b21 + b22);

        let c00 = m1 + m4 - m5 + m7;
        let c01 = m3 + m5;
        let c10 = m2 + m4;
        let c11 = m1 - m2 + m3 + m6;

        _ =  result.set(0, 0, c00);
        _ = result.set(0, 1, c01);
        _ = result.set(1, 0, c10);
        _ = result.set(1, 1, c11);
        return result;
    }

    func strassen3x3(other: Matrix) : Matrix {
        let result =  Matrix(MLINDEX_BYTES_NUM_3, MLINDEX_BYTES_NUM_3)

        let a00 = this.get(0, 0);
        let a01 = this.get(0, 1);
        let a02 = this.get(0, MLINDEX_BYTES_NUM_2);
        let a10 = this.get(1, 0);
        let a11 = this.get(1, 1);
        let a12 = this.get(1, MLINDEX_BYTES_NUM_2);
        let a20 = this.get(MLINDEX_BYTES_NUM_2, 0);
        let a21 = this.get(MLINDEX_BYTES_NUM_2, 1);
        let a22 = this.get(MLINDEX_BYTES_NUM_2, MLINDEX_BYTES_NUM_2);

        let b00 = other.get(0, 0);
        let b01 = other.get(0, 1);
        let b02 = other.get(0, MLINDEX_BYTES_NUM_2);
        let b10 = other.get(1, 0);
        let b11 = other.get(1, 1);
        let b12 = other.get(1, MLINDEX_BYTES_NUM_2);
        let b20 = other.get(MLINDEX_BYTES_NUM_2, 0);
        let b21 = other.get(MLINDEX_BYTES_NUM_2, 1);
        let b22 = other.get(MLINDEX_BYTES_NUM_2, MLINDEX_BYTES_NUM_2);

        let m1 = (a00 + a01 + a02 - a10 - a11 - a21 - a22) * b11;
        let m2 = (a00 - a10) * (-b01 + b11);
        let m3 = a11 * (-b00 + b01 + b10 - b11 - b12 - b20 + b22);
        let m4 = (-a00 + a10 + a11) * (b00 - b01 + b11);
        let m5 = (a10 + a11) * (-b00 + b01);
        let m6 = a00 * b00;
        let m7 = (-a00 + a20 + a21) * (b00 - b02 + b12);
        let m8 = (-a00 + a20) * (b02 - b12);
        let m9 = (a20 + a21) * (-b00 + b02);
        let m10 = (a00 + a01 + a02 - a11 - a12 - a20 - a21) * b12;
        let m11 = a21 * (-b00 + b02 + b10 - b11 - b12 - b20 + b21);
        let m12 = (-a02 + a21 + a22) * (b11 + b20 - b21);
        let m13 = (a02 - a22) * (b11 - b21);
        let m14 = a02 * b20;
        let m15 = (a21 + a22) * (-b20 + b21);
        let m16 = (-a02 + a11 + a12) * (b12 + b20 - b22);
        let m17 = (a02 - a12) * (b12 - b22);
        let m18 = (a11 + a12) * (-b20 + b22);
        let m19 = a01 * b10;
        let m20 = a12 * b21;
        let m21 = a10 * b02;
        let m22 = a20 * b01;
        let m23 = a22 * b22;

        let c00 = m6 + m14 + m19;
        let c01 = m1 + m4 + m5 + m6 + m12 + m14 + m15;
        let c02 = m6 + m7 + m9 + m10 + m14 + m16 + m18;
        let c10 = m2 + m3 + m4 + m6 + m14 + m16 + m17;
        let c11 = m2 + m4 + m5 + m6 + m20;
        let c12 = m14 + m16 + m17 + m18 + m21;
        let c20 = m6 + m7 + m8 + m11 + m12 + m13 + m14;
        let c21 = m12 + m13 + m14 + m15 + m22;
        let c22 = m6 + m7 + m8 + m9 + m23;

        _ = result.set(0, 0, c00);
        _ = result.set(0, 1, c01);
        _ = result.set(0, MLINDEX_BYTES_NUM_2, c02);
        _ = result.set(1, 0, c10);
        _ = result.set(1, 1, c11);
        _ = result.set(1, MLINDEX_BYTES_NUM_2, c12);
        _ = result.set(MLINDEX_BYTES_NUM_2, 0, c20);
        _ = result.set(MLINDEX_BYTES_NUM_2, 1, c21);
        _ = result.set(MLINDEX_BYTES_NUM_2, MLINDEX_BYTES_NUM_2, c22);
        return result;
    }

    func mmulStrassen(y: Matrix) :Matrix {
        var x = this.clone();
        let r1 = x.rows;
        let c1 = x.columns;
        let r2 = y.rows;
        let c2 = y.columns;
        if (c1 != r2) {
            throw Exception ("Multiplying ${r1} x ${c1} and ${r2} x ${c2} matrix: dimensions do not match.")
        }

        let r = max(r1, r2);
        let c = max(c1, c2);
        var x2 = embed(x, r, c);
        var y2 = embed(y, r, c);
        return blockMult(x2, y2, r, c);
    }

    func embed( mat: Matrix,  rows: Int64, cols: Int64) : Matrix {
        let r = mat.rows;
        let c = mat.columns;
        if (r == rows && c == cols) {
            return mat;
        } else {
            var resultat = Matrix.zeros(rows, cols);
            resultat = resultat.setSubMatrix(mat, 0, 0);
            return resultat;
        }
    }

    func blockMult( a: Matrix,  b: Matrix, rows: Int64,  cols: Int64) : Matrix {
        var newA = a
        var newB = b
        if (rows <= MLINDEX_BYTES_NUM_512 || cols <= MLINDEX_BYTES_NUM_512) {
            return  newA.mmul(newB);
        }

        if (rows % MLINDEX_BYTES_NUM_2 == 1 && cols % MLINDEX_BYTES_NUM_2 == 1) {
            newA = embed(newA, rows + 1, cols + 1);
            newB = embed(newB, rows + 1, cols + 1);
        } else if (rows % MLINDEX_BYTES_NUM_2 == 1) {
            newA = embed(newA, rows + 1, cols);
            newB = embed(newB, rows + 1, cols);
        } else if (cols % MLINDEX_BYTES_NUM_2 == 1) {
            newA = embed(newA, rows, cols + 1);
            newB = embed(newB, rows, cols + 1);
        }

        let halfRows = Int64(newA.rows / MLINDEX_BYTES_NUM_2);
        let halfCols = Int64(newA.columns / MLINDEX_BYTES_NUM_2);
        let a11 = newA.subMatrix(0, halfRows - 1, 0, halfCols - 1);
        let b11 = newB.subMatrix(0, halfRows - 1, 0, halfCols - 1);

        let a12 = newA.subMatrix(0, halfRows - 1, halfCols, newA.columns - 1);
        let b12 = newB.subMatrix(0, halfRows - 1, halfCols, newB.columns - 1);

        let a21 = newA.subMatrix(halfRows, newA.rows - 1, 0, halfCols - 1);
        let b21 = newB.subMatrix(halfRows, newB.rows - 1, 0, halfCols - 1);

        let a22 = newA.subMatrix(halfRows, newA.rows - 1, halfCols, newA.columns - 1);
        let b22 = newB.subMatrix(halfRows, newB.rows - 1, halfCols, newB.columns - 1);

        let m1 = blockMult(Matrix.addStatic(a11, a22),Matrix.addStatic(b11, b22),halfRows,halfCols);
        let m2 = blockMult(Matrix.addStatic(a21, a22), b11, halfRows, halfCols);
        let m3 = blockMult(a11, Matrix.subStatic(b12, b22), halfRows, halfCols);
        let m4 = blockMult(a22, Matrix.subStatic(b21, b11), halfRows, halfCols);
        let m5 = blockMult(Matrix.addStatic(a11, a12), b22, halfRows, halfCols);
        let m6 = blockMult(Matrix.addStatic(a21, a11), Matrix.addStatic(b11, b12), halfRows, halfCols );
        let m7 = blockMult( Matrix.subStatic(a12, a22), Matrix.addStatic(b21, b22), halfRows, halfCols);

        let c11 = Matrix.addStatic(m1, m4);
        _ = c11.sub(m5);
        _ = c11.add(m7);
        let c12 = Matrix.addStatic(m3, m5);
        let c21 = Matrix.addStatic(m2, m4);
        let c22 = Matrix.addStatic(m1, m2);
        _ = c22.add(m3);
        _ = c22.add(m6);

        var resultat = Matrix.zeros(MLINDEX_BYTES_NUM_2 * c11.rows, MLINDEX_BYTES_NUM_2 * c11.columns);
        resultat = resultat.setSubMatrix(c11, 0, 0);
        resultat = resultat.setSubMatrix(c12, c11.rows, 0);
        resultat = resultat.setSubMatrix(c21, 0, c11.columns);
        resultat = resultat.setSubMatrix(c22, c11.rows, c11.columns);
        return resultat.subMatrix(0, rows - 1, 0, cols - 1);
    }

    func scaleRows( min!: Int64 = 0,  max!: Int64 = 1)  : Matrix {

        if (min >= max) {
            throw Exception ("min should be strictly smaller than max")
        }
        let options = MlOptions()
        options.min = min
        options.max = max
        let newMatrix  = Matrix(this.rows, this.columns);
        for (i in 0..this.rows) {
            let scaled = mlArrayUtilsArrayUtils.scale(this.getRow(i), options);
            _ = newMatrix.setRow(i, (scaled as Matrix).getOrThrow());
        }
        return newMatrix;
    }

    func scaleColumns( min!: Int64 = 0,  max!: Int64 = 1) : Matrix {

        if (min >= max) {
            throw Exception ("min should be strictly smaller than max")
        }
        let newMatrix = Matrix.empty(this.rows, this.columns);
        let options = MlOptions()
        options.min = min
        options.max = max
        for (i in 0..this.columns) {
            let scaled = mlArrayUtilsArrayUtils.scale(this.getColumn(i),options);
            _ = newMatrix.setColumn(i, (scaled as Array<Float64>).getOrThrow());
        }
        return newMatrix;
    }

    func kroneckerProduct(oth: Matrix) : Matrix {
        var other = Matrix.checkMatrix(oth);

        let m = this.rows;
        let n = this.columns;
        let p = other.rows;
        let q = other.columns;

        let result = Matrix(m * p, n * q);
        for (i in 0..m ){
            for (j in 0..n) {
                for (k in 0..p) {
                    for (l in 0..q) {
                        _ = result.set(p * i + k, q * j + l, this.get(i, j) * other.get(k, l))
                    }
                }
            }
        }
        return result;
    }

    func transpose() :Matrix {
        let result =  Matrix(this.columns, this.rows)
        for (i in 0..this.rows) {
            for (j in 0..this.columns) {
                _ =  result.set(j, i, this.get(i, j));
            }
        }
        return result;
    }

    func sortRows() : ?Matrix {
        return this
    }

    func sortColumns(): ?Matrix {
        return this
    }

    func subMatrix( startRow: Int64,  endRow: Int64,  startColumn: Int64,  endColumn: Int64) : Matrix {
        mlMatrixUtil.checkRange(this, startRow,  endRow,  startColumn,  endColumn);
        let newMatrix =  Matrix( endRow - startRow + 1, endColumn - startColumn + 1)

        for (i in startRow..endRow+1) {
            for (j in startColumn..endColumn+1) {
                _ = newMatrix.set(i - startRow, j - startColumn, this.get(i, j))
            }
        }
        return newMatrix;
    }

    func subMatrixRow( indices: Array<Int64>,  startColumn: Int64 ,endColumn: ?Int64 ): Matrix {
        var newEndColumn = endColumn
        if (newEndColumn.isNone()){
            newEndColumn = this.columns - 1
        }

        if (startColumn > newEndColumn.getOrThrow() || startColumn < 0 || startColumn >= this.columns || newEndColumn.getOrThrow() < 0 || newEndColumn.getOrThrow() >= this.columns) {
            throw Exception ("Argument out of range")
        }

        let newMatrix =Matrix(indices.size, newEndColumn.getOrThrow() - startColumn + 1)

        for (i in 0..indices.size) {
            for (j in startColumn..newEndColumn.getOrThrow()+1) {
                if (indices[i] < 0 || indices[i] >= this.rows) {
                    throw Exception("Row index out of range: ${indices[i]}")
                }
                _ = newMatrix.set(i, j - startColumn, this.get(indices[i], j));
            }
        }
        return newMatrix;
    }

    func subMatrixColumn( indices: Array<Int64>,  startRow: Int64, endRow: ?Int64): Matrix {
        var newEndRow = endRow
        if (newEndRow.isNone()) {
            newEndRow = this.rows - 1
        }
        if ( startRow > newEndRow.getOrThrow() || startRow < 0 || startRow >= this.rows || newEndRow.getOrThrow() < 0 || newEndRow.getOrThrow() >= this.rows) {
            throw Exception("Argument out of range")
        }

        let newMatrix =  Matrix(newEndRow.getOrThrow() - startRow + 1, indices.size)


        for (i in 0..indices.size) {
            for (j in startRow..newEndRow.getOrThrow()+1) {
                if (indices[i] < 0 || indices[i] >= this.columns) {
                    throw Exception("Column index out of range: ${indices[i]}")
                }
                _ = newMatrix.set(j - startRow, i, this.get(j, indices[i]));
            }
        }
        return newMatrix;
    }

    func setSubMatrix(mat: Matrix,  startRow: Int64, startColumn: Int64) :Matrix {
        var matrix = Matrix.checkMatrix(mat)
        let endRow = startRow + matrix.rows - 1;
        let endColumn = startColumn + matrix.columns - 1;
        mlMatrixUtil.checkRange( this, startRow,  endRow,  startColumn,  endColumn);
        for( i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                _ = matrix.set(startRow + i, startColumn + j, matrix.get(i, j))
            }
        }
        return this
    }

    func selection( rowIndices: Array<Int64>,  columnIndices:  Array<Int64>): Matrix {
        _ = mlMatrixUtil.checkIndices(this, rowIndices, columnIndices);
        let newMatrix =  Matrix(rowIndices.size, columnIndices.size)
        return newMatrix;
    }

    func trace() :Float64 {
        let min = min(this.rows, this.columns);
        var trace = 0.0;
        for (i in 0..min) {
            trace += this.get(i, i);
        }
        return trace;
    }

    func transposeView() : MlMatrixTransposeView {
        return  MlMatrixTransposeView(this);
    }

    func rowView( row: Int64) :MlMatrixRowView {
        mlMatrixUtil.checkRowIndex(this, row, false);
        return  MlMatrixRowView(this, row);
    }

    func columnView( column:  Int64) : MlMatrixColumnView {
        mlMatrixUtil.checkColumnIndex(this, column,false);
        return  MlMatrixColumnView(this, column);
    }

    func flipRowView() : MlMatrixFlipRowView {
        return  MlMatrixFlipRowView(this);
    }

    func flipColumnView() : MlMatrixFlipColumnView {
        return  MlMatrixFlipColumnView(this);
    }

    func subMatrixView( startRow: Int64,  endRow: Int64,  startColumn: Int64, endColumn: Int64): MlMatrixSubView {
        return  MlMatrixSubView(this,startRow,endRow,startColumn,endColumn);
    }

    func selectionView(rowIndices:  Array<Int64>,  columnIndices:  Array<Int64>) : MatrixSelectionView {
        return  MatrixSelectionView(this, rowIndices, columnIndices);
    }

    func det() : Float64 {
        if (this.isSquare()) {
            var a: Float64
            var b: Float64
            var c: Float64
            var d: Float64
            if (this.columns == MLINDEX_BYTES_NUM_2) {
                a = this.get(0, 0);
                b = this.get(0, 1);
                c = this.get(1, 0);
                d = this.get(1, 1);

                return a * d - b * c;
            } else if (this.columns == MLINDEX_BYTES_NUM_3) {
                var subMatrix0: MatrixSelectionView
                var subMatrix1: MatrixSelectionView
                var subMatrix2: MatrixSelectionView
                subMatrix0 = this.selectionView([1, MLINDEX_BYTES_NUM_2], [1, MLINDEX_BYTES_NUM_2]);
                subMatrix1 = this.selectionView([1, MLINDEX_BYTES_NUM_2], [0, MLINDEX_BYTES_NUM_2]);
                subMatrix2 = this.selectionView([1, MLINDEX_BYTES_NUM_2], [0, 1]);
                a = this.get(0, 0);
                b = this.get(0, 1);
                c = this.get(0, MLINDEX_BYTES_NUM_2);

                return (a * ( subMatrix0.det() ) - b * ( subMatrix1.det()) + c * ( subMatrix2.det()));
            } else {
                // general purpose determinant using the LU decomposition
                return  MlMatrixDCLU(this).determinant();
            }
        } else {
            throw Exception("Determinant can only be calculated for a square matrix.")
        }
    }

    func checkDimensions( matrix: Matrix,  otherMatrix: Matrix)  {
        if (matrix.rows != otherMatrix.rows || matrix.columns != otherMatrix.columns) {
            throw Exception("Matrices dimensions must be equal")
        }
    }

    func compareNumbers( a: Int64, b: Int64) : Int64 {
        return a - b;
    }

    func inverse(matrix: ?Matrix): ?Matrix {
        return mlMatrixDecompositions.inverse(matrix.getOrThrow())
    }

    func inv(matrix: ?Matrix): ?Matrix {
        return mlMatrixDecompositions.inverse(matrix.getOrThrow())
    }

    func inverse(): ?Matrix {
        return mlMatrixDecompositions.inverse(this)
    }

    func inv(): ?Matrix {
        return inverse()
    }

    func solve(other: Matrix): Matrix {
        return mlMatrixDecompositions.solve(this, other)
    }

    func add(value: Any) : Matrix {
        if((value as Float64).isSome()){
            return this.addS((value as Float64).getOrThrow())
        }

        return this.addM((value as Matrix).getOrThrow())
    }

    func addS(value: Float64) : Matrix {
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) + value)
            }
        }
        return this
    }

    func addM( mat: Matrix): Matrix {
        var matrix = Matrix.checkMatrix(mat)
        checkDimensions(this, matrix)
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) + matrix.get(i, j))
            }
        }
        return this
    }

    static func addStatic( matrix: Matrix, value: Any) : Matrix {
        let newMatrix =  Matrix(matrix, Option<Int64>.None);
        return newMatrix.add(value);
    }

    func sub( value: Any) :Matrix {
        if((value as Float64).isSome()){
            return this.subS((value as Float64).getOrThrow())
        }
        return this.subM((value as Matrix).getOrThrow())
    }

    func subS( value: Float64) : Matrix {
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) - value)
            }
        }
        return this
    }

    func subM( mat: Matrix): Matrix {
        var matrix = Matrix.checkMatrix(mat)
        checkDimensions(this, matrix)
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) - matrix.get(i, j))
            }
        }
        return this
    }

    static func subStatic( matrix: Matrix,  value: Any) :Matrix {
        let newMatrix = Matrix(matrix, Option<Int64>.None);
        return newMatrix.sub(value);
    }

    func mul(value: Any) : Matrix {
        if((value as Float64).isSome()){
            return this.mulS((value as Float64).getOrThrow());
        }
        return this.mulM((value as Matrix).getOrThrow());
    }

    func mulS( value: Float64) : Matrix {
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) * value)
            }
        }
        return this
    }

    func mulM( mat: Matrix) : Matrix {
        var matrix = Matrix.checkMatrix(mat)
        checkDimensions(this, matrix)
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) * matrix.get(i, j))
            }
        }
        return this
    }


    func mulStatic( matrix: Matrix, value: Any): Matrix {
        let newMatrix =  Matrix(matrix, Option<Int64>.None);
        return newMatrix.mul(value);
    }


    func div( value: Any) : Matrix {
        if((value as Float64).isSome()){
            return this.divS((value as Float64).getOrThrow());
        }
        return this.divM((value as Matrix).getOrThrow())
    }

    func divS( value: Float64) : Matrix {
        for (i in 0..rows) {
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) / value)
            }
        }
        return this
    }

    func divM(mat: Matrix) :Matrix {
        var matrix = Matrix.checkMatrix(mat)
        checkDimensions(this, matrix)
        for (i in 0..rows ){
            for (j in 0..columns) {
                _ = set(i, j, get(i, j) / matrix.get(i, j))
            }
        }
        return this
    }


    func divStatic( matrix: Matrix, value: Any) : Matrix {
        let newMatrix =  Matrix(matrix, Option<Int64>.None);
        return newMatrix.div(value);
    }

    func removeRow( index: Int64) : Matrix {
        mlMatrixUtil.checkRowIndex(this, index, false);
        if (this.rows == 1) {
            throw Exception("A matrix cannot have less than one row");
        }
        this.rows -= 1;
        return this;
    }

    func addRow( index: Int64, array: Array<Any>) : Matrix {
        mlMatrixUtil.checkRowIndex(this, index, true);
        _ = mlMatrixUtil.checkRowVector(this, array);
        this.rows += 1;
        return this;
    }

    func removeColumn( index: Int64) : Matrix {
        mlMatrixUtil.checkColumnIndex(this, index,false);
        if (this.columns == 1) {
            throw Exception("A matrix cannot have less than one column");
        }
        this.columns -= 1;
        return this;
    }

    func addColumn( index: Int64,  array:Array<Any>) : Matrix {
        var newArray = array
        mlMatrixUtil.checkColumnIndex(this, index, true);
        newArray = (mlMatrixUtil.checkColumnVector(this, newArray) as Array<Any>).getOrThrow();
        this.columns += 1;
        return this;
    }
}


// ml-matrix src/views/base
open class MlMatrixBaseView <:  Matrix {

    var matrix: Matrix

    init( matrix: Matrix,  rows: Int64,  columns: Int64) {
        super(matrix , Option<Int64>.None)
        this.matrix = matrix
        this.rows = rows
        this.columns = columns
    }

}

// ml-matrix src/views/column.js
class MlMatrixColumnView <:  MlMatrixBaseView {

    var column: Int64

    init(matrix: Matrix,  column: Int64) {
        super(matrix, matrix.rows, 1)
        this.column = column
    }

    public func set( rowIndex: Int64, columnIndex: Int64, value: Float64 )  {
        _ = this.matrix.set(rowIndex, this.column, value);
        return this;
    }

    public func get( rowIndex: Int64) : Float64 {
        return this.matrix.get(rowIndex, this.column);
    }

}

// ml-matrix src/views/flipColumn.js
class MlMatrixFlipColumnView <:  MlMatrixBaseView {
    init( matrix: Matrix) {
        super(matrix, matrix.rows, matrix.columns);
    }

    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64) {
        _ = this.matrix.set(rowIndex, this.columns - columnIndex - 1, value);
        return this;
    }

    override public func get(rowIndex: Int64,  columnIndex: Int64) : Float64 {
        return this.matrix.get(rowIndex, this.columns - columnIndex - 1);
    }

}

// ml-matrix src/views/flipRow.js
class MlMatrixFlipRowView <:  MlMatrixBaseView {

    init( matrix: Matrix) {
        super(matrix, 1, matrix.columns)
    }

    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64) {
        _ = this.matrix.set(this.rows - rowIndex - 1, columnIndex, value);
        return this;
    }

    override public func get( rowIndex: Int64, columnIndex: Int64) :Float64 {
        return this.matrix.get(this.rows - rowIndex - 1, columnIndex);
    }
}

// ml-matrix src/views/row.js
class MlMatrixRowView <:  MlMatrixBaseView {
    var row: Int64
    init( matrix: Matrix,  row: Int64) {
        super(matrix, 1, matrix.columns)
        this.row = row
    }

    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64) {
        _ = this.matrix.set(this.row, columnIndex, value);
        return this;
    }

    override public func get( rowIndex: Int64,  columnIndex: Int64) :Float64 {
        return this.matrix.get(this.row, columnIndex);
    }
}

// ml-matrix src/views/selection.js
class MatrixSelectionView <:  MlMatrixBaseView {

    var rowIndices: Array<Int64>
    var columnIndices: Array<Int64>

    init( matrix: Matrix,  rowIndices: Array<Int64>,  columnIndices: Array<Int64> ) {
        super(matrix, mlMatrixUtil.checkIndices(matrix,rowIndices, columnIndices)[0].size, mlMatrixUtil.checkIndices(matrix,rowIndices, columnIndices)[1].size)
        this.rowIndices = mlMatrixUtil.checkIndices(matrix,rowIndices, columnIndices)[0]
        this.columnIndices = mlMatrixUtil.checkIndices(matrix,rowIndices, columnIndices)[1]
    }


    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64){
        _ = this.matrix.set(this.rowIndices[rowIndex],this.columnIndices[columnIndex],value);
        return this;
    }

    override public func get( rowIndex: Int64,  columnIndex: Int64) : Float64 {
        return this.matrix.get(this.rowIndices[rowIndex],this.columnIndices[columnIndex]);
    }
}

// ml-matrix src/views/sub.js
class MlMatrixSubView <:  MlMatrixBaseView {

    var startRow: Int64


    var startColumn: Int64


    init( matrix: Matrix,  startRow: Int64, endRow: Int64,  startColumn: Int64,  endColumn: Int64) {
        super(matrix, endRow - startRow + 1, endColumn - startColumn + 1)
        mlMatrixUtil.checkRange(matrix, startRow, endRow, startColumn, endColumn);
        this.startRow = startRow
        this.startColumn = startColumn
    }

    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64) {
        _ = this.matrix.set(this.startRow + rowIndex,this.startColumn + columnIndex,value);
        return this;
    }

    override public func get( rowIndex: Int64,  columnIndex: Int64) : Float64 {
        return this.matrix.get(this.startRow + rowIndex, this.startColumn + columnIndex
        );
    }

}

// ml-matrix src/views/transpose.js
class MlMatrixTransposeView <:  MlMatrixBaseView {


    init( matrix: Matrix) {
        super(matrix, matrix.columns, matrix.rows);
    }

    override public func set( rowIndex: Int64,  columnIndex: Int64,  value: Float64)  {
        _ = this.matrix.set(columnIndex, rowIndex, value);
        return this;
    }

    override public func get(rowIndex: Int64,  columnIndex: Int64):Float64 {
        return this.matrix.get(columnIndex, rowIndex);
    }


}

// ml-matrix src/dc/cholesky.js
class MlMatrixDCCholesky {

    var l: Matrix

    init( val: Matrix)  {

        var value = Matrix.checkMatrix(val);

        if (!(value as Matrix).getOrThrow().isSymmetric()) {
            throw Exception ("Matrix is not symmetric");
        }

        let a = value
        let dimension = a.rows
        let l = Matrix(dimension, dimension)
        var positiveDefinite: Bool = true

        for (j in 0..dimension) {
            var Lrowj = l.getRow(j);
            var d = 0.0;
            for (k in 0..j) {
                let Lrowk = l.getRow(k);
                var s: Float64 = 0.0;
                for (i in 0..k) {
                    s += Lrowk[i] * Lrowj[i];
                }
                s = (a.get(j, k) - s) / l.get(k, k)
                Lrowj[k] = s

                d = d + s * s;
            }

            d = a.get(j, j) - d

            if (d > 0.0) {
                positiveDefinite = true
            }else {
                positiveDefinite = false
            }
            _ = l.set(j, j, sqrt(Float64(max(d, 0.0))))

            for (k in j+1..dimension) {
                _ = l.set(j, k, 0.0)
            }
        }

        if (!positiveDefinite) {
            throw Exception ("Matrix is not positive definite");
        }
        this.l = l;
    }

    func lowerTriangularMatrix(): Any {
        return this.l;
    }

    func solve(val: Any) : Any {
        var value = Matrix.checkMatrix(val);

        let l = this.l
        let dimension = l.rows

        if ((value as Matrix).getOrThrow().rows != dimension) {
            println("Matrix dimensions do not match")
        }

        let count = (value as Matrix).getOrThrow().columns
        let  B = (value as Matrix).getOrThrow().clone()

        for (k in 0..dimension) {
            for (j in 0..count) {
                for (i in 0..k) {
                    _ = B.set(k, j, B.get(k, j) - B.get(i, j) * l.get(k, i))
                }
                _ = B.set(k, j, B.get(k, j) / l.get(k, k))
            }
        }
        var k = dimension - 1
        for (k in dimension - 1.. -1: -1){
            for (j in 0..count) {
                for (i in k+1..dimension) {
                    _ = B.set(k, j, B.get(k, j) - B.get(i, j) * l.get(i, k))
                }
                _ = B.set(k, j, B.get(k, j) / l.get(k, k))
            }
        }
        return B;
    }
}

// ml-matrix src/dc/evd.js
class MlMatrixDCEVD {

    var n: Int64 = 0
    var e: Array<Float64> = []
    var d: Array<Float64> = []
    var v: Array<Array<Float64>> = [[]]
    var m1: ?Matrix = None

    init( mat: Matrix,  options: MlOptions)  {

        var matrix = Matrix.checkMatrix(mat);
        if (!matrix.isSquare()) {
            throw Exception("Matrix is not a square matrix");
        }

        let n = matrix.columns
        var v = mlMatrixDCUtil.getFilled2DArray(n, n, 0.0)
        let d =  Array(n,repeat:0.0)
        let e = Array(n,repeat:0.0)
        let value = matrix

        var isSymmetric = false;

        if (options.defaultOptions["assumeSymmetric"]) {
            isSymmetric = true;
        } else {
            isSymmetric = matrix.isSymmetric();
        }

        if (isSymmetric) {
            for (i in 0..n) {
                for (j in 0..n) {
                    v[i][j] = value.get(i, j);
                }
            }
            tred2(n, e, d, v);
            tql2(n, e, d, v);
        } else {
            var h = mlMatrixDCUtil.getFilled2DArray(n, n, 0.0)
            let ort = Array(n,repeat:0.0)
            for (j in 0..n ){
                for (i in 0..n) {
                    h[i][j] = value.get(i, j);
                }
            }
            orthes(n, h, ort, v);
            hqr2(n, e, d, v, h);
        }

        this.n = n;
        this.e = e;
        this.d = d;
        this.v = v;
    }

    func realEigenvalues() : Array<Float64> {
        return this.d;
    }
    func imaginaryEigenvalues() : Array<Float64> {
        return this.e;
    }
    func eigenvectorMatrix() :Matrix {
        if (!Matrix.isMatrix(this.v)) {
            this.m1 =  Matrix(this.v,Option<Int64>.None)
        }
        return this.m1.getOrThrow()
    }

    func diagonalMatrix() :Matrix {
        let n = this.n
        let e = this.e
        let d = this.d
        let x = Matrix(n, n)
        for (i in 0..n ){
            for( j in 0..n) {
                _ = x.set(i, j, 0.0)
            }
            _ = x.set(i, i, d[i])
            if (e[i] > 0.0) {
                _ = x.set(i, i + 1, e[i])
            } else if (e[i] < 0.0) {
                _ = x.set(i, i - 1, e[i])
            }
        }
        return x;
    }

    func tred2( n: Int64, e: Array<Float64>,  d: Array<Float64>,  V: Array<Array<Float64>>) {
        var f: Float64
        var g: Float64
        var h: Float64
        var hh: Float64
        var scale: Float64
        var ei = e
        var di = d
        var vi = V

        for (j in 0..n) {
            di[j] = vi[n - 1][j];
        }
        for (i in n-1..0: -1){
            scale = 0.0;
            h = 0.0;
            for (k in 0..i) {
                scale = scale + abs(di[k]);
            }

            if (scale == 0.0) {
                ei[i] = di[i - 1];
                for (j in 0..i) {
                    di[j] = vi[i - 1][j];
                    vi[i][j] = 0.0;
                }
            } else {
                for (k in 0..i) {
                    di[k] /= scale;
                    h += di[k] * di[k];
                }

                f = di[i - 1];
                g = sqrt(Float64(h));
                if (f > 0.0) {
                    g = -g;
                }

                ei[i] = scale * g;
                h = h - f * g;
                di[i - 1] = f - g;
                for (j in 0..i) {
                    ei[j] = 0.0;
                }

                for (j in 0..i) {
                    f = di[j];
                    vi[j][i] = f;
                    g = ei[j] + vi[j][j] * f;
                    for (k in j+1..i ){
                        g += vi[k][j] * di[k];
                        ei[k] += vi[k][j] * f;
                    }
                    ei[j] = g;
                }

                f = 0.0;
                for (j in 0..i) {
                    ei[j] /= h;
                    f += ei[j] * di[j];
                }

                hh = f / (h + h);
                for (j in 0..i) {
                    ei[j] -= hh * di[j];
                }

                for (j in 0..i) {
                    f = di[j];
                    g = ei[j];
                    for (k in j..i) {
                        vi[k][j] -= f * ei[k] + g * di[k];
                    }
                    di[j] = vi[i - 1][j];
                    vi[i][j] = 0.0;
                }
            }
            di[i] = h;
        }
        for (i in 0..n-1) {
            vi[n - 1][i] = vi[i][i];
            vi[i][i] = 1.0;
            h = di[i + 1];
            if (h != 0.0) {
                for (k in 0..i) {
                    di[k] = vi[k][i + 1] / h;
                }
                for (j in 0..i+1) {
                    g = 0.0;
                    for (k in 0..i+1){
                        g += vi[k][i + 1] * vi[k][j];
                    }
                    for (k in 0..i+1) {
                        vi[k][j] -= g * di[k];
                    }
                }
            }

            for (k in 0..i+1) {
                vi[k][i + 1] = 0.0;
            }
        }

        for (j in 0..n) {
            di[j] = vi[n - 1][j];
            vi[n - 1][j] = 0.0;
        }

        vi[n - 1][n - 1] = 1.0;
        ei[0] = 0.0;
    }

    func tql2( n: Int64,  e: Array<Float64>, d: Array<Float64>,  V: Array<Array<Float64>>) {
        var g: Float64
        var h: Float64
        var k: Int64
        var m: Int64
        var p: Float64
        var r: Float64
        var dl1: Float64
        var c: Float64
        var c2: Float64
        var c3: Float64
        var el1: Float64
        var s: Float64
        var s2: Float64
        var iter: Float64
        var ei = e
        var di = d
        var vi = V

        for (i in 1..n) {
            ei[i - 1] = ei[i];
        }

        ei[n - 1] = 0.0;

        var f = 0.0
        var tst1 = 0.0
        let eps = pow(MLINDEX_BYTES_NUM_20, MLINDEX_BYTES_NUM_0520)

        for (l in 0..n) {
            tst1 = max(tst1, abs(di[l]) + abs(e[l]));
            m = l;
            while (m < n) {

                if (abs(ei[m]) <= eps * tst1) {
                    break;
                }
                m += 1;
            }

            if (m > l) {
                iter = 0.0;
                do {
                    iter = iter + 1.0;

                    g = di[l];
                    p = (di[l + 1] - g) / (Float64(MLINDEX_BYTES_NUM_2) * ei[l]);
                    r = mlMatrixDCUtil.hypotenuse(p, 1.0);
                    if (p < 0.0) {
                        r = -r;
                    }

                    di[l] = ei[l] / (p + r);
                    di[l + 1] = ei[l] * (p + r);
                    dl1 = di[l + 1];
                    h = g - di[l];
                    for (i in l+MLINDEX_BYTES_NUM_2..n) {
                        di[i] -= h;
                    }

                    f = f + h;

                    p = di[m];
                    c = 1.0;
                    c2 = c;
                    c3 = c;
                    el1 = ei[l + 1];
                    s = 0.0;
                    s2 = 0.0;
                    for (i in m-1..0: -1) {
                        c3 = c2;
                        c2 = c;
                        s2 = s;
                        g = c * ei[i];
                        h = c * p;
                        r = mlMatrixDCUtil.hypotenuse(p, ei[i]);
                        ei[i + 1] = s * r;
                        s = ei[i] / r;
                        c = p / r;
                        p = c * di[i] - s * g;
                        di[i + 1] = h + s * (c * g + s * di[i]);
                        for (k in 0..n ){
                            h = V[k][i + 1];
                            vi[k][i + 1] = s * vi[k][i] + c * h;
                            vi[k][i] = c * vi[k][i] - s * h;
                        }
                    }
                    p = (-s * s2 * c3 * el1 * ei[l]) / dl1;
                    ei[l] = s * p;
                    di[l] = c * p;
                } while (abs(ei[l]) > eps * tst1);
            }
            di[l] = di[l] + f;
            ei[l] = 0.0;
        }

        for (i in 0..n-1) {
            k = i;
            p = di[i];
            for (j in i+1..n) {
                if (di[j] < p) {
                    k = j;
                    p = di[j];
                }
            }

            if (k != i) {
                di[k] = di[i];
                di[i] = p;
                for( j in 0..n) {
                    p = vi[j][i];
                    vi[j][i] = vi[j][k];
                    vi[j][k] = p;
                }
            }
        }
    }

    func orthes( n: Int64,  H: Array<Array<Float64>>,  ort: Array<Float64>,  V: Array<Array<Float64>>) {
        let low = 0;
        let high = n - 1;
        var f: Float64;
        var g: Float64;
        var h: Float64;
        var scale: Float64;
        var hi = H
        var orti = ort
        var vi = V
        for (m in low+1..high+1) {
            scale = 0.0;
            for (i in m..high+1) {
                scale = scale + abs(hi[i][m - 1]);
            }
            if (scale != 0.0) {
                h = 0.0;
                for (i in high..m-1:-1){
                    orti[i] = hi[i][m - 1] / scale;
                    h += orti[i] * orti[i];
                }
                g = sqrt(Float64(h));
                if (orti[m] > 0.0) {
                    g = -g;
                }

                h = h - orti[m] * g
                orti[m] = orti[m] - g

                for (j in m..n) {
                    f = 0.0;
                    for (i in high..m-1:-1){
                        f += orti[i] * hi[i][j];
                   }
                    f = f / h;
                    for (i in m..high+1) {
                        hi[i][j] -= f * orti[i];
                    }
                }

                for (i in 0..high+1 ){
                    f = 0.0;
                    for (j in high..m-1: -1){
                        f += orti[j] * hi[i][j];
                    }
                    f = f / h;
                    for (j in m..high+1) {
                        hi[i][j] -= f * orti[j];
                    }
                }

                orti[m] = scale * orti[m];
                hi[m][m - 1] = scale * g;
            }
        }

        for (i in 0..n) {
            for (j in 0..n) {
                if(i==j){
                    vi[i][j] = 1.0
                }else{
                    vi[i][j] = 0.0
                }
            }
        }
        for (m in high - 1..low: -1) {
            if (hi[m][m - 1] != 0.0) {
                for (i in high..(m+1)) {
                    orti[i] = hi[i][m - 1];
                }

                for (j in m..high+1) {
                    g = 0.0;
                    for (i in m..high+1) {
                        g += orti[i] * vi[i][j];
                    }

                    g = g / orti[m] / hi[m][m - 1];
                    for (i in m..high+1 ){
                        vi[i][j] += g * orti[i];
                    }
                }
            }
        }

    }

    func hqr2( nn: Int64,  e: Array<Float64>,  d: Array<Float64>,  v: Array<Array<Float64>>, h: Array<Array<Float64>>) {
        var n = nn - 1;
        let low = 0;
        let high = nn - 1;
        let eps = pow(MLINDEX_BYTES_NUM_20, MLINDEX_BYTES_NUM_0520);
        var exshift = 0.0;
        var norm = 0.0;
        var p = 0.0;
        var q = 0.0;
        var r = 0.0;
        var s = 0.0;
        var z = 0.0;
        var iter = 0.0;
        var l: Int64;
        var m: Int64;
        var t: Float64
        var w: Float64;
        var x: Float64;
        var y: Float64;
        var ra: Float64;
        var sa: Float64;
        var vr: Float64;
        var vi: Float64;
        var notlast: Bool;
        var cdivres: (Float64,Float64);

        let nni = nn
        var ei = e
        var di = d
        var vd = v
        var hi = h

        for (i in 0..nni) {
            if (i < low || i > high) {
                di[i] = hi[i][i];
                ei[i] = 0.0;
            }

            for  (j in max(i-1, 0)..nni) {
                norm = norm + abs(hi[i][j]);
            }
        }

        while (n >= low) {
            l = n;
            while (l > low) {
                s = abs(h[l - 1][l - 1]) + abs(hi[l][l]);
                if (s == 0.0) {
                    s = norm;
                }
                if (abs(hi[l][l - 1]) < eps * s) {
                    break;
                }
                l -= 1;
            }

            if (l == n) {
                hi[n][n] = hi[n][n] + exshift;
                di[n] = hi[n][n];
                ei[n] = 0.0;
                n -= 1;
                iter = 0.0;
            }else if (l == n - 1) {
                w = hi[n][n - 1] * hi[n - 1][n];
                p = (hi[n - 1][n - 1] - hi[n][n]) / Float64(MLINDEX_BYTES_NUM_2);
                q = p * p + w;
                z = sqrt(Float64(abs(q)));
                hi[n][n] = hi[n][n] + exshift;
                hi[n - 1][n - 1] = hi[n - 1][n - 1] + exshift;
                x = hi[n][n];

                if (q >= 0.0) {
                    if(p >= 0.0){
                        z = Float64(p) + z
                    }else{
                        z = Float64(p) - z
                    }
                    di[n - 1] = x + z;
                    di[n] = d[n - 1];
                    if (z != 0.0) {
                        di[n] = x - w / z;
                    }
                    ei[n - 1] = 0.0;
                    ei[n] = 0.0;
                    x = hi[n][n - 1];
                    s = abs(x) + abs(z);
                    p = x / s;
                    q = z / s;
                    r = sqrt(Float64(p * p + q * q));
                    p = p / r;
                    q = q / r;

                    for (j in n-1..nni) {
                        z = Float64(hi[n - 1][j]);
                        hi[n - 1][j] = q * z + p * hi[n][j];
                        hi[n][j] = q * hi[n][j] - p * z;
                    }
                    for (i in 0..n+1) {
                        z = Float64(hi[i][n - 1]);
                        hi[i][n - 1] = q * z + p * hi[i][n];
                        hi[i][n] = q * hi[i][n] - p * z;
                    }

                    for (i in low..high+1) {
                        z = Float64(vd[i][n - 1]);
                        vd[i][n - 1] = q * z + p * vd[i][n];
                        vd[i][n] = q * vd[i][n] - p * z;
                    }
                } else {
                    di[n - 1] = x + p;
                    di[n] = x + p;
                    ei[n - 1] = z;
                    ei[n] = -z;
                }

                n = n - MLINDEX_BYTES_NUM_2;
                iter = 0.0;
            } else {
                x = hi[n][n];
                y = 0.0;
                w = 0.0;
                if (l < n) {
                    y = hi[n - 1][n - 1];
                    w = hi[n][n - 1] * hi[n - 1][n];
                }

                if (iter == Float64(MLINDEX_BYTES_NUM_10)) {
                    exshift += x;
                    for (i in low..n+1 ){
                        hi[i][i] -= x;
                    }
                    s = abs(hi[n][n - 1] + abs(hi[n - 1][n - MLINDEX_BYTES_NUM_2]));
                    y = MLINDEX_BYTES_NUM_075 * s;
                    x = y
                    w = MLINDEX_BYTES_NUM_04375 * s * s;
                }

                if (iter == Float64(MLINDEX_BYTES_NUM_30)) {
                    s = (y - x) / Float64(MLINDEX_BYTES_NUM_2);
                    s = s * s + w;
                    if (s > 0.0) {
                        s = sqrt(s);
                        if (y < x) {
                            s = -s;
                        }
                        s = x - w / ((y - x) / Float64(MLINDEX_BYTES_NUM_2) + s);
                        for (i in low..n+1) {
                            hi[i][i] -= s;
                        }
                        exshift += s;
                        w = MLINDEX_BYTES_NUM_0964;
                        y = w
                        x = y
                    }
                }

                iter = iter + 1.0;

                m = n - MLINDEX_BYTES_NUM_2;
                while (m >= l) {
                    z = hi[m][m];
                    r = x - z;
                    s = y - z;
                    p = (r * s - w) / hi[m + 1][m] + hi[m][m + 1];
                    q = hi[m + 1][m + 1] - z - r - s;
                    r = hi[m + MLINDEX_BYTES_NUM_2][m + 1];
                    s = abs(p) + abs(q) + abs(r);
                    p = p / s;
                    q = q / s;
                    r = r / s;
                    if (m == l) {
                        break;
                    }
                    if (
                        abs(hi[m][m - 1]) * (abs(q) + abs(r)) <
                        eps * (abs(p) * (abs(hi[m - 1][m - 1]) + abs(z) + abs(hi[m + 1][m + 1])))
                    ) {
                        break;
                    }
                    m -= 1;
                }
                for (i in m+MLINDEX_BYTES_NUM_2..n+1) {
                    hi[i][i - MLINDEX_BYTES_NUM_2] = 0.0;
                    if (i > m + MLINDEX_BYTES_NUM_2) {
                        hi[i][i - MLINDEX_BYTES_NUM_3] = 0.0;
                    }
                }
                for (k in m..n){
                    notlast = (k != n - 1);
                    if (k != m) {
                        p = hi[k][k - 1];
                        q = hi[k + 1][k - 1];
                        if(notlast){
                            r = hi[k + MLINDEX_BYTES_NUM_2][k - 1]
                        }else{r=0.0}
                        x = abs(p) + abs(q) + abs(r);
                        if (x != 0.0) {
                            p = p / x
                            q = q / x
                            r = r / x
                        }
                    }

                    if (x == 0.0) {
                        break;
                    }

                    s = sqrt(Float64(p * p + q * q) + r * r);
                    if (p < 0.0) {
                        s = -s;
                    }

                    if (s != 0.0) {
                        if (k != m) {
                            hi[k][k - 1] = -s * x;
                        } else if (l != m) {
                            hi[k][k - 1] = -hi[k][k - 1];
                        }

                        p = p + s;
                        x = p / s;
                        y = q / s;
                        z = r / s;
                        q = q / p;
                        r = r / Float64(p);

                        for (j in k..nni) {
                            p = hi[k][j] + q * hi[k + 1][j];
                            if (notlast) {
                                p = p + r * hi[k + MLINDEX_BYTES_NUM_2][j];
                                hi[k + MLINDEX_BYTES_NUM_2][j] = hi[k + MLINDEX_BYTES_NUM_2][j] - p * z;
                            }

                            hi[k][j] = hi[k][j] - p * x;
                            hi[k + 1][j] = hi[k + 1][j] - p * y;
                        }

                        for (i in 0..min(n, k + MLINDEX_BYTES_NUM_3)+1) {
                            p = x * hi[i][k] + y * hi[i][k + 1];
                            if (notlast) {
                                p = p + z * hi[i][k + MLINDEX_BYTES_NUM_2];
                                hi[i][k + MLINDEX_BYTES_NUM_2] = hi[i][k + MLINDEX_BYTES_NUM_2] - p * r;
                            }

                            hi[i][k] = hi[i][k] - p;
                            hi[i][k + 1] = hi[i][k + 1] - p * q;
                        }

                        for (i in low..high+1) {
                            p = x * vd[i][k] + y * vd[i][k + 1];
                            if (notlast) {
                                p = p + z * vd[i][k + MLINDEX_BYTES_NUM_2];
                                vd[i][k + MLINDEX_BYTES_NUM_2] = vd[i][k + MLINDEX_BYTES_NUM_2] - p * r;
                            }

                            vd[i][k] = vd[i][k] - p;
                            vd[i][k + 1] = vd[i][k + 1] - p * q;
                        }
                    }
                }
            }
        }


        if (norm == 0.0) {
            return;
        }
        for (n in nni- 1..-1: -1) {
            p = di[n];
            q = ei[n];

            if (q == 0.0) {
                l = n;
                hi[n][n] = 1.0;
                for (i in n-1..-1:-1){
                    w = hi[i][i] - p;
                    r = 0.0;
                    for (j in l..n+1) {
                        r = r + hi[i][j] * hi[j][n];
                    }

                    if (ei[i] < 0.0) {
                        z = w;
                        s = r;
                    } else {
                        l = i;
                        if (ei[i] == 0.0) {
                            if (w != 0.0) {
                                hi[i][n] = -r / w
                            }else {
                                hi[i][n] = -r / (eps * norm)
                            }
                        } else {
                            x = hi[i][i + 1];
                            y = hi[i + 1][i];
                            q = (di[i] - p) * (di[i] - p) + ei[i] * ei[i];
                            t = x * s - z * r / q;
                            hi[i][n] = t;
                            if (abs(x) > abs(z)) {
                                hi[i + 1][n] = -r - w * t / x
                            }else {
                                hi[i + 1][n] = -s - y * t / z;
                            }
                        }

                        t = abs(hi[i][n]);
                        if (eps * t * t > 1.0) {
                            for (j in i..n+1) {
                                hi[j][n] = hi[j][n] / t;
                            }
                        }
                    }
                }
            } else if (q < 0.0) {
                l = n - 1;

                if (abs(hi[n][n - 1]) > abs(hi[n - 1][n])) {
                    hi[n - 1][n - 1] = q / hi[n][n - 1];
                    hi[n - 1][n] = -(hi[n][n] - p) / hi[n][n - 1];
                } else {
                    cdivres = cdiv(0.0, -hi[n - 1][n], hi[n - 1][n - 1] - p, q);
                    hi[n - 1][n - 1] = cdivres[0];
                    hi[n - 1][n] = cdivres[1];
                }

                hi[n][n - 1] = 0.0;
                hi[n][n] = 1.0;
                for (i in n-MLINDEX_BYTES_NUM_2..-1: -1){
                    ra = 0.0;
                    sa = 0.0;
                    for (j in l..n+1) {
                        ra = ra + hi[i][j] * hi[j][n - 1];
                        sa = sa + hi[i][j] * hi[j][n];
                    }

                    w = hi[i][i] - p;

                    if (ei[i] < 0.0) {
                        z = w;
                        r = ra;
                        s = sa;
                    } else {
                        l = i;
                        if (ei[i] == 0.0) {
                            cdivres = cdiv(-ra, -sa, w, q);
                            hi[i][n - 1] = cdivres[0];
                            hi[i][n] = cdivres[1];
                        } else {
                            x = hi[i][i + 1];
                            y = hi[i + 1][i];
                            vr = (di[i] - p) * (di[i] - p) + ei[i] * ei[i] - q * q;
                            vi = (di[i] - p) * Float64(MLINDEX_BYTES_NUM_2) * q;
                            if (vr == 0.0 && vi == 0.0) {
                                vr = eps * norm * (abs(w) + abs(q) + abs(x) + abs(y) + abs(z));
                            }
                            cdivres = cdiv( x * r - z * ra + q * sa, x * s - z * sa - q * ra, vr,vi);
                            hi[i][n - 1] = cdivres[0]
                            hi[i][n] = cdivres[1]
                            if (abs(x) > abs(z) + abs(q)) {
                                hi[i + 1][n - 1] = (-ra - w * hi[i][n - 1] + q * hi[i][n]) / x;
                                hi[i + 1][n] = (-sa - w * hi[i][n] - q * hi[i][n - 1]) / x;
                            } else {
                                cdivres = cdiv(-r - y * hi[i][n - 1], -s - y * hi[i][n], z, q);
                                hi[i + 1][n - 1] = cdivres[0]
                                hi[i + 1][n] =cdivres[1]
                            }
                        }

                        t = max(abs(hi[i][n - 1]), abs(hi[i][n]));
                        if (eps * t * t > 1.0) {
                            for (j in i..n+1) {
                                hi[j][n - 1] = hi[j][n - 1] / t;
                                hi[j][n] = hi[j][n] / t;
                            }
                        }
                    }
                }
            }
        }
        for (i in 0..nni) {
            if (i < low || i > high) {
                for (j in i..nni) {
                    vd[i][j] = hi[i][j]
                }
            }
        }
        for (j in nni - 1..low-1: -1) {
            for (i in low..high+1) {
                z = 0.0;
                for (k in low..min(j, high)+1) {
                    z = z + Float64(vd[i][k] * hi[k][j]);
                }
                vd[i][j] = z
            }
       }
    }

    func cdiv( xr: Float64,  xi: Float64,  yr: Float64,  yi: Float64): (Float64,Float64) {
        var r: Float64
        var d: Float64
        if (abs(yr) > abs(yi)) {
            r = yi / yr;
            d = yr + r * yi;
            return ((xr + r * xi) / d, (xi - r * xr) / d);
        } else {
            r = yr / yi;
            d = yi + r * yr;
            return ((r * xr + xi) / d, (r * xi - xr) / d);
        }
    }
}

// ml-matrix src/dc/qr.js
class MlMatrixDCQR {
    var qr: Matrix
    var rdiag: Array<Float64> =[]

    init( qr: Matrix) {
        this.qr = qr
    }
    func qrDecomposition( val: Array<Array<Int64>>) {

        var value = Matrix.checkMatrix(val);

        let qr = value.clone();
        let m = value.rows;
        let n = value.columns;
        var rdiag =  Array(n,repeat:0.0);
        var s: Float64

        for (k in 0..n ){
            var nrm = 0.0;
            for (i in k..m) {
                nrm = mlMatrixDCUtil.hypotenuse(nrm, qr.get(i, k));
            }
            if (nrm != 0.0) {
                if (qr.get(k, k) < 0.0) {
                    nrm = -nrm;
                }
                for (i in k..m) {
                    _ = qr.set(i, k, qr.get(i, k)/nrm)

                }
                _ =  qr.set(k, k, qr.get(k, k) + 1.0)
                for (j in k+1..n) {
                    s = 0.0;
                    for (i in k..m) {
                        s += qr.get(i, k) * qr.get(i, j)
                    }
                    s = -s / qr.get(k, k)
                    for (i in k..m) {
                        _ = qr.set(i, j, qr.get(i, j) + s * qr.get(i, k))

                    }
                }
            }
            rdiag[k] = -nrm;
        }

        this.qr = qr;
        this.rdiag = rdiag;
    }

    func solve (val: Any) :Matrix {
        var value = Matrix.checkMatrix(val);

        let qr = this.qr
        let m = qr.rows;

        if ((value as Matrix).getOrThrow().rows != m) {
            throw Exception("Matrix row dimensions must agree");
        }
        if (!this.isFullRank()) {
            throw Exception("Matrix is rank deficient");
        }

        let count = (value as Matrix).getOrThrow().columns;
        let x = (value as Matrix).getOrThrow().clone();
        let n = qr.columns;
        var s: Float64

        for (k in 0..n) {
            for (j in 0..count) {
                s = 0.0;
                for (i in k..m) {
                    s += qr.get(i, k) * x.get(i, j);
                }
                s = -s / qr.get(k, k);
                for (i in k..m ){
                    _ = x.set(i, j, x.get(i, j) + s * qr.get(i, k))
                }
            }
        }
        for (k in n - 1..-1: -1){
            for (j in 0..count) {
                _ = x.set(k, j, x.get(k, j) / (this.rdiag[k] as Float64).getOrThrow())
            }
            for (i in 0..k) {
                for (j in 0..count) {
                    _ = x.set(i, j, x.get(k, j) - x.get(k, j) * qr.get(i, k))
                }
            }
        }
        return x.subMatrix(0, n - 1, 0, count - 1);
    }
    func isFullRank () : Bool {
        let columns = this.qr.columns;
        for (i in 0..columns) {
            if ((this.rdiag[i] as Int64).getOrThrow() == 0) {
                return false;
            }
        }
        return true;
    }
    func upperTriangularMatrix():Matrix {
        let qr = this.qr;
        let n = qr.columns;
        let x =   Matrix(n, n);
        for (i in 0..n) {
            for (j in 0..n) {
                if (i < j) {
                    _ = x.set(i, j, qr.get(i, j))
                } else if (i == j) {
                    _ = x.set(i, j, (this.rdiag[i] as Float64).getOrThrow())
                } else {
                    _ = x.set(i, j, 0.0)
                }
            }
        }
        return x;
    }
    func orthogonalMatrix() :Matrix {
        let qr = this.qr;
        let rows = qr.rows;
        let columns = qr.columns;
        let x =   Matrix(rows, columns);
        var s: Float64;
        for (k in columns - 1..-1: -1){
            for (i in 0..rows) {
                _ = x.set(i, k, 0.0)
            }
            _ = x.set(k, k, 1.0)
            for (j in k..columns ){
                if (qr.get(k, k) != 0.0) {
                    s = 0.0;
                    for (i in k..rows) {
                        s += qr.get(i, k) * x.get(i, j)
                    }

                    s = -s / qr.get(k, k);

                    for (i in k..rows) {
                        _ = x.set(i, j, x.get(i, j) + s * qr.get(i, k))
                    }
                }
            }
        }
        return x;
    }
}


// feedforward-neural-networks utils.js
class FeedforwardNeuralNetworksUtilsCls {

    func sumRow( matrix: Matrix) : Matrix {
        let sum = Matrix.zeros(matrix.rows, 1);
        for (i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                _ = sum.set(i, 0, sum.get(i, 0) + matrix.get(i, j))
            }
        }
        return sum;
    }

    func sumCol( matrix: Matrix) : Matrix {
        let sum = Matrix.zeros(1, matrix.columns);
        for (i in 0..matrix.rows) {
            for (j in 0..matrix.columns) {
                _ = sum.set(0, j, sum.get(0, j) + matrix.get(i, j))
            }
        }
        return sum
    }
    func dictOutputs1(arr: Array<Int64>) : NeuralNetworkDict {
        var inputs: HashMap<String, Int64> = HashMap<String, Int64>()
        var outputs: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var index = 0
        for (i in 0..arr.size) {
            if (!inputs.contains("${arr[i]}")) {
                inputs.add("${arr[i]}" ,index)
                outputs.add(index, arr[i])
                index += 1
            }
        }
        return NeuralNetworkDict(inputs, outputs)
    }
    func dictOutputs2(arr: Array<Array<Int64>>) : NeuralNetworkDict {
        var inputs: HashMap<String, Int64> = HashMap<String, Int64>()
        var outputs: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
        var index = 0
        for (i in 0..arr.size) {
            var arrStr = Array<String>(arr[i].size,repeat:"")
            for(j in 0..arr[i].size){
                  arrStr[j] = "${arr[i][j]}"
            }
            let key = String.join(arrStr, delimiter: ",")
            if (!inputs.contains(key)) {
                inputs.add(key, index)
                outputs.add(index , 0)
                index += 1
            }
        }
        return NeuralNetworkDict(inputs, outputs)
    }


}
let FeedforwardNeuralNetworksUtils = FeedforwardNeuralNetworksUtilsCls()


// feedforward-neural-networks activationFunctions.js
abstract class ActivationFuncation {
    public func getName(): String

    public func getParamsCount(): Int64

    public func activation(value: Array<Float64>): Float64

    public func derivate(value: Array<Float64>): Float64
}

class ActivationFuncationTanh <: ActivationFuncation {

    var name: String = "tanh"

    var paramsCount: Int64 = 1

    public func getName() :String{return "tanh"}

    public func getParamsCount() :Int64{return 1}

    public func activation( value: Array<Float64>) : Float64 {
        return tanh(value[0])
    }

    public func derivate( value:Array<Float64>) : Float64 {
        return 1.0 - (value[0] * value[0])
    }
}

class ActivationFuncationIdentity <: ActivationFuncation {

    var name: String =  "identity"

    var paramsCount: Int64 = 1

    public func getName() :String{return "identity" }

    public func getParamsCount() :Int64{return 1}

    public func activation( value: Array<Float64>): Float64 {
        return value[0]
    }

    public func derivate( value: Array<Float64>):Float64 {
        return 1.0
    }
}

class ActivationFuncationLogistic <: ActivationFuncation {

    var paramsCount: Int64 = 1
    var name: String = "logistic"
    public func getName() :String{return "logistic" }

    public func getParamsCount() :Int64{return 1}
    func logistic( val: Float64) : Float64 {
        return 1.0 / (1.0 + exp(-val))
    }


    public func activation( value: Array<Float64>): Float64 {
        return logistic(value[0])
    }

    public func derivate(value: Array<Float64>) : Float64 {
        return logistic(value[0]) * (1.0 - logistic(value[0]))
    }
}

class ActivationFuncationArctan <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String = "arctan"
    public func getName() :String{return "arctan" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        return atan(value[0])
    }

    public func derivate( value: Array<Float64>) : Float64 {
        return 1.0 / (value[0] * value[0] + 1.0)
    }
}

class ActivationFuncationSoftsign <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String = "softsign"
    public func getName() :String{return "softsign" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        return value[0] / (1.0 + abs(value[0]))
    }

    public func derivate( value: Array<Float64>) :Float64 {
        return 1.0 / ((1.0 + abs(value[0])) * (1.0 + abs(value[0])))
    }
}

class ActivationFuncationRelu <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String = "relu"
    public func getName() :String{return "relu" }

    public func getParamsCount() :Int64{return 1}
    public func activation(value: Array<Float64>) : Float64 {
        if(value[0] < 0.0){
            return 0.0
        }else{
            return value[0]
        }
    }

    public func derivate( value: Array<Float64>): Float64 {
        if(value[0] < 0.0){
            return 0.0
        }else{
            return 1.0
        }
    }
}

class ActivationFuncationSoftplus <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String ="softplus"
    public func getName() :String{return "softplus" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        return log(1.0 + exp(value[0]))
    }

    public func derivate(value: Array<Float64>) :Float64 {
        return 1.0 / (1.0 + exp(-value[0]))
    }
}

class ActivationFuncationBent <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String ="bent"
    public func getName() :String{return "bent" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        return (sqrt(value[0] * value[0] + 1.0) - 1.0) / Float64(MLINDEX_BYTES_NUM_2) + value[0]
    }

    public func derivate( value: Array<Float64>) : Float64 {
        return (value[0] / (Float64(MLINDEX_BYTES_NUM_2) * sqrt(value[0] * value[0] + 1.0))) + 1.0
    }
}

class ActivationFuncationSinusoid <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String= "sinusoid"
    public func getName() :String{return "sinusoid" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        return sin(value[0])
    }

    public func derivate( value:Array<Float64>) : Float64 {
        return cos(value[0])
    }
}

class ActivationFuncationSinc <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String = "sinc"
    public func getName() :String{return "sinc" }

    public func getParamsCount() :Int64{return 1}
    public func activation( value: Array<Float64>) : Float64 {
        if(value[0] == 0.0){
            return 1.0
        }else{
            return sin(value[0]) / value[0]
        }
    }

    public func derivate( val: Array<Float64>) : Float64 {
        if(val[0] == 0.0){
            return 0.0
        }else{
            return (cos(val[0]) / val[0]) - (sin(val[0]) / (val[0] * val[0]))
        }
    }
}

class ActivationFuncationGaussian <: ActivationFuncation {

    var paramsCount: Int64 = 1

    var name: String = "gaussian"
    public func getName() :String{return "gaussian" }

    public func getParamsCount() :Int64{return 1}
    public func activation(val: Array<Float64>) : Float64 {
        return exp(-(val[0] * val[0]))
    }

    public func derivate( val: Array<Float64>) : Float64 {
        return Float64(MLINDEX_BYTES_NUM_002) * val[0] * exp(-(val[0] * val[0]))
    }
}

class ActivationFuncationParametricRelu <: ActivationFuncation {

    var paramsCount: Int64 = MLINDEX_BYTES_NUM_2

    var name: String = "parametric-relu"
    public func getName() :String{return "parametric-relu" }

    public func getParamsCount() :Int64{return MLINDEX_BYTES_NUM_2}
    public func activation( value:Array<Float64>) : Float64 {
        if (value.size > 1) {
            if(value[0] < 0.0){
                return value[1] * value[0]
            }else{
                return value[0]
            }
        }else {
            return value[0]
        }
    }

    public func derivate( value: Array<Float64>) : Float64 {
        if (value.size > 1) {
            if(value[0] < 0.0){
                return value[1]
            }else{
                return 1.0
            }
        }else {
            return value[0]
        }
    }
}

class ActivationFuncationExponentialElu <: ActivationFuncation {

    var paramsCount: Int64 = MLINDEX_BYTES_NUM_2

    var name: String = "exponential-elu"
    public func getName() :String{return "exponential-elu" }

    public func getParamsCount() :Int64{return MLINDEX_BYTES_NUM_2}
    public func expElu( val: Float64,  param: Float64) : Float64 {
        if(val < 0.0){
            return param * (exp(val) - 1.0)
         }else{
            return val
         }
    }

    public func activation( value: Array<Float64>) : Float64 {
        return expElu(value[0], value[1])
    }

    public func derivate( value: Array<Float64>) : Float64 {
        if(value[0] < 0.0){
            return expElu(value[0], value[1]) + value[1]
        }else{
            return 1.0
        }
    }
}

class ActivationFuncationSoftExponential <: ActivationFuncation {

    var paramsCount: Int64 = MLINDEX_BYTES_NUM_2

    var name: String = "soft-exponential"
    public func getName() :String{return "soft-exponential" }

    public func getParamsCount() :Int64{return MLINDEX_BYTES_NUM_2}
    public func softExponential( val: Float64,  param: Float64) : Float64 {
        if (param < 0.0) {
            return -log(1.0 - param * (val + param)) / param;
        }
        if (param > 0.0) {
            return ((exp(param * val) - 1.0) / param) + param;
        }
        return val;
    }

    func softExponentialPrime( val: Float64,  param: Float64) : Float64 {
        if (param < 0.0) {
            return 1.0 / (1.0 - param * (param + val));
        } else {
            return exp(param * val);
        }
    }

    public func activation( value: Array<Float64>) : Float64 {
        return softExponential(value[0], value[1])
    }

    public func derivate( value: Array<Float64>) : Float64 {
        return softExponentialPrime(value[0], value[1])
    }
}

let ACTIVATION_FUNCTIONS: Array<ActivationFuncation>  = [
    ActivationFuncationTanh(),
    ActivationFuncationIdentity(),
    ActivationFuncationLogistic(),
    ActivationFuncationArctan(),
    ActivationFuncationSoftsign(),
    ActivationFuncationRelu(),
    ActivationFuncationSoftplus(),
    ActivationFuncationBent(),
    ActivationFuncationSinusoid(),
    ActivationFuncationSinc(),
    ActivationFuncationGaussian(),
    ActivationFuncationParametricRelu(),
    ActivationFuncationExponentialElu(),
    ActivationFuncationSoftExponential()
]
let FeedforwardNeuralNetworksActivationFunctions = ACTIVATION_FUNCTIONS

// feedforward-neural-networks FeedForwardNeuralNetwork.js
struct NeuralNetworkDict {
    var inputs: HashMap<String, Int64> =  HashMap<String, Int64>()
    var outputs:HashMap<Int64, Int64> = HashMap<Int64, Int64>()
    init( inputs:HashMap<String, Int64>, outputs: HashMap<Int64, Int64>) {
        this.inputs = inputs
        this.outputs = outputs
    }
}

class FeedforwardNeuralNetwork {

    var hiddenLayers: Array<Int64>

    var iterations: Int64 = 0

    var learningRate: Float64 = 0.0

    var regularization: Float64 = 0.0

    var dicts: ?NeuralNetworkDict =None

    var activation: ?String =None

    var activationParam: ?Float64 =None

    var model = ArrayList<FeedforwardNeuralNetworksLayer>()


    init( options: MlOptions) {
        if (options.model.isSome()) {
            hiddenLayers = options.hiddenLayers
            iterations = options.iterations.getOrThrow()
            learningRate = options.learningRate.getOrThrow()
            regularization = options.regularization.getOrThrow()
            dicts = options.dicts
            activation = options.activation

            activationParam = options.activationParam
            model = ArrayList<FeedforwardNeuralNetworksLayer>()
            for (i in 0..(options.layers.size-1)) {
                model.add(FeedforwardNeuralNetworksLayer.load(options.layers[i]))
            }
            model.add(FeedforwardNeuralNetworksOutputLayer(options.layers[options.layers.size - 1]))


        } else {
            if(options.hiddenLayers.size == 0){
                hiddenLayers =  [MLINDEX_BYTES_NUM_10]
            }else{
                hiddenLayers = options.hiddenLayers
            }
            if(options.iterations.isNone()){
                iterations = MLINDEX_BYTES_NUM_50
            }else{
                iterations = options.iterations.getOrThrow()
            }
            if(options.learningRate.isNone()){
                learningRate = MLINDEX_BYTES_NUM_001
            }else{
                learningRate  =  options.learningRate.getOrThrow()
            }
            if(options.regularization.isNone()){
                regularization = MLINDEX_BYTES_NUM_001
            }else{
                regularization =  options.regularization.getOrThrow()
            }
            if(options.activation.isNone()){
                activation =  "tanh"
            }else{
                activation =  options.activation.getOrThrow()
            }
            if( options.activationParam.isNone()){
                activationParam = 1.0
            }else{
                activationParam = options.activationParam.getOrThrow()
            }
            var flag = true
            for(i in ACTIVATION_FUNCTIONS){
                if(i.getName() == activation.getOrThrow()){
                    flag = false
                    break;
                }
            }
            if(flag){activation = "tanh"}
        }
    }

    func buildNetwork( inputSize: Int64,  outputSize: Int64) {
        _ = MLINDEX_BYTES_NUM_2 + (hiddenLayers.size - 1);
        model = ArrayList<FeedforwardNeuralNetworksLayer>()
        let options = MlOptions()
        options.inputSize = inputSize
        options.outputSize = hiddenLayers[0]
        options.activation = activation
        options.activationParam = activationParam
        options.regularization = regularization
        options.epsilon = learningRate

        model.add(FeedforwardNeuralNetworksLayer(options))
        for (i in 1..hiddenLayers.size ){
            let option = MlOptions()
            option.inputSize = hiddenLayers[i - 1]
            option.outputSize = hiddenLayers[i]
            option.activation = activation
            option.activationParam = activationParam
            option.regularization = regularization
            option.epsilon = learningRate
            model.add(FeedforwardNeuralNetworksLayer(option))
        }

        let optionOut = MlOptions()
        optionOut.inputSize = hiddenLayers[hiddenLayers.size - 1]
        optionOut.outputSize = outputSize
        optionOut.activation = activation
        optionOut.activationParam = activationParam
        optionOut.regularization = regularization
        optionOut.epsilon = learningRate
        model.add(FeedforwardNeuralNetworksOutputLayer(optionOut))
    }



    func train1( features: Any, labels: Array<Int64>) {
        var feature = Matrix.checkMatrix(features)

        var inputSize = feature.columns
        var dicts = FeedforwardNeuralNetworksUtils.dictOutputs1(labels)
        let outputSize = dicts.inputs.keys().size

        buildNetwork(inputSize, outputSize);
        for (_ in 0..iterations) {
            let probabilities = propagate(feature);
            backpropagation1(feature, labels, probabilities,dicts);
        }
    }
    func train2( features: Any, labels: Array<Array<Int64>>) {
        var feature = Matrix.checkMatrix(features)
        var inputSize = feature.columns
        var dicts = FeedforwardNeuralNetworksUtils.dictOutputs2(labels)

        let outputSize = dicts.inputs.keys().size
        buildNetwork(inputSize, outputSize);
        for (_ in 0..iterations) {
            let probabilities = propagate(feature);
            backpropagation2(feature, labels, probabilities,dicts);
        }
    }

    func getDicts1 ( features: Any, labels: Array<Int64>):NeuralNetworkDict{
        var feature = Matrix.checkMatrix(features)
        var inputSize = feature.columns
        var dicts = FeedforwardNeuralNetworksUtils.dictOutputs1(labels)
        return dicts

    }

    func getDicts2 ( features: Any, labels: Array<Array<Int64>>):NeuralNetworkDict{
        var feature = Matrix.checkMatrix(features)
        var inputSize = feature.columns
        var dicts = FeedforwardNeuralNetworksUtils.dictOutputs2(labels)
        return dicts

    }


    func propagate( X: Matrix) : Matrix {
        var input = X;
        for (i in 0..model.size) {
            input = model[i].forward(input);
        }
        return input.divColumnVector(FeedforwardNeuralNetworksUtils.sumRow(input));
    }
    func backpropagation1( features: Matrix,  labels: Array<Int64>,  probabilities: Matrix,dicts:NeuralNetworkDict) {
        let newProbabilities = probabilities
        for (i in 0..newProbabilities.array.size) {
            var key = labels[i]
            _ = newProbabilities.set(i, (dicts.inputs["${labels[i]}"]), Float64(probabilities.get(i, (dicts.inputs["${labels[i]}"])) - 1.0))
        }

        var delta = newProbabilities;
        for (i in model.size-1..-1:-1) {
            var a = features
            if(i > 0){
                a=model[i-1].a.getOrThrow()
            }
            delta = model[i].backpropagation(delta, a)
        }
        for (i in 0..model.size) {
            model[i].update()
        }
    }

    func backpropagation2( features: Matrix,  labels: Array<Array<Int64>>,  probabilities: Matrix,dicts:NeuralNetworkDict) {
        let newProbabilities = probabilities
        for (i in 0..newProbabilities.array.size) {
            var key1 = labels[i]
            var arrStr = Array<String>(key1.size,repeat:"")
            for(j in 0..key1.size){
                arrStr[j] = "${key1[j]}"
            }
            var key = String.join(arrStr, delimiter: ",")
            _ = newProbabilities.set(i, (dicts.inputs[key]), probabilities.get(i, (dicts.inputs[key])) - 1.0)

        }

        var delta = newProbabilities;
        for (i in model.size-1..-1:-1) {
            var a = features
            if(i > 0){
                a=model[i-1].a.getOrThrow()
            }
            delta = model[i].backpropagation(delta, a)
        }
        for (i in 0..model.size) {
            model[i].update()
        }
    }


    func predict(feature: Any,dicts:NeuralNetworkDict) : ArrayList<Any>{
        var features = Matrix.checkMatrix(feature)
        var outputs = ArrayList<Any>()
        let probabilities = propagate(features)
        for (i in 0..features.rows) {
            if(dicts.outputs.contains(probabilities.maxRowIndex(i)[1])){
                let result = dicts.outputs[probabilities.maxRowIndex(i)[1]]
                outputs.add(result)

            }
        }
        return outputs;
    }

    func toJSON(): MlOptions {
        let model = MlOptions()
        model.model = "FNN"
        model.hiddenLayers = hiddenLayers
        model.iterations = iterations
        model.learningRate = learningRate
        model.regularization = regularization
        model.activation = activation
        model.activationParam = activationParam
        model.dicts = dicts
        model.layers = ArrayList<MlOptions>()
        for (i in 0..this.model.size){
            model.layers.add(this.model[i].toJSON())
        }
        return model
    }

    static func load(model: MlOptions) : FeedforwardNeuralNetwork {
        if (model.model != "FNN") {
            throw Exception("the current model is not a feed forward network")
        }
        return FeedforwardNeuralNetwork(model)
    }
}

public func indexFirst(arr:Array<Int64>,target:Int64):Int64{
    var first = -1
    var flg = false
    for(i in 0..arr.size){
        if(arr[i] == target && !flg){
            first = i
            flg = true
            break
        }
    }
    return first
}


public func reversed(x:Array<Int64>) : Array<Int64> {
    var newX = x
    for(i in 0..x.size){
        newX[i] = x[x.size-1-i]
    }
    return newX
}

public func sort(arr:Array<Int64>):Array<Int64>{
    for(i in 0..arr.size-1){
        for(j in 0..arr.size-i-1){
            if(arr[j]>arr[j+1]){
                var temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
    return arr
}

public func findFirst<T>(predicate: (T) -> Bool): (Iterable<T>) -> Option<T> {
    {
        it: Iterable<T> =>
        for (v in it) {
            if (v |> predicate) {
                return Some(v)
            }
        }
        return None
    }
}

open class ActFunction{
    var actFunction : ((Float64) -> Float64) = {val =>
                return val}
}

open class DerFunction{
    var derFunction: ((Float64) -> Float64) = {val =>
                return val}
}

// feedforward-neural-networks Layer.js
open class FeedforwardNeuralNetworksLayer {

    var inputSize: ?Int64 = None

    var outputSize: ?Int64 = None

    var regularization: ?Float64 = None

    var epsilon: ?Float64 = None

    var activation: ?String = None

    var activationParam: ?Float64 = None

    var w: ?Matrix = None

    var b: ?Matrix = None

    var a: ?Matrix = None

    var dw: ?Matrix = None

    var db: ?Matrix = None

    var activationFunction : ?((Matrix, Int64, Int64) -> Unit) = None

    var derivate : ?((Matrix, Int64, Int64)-> Unit) = None

    init( options: MlOptions) {
        this.inputSize = options.inputSize;
        this.outputSize = options.outputSize;
        this.regularization = options.regularization;
        this.epsilon = options.epsilon;
        this.activation = options.activation;
        this.activationParam = options.activationParam;

        let selectedFunction = (ACTIVATION_FUNCTIONS |> findFirst<ActivationFuncation> {item => item.getName() == options.activation.getOrThrow()}).getOrThrow()


        let actFunction1 : ((Float64) -> Float64) = { val =>
            if (options.activationParam.isSome()) {
                return selectedFunction.activation([val, options.activationParam.getOrThrow()])
            }else {
                return selectedFunction.activation([val, 1.0])
            }
        }
        let actFunction2 : ((Float64) -> Float64) = {val =>
                return selectedFunction.activation([val])
        }
        if(selectedFunction.getParamsCount() == MLINDEX_BYTES_NUM_2) {
            this.activationFunction = { matrix, i, j =>
                _ = matrix.set(i, j, actFunction1(matrix.get(i, j)))
            }
        }else{
            this.activationFunction = { matrix, i, j =>
                _ = matrix.set(i, j, actFunction2(matrix.get(i, j)))
            }
        }

        let derFunction1: ((Float64) -> Float64) = { val =>
            return selectedFunction.derivate([val, options.activationParam.getOrThrow()])
        }
        let derFunction2: ((Float64) -> Float64) = { val =>
            return selectedFunction.derivate([val])
        }
        if (selectedFunction.getParamsCount() == MLINDEX_BYTES_NUM_2){
            this.derivate = { matrix, i, j =>
                _ = matrix.set(i, j,derFunction1(matrix.get(i, j)))
            }
        }else{
            this.derivate = { matrix, i, j =>
                _ = matrix.set(i, j,derFunction2(matrix.get(i, j)))
            }
        }
        if (options.model.isSome()) {
            this.w = Matrix.checkMatrix(options.w.getOrThrow())
            b = Matrix.checkMatrix(options.b.getOrThrow())
        } else {
            this.w = Matrix.rand(inputSize.getOrThrow(), outputSize.getOrThrow(),Option<Float64>.None)
            this.b = Matrix.zeros(1, outputSize.getOrThrow())
            _ = this.w.getOrThrow().apply { matrix, i, j =>
                _ = matrix.set(i, j, matrix.get(i, j) / sqrt(Float64(options.inputSize.getOrThrow())))
            }
        }
    }

    func forward(x: Matrix) : Matrix {
        let z =  x.mmul(this.w.getOrThrow()).addRowVector(b.getOrThrow())
        _ = z.apply(activationFunction.getOrThrow())
        this.a = z.clone();
        return z;
    }

    func backpropagation( delta: Matrix, a: Matrix) :Matrix {
        this.dw =  a.transposeView().mmul(delta)
        this.db = FeedforwardNeuralNetworksUtils.sumCol(delta);
        let aCopy = a.clone();
        var temp = Matrix(this.w.getOrThrow().columns,this.w.getOrThrow().rows)
        for(i in 0..temp.rows){
            for(j in 0..temp.columns){

                temp.set(i,j,this.w.getOrThrow().get(j,i))
            }
        }

        return  delta.mmul(temp).mul(aCopy.apply(derivate.getOrThrow()));
    }


    func update() {
        _ = this.dw.getOrThrow().add(this.w.getOrThrow().clone().mul(this.regularization.getOrThrow()));
        _ = this.w.getOrThrow().add(this.dw.getOrThrow().mul(-this.epsilon.getOrThrow()));
        _ = this.b.getOrThrow().add(this.db.getOrThrow().mul(-this.epsilon.getOrThrow()));
    }

    func toJSON() : MlOptions {
        let model = MlOptions()
        model.model = "Layer"
        model.inputSize = inputSize
        model.outputSize = outputSize
        model.regularization = regularization
        model.epsilon = epsilon
        model.activation = activation
        model.w = w
        model.b = b
        return model
    }

    static func load(model: MlOptions) : FeedforwardNeuralNetworksLayer {
        if (model.model != "Layer") {
            throw Exception("the current model is not a Layer model");
        }
        return FeedforwardNeuralNetworksLayer(model);
    }
}
// feedforward-neural-networks OutputLayer.js
class FeedforwardNeuralNetworksOutputLayer <: FeedforwardNeuralNetworksLayer {
    init( options: MlOptions) {
        super(options)
        activationFunction = {matrix, i, j =>
            _ = matrix.set(i, j, exp(matrix.get(i, j)))
        }
    }
    static func load1( model: MlOptions) : FeedforwardNeuralNetworksOutputLayer {
        if (model.model != "Layer") {
            throw Exception("the current model is not a Layer model")
        }
        return FeedforwardNeuralNetworksOutputLayer(model);
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {

    public static func it(name: String, f: ()-> Unit): Unit {
        f()
    }
    func run() {
        let functions = ACTIVATION_FUNCTIONS
        it("Training the neural network with XOR operator") {
            var result: ArrayList<Any>

            let source = [
                [0.0, 0.0],
                [0.0, 1.0],
                [1.0, 0.0],
                [1.0, 1.0]
            ]
            let trainingSet =  Matrix(source, Option<Int64>.None)
            let predictions = [0, 1, 1, 0];
            for (i in 0..functions.size) {
                let options = MlOptions()
                options.hiddenLayers = [MLINDEX_BYTES_NUM_4]
                options.iterations = MLINDEX_BYTES_NUM_040
                options.learningRate = MLINDEX_BYTES_NUM_03
                options.activation = functions[i].getName()
                let xorNN = FeedforwardNeuralNetwork(options)
                xorNN.train1(trainingSet, predictions)
                var dicts = xorNN.getDicts1(trainingSet, predictions)
                result = xorNN.predict(trainingSet,dicts)
            }
        }

        it("Training the neural network with AND operator") {
            var result: ArrayList<Any>
            let trainingSet: Array<Array<Float64>> = [
                [0.0, 0.0],
                [0.0, 1.0],
                [1.0, 0.0],
                [1.0, 1.0]
            ];
            let predictions = [
                [1, 0],
                [1, 0],
                [1, 0],
                [0, 1]
            ];
            for (i in 0..functions.size) {
                let options = MlOptions()
                options.hiddenLayers = [MLINDEX_BYTES_NUM_3]
                options.iterations = MLINDEX_BYTES_NUM_75
                options.learningRate = MLINDEX_BYTES_NUM_03
                options.activation = functions[i].getName()
                let andNN = FeedforwardNeuralNetwork(options)
                andNN.train2(trainingSet, predictions)
                var dicts = andNN.getDicts2(trainingSet, predictions)
                result = andNN.predict(trainingSet,dicts)
            }
        }

        it("Export and import") {
            var result: ArrayList<Any>
            let trainingSet:Array<Array<Float64>> = [
                [0.0, 0.0],
                [0.0, 1.0],
                [1.0, 0.0],
                [1.0, 1.0]
            ];
            let predictions = [0, 1, 1, 1];
            for (i in 0..functions.size) {
                let options = MlOptions()
                options.hiddenLayers = [MLINDEX_BYTES_NUM_4]
                options.iterations = MLINDEX_BYTES_NUM_040
                options.learningRate = MLINDEX_BYTES_NUM_03
                options.activation = functions[i].getName()
                let nn =  FeedforwardNeuralNetwork(options)
                nn.train1(trainingSet, predictions)
                var dicts = nn.getDicts1(trainingSet, predictions)

                let model = nn.toJSON()
                let networkNN = FeedforwardNeuralNetwork.load(model)

                result = networkNN.predict(trainingSet,dicts);
            }
        }

        it("Multiclass clasification") {
            var result: ArrayList<Any>
            let trainingSet: Array<Array<Float64>> = [
                [0.0, 0.0],
                [0.0, 1.0],
                [1.0, 0.0],
                [1.0, 1.0]
            ]
            let predictions = [(MLINDEX_BYTES_NUM_2), 0, 1, 0]
            for (i in 0..functions.size) {
                let options = MlOptions()
                options.hiddenLayers = [MLINDEX_BYTES_NUM_4]
                options.iterations = MLINDEX_BYTES_NUM_040
                options.learningRate = MLINDEX_BYTES_NUM_05
                options.activation = functions[i].getName()
                let nn =  FeedforwardNeuralNetwork(options);
                nn.train1(trainingSet, predictions);
                var dicts = nn.getDicts1(trainingSet, predictions)

                result = nn.predict(trainingSet,dicts);
            }
        }
        it("Big case") {
            var result: ArrayList<Any>
            let trainingSet:Array<Array<Float64>> = [
                [1.0, 1.0],
                [1.0, Float64(MLINDEX_BYTES_NUM_2)],
                [Float64(MLINDEX_BYTES_NUM_2), 1.0],
                [Float64(MLINDEX_BYTES_NUM_2), Float64(MLINDEX_BYTES_NUM_2)],
                [Float64(MLINDEX_BYTES_NUM_3), 1.0],
                [1.0, Float64(MLINDEX_BYTES_NUM_3)],
                [1.0, Float64(MLINDEX_BYTES_NUM_4)],
                [Float64(MLINDEX_BYTES_NUM_4), 1.0],
                [Float64(MLINDEX_BYTES_NUM_6), 1.0],
                [Float64(MLINDEX_BYTES_NUM_6), Float64(MLINDEX_BYTES_NUM_2)],
                [Float64(MLINDEX_BYTES_NUM_6), Float64(MLINDEX_BYTES_NUM_3)],
                [Float64(MLINDEX_BYTES_NUM_6), Float64(MLINDEX_BYTES_NUM_4)],
                [Float64(MLINDEX_BYTES_NUM_6), Float64(MLINDEX_BYTES_NUM_5)],
                [Float64(MLINDEX_BYTES_NUM_5), Float64(MLINDEX_BYTES_NUM_5)],
                [Float64(MLINDEX_BYTES_NUM_4), Float64(MLINDEX_BYTES_NUM_5)],
                [Float64(MLINDEX_BYTES_NUM_3), Float64(MLINDEX_BYTES_NUM_5)]
            ];
            let predictions = [
                [1, 0],
                [1, 0],
                [1, 0],
                [1, 0],
                [1, 0],
                [1, 0],
                [1, 0],
                [1, 0],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1],
                [0, 1]
            ];
            for (i in 0..functions.size) {
                let options = MlOptions()
                options.hiddenLayers = [MLINDEX_BYTES_NUM_020]
                options.iterations = NUM_TIME_LOOP_CONST
                options.learningRate = MLINDEX_BYTES_NUM_001
                options.activation = functions[i].getName()
                let nn = FeedforwardNeuralNetwork(options);
                nn.train2(trainingSet, predictions);
                var dicts = nn.getDicts2(trainingSet, predictions)
                result = nn.predict([[MLINDEX_BYTES_NUM_050, MLINDEX_BYTES_NUM_40]],dicts);
            }
        }
    }
    /*
     * @Benchmark
     */
    func runIteration(){
        let start = Timer().getTime()
        for (_ in 0..NUM_TIME_LOOP_5) {
            run()
        }
        let end = Timer().getTime()
        println("ml: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}
main() {
    Benchmark().runIteration()
}
