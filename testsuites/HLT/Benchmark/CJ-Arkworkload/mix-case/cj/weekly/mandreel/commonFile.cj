/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*
import std.convert.*

let isDebug : Bool = false
let line = @sourceLine()
let file = @sourceFile()
func deBugLog(msg : Any , file!: String = file, line!: Int64 = line, fn!: String = "function") : Unit{
    if (isDebug) {
        let prefix = "${(msg as String).getOrThrow()}"
        print(prefix)
    }
}

class SwriteIndex {
    var swrite__index__: Int64 = 0;
    var _ZN21btCollisionDispatcher19defaultNearCallbackER16btBroadphasePairRS_RK16btDispatcherInfo__index__: Int64 = 0;
    var _ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3__index__: Int64 = 0;
    var _ZNK13btConvexShape31localGetSupportVertexNonVirtualERK9btVector3__index__: Int64 = 0;
    var cmpfacets__index__: Int64 = 0;
    var cmplocales__index__: Int64 = 0;
    var imandreel_restore_glcontext__index__: Int64 = 0;
    var iMandreel_TextureAsync_GetPackOffset__index__: Int64 = 0;
    var iMandreel_TextureAsync_IsCompressed__index__: Int64 = 0;
    var imandreel_viewport_resize__index__: Int64 = 0;
    var mandreel_flash_tcp_onError__index__: Int64 = 0;
    var _Z31MandreelDefaultDebugMsgCallbackiPKc__index__: Int64 = 0;
    var __fwrite__index__: Int64 = 0;
    var __mandreel_internal_SetResolution__index__: Int64 = 0;
    var __resize__index__: Int64 = 0;
    var _ZN16btCollisionWorld24ClosestRayResultCallback15addSingleResultERNS_14LocalRayResultEb__index__: Int64 = 0;
    var _ZN13BenchmarkDemo15displayCallbackEv__index__: Int64 = 0;
    var _ZNK16btCollisionWorld17RayResultCallback14needsCollisionEP17btBroadphaseProxy__index__: Int64 = 0;
    var _ZN16btCollisionWorld24ClosestRayResultCallbackD0Ev__index__: Int64 = 0;
    var _ZN13BenchmarkDemo20clientMoveAndDisplayEv__index__: Int64 = 0;
    var _ZN7RagDollD0Ev__index__: Int64 = 0;
    var _ZN7RagDollD1Ev__index__: Int64 = 0;
    var _ZN16btCollisionWorld24ClosestRayResultCallbackD1Ev__index__: Int64 = 0;
    var _ZN20btDefaultMotionState17setWorldTransformERK11btTransform__index__: Int64 = 0;
    var _ZNK20btDefaultMotionState17getWorldTransformER11btTransform__index__: Int64 = 0;
    var _ZN15DemoApplication16getDynamicsWorldEv__index__: Int64 = 0;
    var _ZN20btDefaultMotionStateD0Ev__index__: Int64 = 0;
    var _ZN20btDefaultMotionStateD1Ev__index__: Int64 = 0;
    var _ZN15DemoApplication6myinitEv__index__: Int64 = 0;
    var _ZN13BenchmarkDemoD1Ev__index__: Int64 = 0;
    var _ZN13BenchmarkDemoD0Ev__index__: Int64 = 0;
    var _ZN15DemoApplication20localCreateRigidBodyEfRK11btTransformP16btCollisionShape__index__: Int64 = 0;
}
let swrite_Index = SwriteIndex();
    
class TlsfPtr {
    var tlsf_ptr: Int64 = 0;
}
let tlsfPtr = TlsfPtr();
    
class CreateFileId {
    var buffer: CPointer<Unit>
    var offset: Int64
    var count = 0
    var byteArray: ArrayList<UInt8>
    init(buffer: CPointer<Unit>, offset!: Int64 = 0, byteArray!: ArrayList<UInt8> = ArrayList<UInt8>()) {
        this.buffer = buffer
        this.offset = offset
        this.byteArray = byteArray
    }
}
var mandreel_total_memory = 15908864;
var mandreel_stack_memory = 1048576;
var mandreel_heap_memory = 13591752;
var __FUNCTION_TABLE__: ArrayList<(Int64) -> Unit > = ArrayList.of({a:Int64 => return})
var mandreel_pos_function_table = 1;
var g_stack_pointer: Int64 = Malloc(mandreel_stack_memory);

open class MandreelBulkClass {
    var mandreel_width: Int64 = 0
    var mandreel_height: Int64 = 0
}

class ArrayUniformLocations <: MandreelBulkClass {
    var uniform_locations_current_id: Int64 = 0
    var array_uniform_locations: Array<Int64> = [0]
}
var array_ids_ogl: ArrayList<ArrayUniformLocations> = ArrayList<ArrayUniformLocations>();
    
class ImandreelGl {
    var TEXTURE_2D: Int64 = 0
    var RGB: Int64 = 0
    var RGBA: Int64 = 0
    var LUMINANCE: Int64 = 0
    var ALPHA: Int64 = 0
    var LUMINANCE_ALPHA: Int64 = 0
    var UNSIGNED_BYTE: Int64 = 0
    var UNSIGNED_SHORT_5_6_5: Int64 = 0
    var UNSIGNED_SHORT_4_4_4_4: Int64 = 0
    var UNSIGNED_SHORT_5_5_5_1: Int64 = 0
    var STATIC_DRAW: Int64 = 0
    
    func createTexture() : ArrayUniformLocations {
        return ArrayUniformLocations()
    }
    
    func createRenderbuffer() : ArrayUniformLocations {
        return ArrayUniformLocations()
    }
    
    func createFramebuffer() : ArrayUniformLocations {
        return ArrayUniformLocations()
    }
    
    func createBuffer() : ArrayUniformLocations {
        return ArrayUniformLocations()
    }
    
    func isEnabled(x: Int64) : Int64 {
        return 1
    }
    
    func getUniformLocation(x: ArrayUniformLocations, y: String) : Int64 {
        return 1
    }
    
    func getAttribLocation(x: Any, y: String) : Int64 {
        return 1
    }
    
    func getProgramInfoLog(x: Any) : String {
        return ""
    }
    
    func getShaderInfoLog(x: Any) : String {
        return ""
    }
    
    func getProgramParameter(x: Any, y: Int64) : Int64 {
        return 1
    }
    
    func getActiveAttrib(x: Any, y: Int64) : ResultClass {
        return ResultClass()
    }
    
    func getActiveUniform(x: Any, y: Int64) : ResultClass {
        return ResultClass()
    }
    
    func getShaderParameter(x: ?ArrayUniformLocations, y: Int32) : Int64  {
        return 0
    }
    
    func getError() : Int64 {
        return 0
    }
}
    
class ResultClass {
    var size: Int64 = 0
    var type1: Int64 = 0
    var name: String = ""
}
var imandreel_gl: ?ImandreelGl = Option<ImandreelGl>.None
var mandreel_cache_files: HashMap<String, Int64> = HashMap();

class Stufix {
    var g_mandreel_datafiles_sufix: String = ".dat"
}

func Malloc(bytes: Int64) : Int64
{
   
    var newOffset = commonVariable.heapNewPos;
    commonVariable.heapNewPos += ((bytes + 3) & 0xfffffffc);
    if (commonVariable.heapNewPos > mandreel_total_memory) {
        assert(false);
    }
    return newOffset;
}

let sufix = Stufix();
var file_ids = ArrayList<?CreateFileId>();
var current_file_id = 20;
var arg_test_local = Malloc(8);
var llvm_Float64_addr = Malloc(8);
var llvm_errno = Malloc(4);
var _ZGVZN11btMatrix3x311getIdentityEvE14identityMatrix = Malloc(8);
var _ZGVZN11btTransform11getIdentityEvE17identityTransform = Malloc(8);
var Landscape02Vtx = Malloc(23760);
var _ZTIN16btCollisionWorld17RayResultCallbackE = Malloc(8);
var _ZTSN16btCollisionWorld17RayResultCallbackE = Malloc(40);
var _ZTVN16btCollisionWorld24ClosestRayResultCallbackE = Malloc(24);
var _ZTIN16btCollisionWorld24ClosestRayResultCallbackE = Malloc(12);
var _ZTSN16btCollisionWorld24ClosestRayResultCallbackE = Malloc(47);
var _ZTI13btMotionState = Malloc(8);
var _ZTS13btMotionState = Malloc(16);
var _ZTV20btDefaultMotionState = Malloc(24);
var _ZTI20btDefaultMotionState = Malloc(12);
var _ZTS20btDefaultMotionState = Malloc(23);
var _ZTI17btTypedConstraint = Malloc(24);
var _ZTS17btTypedConstraint = Malloc(20);
var _ZTI13btTypedObject = Malloc(8);
var _ZTS13btTypedObject = Malloc(16);
var _ZTV7RagDoll = Malloc(16);
var _ZTI7RagDoll = Malloc(8);
var _ZTS7RagDoll = Malloc(9);
var _ZTV13BenchmarkDemo = Malloc(36);
var _ZTI13BenchmarkDemo = Malloc(12);
var _ZTS13BenchmarkDemo = Malloc(16);
var _ZTI15DemoApplication = Malloc(8);
var _ZTS15DemoApplication = Malloc(18);
var _ZL10raycastBar = Malloc(40048);
var _E2_str3 = Malloc(48);
var _E2_str4 = Malloc(69);
var _E2_str5 = Malloc(61);
var _E2_str6 = Malloc(50);
var _E2_str7 = Malloc(27);
var _ZL7TaruVtx = Malloc(516);
var LandscapeVtx = Malloc(32);
var Landscape01Vtx = Malloc(24576);
var Landscape03Vtx = Malloc(24576);
var Landscape04Vtx = Malloc(25344);
var Landscape05Vtx = Malloc(26928);
var Landscape06Vtx = Malloc(27720);
var Landscape07Vtx = Malloc(26880);
var Landscape08Vtx = Malloc(26136);
var LandscapeVtxCount = Malloc(32);
var LandscapeIdx = Malloc(32);
var Landscape01Idx = Malloc(23436);
var Landscape02Idx = Malloc(22620);
var Landscape03Idx = Malloc(23436);
var Landscape04Idx = Malloc(24192);
var Landscape05Idx = Malloc(25740);
var Landscape06Idx = Malloc(26520);
var Landscape07Idx = Malloc(25704);
var Landscape08Idx = Malloc(24960);
var LandscapeIdxCount = Malloc(32);
var _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0 = Malloc(4);
var _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1 = Malloc(4);
var _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2 = Malloc(4);
var _ZZN11btTransform11getIdentityEvE17identityTransform = Malloc(64);
var _ZTV14BenchmarkDemo4 = Malloc(36);
var _ZTI14BenchmarkDemo4 = Malloc(12);
var _ZTS14BenchmarkDemo4 = Malloc(17);
var _ZL14benchmarkDemo4 = Malloc(80);
var _ZTI21btBroadphaseInterface = Malloc(8);
var _ZTS21btBroadphaseInterface = Malloc(24);
var _ZTI25btOverlappingPairCallback = Malloc(8);
var _ZTS25btOverlappingPairCallback = Malloc(28);
var _ZTI22btOverlappingPairCache = Malloc(12);
var _ZTS22btOverlappingPairCache = Malloc(25);
var _ZTV15btNullPairCache = Malloc(76);
var _ZTI15btNullPairCache = Malloc(12);
var _ZTS15btNullPairCache = Malloc(18);
var _E2_str11 = Malloc(36);
var _E2_str112 = Malloc(67);
var _E2_str213 = Malloc(18);
var _E2_str314 = Malloc(18);
var _ZTV20btAxisSweep3InternalItE = Malloc(64);
var _ZTI20btAxisSweep3InternalItE = Malloc(12);
var _ZTS20btAxisSweep3InternalItE = Malloc(26);
var _ZTV12btAxisSweep3 = Malloc(64);
var _ZTI12btAxisSweep3 = Malloc(12);
var _ZTS12btAxisSweep3 = Malloc(15);
var _ZTV20btCollisionAlgorithm = Malloc(28);
var _ZTI20btCollisionAlgorithm = Malloc(8);
var _ZTS20btCollisionAlgorithm = Malloc(23);
var _ZTIN6btDbvt8ICollideE = Malloc(8);
var _ZTSN6btDbvt8ICollideE = Malloc(19);
var _E2_str1118 = Malloc(63);
var _E2_str22 = Malloc(16);
var _ZTV18btDbvtTreeCollider = Malloc(36);
var _ZTI18btDbvtTreeCollider = Malloc(12);
var _ZTS18btDbvtTreeCollider = Malloc(21);
var _ZTV19BroadphaseRayTester = Malloc(36);
var _ZTI19BroadphaseRayTester = Malloc(12);
var _ZTS19BroadphaseRayTester = Malloc(22);
var _ZTV20BroadphaseAabbTester = Malloc(36);
var _ZTI20BroadphaseAabbTester = Malloc(12);
var _ZTS20BroadphaseAabbTester = Malloc(23);
var _E2_str18 = Malloc(73);
var _ZTV16btDbvtBroadphase = Malloc(64);
var _ZTI16btDbvtBroadphase = Malloc(12);
var _ZTS16btDbvtBroadphase = Malloc(19);
var _ZTV12btDispatcher = Malloc(64);
var _ZTI12btDispatcher = Malloc(8);
var _ZTS12btDispatcher = Malloc(15);
var _ZTI21btNodeOverlapCallback = Malloc(8);
var _ZTS21btNodeOverlapCallback = Malloc(24);
var _E2_str10 = Malloc(2);
var _E2_str212 = Malloc(18);
var _E2_str313 = Malloc(69);
var _E2_str414 = Malloc(36);
var _E2_str515 = Malloc(36);
var _E2_str616 = Malloc(36);
var _E2_str717 = Malloc(36);
var _E2_str820 = Malloc(36);
var _E2_str9 = Malloc(36);
var gOverlappingPairs = Malloc(4);
var _ZTI17btOverlapCallback = Malloc(8);
var _ZTS17btOverlapCallback = Malloc(20);
var _ZTVZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback = Malloc(20);
var _ZTIZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback = Malloc(12);
var _ZTSZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback = Malloc(110);
var _ZTVZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback = Malloc(20);
var _ZTIZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback = Malloc(12);
var _ZTSZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback = Malloc(129);
var gRemovePairs = Malloc(4);
var _ZTV28btHashedOverlappingPairCache = Malloc(76);
var _ZTI28btHashedOverlappingPairCache = Malloc(12);
var _ZTS28btHashedOverlappingPairCache = Malloc(31);
var _E2_str121 = Malloc(79);
var gAddedPairs = Malloc(4);
var _E2_str222 = Malloc(38);
var _E2_str323 = Malloc(77);
var _E2_str424 = Malloc(38);
var _E2_str525 = Malloc(38);
var _E2_str626 = Malloc(42);
var _E2_str727 = Malloc(22);
var gFindPairs = Malloc(4);
var _E2_str32 = Malloc(23);
var _E2_str133 = Malloc(23);
var _E2_str234 = Malloc(21);
var _E2_str335 = Malloc(24);
var _ZTV14btQuantizedBvh = Malloc(36);
var _ZTI14btQuantizedBvh = Malloc(8);
var _ZTS14btQuantizedBvh = Malloc(17);
var _E2_str537 = Malloc(71);
var _E2_str638 = Malloc(48);
var _E2_str739 = Malloc(13);
var _E2_str941 = Malloc(14);
var _E2_str1143 = Malloc(29);
var maxIterations = Malloc(4);
var _E2_str1844 = Malloc(19);
var _E2_str1921 = Malloc(32);
var _E2_str21 = Malloc(7);
var _E2_str2246 = Malloc(13);
var _ZTV30btActivatingCollisionAlgorithm = Malloc(28);
var _ZTI30btActivatingCollisionAlgorithm = Malloc(12);
var _ZTS30btActivatingCollisionAlgorithm = Malloc(33);
var _E2_str59 = Malloc(14);
var _E2_str160 = Malloc(69);
var _ZTV26btBoxBoxCollisionAlgorithm = Malloc(28);
var _ZTI26btBoxBoxCollisionAlgorithm = Malloc(12);
var _ZTS26btBoxBoxCollisionAlgorithm = Malloc(29);
var _ZTI36btDiscreteCollisionDetectorInterface = Malloc(8);
var _ZTS36btDiscreteCollisionDetectorInterface = Malloc(39);
var _ZTV16btBoxBoxDetector = Malloc(20);
var _ZTI16btBoxBoxDetector = Malloc(12);
var _ZTS16btBoxBoxDetector = Malloc(19);
var _E2_str65 = Malloc(12);
var _E2_str166 = Malloc(71);
var gNumManifold = Malloc(4);
var _ZTIN36btDiscreteCollisionDetectorInterface6ResultE = Malloc(8);
var _ZTSN36btDiscreteCollisionDetectorInterface6ResultE = Malloc(48);
var _ZTV23btCollisionPairCallback = Malloc(20);
var _ZTI23btCollisionPairCallback = Malloc(12);
var _ZTS23btCollisionPairCallback = Malloc(26);
var _E2_str169 = Malloc(45);
var _E2_str270 = Malloc(26);
var _E2_str371 = Malloc(14);
var _E2_str472 = Malloc(34);
var _E2_str573 = Malloc(76);
var _ZTV21btCollisionDispatcher = Malloc(64);
var _ZTI21btCollisionDispatcher = Malloc(12);
var _ZTS21btCollisionDispatcher = Malloc(24);
var _E2_str674 = Malloc(23);
var _E2_str775 = Malloc(6);
var _E2_str876 = Malloc(6);
var _E2_str977 = Malloc(73);
var _ZTV17btCollisionObject = Malloc(36);
var _ZTI17btCollisionObject = Malloc(8);
var _ZTS17btCollisionObject = Malloc(20);
var _E2_str78 = Malloc(27);
var _ZTIN16btCollisionWorld20ConvexResultCallbackE = Malloc(8);
var _ZTSN16btCollisionWorld20ConvexResultCallbackE = Malloc(43);
var _ZTI30btConvexPenetrationDepthSolver = Malloc(8);
var _ZTS30btConvexPenetrationDepthSolver = Malloc(33);
var _ZTVN12btConvexCast10CastResultE = Malloc(24);
var _ZTIN12btConvexCast10CastResultE = Malloc(8);
var _ZTSN12btConvexCast10CastResultE = Malloc(29);
var _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2 = Malloc(24);
var _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2 = Malloc(12);
var _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2 = Malloc(140);
var _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder = Malloc(24);
var _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder = Malloc(12);
var _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder = Malloc(164);
var _ZTI24btBroadphaseAabbCallback = Malloc(8);
var _ZTS24btBroadphaseAabbCallback = Malloc(27);
var _ZTI23btBroadphaseRayCallback = Malloc(12);
var _ZTS23btBroadphaseRayCallback = Malloc(26);
var _ZTV17DebugDrawcallback = Malloc(44);
var _ZTI17DebugDrawcallback = Malloc(32);
var _ZTS17DebugDrawcallback = Malloc(20);
var _ZTI18btTriangleCallback = Malloc(8);
var _ZTS18btTriangleCallback = Malloc(21);
var _ZTI31btInternalTriangleIndexCallback = Malloc(8);
var _ZTS31btInternalTriangleIndexCallback = Malloc(34);
var _ZTV16btCollisionWorld = Malloc(56);
var _ZTI16btCollisionWorld = Malloc(8);
var _ZTS16btCollisionWorld = Malloc(19);
var _ZTI16btManifoldResult = Malloc(12);
var _ZTS16btManifoldResult = Malloc(19);
var _ZTV21btSingleSweepCallback = Malloc(20);
var _ZTI21btSingleSweepCallback = Malloc(12);
var _ZTS21btSingleSweepCallback = Malloc(24);
var _ZTV19btSingleRayCallback = Malloc(20);
var _ZTI19btSingleRayCallback = Malloc(12);
var _ZTS19btSingleRayCallback = Malloc(22);
var _E2_str382 = Malloc(23);
var _E2_str483 = Malloc(76);
var _E2_str584 = Malloc(19);
var _E2_str685 = Malloc(42);
var _E2_str786 = Malloc(16);
var _E2_str887 = Malloc(71);
var _E2_str988 = Malloc(82);
var _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0 = Malloc(24);
var _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0 = Malloc(12);
var _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0 = Malloc(184);
var _ZTI28btTriangleConvexcastCallback = Malloc(12);
var _ZTS28btTriangleConvexcastCallback = Malloc(31);
var _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback = Malloc(24);
var _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback = Malloc(12);
var _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback = Malloc(182);
var _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0 = Malloc(24);
var _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0 = Malloc(12);
var _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0 = Malloc(156);
var _ZTI25btTriangleRaycastCallback = Malloc(12);
var _ZTS25btTriangleRaycastCallback = Malloc(28);
var _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback = Malloc(24);
var _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback = Malloc(12);
var _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback = Malloc(154);
var _E2_str1089 = Malloc(16);
var _E2_str1190 = Malloc(34);
var _E2_str1291 = Malloc(26);
var _E2_str1392 = Malloc(26);
var _E2_str1493 = Malloc(20);
var _ZZN16btCollisionWorld16updateSingleAabbEP17btCollisionObjectE8reportMe_2E_b = Malloc(1);
var _E2_str1594 = Malloc(49);
var _E2_str1695 = Malloc(68);
var _E2_str1796 = Malloc(65);
var _E2_str1897 = Malloc(9);
var _E2_str1998 = Malloc(12);
var _ZTV22btCompoundLeafCallback = Malloc(36);
var _ZTI22btCompoundLeafCallback = Malloc(12);
var _ZTS22btCompoundLeafCallback = Malloc(25);
var _E2_str99 = Malloc(42);
var _E2_str1100 = Malloc(83);
var _E2_str2101 = Malloc(43);
var _E2_str3102 = Malloc(41);
var _E2_str4103 = Malloc(43);
var _E2_str5104 = Malloc(43);
var _E2_str6105 = Malloc(9);
var _E2_str7106 = Malloc(41);
var _ZTV28btCompoundCollisionAlgorithm = Malloc(28);
var _ZTI28btCompoundCollisionAlgorithm = Malloc(12);
var _ZTS28btCompoundCollisionAlgorithm = Malloc(31);
var _E2_str109 = Malloc(9);
var _ZTV24btConvexTriangleCallback = Malloc(20);
var _ZTI24btConvexTriangleCallback = Malloc(12);
var _ZTS24btConvexTriangleCallback = Malloc(27);
var _ZTVZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback = Malloc(20);
var _ZTIZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback = Malloc(12);
var _ZTSZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback = Malloc(158);
var _ZTV15btTriangleShape = Malloc(124);
var _ZTI15btTriangleShape = Malloc(12);
var _ZTS15btTriangleShape = Malloc(18);
var _ZTI23btPolyhedralConvexShape = Malloc(12);
var _ZTS23btPolyhedralConvexShape = Malloc(26);
var _ZTI21btConvexInternalShape = Malloc(12);
var _ZTS21btConvexInternalShape = Malloc(24);
var _ZTI13btConvexShape = Malloc(12);
var _ZTS13btConvexShape = Malloc(16);
var _ZTI16btCollisionShape = Malloc(8);
var _ZTS16btCollisionShape = Malloc(19);
var _E2_str1110 = Malloc(26);
var _E2_str3112 = Malloc(66);
var _ZTV33btConvexConcaveCollisionAlgorithm = Malloc(28);
var _ZTI33btConvexConcaveCollisionAlgorithm = Malloc(12);
var _ZTS33btConvexConcaveCollisionAlgorithm = Malloc(36);
var _ZTI30btCollisionAlgorithmCreateFunc = Malloc(8);
var _ZTS30btCollisionAlgorithmCreateFunc = Malloc(33);
var _ZTVN23btConvexConvexAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN23btConvexConvexAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN23btConvexConvexAlgorithm10CreateFuncE = Malloc(40);
var _ZTV24btPerturbedContactResult = Malloc(28);
var _ZTI24btPerturbedContactResult = Malloc(12);
var _ZTS24btPerturbedContactResult = Malloc(27);
var _E2_str115 = Malloc(19);
var _E2_str4119 = Malloc(49);
var _E2_str5120 = Malloc(78);
var _ZTV23btConvexConvexAlgorithm = Malloc(28);
var _ZTI23btConvexConvexAlgorithm = Malloc(12);
var _ZTS23btConvexConvexAlgorithm = Malloc(26);
var _ZTV31btConvexPlaneCollisionAlgorithm = Malloc(28);
var _ZTI31btConvexPlaneCollisionAlgorithm = Malloc(12);
var _ZTS31btConvexPlaneCollisionAlgorithm = Malloc(34);
var _ZTVN31btConvexPlaneCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN31btConvexPlaneCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN31btConvexPlaneCollisionAlgorithm10CreateFuncE = Malloc(48);
var _ZTI24btCollisionConfiguration = Malloc(8);
var _ZTS24btCollisionConfiguration = Malloc(27);
var _ZTVN33btConvexConcaveCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN33btConvexConcaveCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN33btConvexConcaveCollisionAlgorithm10CreateFuncE = Malloc(50);
var _ZTVN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE = Malloc(20);
var _ZTIN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE = Malloc(12);
var _ZTSN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE = Malloc(57);
var _ZTVN28btCompoundCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN28btCompoundCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN28btCompoundCollisionAlgorithm10CreateFuncE = Malloc(45);
var _ZTVN28btCompoundCollisionAlgorithm17SwappedCreateFuncE = Malloc(20);
var _ZTIN28btCompoundCollisionAlgorithm17SwappedCreateFuncE = Malloc(12);
var _ZTSN28btCompoundCollisionAlgorithm17SwappedCreateFuncE = Malloc(52);
var _ZTVN16btEmptyAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN16btEmptyAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN16btEmptyAlgorithm10CreateFuncE = Malloc(33);
var _ZTVN32btSphereSphereCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN32btSphereSphereCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN32btSphereSphereCollisionAlgorithm10CreateFuncE = Malloc(49);
var _ZTVN34btSphereTriangleCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN34btSphereTriangleCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN34btSphereTriangleCollisionAlgorithm10CreateFuncE = Malloc(51);
var _ZTVN26btBoxBoxCollisionAlgorithm10CreateFuncE = Malloc(20);
var _ZTIN26btBoxBoxCollisionAlgorithm10CreateFuncE = Malloc(12);
var _ZTSN26btBoxBoxCollisionAlgorithm10CreateFuncE = Malloc(43);
var _E2_str128 = Malloc(12);
var _E2_str1129 = Malloc(42);
var _ZTV31btDefaultCollisionConfiguration = Malloc(36);
var _ZTI31btDefaultCollisionConfiguration = Malloc(12);
var _ZTS31btDefaultCollisionConfiguration = Malloc(34);
var _ZTV16btEmptyAlgorithm = Malloc(28);
var _ZTI16btEmptyAlgorithm = Malloc(12);
var _ZTS16btEmptyAlgorithm = Malloc(19);
var _ZTV16btManifoldResult = Malloc(28);
var _E2_str2149 = Malloc(31);
var _E2_str3150 = Malloc(12);
var _E2_str5152 = Malloc(71);
var _E2_str155 = Malloc(28);
var _E2_str1156 = Malloc(73);
var _E2_str2157 = Malloc(80);
var _E2_str3158 = Malloc(15);
var _ZTV25btSimulationIslandManager = Malloc(24);
var _ZTI25btSimulationIslandManager = Malloc(8);
var _ZTS25btSimulationIslandManager = Malloc(28);
var _ZTV32btSphereSphereCollisionAlgorithm = Malloc(28);
var _ZTI32btSphereSphereCollisionAlgorithm = Malloc(12);
var _ZTS32btSphereSphereCollisionAlgorithm = Malloc(35);
var _ZTV34btSphereTriangleCollisionAlgorithm = Malloc(28);
var _ZTI34btSphereTriangleCollisionAlgorithm = Malloc(12);
var _ZTS34btSphereTriangleCollisionAlgorithm = Malloc(37);
var _ZTV22SphereTriangleDetector = Malloc(20);
var _ZTI22SphereTriangleDetector = Malloc(12);
var _ZTS22SphereTriangleDetector = Malloc(25);
var _E2_str173 = Malloc(4);
var _E2_str2175 = Malloc(61);
var _ZTV10btBoxShape = Malloc(124);
var _ZTI10btBoxShape = Malloc(12);
var _ZTS10btBoxShape = Malloc(13);
var _E2_str181 = Malloc(16);
var _ZTVZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(20);
var _ZTIZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(12);
var _ZTSZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(104);
var _ZTVZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback = Malloc(20);
var _ZTIZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback = Malloc(12);
var _ZTSZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback = Malloc(113);
var _ZTVZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(20);
var _ZTIZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(12);
var _ZTSZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback = Malloc(110);
var _E2_str5186 = Malloc(70);
var _E2_str6187 = Malloc(49);
var _E2_str7188 = Malloc(75);
var _E2_str8189 = Malloc(24);
var _ZTV22btBvhTriangleMeshShape = Malloc(88);
var _ZTI22btBvhTriangleMeshShape = Malloc(12);
var _ZTS22btBvhTriangleMeshShape = Malloc(25);
var _ZTI19btTriangleMeshShape = Malloc(12);
var _ZTS19btTriangleMeshShape = Malloc(22);
var _ZTI14btConcaveShape = Malloc(12);
var _ZTS14btConcaveShape = Malloc(17);
var _E2_str194 = Malloc(13);
var _E2_str4198 = Malloc(72);
var _E2_str6199 = Malloc(19);
var _ZTV14btCapsuleShape = Malloc(92);
var _ZTI14btCapsuleShape = Malloc(12);
var _ZTS14btCapsuleShape = Malloc(17);
var _E2_str200 = Malloc(21);
var _ZTV14btConcaveShape = Malloc(72);
var _E2_str219 = Malloc(7);
var _E2_str3222 = Malloc(70);
var _ZTV17btConvexHullShape = Malloc(120);
var _ZTI17btConvexHullShape = Malloc(12);
var _ZTS17btConvexHullShape = Malloc(20);
var _ZTI34btPolyhedralConvexAabbCachingShape = Malloc(12);
var _ZTS34btPolyhedralConvexAabbCachingShape = Malloc(37);
var _E2_str5223 = Malloc(19);
var _E2_str6224 = Malloc(22);
var _E2_str6232 = Malloc(19);
var _ZTV13btConvexShape = Malloc(92);
var _E2_str6249 = Malloc(13);
var _E2_str7250 = Malloc(66);
var _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback = Malloc(20);
var _ZTIZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback = Malloc(12);
var _ZTSZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback = Malloc(91);
var _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback = Malloc(20);
var _ZTIZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback = Malloc(12);
var _ZTSZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback = Malloc(100);
var _E2_str10306 = Malloc(67);
var _E2_str18314 = Malloc(36);
var _E2_str19315 = Malloc(48);
var _E2_str20316 = Malloc(17);
var _ZTV14btOptimizedBvh = Malloc(40);
var _ZTI14btOptimizedBvh = Malloc(12);
var _ZTS14btOptimizedBvh = Malloc(17);
var _E2_str7331 = Malloc(74);
var _ZGVZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions = Malloc(8);
var _ZZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions = Malloc(96);
var _E2_str342 = Malloc(7);
var _ZTV13btSphereShape = Malloc(92);
var _ZTI13btSphereShape = Malloc(12);
var _ZTS13btSphereShape = Malloc(16);
var _E2_str349 = Malloc(15);
var _E2_str1350 = Malloc(27);
var _E2_str3352 = Malloc(76);
var _E2_str5354 = Malloc(20);
var _E2_str6355 = Malloc(44);
var _E2_str7356 = Malloc(15);
var _E2_str8357 = Malloc(28);
var _E2_str9358 = Malloc(61);
var _ZTV23btStridingMeshInterface = Malloc(68);
var _ZTI23btStridingMeshInterface = Malloc(8);
var _ZTS23btStridingMeshInterface = Malloc(26);
var _ZTV31btInternalTriangleIndexCallback = Malloc(20);
var _ZTV18btTriangleCallback = Malloc(20);
var _E2_str367 = Malloc(26);
var _E2_str1368 = Malloc(79);
var _ZTV26btTriangleIndexVertexArray = Malloc(68);
var _ZTI26btTriangleIndexVertexArray = Malloc(12);
var _ZTS26btTriangleIndexVertexArray = Malloc(29);
var _E2_str372 = Malloc(13);
var _ZTV21SupportVertexCallback = Malloc(20);
var _ZTI21SupportVertexCallback = Malloc(12);
var _ZTS21SupportVertexCallback = Malloc(24);
var _ZTVZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback = Malloc(20);
var _ZTIZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback = Malloc(12);
var _ZTSZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback = Malloc(102);
var _E2_str3375 = Malloc(72);
var _ZTV19btTriangleMeshShape = Malloc(80);
var _ZTV16btPointCollector = Malloc(28);
var _ZTI16btPointCollector = Malloc(12);
var _ZTS16btPointCollector = Malloc(19);
var _ZTV27btContinuousConvexCollision = Malloc(20);
var _ZTI27btContinuousConvexCollision = Malloc(12);
var _ZTS27btContinuousConvexCollision = Malloc(30);
var _ZTI12btConvexCast = Malloc(8);
var _ZTS12btConvexCast = Malloc(15);
var _ZTV12btConvexCast = Malloc(20);
var _ZTV15btGjkConvexCast = Malloc(20);
var _ZTI15btGjkConvexCast = Malloc(12);
var _ZTS15btGjkConvexCast = Malloc(18);
var _ZZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRjE4imd3 = Malloc(12);
var _ZZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonEE4i2m3 = Malloc(12);
var _ZTV30btGjkEpaPenetrationDepthSolver = Malloc(20);
var _ZTI30btGjkEpaPenetrationDepthSolver = Malloc(12);
var _ZTS30btGjkEpaPenetrationDepthSolver = Malloc(33);
var gNumDeepPenetrationChecks = Malloc(4);
var _ZTV17btGjkPairDetector = Malloc(20);
var _ZTI17btGjkPairDetector = Malloc(12);
var _ZTS17btGjkPairDetector = Malloc(20);
var gNumGjkChecks = Malloc(4);
var _E2_str425 = Malloc(39);
var _E2_str1426 = Malloc(71);
var _E2_str2427 = Malloc(18);
var _E2_str3428 = Malloc(75);
var gContactBreakingThreshold = Malloc(4);
var _E2_str434 = Malloc(52);
var _E2_str3437 = Malloc(78);
var _E2_str4438 = Malloc(50);
var _ZTV28btTriangleConvexcastCallback = Malloc(24);
var _ZTV22btSubsimplexConvexCast = Malloc(20);
var _ZTI22btSubsimplexConvexCast = Malloc(12);
var _ZTS22btSubsimplexConvexCast = Malloc(25);
var _E2_str457 = Malloc(16);
var _E2_str1458 = Malloc(80);
var _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE = Malloc(24);
var _ZTIN16btCollisionWorld27ClosestConvexResultCallbackE = Malloc(12);
var _ZTSN16btCollisionWorld27ClosestConvexResultCallbackE = Malloc(50);
var _E2_str36 = Malloc(51);
var _E2_str239 = Malloc(26);
var _ZTV21btConeTwistConstraint = Malloc(52);
var _ZTI21btConeTwistConstraint = Malloc(12);
var _ZTS21btConeTwistConstraint = Malloc(24);
var _E2_str1340 = Malloc(37);
var _E2_str24 = Malloc(74);
var _E2_str442 = Malloc(37);
var _E2_str543 = Malloc(37);
var _E2_str846 = Malloc(24);
var _E2_str947 = Malloc(66);
var _E2_str1149 = Malloc(30);
var _E2_str29 = Malloc(27);
var _ZTV17btHingeConstraint = Malloc(52);
var _ZTI17btHingeConstraint = Malloc(12);
var _ZTS17btHingeConstraint = Malloc(20);
var _E2_str130 = Malloc(34);
var _E2_str231 = Malloc(70);
var _E2_str332 = Malloc(34);
var _E2_str433 = Malloc(34);
var gNumSplitImpulseRecoveries = Malloc(4);
var _ZTI18btConstraintSolver = Malloc(8);
var _ZTS18btConstraintSolver = Malloc(21);
var _ZTV35btSequentialImpulseConstraintSolver = Malloc(48);
var _ZTI35btSequentialImpulseConstraintSolver = Malloc(12);
var _ZTS35btSequentialImpulseConstraintSolver = Malloc(38);
var _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed = Malloc(8);
var _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed = Malloc(608);
var _E2_str248 = Malloc(27);
var _E2_str34955 = Malloc(54);
var _E2_str450 = Malloc(11);
var _E2_str551 = Malloc(7);
var _E2_str652 = Malloc(88);
var _E2_str753 = Malloc(10);
var _E2_str854 = Malloc(34);
var _E2_str955 = Malloc(3);
var _E2_str1056 = Malloc(29);
var _E2_str1157 = Malloc(24);
var _E2_str76 = Malloc(22);
var _ZTI23btDiscreteDynamicsWorld = Malloc(12);
var _ZTS23btDiscreteDynamicsWorld = Malloc(26);
var _ZTI15btDynamicsWorld = Malloc(12);
var _ZTS15btDynamicsWorld = Malloc(18);
var _ZTIN25btSimulationIslandManager14IslandCallbackE = Malloc(8);
var _ZTSN25btSimulationIslandManager14IslandCallbackE = Malloc(46);
var _ZTV34btClosestNotMeConvexResultCallback = Malloc(24);
var _ZTI34btClosestNotMeConvexResultCallback = Malloc(12);
var _ZTS34btClosestNotMeConvexResultCallback = Malloc(37);
var _ZTVZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback = Malloc(20);
var _ZTIZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback = Malloc(12);
var _ZTSZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback = Malloc(99);
var _E2_str87 = Malloc(26);
var _E2_str188 = Malloc(27);
var _E2_str289 = Malloc(14);
var _E2_str794 = Malloc(20);
var _E2_str895 = Malloc(20);
var gNumClampedCcdMotions = Malloc(4);
var _E2_str996 = Malloc(17);
var _E2_str1097 = Malloc(22);
var _E2_str1198 = Malloc(29);
var _E2_str1299 = Malloc(15);
var _E2_str13100 = Malloc(5);
var _E2_str1461 = Malloc(68);
var _E2_str1562 = Malloc(24);
var _E2_str16101 = Malloc(15);
var _ZTV15btDynamicsWorld = Malloc(140);
var _ZTV23btDiscreteDynamicsWorld = Malloc(180);
var _ZL8uniqueId = Malloc(4);
var _ZTV11btRigidBody = Malloc(36);
var _ZTI11btRigidBody = Malloc(12);
var _ZTS11btRigidBody = Malloc(14);
var _E2_str4144 = Malloc(21);
var gDisableDeactivation = Malloc(1);
var gNumAlignedAllocs = Malloc(4);
var gNumAlignedFree = Malloc(4);
var _ZN15CProfileManager12FrameCounterE = Malloc(4);
var _ZN15CProfileManager4RootE = Malloc(32);
var _ZL13gProfileClock_2E_0 = Malloc(4);
var _ZN15CProfileManager11CurrentNodeE = Malloc(4);
var _E2_str729 = Malloc(5);
var _ZN4__rwL12__rw_catlistE_2E_0 = Malloc(4);
var _ZN4__rwL12__rw_catlistE_2E_1 = Malloc(4);
var _ZN4__rwL12__rw_catlistE_2E_2 = Malloc(4);
var llvm_2E_eh_2E_catch_2E_all_2E_value = Malloc(4);
var _ZTIN4__rw10__rw_facetE = Malloc(12);
var _ZTSN4__rw10__rw_facetE = Malloc(20);
var _ZTIN4__rw17__rw_synchronizedE = Malloc(8);
var _ZTSN4__rw17__rw_synchronizedE = Malloc(27);
var _E2_str4131 = Malloc(10);
var _E2_str15132 = Malloc(21);
var _E2_str26 = Malloc(1);
var _ZN4__rwL13__rw_what_bufE = Malloc(256);
var _ZN4__rwL16__rw_what_refcntE = Malloc(4);
var _E2_str3133 = Malloc(16);
var _E2_str47 = Malloc(25);
var _E2_str5134 = Malloc(18);
var _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E7__fname = Malloc(4);
var _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E6buffer = Malloc(11);
var _E2_str7136 = Malloc(3);
var _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E8__catset = Malloc(4);
var _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E4msgs = Malloc(32);
var _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E5__cat = Malloc(4);
var _ZZN4__rw10__rw_throwEizE6errors = Malloc(100);
var _E2_str8137 = Malloc(26);
var _E2_str9138 = Malloc(18);
var _E2_str10139 = Malloc(29);
var _E2_str11140 = Malloc(33);
var _E2_str12141 = Malloc(17);
var _E2_str138142 = Malloc(20);
var _E2_str14143 = Malloc(21);
var _E2_str159144 = Malloc(25);
var _E2_str16145 = Malloc(51);
var _E2_str17146 = Malloc(47);
var _E2_str18147 = Malloc(22);
var _E2_str19148 = Malloc(44);
var _E2_str20149 = Malloc(23);
var _E2_str21150 = Malloc(24);
var _E2_str22151 = Malloc(39);
var _E2_str23152 = Malloc(38);
var _E2_str24153 = Malloc(38);
var _E2_str25154 = Malloc(29);
var _E2_str2610 = Malloc(44);
var _E2_str27 = Malloc(30);
var _E2_str28155 = Malloc(40);
var _E2_str29156 = Malloc(26);
var _E2_str30 = Malloc(27);
var _E2_str31 = Malloc(30);
var _E2_str32157 = Malloc(32);
var _E2_str33 = Malloc(11);
var _E2_str134 = Malloc(9);
var _E2_str235 = Malloc(12);
var _E2_str336 = Malloc(11);
var _E2_str437 = Malloc(8);
var _ZTVN4__rw10__rw_facetE = Malloc(16);
var _E2_str538 = Malloc(2);
var _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE12n_std_facets = Malloc(4);
var _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE10std_facets = Malloc(4);
var _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE13std_facet_buf = Malloc(1664);
var _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE17std_facet_bufsize = Malloc(4);
var _ZZN4__rw10__rw_facetD4EvE9destroyed = Malloc(24);
var _ZN4__rw9__rw_catsE = Malloc(72);
var _E2_str785 = Malloc(2);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE6global = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE5ginit = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE9n_locales = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7locales = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE10locale_buf = Malloc(32);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE14locale_bufsize = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7classic = Malloc(4);
var _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE12classic_body = Malloc(172);
var _ZN4__rwL22__rw_classic_once_initE_2E_0_2E_b = Malloc(1);
var _ZN4__rwL12__rw_classicE = Malloc(4);
var _E2_str292167 = Malloc(4);
var _E2_str10100175 = Malloc(29);
var _E2_str12102177 = Malloc(33);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE4init_2E_b = Malloc(1);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs = Malloc(4);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11catalog_buf = Malloc(64);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize = Malloc(4);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE10n_catalogs = Malloc(4);
var _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11largest_cat = Malloc(4);
var _E2_str115180 = Malloc(27);
var _E2_str1116181 = Malloc(25);
var _E2_str2131 = Malloc(2);
var _E2_str4133 = Malloc(2);
var _ZZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEEE11locale_root = Malloc(259);
var _ZNSs11_C_null_refE = Malloc(16);
var _ZTVSt8messagesIcE = Malloc(28);
var _ZTISt8messagesIcE = Malloc(32);
var _ZTSSt8messagesIcE = Malloc(15);
var _ZTISt13messages_base = Malloc(8);
var _ZTSSt13messages_base = Malloc(18);
var _E2_str2360 = Malloc(31);
var _E2_str3361 = Malloc(48);
var _E2_str4362 = Malloc(31);
var _ZTVSt9type_info = Malloc(24);
var _ZTISt9type_info = Malloc(8);
var _ZTSSt9type_info = Malloc(13);
var s_max_memory = Malloc(4);
var s_current_memory = Malloc(4);
var block_null = Malloc(16);
var _E2_str643 = Malloc(57);
var _E2_str1648 = Malloc(3);
var _E2_str4651 = Malloc(4);
var _E2_str5652 = Malloc(4);
var my_ctype = Malloc(1028);
var _ZL8nextRand = Malloc(4);
var _E2_str7654 = Malloc(4);
var _E2_str9655 = Malloc(4);
var _ZL8pad_line = Malloc(64);
var _ZL10strtok_pos = Malloc(4);
var _ZTI14CFileInterface = Malloc(8);
var _ZTS14CFileInterface = Malloc(17);
var _ZTV11CFileSystem = Malloc(44);
var _ZTI11CFileSystem = Malloc(12);
var _ZTS11CFileSystem = Malloc(14);
var _ZL13s_file_stdout = Malloc(4);
var _ZTV7CFileLS = Malloc(44);
var _ZTI7CFileLS = Malloc(12);
var _ZTS7CFileLS = Malloc(9);
var _ZTV10CFileCloud = Malloc(44);
var _ZTI10CFileCloud = Malloc(12);
var _ZTS10CFileCloud = Malloc(13);
var _ZL10s_aSockets = Malloc(262336);
var _ZTV11CFileStdout = Malloc(44);
var _ZTI11CFileStdout = Malloc(12);
var _ZTS11CFileStdout = Malloc(14);
var _E2_str31677 = Malloc(4);
var _E2_str32678 = Malloc(4);
var _E2_str33679 = Malloc(5);
var _E2_str34680 = Malloc(8);
var _E2_str35681 = Malloc(53);
var _E2_str37683 = Malloc(4);
var _E2_str38684 = Malloc(7);
var _ZN12mandreel_b64L9b64_charsE = Malloc(65);
var _ZN12mandreel_b64L11b64_indexesE = Malloc(256);
var _ZL25s_mandreel_internal_width = Malloc(4);
var _ZL26s_mandreel_internal_height = Malloc(4);
var g_msgcallback = Malloc(4);
var _ZL24g_pFirstTextureAsyncInfo = Malloc(4);
var _ZL17g_apPackFileNames = Malloc(1024);
var _ZGVZ21Mandreel_GetTickCountE7s_first = Malloc(8);
var _ZZ21Mandreel_GetTickCountE7s_first = Malloc(8);
var _ZZ29__mandreel_internal_preupdateE8s_bfirst_2E_b = Malloc(1);
var _E2_str779 = Malloc(13);
var _E2_str3782 = Malloc(13);
var _E2_str4783 = Malloc(37);
var _E2_str5784 = Malloc(12);
var _E2_str6785 = Malloc(17);
var _ZZ24__mandreel_internal_initE54s_723478567_mandreel___mandreel_internal_SetResolution = Malloc(4);
var _ZZ24__mandreel_internal_initE56s_723478567_mandreel_iMandreel_TextureAsync_IsCompressed = Malloc(4);
var _ZZ24__mandreel_internal_initE57s_723478567_mandreel_iMandreel_TextureAsync_GetPackOffset = Malloc(4);
var _ZZ24__mandreel_internal_initE29s_723478567_mandreel___resize = Malloc(4);
var _ZZ24__mandreel_internal_initE48s_723478567_mandreel_imandreel_restore_glcontext = Malloc(4);
var _ZZ24__mandreel_internal_initE46s_723478567_mandreel_imandreel_viewport_resize = Malloc(4);
var _ZTVN10__cxxabiv120__si_class_type_infoE = Malloc(40);
var _ZTIN10__cxxabiv120__si_class_type_infoE = Malloc(12);
var _ZTSN10__cxxabiv120__si_class_type_infoE = Malloc(37);
var _ZTIN10__cxxabiv117__class_type_infoE = Malloc(12);
var _ZTSN10__cxxabiv117__class_type_infoE = Malloc(34);
var _ZTVN10__cxxabiv117__class_type_infoE = Malloc(40);
var _ZTVN10__cxxabiv121__vmi_class_type_infoE = Malloc(40);
var _ZTIN10__cxxabiv121__vmi_class_type_infoE = Malloc(12);
var _ZTSN10__cxxabiv121__vmi_class_type_infoE = Malloc(38);
var _ZL11g_aChannels = Malloc(9344);
var _ZL7g_bInit_2E_b = Malloc(1);
var _E2_str221 = Malloc(8);
var _E2_str1222 = Malloc(21);
var _ZL21g_pFirstSoundDuration = Malloc(4);
var _E2_str3224 = Malloc(71);
var _E2_str4225 = Malloc(8);
var _ZL15g_iFreeChannels = Malloc(4);
var _ZL15g_aFreeChannels = Malloc(128);
var _ZL6g_bLog = Malloc(1);
var _E2_str12233 = Malloc(5);
var _E2_str22243 = Malloc(21);
var _E2_str24245 = Malloc(86);
var _E2_str26247 = Malloc(8);
var _E2_str27248 = Malloc(4);
var _E2_str28249 = Malloc(60);
var _E2_str29250 = Malloc(10);
var _E2_str30251 = Malloc(3);
var _E2_str31252 = Malloc(75);
var _E2_str32253 = Malloc(5);
var _E2_str33254 = Malloc(4);
var _E2_str34255 = Malloc(9);
var _E2_str35256 = Malloc(22);
var _ZZL32_mandreel_init_tcp_socket_librayvE47s_723478567_mandreel_mandreel_flash_tcp_onError = Malloc(4);
var _ZL13s_fifo_errors = Malloc(24);
var _ZN5my_glL9m_contextE = Malloc(324);
var llvm_2E_global_ctors = Malloc(40);
var llvm_2E_global_dtors = Malloc(56);
var llvm_2E_used = Malloc(300)
var my_heapNewPos: Int64 = 0
    
class CMalloc {
    static func malloc() : Unit{
    g_stack_pointer
    arg_test_local
    llvm_Float64_addr
    llvm_errno
    _ZGVZN11btMatrix3x311getIdentityEvE14identityMatrix
    _ZGVZN11btTransform11getIdentityEvE17identityTransform
    Landscape02Vtx
    _ZTIN16btCollisionWorld17RayResultCallbackE
    _ZTSN16btCollisionWorld17RayResultCallbackE
    _ZTVN16btCollisionWorld24ClosestRayResultCallbackE
    _ZTIN16btCollisionWorld24ClosestRayResultCallbackE
    _ZTSN16btCollisionWorld24ClosestRayResultCallbackE
    _ZTI13btMotionState
    _ZTS13btMotionState
    _ZTV20btDefaultMotionState
    _ZTI20btDefaultMotionState
    _ZTS20btDefaultMotionState
    _ZTI17btTypedConstraint
    _ZTS17btTypedConstraint
    _ZTI13btTypedObject
    _ZTS13btTypedObject
    _ZTV7RagDoll
    _ZTI7RagDoll
    _ZTS7RagDoll
    _ZTV13BenchmarkDemo
    _ZTI13BenchmarkDemo
    _ZTS13BenchmarkDemo
    _ZTI15DemoApplication
    _ZTS15DemoApplication
    _ZL10raycastBar
    _E2_str3
    _E2_str4
    _E2_str5
    _E2_str6
    _E2_str7
    _ZL7TaruVtx
    LandscapeVtx
    Landscape01Vtx
    Landscape03Vtx
    Landscape04Vtx
    Landscape05Vtx
    Landscape06Vtx
    Landscape07Vtx
    Landscape08Vtx
    LandscapeVtxCount
    LandscapeIdx
    Landscape01Idx
    Landscape02Idx
    Landscape03Idx
    Landscape04Idx
    Landscape05Idx
    Landscape06Idx
    Landscape07Idx
    Landscape08Idx
    LandscapeIdxCount
    _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_0_2E_0_2E_0
    _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_1_2E_0_2E_1
    _ZZN11btMatrix3x311getIdentityEvE14identityMatrix_2E_0_2E_2_2E_0_2E_2
    _ZZN11btTransform11getIdentityEvE17identityTransform
    _ZTV14BenchmarkDemo4
    _ZTI14BenchmarkDemo4
    _ZTS14BenchmarkDemo4
    _ZL14benchmarkDemo4
    _ZTI21btBroadphaseInterface
    _ZTS21btBroadphaseInterface
    _ZTI25btOverlappingPairCallback
    _ZTS25btOverlappingPairCallback
    _ZTI22btOverlappingPairCache
    _ZTS22btOverlappingPairCache
    _ZTV15btNullPairCache
    _ZTI15btNullPairCache
    _ZTS15btNullPairCache
    _E2_str11
    _E2_str112
    _E2_str213
    _E2_str314
    _ZTV20btAxisSweep3InternalItE
    _ZTI20btAxisSweep3InternalItE
    _ZTS20btAxisSweep3InternalItE
    _ZTV12btAxisSweep3
    _ZTI12btAxisSweep3
    _ZTS12btAxisSweep3
    _ZTV20btCollisionAlgorithm
    _ZTI20btCollisionAlgorithm
    _ZTS20btCollisionAlgorithm
    _ZTIN6btDbvt8ICollideE
    _ZTSN6btDbvt8ICollideE
    _E2_str1118
    _E2_str22
    _ZTV18btDbvtTreeCollider
    _ZTI18btDbvtTreeCollider
    _ZTS18btDbvtTreeCollider
    _ZTV19BroadphaseRayTester
    _ZTI19BroadphaseRayTester
    _ZTS19BroadphaseRayTester
    _ZTV20BroadphaseAabbTester
    _ZTI20BroadphaseAabbTester
    _ZTS20BroadphaseAabbTester
    _E2_str18
    _ZTV16btDbvtBroadphase
    _ZTI16btDbvtBroadphase
    _ZTS16btDbvtBroadphase
    _ZTV12btDispatcher
    _ZTI12btDispatcher
    _ZTS12btDispatcher
    _ZTI21btNodeOverlapCallback
    _ZTS21btNodeOverlapCallback
    _E2_str10
    _E2_str212
    _E2_str313
    _E2_str414
    _E2_str515
    _E2_str616
    _E2_str717
    _E2_str820
    _E2_str9
    gOverlappingPairs
    _ZTI17btOverlapCallback
    _ZTS17btOverlapCallback
    _ZTVZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    _ZTIZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    _ZTSZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    _ZTVZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    _ZTIZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    _ZTSZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    gRemovePairs
    _ZTV28btHashedOverlappingPairCache
    _ZTI28btHashedOverlappingPairCache
    _ZTS28btHashedOverlappingPairCache
    _E2_str121
    gAddedPairs
    _E2_str222
    _E2_str323
    _E2_str424
    _E2_str525
    _E2_str626
    _E2_str727
    gFindPairs
    _E2_str32
    _E2_str133
    _E2_str234
    _E2_str335
    _ZTV14btQuantizedBvh
    _ZTI14btQuantizedBvh
    _ZTS14btQuantizedBvh
    _E2_str537
    _E2_str638
    _E2_str739
    _E2_str941
    _E2_str1143
    maxIterations
    _E2_str1844
    _E2_str1921
    _E2_str21
    _E2_str2246
    _ZTV30btActivatingCollisionAlgorithm
    _ZTI30btActivatingCollisionAlgorithm
    _ZTS30btActivatingCollisionAlgorithm
    _E2_str59
    _E2_str160
    _ZTV26btBoxBoxCollisionAlgorithm
    _ZTI26btBoxBoxCollisionAlgorithm
    _ZTS26btBoxBoxCollisionAlgorithm
    _ZTI36btDiscreteCollisionDetectorInterface
    _ZTS36btDiscreteCollisionDetectorInterface
    _ZTV16btBoxBoxDetector
    _ZTI16btBoxBoxDetector
    _ZTS16btBoxBoxDetector
    _E2_str65
    _E2_str166
    gNumManifold
    _ZTIN36btDiscreteCollisionDetectorInterface6ResultE
    _ZTSN36btDiscreteCollisionDetectorInterface6ResultE
    _ZTV23btCollisionPairCallback
    _ZTI23btCollisionPairCallback
    _ZTS23btCollisionPairCallback
    _E2_str169
    _E2_str270
    _E2_str371
    _E2_str472
    _E2_str573
    _ZTV21btCollisionDispatcher
    _ZTI21btCollisionDispatcher
    _ZTS21btCollisionDispatcher
    _E2_str674
    _E2_str775
    _E2_str876
    _E2_str977
    _ZTV17btCollisionObject
    _ZTI17btCollisionObject
    _ZTS17btCollisionObject
    _E2_str78
    _ZTIN16btCollisionWorld20ConvexResultCallbackE
    _ZTSN16btCollisionWorld20ConvexResultCallbackE
    _ZTI30btConvexPenetrationDepthSolver
    _ZTS30btConvexPenetrationDepthSolver
    _ZTVN12btConvexCast10CastResultE
    _ZTIN12btConvexCast10CastResultE
    _ZTSN12btConvexCast10CastResultE
    _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2
    _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2
    _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE15LocalInfoAdder2
    _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder
    _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder
    _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE14LocalInfoAdder
    _ZTI24btBroadphaseAabbCallback
    _ZTS24btBroadphaseAabbCallback
    _ZTI23btBroadphaseRayCallback
    _ZTS23btBroadphaseRayCallback
    _ZTV17DebugDrawcallback
    _ZTI17DebugDrawcallback
    _ZTS17DebugDrawcallback
    _ZTI18btTriangleCallback
    _ZTS18btTriangleCallback
    _ZTI31btInternalTriangleIndexCallback
    _ZTS31btInternalTriangleIndexCallback
    _ZTV16btCollisionWorld
    _ZTI16btCollisionWorld
    _ZTS16btCollisionWorld
    _ZTI16btManifoldResult
    _ZTS16btManifoldResult
    _ZTV21btSingleSweepCallback
    _ZTI21btSingleSweepCallback
    _ZTS21btSingleSweepCallback
    _ZTV19btSingleRayCallback
    _ZTI19btSingleRayCallback
    _ZTS19btSingleRayCallback
    _E2_str382
    _E2_str483
    _E2_str584
    _E2_str685
    _E2_str786
    _E2_str887
    _E2_str988
    _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0
    _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0
    _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback_0
    _ZTI28btTriangleConvexcastCallback
    _ZTS28btTriangleConvexcastCallback
    _ZTVZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback
    _ZTIZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback
    _ZTSZN16btCollisionWorld17objectQuerySingleEPK13btConvexShapeRK11btTransformS5_P17btCollisionObjectPK16btCollisionShapeS5_RNS_20ConvexResultCallbackEfE32BridgeTriangleConvexcastCallback
    _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0
    _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0
    _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback_0
    _ZTI25btTriangleRaycastCallback
    _ZTS25btTriangleRaycastCallback
    _ZTVZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback
    _ZTIZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback
    _ZTSZN16btCollisionWorld13rayTestSingleERK11btTransformS2_P17btCollisionObjectPK16btCollisionShapeS2_RNS_17RayResultCallbackEE29BridgeTriangleRaycastCallback
    _E2_str1089
    _E2_str1190
    _E2_str1291
    _E2_str1392
    _E2_str1493
    _ZZN16btCollisionWorld16updateSingleAabbEP17btCollisionObjectE8reportMe_2E_b
    _E2_str1594
    _E2_str1695
    _E2_str1796
    _E2_str1897
    _E2_str1998
    _ZTV22btCompoundLeafCallback
    _ZTI22btCompoundLeafCallback
    _ZTS22btCompoundLeafCallback
    _E2_str99
    _E2_str1100
    _E2_str2101
    _E2_str3102
    _E2_str4103
    _E2_str5104
    _E2_str6105
    _E2_str7106
    _ZTV28btCompoundCollisionAlgorithm
    _ZTI28btCompoundCollisionAlgorithm
    _ZTS28btCompoundCollisionAlgorithm
    _E2_str109
    _ZTV24btConvexTriangleCallback
    _ZTI24btConvexTriangleCallback
    _ZTS24btConvexTriangleCallback
    _ZTVZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback
    _ZTIZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback
    _ZTSZN33btConvexConcaveCollisionAlgorithm21calculateTimeOfImpactEP17btCollisionObjectS1_RK16btDispatcherInfoP16btManifoldResultE31LocalTriangleSphereCastCallback
    _ZTV15btTriangleShape
    _ZTI15btTriangleShape
    _ZTS15btTriangleShape
    _ZTI23btPolyhedralConvexShape
    _ZTS23btPolyhedralConvexShape
    _ZTI21btConvexInternalShape
    _ZTS21btConvexInternalShape
    _ZTI13btConvexShape
    _ZTS13btConvexShape
    _ZTI16btCollisionShape
    _ZTS16btCollisionShape
    _E2_str1110
    _E2_str3112
    _ZTV33btConvexConcaveCollisionAlgorithm
    _ZTI33btConvexConcaveCollisionAlgorithm
    _ZTS33btConvexConcaveCollisionAlgorithm
    _ZTI30btCollisionAlgorithmCreateFunc
    _ZTS30btCollisionAlgorithmCreateFunc
    _ZTVN23btConvexConvexAlgorithm10CreateFuncE
    _ZTIN23btConvexConvexAlgorithm10CreateFuncE
    _ZTSN23btConvexConvexAlgorithm10CreateFuncE
    _ZTV24btPerturbedContactResult
    _ZTI24btPerturbedContactResult
    _ZTS24btPerturbedContactResult
    _E2_str115
    _E2_str4119
    _E2_str5120
    _ZTV23btConvexConvexAlgorithm
    _ZTI23btConvexConvexAlgorithm
    _ZTS23btConvexConvexAlgorithm
    _ZTV31btConvexPlaneCollisionAlgorithm
    _ZTI31btConvexPlaneCollisionAlgorithm
    _ZTS31btConvexPlaneCollisionAlgorithm
    _ZTVN31btConvexPlaneCollisionAlgorithm10CreateFuncE
    _ZTIN31btConvexPlaneCollisionAlgorithm10CreateFuncE
    _ZTSN31btConvexPlaneCollisionAlgorithm10CreateFuncE
    _ZTI24btCollisionConfiguration
    _ZTS24btCollisionConfiguration
    _ZTVN33btConvexConcaveCollisionAlgorithm10CreateFuncE
    _ZTIN33btConvexConcaveCollisionAlgorithm10CreateFuncE
    _ZTSN33btConvexConcaveCollisionAlgorithm10CreateFuncE
    _ZTVN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE
    _ZTIN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE
    _ZTSN33btConvexConcaveCollisionAlgorithm17SwappedCreateFuncE
    _ZTVN28btCompoundCollisionAlgorithm10CreateFuncE
    _ZTIN28btCompoundCollisionAlgorithm10CreateFuncE
    _ZTSN28btCompoundCollisionAlgorithm10CreateFuncE
    _ZTVN28btCompoundCollisionAlgorithm17SwappedCreateFuncE
    _ZTIN28btCompoundCollisionAlgorithm17SwappedCreateFuncE
    _ZTSN28btCompoundCollisionAlgorithm17SwappedCreateFuncE
    _ZTVN16btEmptyAlgorithm10CreateFuncE
    _ZTIN16btEmptyAlgorithm10CreateFuncE
    _ZTSN16btEmptyAlgorithm10CreateFuncE
    _ZTVN32btSphereSphereCollisionAlgorithm10CreateFuncE
    _ZTIN32btSphereSphereCollisionAlgorithm10CreateFuncE
    _ZTSN32btSphereSphereCollisionAlgorithm10CreateFuncE
    _ZTVN34btSphereTriangleCollisionAlgorithm10CreateFuncE
    _ZTIN34btSphereTriangleCollisionAlgorithm10CreateFuncE
    _ZTSN34btSphereTriangleCollisionAlgorithm10CreateFuncE
    _ZTVN26btBoxBoxCollisionAlgorithm10CreateFuncE
    _ZTIN26btBoxBoxCollisionAlgorithm10CreateFuncE
    _ZTSN26btBoxBoxCollisionAlgorithm10CreateFuncE
    _E2_str128
    _E2_str1129
    _ZTV31btDefaultCollisionConfiguration
    _ZTI31btDefaultCollisionConfiguration
    _ZTS31btDefaultCollisionConfiguration
    _ZTV16btEmptyAlgorithm
    _ZTI16btEmptyAlgorithm
    _ZTS16btEmptyAlgorithm
    _ZTV16btManifoldResult
    _E2_str2149
    _E2_str3150
    _E2_str5152
    _E2_str155
    _E2_str1156
    _E2_str2157
    _E2_str3158
    _ZTV25btSimulationIslandManager
    _ZTI25btSimulationIslandManager
    _ZTS25btSimulationIslandManager
    _ZTV32btSphereSphereCollisionAlgorithm
    _ZTI32btSphereSphereCollisionAlgorithm
    _ZTS32btSphereSphereCollisionAlgorithm
    _ZTV34btSphereTriangleCollisionAlgorithm
    _ZTI34btSphereTriangleCollisionAlgorithm
    _ZTS34btSphereTriangleCollisionAlgorithm
    _ZTV22SphereTriangleDetector
    _ZTI22SphereTriangleDetector
    _ZTS22SphereTriangleDetector
    _E2_str173
    _E2_str2175
    _ZTV10btBoxShape
    _ZTI10btBoxShape
    _ZTS10btBoxShape
    _E2_str181
    _ZTVZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _ZTIZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _ZTSZN22btBvhTriangleMeshShape14performRaycastEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _ZTVZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback
    _ZTIZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback
    _ZTSZN22btBvhTriangleMeshShape17performConvexcastEP18btTriangleCallbackRK9btVector3S4_S4_S4_E21MyNodeOverlapCallback
    _ZTVZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _ZTIZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _ZTSZNK22btBvhTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E21MyNodeOverlapCallback
    _E2_str5186
    _E2_str6187
    _E2_str7188
    _E2_str8189
    _ZTV22btBvhTriangleMeshShape
    _ZTI22btBvhTriangleMeshShape
    _ZTS22btBvhTriangleMeshShape
    _ZTI19btTriangleMeshShape
    _ZTS19btTriangleMeshShape
    _ZTI14btConcaveShape
    _ZTS14btConcaveShape
    _E2_str194
    _E2_str4198
    _E2_str6199
    _ZTV14btCapsuleShape
    _ZTI14btCapsuleShape
    _ZTS14btCapsuleShape
    _E2_str200
    _ZTV14btConcaveShape
    _E2_str219
    _E2_str3222
    _ZTV17btConvexHullShape
    _ZTI17btConvexHullShape
    _ZTS17btConvexHullShape
    _ZTI34btPolyhedralConvexAabbCachingShape
    _ZTS34btPolyhedralConvexAabbCachingShape
    _E2_str5223
    _E2_str6224
    _E2_str6232
    _ZTV13btConvexShape
    _E2_str6249
    _E2_str7250
    _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback
    _ZTIZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback
    _ZTSZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E20NodeTriangleCallback
    _ZTVZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback
    _ZTIZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback
    _ZTSZN14btOptimizedBvh5buildEP23btStridingMeshInterfacebRK9btVector3S4_E29QuantizedNodeTriangleCallback
    _E2_str10306
    _E2_str18314
    _E2_str19315
    _E2_str20316
    _ZTV14btOptimizedBvh
    _ZTI14btOptimizedBvh
    _ZTS14btOptimizedBvh
    _E2_str7331
    _ZGVZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions
    _ZZN34btPolyhedralConvexAabbCachingShape15recalcLocalAabbEvE11_directions
    _E2_str342
    _ZTV13btSphereShape
    _ZTI13btSphereShape
    _ZTS13btSphereShape
    _E2_str349
    _E2_str1350
    _E2_str3352
    _E2_str5354
    _E2_str6355
    _E2_str7356
    _E2_str8357
    _E2_str9358
    _ZTV23btStridingMeshInterface
    _ZTI23btStridingMeshInterface
    _ZTS23btStridingMeshInterface
    _ZTV31btInternalTriangleIndexCallback
    _ZTV18btTriangleCallback
    _E2_str367
    _E2_str1368
    _ZTV26btTriangleIndexVertexArray
    _ZTI26btTriangleIndexVertexArray
    _ZTS26btTriangleIndexVertexArray
    _E2_str372
    _ZTV21SupportVertexCallback
    _ZTI21SupportVertexCallback
    _ZTS21SupportVertexCallback
    _ZTVZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback
    _ZTIZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback
    _ZTSZNK19btTriangleMeshShape19processAllTrianglesEP18btTriangleCallbackRK9btVector3S4_E16FilteredCallback
    _E2_str3375
    _ZTV19btTriangleMeshShape
    _ZTV16btPointCollector
    _ZTI16btPointCollector
    _ZTS16btPointCollector
    _ZTV27btContinuousConvexCollision
    _ZTI27btContinuousConvexCollision
    _ZTS27btContinuousConvexCollision
    _ZTI12btConvexCast
    _ZTS12btConvexCast
    _ZTV12btConvexCast
    _ZTV15btGjkConvexCast
    _ZTI15btGjkConvexCast
    _ZTS15btGjkConvexCast
    _ZZN12gjkepa2_impl3GJK13projectoriginERK9btVector3S3_S3_PfRjE4imd3
    _ZZN12gjkepa2_impl3EPA6expandEjPNS_3GJK3sSVEPNS0_5sFaceEjRNS0_8sHorizonEE4i2m3
    _ZTV30btGjkEpaPenetrationDepthSolver
    _ZTI30btGjkEpaPenetrationDepthSolver
    _ZTS30btGjkEpaPenetrationDepthSolver
    gNumDeepPenetrationChecks
    _ZTV17btGjkPairDetector
    _ZTI17btGjkPairDetector
    _ZTS17btGjkPairDetector
    gNumGjkChecks
    _E2_str425
    _E2_str1426
    _E2_str2427
    _E2_str3428
    gContactBreakingThreshold
    _E2_str434
    _E2_str3437
    _E2_str4438
    _ZTV28btTriangleConvexcastCallback
    _ZTV22btSubsimplexConvexCast
    _ZTI22btSubsimplexConvexCast
    _ZTS22btSubsimplexConvexCast
    _E2_str457
    _E2_str1458
    _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE
    _ZTIN16btCollisionWorld27ClosestConvexResultCallbackE
    _ZTSN16btCollisionWorld27ClosestConvexResultCallbackE
    _E2_str36
    _E2_str239
    _ZTV21btConeTwistConstraint
    _ZTI21btConeTwistConstraint
    _ZTS21btConeTwistConstraint
    _E2_str1340
    _E2_str24
    _E2_str442
    _E2_str543
    _E2_str846
    _E2_str947
    _E2_str1149
    _E2_str29
    _ZTV17btHingeConstraint
    _ZTI17btHingeConstraint
    _ZTS17btHingeConstraint
    _E2_str130
    _E2_str231
    _E2_str332
    _E2_str433
    gNumSplitImpulseRecoveries
    _ZTI18btConstraintSolver
    _ZTS18btConstraintSolver
    _ZTV35btSequentialImpulseConstraintSolver
    _ZTI35btSequentialImpulseConstraintSolver
    _ZTS35btSequentialImpulseConstraintSolver
    _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
    _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
    _E2_str248
    _E2_str34955
    _E2_str450
    _E2_str551
    _E2_str652
    _E2_str753
    _E2_str854
    _E2_str955
    _E2_str1056
    _E2_str1157
    _E2_str76
    _ZTI23btDiscreteDynamicsWorld
    _ZTS23btDiscreteDynamicsWorld
    _ZTI15btDynamicsWorld
    _ZTS15btDynamicsWorld
    _ZTIN25btSimulationIslandManager14IslandCallbackE
    _ZTSN25btSimulationIslandManager14IslandCallbackE
    _ZTV34btClosestNotMeConvexResultCallback
    _ZTI34btClosestNotMeConvexResultCallback
    _ZTS34btClosestNotMeConvexResultCallback
    _ZTVZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    _ZTIZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    _ZTSZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    _E2_str87
    _E2_str188
    _E2_str289
    _E2_str794
    _E2_str895
    gNumClampedCcdMotions
    _E2_str996
    _E2_str1097
    _E2_str1198
    _E2_str1299
    _E2_str13100
    _E2_str1461
    _E2_str1562
    _E2_str16101
    _ZTV15btDynamicsWorld
    _ZTV23btDiscreteDynamicsWorld
    _ZL8uniqueId
    _ZTV11btRigidBody
    _ZTI11btRigidBody
    _ZTS11btRigidBody
    _E2_str4144
    gDisableDeactivation
    gNumAlignedAllocs
    gNumAlignedFree
    _ZN15CProfileManager12FrameCounterE
    _ZN15CProfileManager4RootE
    _ZL13gProfileClock_2E_0
    _ZN15CProfileManager11CurrentNodeE
    _E2_str729
    _ZN4__rwL12__rw_catlistE_2E_0
    _ZN4__rwL12__rw_catlistE_2E_1
    _ZN4__rwL12__rw_catlistE_2E_2
    llvm_2E_eh_2E_catch_2E_all_2E_value
    _ZTIN4__rw10__rw_facetE
    _ZTSN4__rw10__rw_facetE
    _ZTIN4__rw17__rw_synchronizedE
    _ZTSN4__rw17__rw_synchronizedE
    _E2_str4131
    _E2_str15132
    _E2_str26
    _ZN4__rwL13__rw_what_bufE
    _ZN4__rwL16__rw_what_refcntE
    _E2_str3133
    _E2_str47
    _E2_str5134
    _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E7__fname
    _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E6buffer
    _E2_str7136
    _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E8__catset
    _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E4msgs
    _ZZN4__rwL13__rw_vfmtwhatEPcjiS0_E5__cat
    _ZZN4__rw10__rw_throwEizE6errors
    _E2_str8137
    _E2_str9138
    _E2_str10139
    _E2_str11140
    _E2_str12141
    _E2_str138142
    _E2_str14143
    _E2_str159144
    _E2_str16145
    _E2_str17146
    _E2_str18147
    _E2_str19148
    _E2_str20149
    _E2_str21150
    _E2_str22151
    _E2_str23152
    _E2_str24153
    _E2_str25154
    _E2_str2610
    _E2_str27
    _E2_str28155
    _E2_str29156
    _E2_str30
    _E2_str31
    _E2_str32157
    _E2_str33
    _E2_str134
    _E2_str235
    _E2_str336
    _E2_str437
    _ZTVN4__rw10__rw_facetE
    _E2_str538
    _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE12n_std_facets
    _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE10std_facets
    _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE13std_facet_buf
    _ZZN4__rw10__rw_facet9_C_manageEPS0_NS0_13_C_facet_typeEPKcPFS1_jS4_EE17std_facet_bufsize
    _ZZN4__rw10__rw_facetD4EvE9destroyed
    _ZN4__rw9__rw_catsE
    _E2_str785
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE6global
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE5ginit
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE9n_locales
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7locales
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE10locale_buf
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE14locale_bufsize
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE7classic
    _ZZN4__rw11__rw_locale9_C_manageEPS0_PKcE12classic_body
    _ZN4__rwL22__rw_classic_once_initE_2E_0_2E_b
    _ZN4__rwL12__rw_classicE
    _E2_str292167
    _E2_str10100175
    _E2_str12102177
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE4init_2E_b
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE8catalogs
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11catalog_buf
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE15catalog_bufsize
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE10n_catalogs
    _ZZN4__rwL20__rw_manage_cat_dataERiPNS_18__rw_open_cat_dataEE11largest_cat
    _E2_str115180
    _E2_str1116181
    _E2_str2131
    _E2_str4133
    _ZZN4__rw16__rw_locale_nameEiPKcRNS_14__rw_pod_arrayIcLj256EEEE11locale_root
    _ZNSs11_C_null_refE
    _ZTVSt8messagesIcE
    _ZTISt8messagesIcE
    _ZTSSt8messagesIcE
    _ZTISt13messages_base
    _ZTSSt13messages_base
    _E2_str2360
    _E2_str3361
    _E2_str4362
    _ZTVSt9type_info
    _ZTISt9type_info
    _ZTSSt9type_info
    s_max_memory
    s_current_memory
    block_null
    _E2_str643
    _E2_str1648
    _E2_str4651
    _E2_str5652
    my_ctype
    _ZL8nextRand
    _E2_str7654
    _E2_str9655
    _ZL8pad_line
    _ZL10strtok_pos
    _ZTI14CFileInterface
    _ZTS14CFileInterface
    _ZTV11CFileSystem
    _ZTI11CFileSystem
    _ZTS11CFileSystem
    _ZL13s_file_stdout
    _ZTV7CFileLS
    _ZTI7CFileLS
    _ZTS7CFileLS
    _ZTV10CFileCloud
    _ZTI10CFileCloud
    _ZTS10CFileCloud
    _ZL10s_aSockets
    _ZTV11CFileStdout
    _ZTI11CFileStdout
    _ZTS11CFileStdout
    _E2_str31677
    _E2_str32678
    _E2_str33679
    _E2_str34680
    _E2_str35681
    _E2_str37683
    _E2_str38684
    _ZN12mandreel_b64L9b64_charsE
    _ZN12mandreel_b64L11b64_indexesE
    _ZL25s_mandreel_internal_width
    _ZL26s_mandreel_internal_height
    g_msgcallback
    _ZL24g_pFirstTextureAsyncInfo
    _ZL17g_apPackFileNames
    _ZGVZ21Mandreel_GetTickCountE7s_first
    _ZZ21Mandreel_GetTickCountE7s_first
    _ZZ29__mandreel_internal_preupdateE8s_bfirst_2E_b
    _E2_str779
    _E2_str3782
    _E2_str4783
    _E2_str5784
    _E2_str6785
    _ZZ24__mandreel_internal_initE54s_723478567_mandreel___mandreel_internal_SetResolution
    _ZZ24__mandreel_internal_initE56s_723478567_mandreel_iMandreel_TextureAsync_IsCompressed
    _ZZ24__mandreel_internal_initE57s_723478567_mandreel_iMandreel_TextureAsync_GetPackOffset
    _ZZ24__mandreel_internal_initE29s_723478567_mandreel___resize
    _ZZ24__mandreel_internal_initE48s_723478567_mandreel_imandreel_restore_glcontext
    _ZZ24__mandreel_internal_initE46s_723478567_mandreel_imandreel_viewport_resize
    _ZTVN10__cxxabiv120__si_class_type_infoE
    _ZTIN10__cxxabiv120__si_class_type_infoE
    _ZTSN10__cxxabiv120__si_class_type_infoE
    _ZTIN10__cxxabiv117__class_type_infoE
    _ZTSN10__cxxabiv117__class_type_infoE
    _ZTVN10__cxxabiv117__class_type_infoE
    _ZTVN10__cxxabiv121__vmi_class_type_infoE
    _ZTIN10__cxxabiv121__vmi_class_type_infoE
    _ZTSN10__cxxabiv121__vmi_class_type_infoE
    _ZL11g_aChannels
    _ZL7g_bInit_2E_b
    _E2_str221
    _E2_str1222
    _ZL21g_pFirstSoundDuration
    _E2_str3224
    _E2_str4225
    _ZL15g_iFreeChannels
    _ZL15g_aFreeChannels
    _ZL6g_bLog
    _E2_str12233
    _E2_str22243
    _E2_str24245
    _E2_str26247
    _E2_str27248
    _E2_str28249
    _E2_str29250
    _E2_str30251
    _E2_str31252
    _E2_str32253
    _E2_str33254
    _E2_str34255
    _E2_str35256
    _ZZL32_mandreel_init_tcp_socket_librayvE47s_723478567_mandreel_mandreel_flash_tcp_onError
    _ZL13s_fifo_errors
    _ZN5my_glL9m_contextE
    llvm_2E_global_ctors
    llvm_2E_global_dtors
    llvm_2E_used
    }
}
    
func cosf(sp: Int64) : Unit
{
    var value = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(cos(value))
}
    
func dump(x: String) : Unit {
}
    
func fill_ptr_from_string(ptr: Int64, v: String) : Unit
{
    var lptr = ptr
    for (char1 in v) {
        heapClassInst.heapU8[lptr] = UInt8(char1)
        lptr += 1
    }
    heapClassInst.heapU8[lptr] = 0
}
    
func fmodf(sp: Int64) : Unit
{
    var lsp = sp
    var value: Float32 = heapClassInst.heapFloat[lsp >> 2];
    lsp += 4;
    var value2: Float32 = heapClassInst.heapFloat[lsp >> 2];
}
    
func free(sp: Int64) : Unit
{
    var lsp = sp
    var ptr = heapClassInst.heapU32[lsp >> 2];
    lsp -= 8;
    heapClassInst.heap32[lsp >> 2] = Int32(tlsfPtr.tlsf_ptr);
    heapClassInst.heap32[(lsp + 4) >> 2] = Int32(ptr);
    tlsf_free(lsp);
}
    
func gettimeofday(sp: Int64) : Unit
{
    var ptr: Int64 = Int64(heapClassInst.heap32[sp >> 2]);
    var time_ms: Int64 = Date_now();
    heapClassInst.heap32[ptr >> 2] = Int32(time_ms / 1000);
    heapClassInst.heap32[(ptr >> 2) + 1] = Int32((time_ms % 1000) * 1000);
    commonVariable.r_g0 = 0;
}
    
func Date_now() : Int64 {
    commonVariable.Mandreel_currentTime += 16;
    return commonVariable.Mandreel_currentTime;
}
    
func updateMandreelStats(time: Float64) : Unit {
    let pause = time - commonVariable.mandreelSampleTimeStart
    commonVariable.mandreelSampleTimeStart = time
    commonVariable.mandreelPauseTimes.add(pause)
}
    
func js_mandreel_flash_tcp_update(sp: Int64) : Unit
{
}
    
func __mandreel_internal_CreateWindow(param: Int64) : Unit
{
}
    
func iMandreelRegisterExternalCallback(param: Int64) : Unit
{
}
    
func _Z30mandreel_fopen_enable_checkfatb(sp: Int64) : Unit
{
}
    
func Mandreel_TextureAsync_SetData(sp: Int64) : Unit
{
    var lsp = sp
    var texture_id = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    var tex: ?ArrayUniformLocations = array_ids_ogl[texture_id];
    if  (commonVariable.mandreelAppPlatform != "canvas")
    {
        // tex = nil;
        tex = None
    }
}
    
func block_merge_next(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r2 = (r2 + (-4)) | 0;
    r2 = r2 & (-4);
    r3 = (r0 + 8) | 0;
    r4 = (r2 + 4) | 0;
    r4 = (r3 + r4) | 0;
    r4 = r4 >> 2;
    r5 = Int64(heapClassInst.heap32[(r4)]);
    r6 = r5 & 1;
    if (!(r6 == 0)) {
        r6 = Int64(heapClassInst.heap32[(fp)]);
        r7 = (r3 + r2) | 0;
        r8 = r5 & (-4);
        if (`UIntNative`(r8) > `UIntNative`(255)) {
            r5 = r8 >> 1;
            r5 = r8 | r5;
            r9 = r5 >> 2;
            r5 = r5 | r9;
            r9 = r5 >> 4;
            r5 = r5 | r9;
            r9 = r5 >> 8;
            r5 = r5 | r9;
            r9 = r5 >> 16;
            r5 = r5 | r9;
            r9 = r5 ^ (-1);
            r10 = 1431655765;
            r9 = r9 >> 1;
            r5 = r10 & (!r5);
            r9 = r9 & 1431655765;
            r5 = (r5 + r9) | 0;
            r9 = r5 >> 2;
            r5 = r5 & 858993459;
            r9 = r9 & 858993459;
            r5 = (r5 + r9) | 0;
            r9 = r5 >> 4;
            r5 = r5 & 252645135;
            r9 = r9 & 252645135;
            r5 = (r5 + r9) | 0;
            r9 = r5 >> 8;
            r5 = r5 & 16711935;
            r9 = r9 & 16711935;
            r5 = (r5 + r9) | 0;
            r9 = r5 & 65535;
            r5 = r5 >> 16;
            r10 = 26;
            r5 = (r9 + r5) | 0;
            r9 = (r10 - r5) | 0;
            r8 = r8 >> r9;
            r9 = 24;
            r8 = r8 ^ 32;
            r5 = (r9 - r5) | 0;
        }
        else {
            r8 = r5 >> 3;
            r5 = 0;
        }
        r2 = (r2 + r3) | 0;
        r2 = r2 >> 2;
        r9 = r5 << 7;
        r10 = Int64(heapClassInst.heap32[(r2 + 2)]);
        r2 = Int64(heapClassInst.heap32[(r2 + 3)]);
        r9 = (r6 + r9) | 0;
        r11 = r8 << 2;
        r9 = (r9 + r11) | 0;
        r11 = r10 >> 2;
        r12 = r2 >> 2;
        heapClassInst.heap32[(r11 + 3)] = Int32(r2);
        r2 = r9 >> 2;
        heapClassInst.heap32[(r12 + 2)] = Int32(r10);
        r2 = Int64(heapClassInst.heap32[(r2 + 24)]);
        if (!(r2 != r7)) {
            r2 = (r9 + 96) | 0;
            r2 = r2 >> 2;
            r7 = block_null;
            heapClassInst.heap32[(r2)] = Int32(r10);
            if (!(r10 != r7)) {
                r2 = r5 << 2;
                r2 = (r6 + r2) | 0;
                r2 = r2 >> 2;
                r7 = 1;
                r8 = r7 << r8;
                r9 = Int64(heapClassInst.heap32[(r2 + 1)]);
                r8 = r9 & (!r8);
                heapClassInst.heap32[(r2 + 1)] = Int32(r8);
                if (!(r8 != 0)) {
                    r2 = r6 >> 2;
                    r5 = r7 << r5;
                    r6 = Int64(heapClassInst.heap32[(r2)]);
                    r5 = r6 & (!r5);
                    heapClassInst.heap32[(r2)] = Int32(r5);
                }
            }
        }
        r2 = Int64(heapClassInst.heap32[(r4)]);
        r4 = Int64(heapClassInst.heap32[(r1 + 1)]);
        r2 = r2 & (-4);
        r2 = (r2 + r4) | 0;
        r4 = r2 & (-4);
        r3 = (r3 + r4) | 0;
        r2 = (r2 + 4) | 0;
        r3 = r3 >> 2;
        heapClassInst.heap32[(r1 + 1)] = Int32(r2);
        heapClassInst.heap32[(r3)] = Int32(r0);
    }
    commonVariable.r_g0 = r0;
    return;
}
    
func mandreel_add_valid_fopenfile(param: Int64) : Unit {
}
    
func mandreel_fread(sp: Int64) : Unit {
}
    
func mandreel_fclose(sp: Int64) : Unit
{
    var lsp = sp
    var file_id = heapClassInst.heap32[lsp >> 2];
    lsp += 4;
    file_ids[Int64(file_id)] = None;
    commonVariable.r_g0 = 0;
}
    
func mandreel_feof(sp: Int64) : Unit
{
    var lsp = sp
    var file_id = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    var offset = file_ids[file_id].getOrThrow().offset;
    var total = file_ids[file_id].getOrThrow().count;
    if (offset >= total) {
        commonVariable.r_g0 = 1;
    } else {
        commonVariable.r_g0 = 0;
    }
}
    
func mandreel_ftell(sp: Int64) : Unit
{
    var lsp = sp
    var file_id = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    if(file_ids[file_id].isSome()) {
        var value = file_ids[file_id].getOrThrow().offset;
        commonVariable.r_g0 = value
    } else {
        commonVariable.r_g0 = 0;
    }
    
}
    
func mandreel_fseek(sp: Int64) : Unit
{
    var lsp = sp
    var file_id = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    var pos = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    var type1 = heapClassInst.heap32[lsp >> 2];
    lsp += 4;
    if (type1 == 2) {
        file_ids[file_id].getOrThrow().offset = file_ids[file_id].getOrThrow().count + pos
    }
    else if (type1 == 1) {
        file_ids[file_id].getOrThrow().offset = file_ids[file_id].getOrThrow().offset + pos;
    }
    else if (type1 == 0) {
        file_ids[file_id].getOrThrow().offset = pos;
    }
    commonVariable.r_g0 = 0;
}
    
func mandreel_ungetc(sp: Int64) : Int64
{
    var lsp = sp
    var my_char = heapClassInst.heap32[lsp >> 2];
    lsp += 4;
    var file_id = Int64(heapClassInst.heap32[lsp >> 2]);
    lsp += 4;
    var offset = (file_ids[file_id].getOrThrow().offset) - 1;
    var byteArray = file_ids[file_id].getOrThrow().byteArray;
    assert(byteArray[offset] == UInt8(my_char));
    file_ids[file_id].getOrThrow().offset = offset;
    return Int64(my_char);
}
    
func realloc(sp: Int64) : Unit
{
    var lsp = sp
    var ptr = Int64(heapClassInst.heapU32[lsp >> 2]);
    var size = heapClassInst.heapU32[(lsp + 4) >> 2];
    lsp -= 12;
    heapClassInst.heap32[lsp >> 2] = Int32(tlsfPtr.tlsf_ptr);
    heapClassInst.heap32[(lsp + 4) >> 2] = Int32(ptr);
    heapClassInst.heap32[(lsp + 8) >> 2] = Int32(size);
    tlsf_realloc(lsp);
}
    
func tlsf_realloc(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    if (!(r0 == 0)) {
        if (!(r2 != 0)) {
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            tlsf_free(i7)
            r0 = 0;
            commonVariable.r_g0 = r0;
            return;
        }
    }
    if (r0 != 0) {
        r3 = r0 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3 + (-1))]);
        r5 = r4 & (-4);
        r6 = (r0 + r5) | 0;
        r6 = r6 >> 2;
        r6 = Int64(heapClassInst.heap32[(r6)]);
        r7 = r6 & (-4);
        r7 = (r5 + r7) | 0;
        r8 = (r2 + (-1)) | 0;
        r9 = (r0 + (-8)) | 0;
        r7 = (r7 + 4) | 0;
        if (`UIntNative`(r8) < `UIntNative`(1073741823)) {
            r10 = (r2 + 7) | 0;
            r10 = r10 & (-8);
            r11 = 12;
            if (`UIntNative`(r10) < `UIntNative`(r11)){
                r10 = r11
            } 
        }
        else {
            r10 = 0;
        }
        do {
            if (`UIntNative`(r10) > `UIntNative`(r5)) {
                r4 = r6 & 1;
                if (!(r4 == 0)) {
                    if (`UIntNative`(r10) <= `UIntNative`(r7)) {
                        heapClassInst.heap32[(g0)] = Int32(r1);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r9);
                        block_merge_next(i7);
                        r4 = Int64(heapClassInst.heap32[(r3 + (-1))]);
                        r4 = r4 & (-4);
                        r4 = (r0 + r4) | 0;
                        r4 = r4 >> 2;
                        r9 = Int64(heapClassInst.heap32[(r4)]);
                        r9 = r9 & (-3);
                        heapClassInst.heap32[(r4)] = Int32(r9);
                        r4 = Int64(heapClassInst.heap32[(r3 + (-1))]);
                        r4 = r4 & (-2);
                        heapClassInst.heap32[(r3 + (-1))] = Int32(r4);
                        break 
                    }
                }
                if (`UIntNative`(r8) < `UIntNative`(1073741823)) {
                    r3 = (r2 + 7) | 0;
                    r3 = r3 & (-8);
                    r4 = 12;
                    if (`UIntNative`(r3) < `UIntNative`(r4)){
                        r3 = r4
                    }
                }
                else {
                    r3 = 0;
                }
                heapClassInst.heap32[(g0)] = Int32(r1);
                heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                block_locate_free(i7);
                r4 = commonVariable.r_g0;
                heapClassInst.heap32[(g0)] = Int32(r1);
                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                heapClassInst.heap32[(g0 + 2)] = Int32(r3);
                r3 = s_current_memory;
                block_prepare_used(i7);
                r9 = commonVariable.r_g0;
                r4 = r4 >> 2;
                r3 = r3 >> 2;
                r4 = Int64(heapClassInst.heap32[(r4 + 1)]);
                r10 = Int64(heapClassInst.heap32[(r3)]);
                r4 = r4 & (-4);
                r4 = (r10 + r4) | 0;
                r10 = s_max_memory;
                r10 = r10 >> 2;
                heapClassInst.heap32[(r3)] = Int32(r4);
                r3 = Int64(heapClassInst.heap32[(r10)]);
                if (!(`UIntNative`(r4) <= `UIntNative`(r3))) {
                    heapClassInst.heap32[(r10)] = Int32(r4);
                }
                if (r9 == 0) {
                    commonVariable.r_g0 = r9;
                    return;
                }
                else {
                    if (`UIntNative`(r5) >= `UIntNative`(r2)){
                        r3 = r2
                    } else{
                        r3 = r5
                    }
                    heapClassInst.heap32[(g0)] = Int32(r9);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r3);
                    memcpy(i7);
                    heapClassInst.heap32[(g0)] = Int32(r1);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                    tlsf_free(i7);
                    commonVariable.r_g0 = r9;
                    return;
                }
            }
        } while (false);
        r9 = s_current_memory;
        r9 = r9 >> 2;
        r2 = Int64(heapClassInst.heap32[(r9)]);
        r2 = (r2 - r5) | 0;
        r5 = r4 & (-4);
        heapClassInst.heap32[(r9)] = Int32(r2);
        r6 = (r10 + 16) | 0;
        if (`UIntNative`(r5) >= `UIntNative`(r6)) {
            r4 = (r0 + r10) | 0;
            r6 = r4 >> 2;
            r7 = (-4);
            r8 = Int64(heapClassInst.heap32[(r6)]);
            r7 = (r7 - r10) | 0;
            r8 = r8 & 3;
            r5 = (r7 + r5) | 0;
            r5 = r8 | r5;
            heapClassInst.heap32[(r6)] = Int32(r5);
            r5 = Int64(heapClassInst.heap32[(r3 + (-1))]);
            r5 = r5 & 3;
            r5 = r5 | r10;
            heapClassInst.heap32[(r3 + (-1))] = Int32(r5);
            r5 = Int64(heapClassInst.heap32[(r6)]);
            r5 = (r5 + (-4)) | 0;
            r5 = r5 & (-4);
            r5 = (r10 + r5) | 0;
            r5 = (r5 + r0) | 0;
            r4 = (r4 + (-4)) | 0;
            r5 = r5 >> 2;
            heapClassInst.heap32[(r5 + 1)] = Int32(r4);
            r7 = Int64(heapClassInst.heap32[(r5 + 2)]);
            r7 = r7 | 2;
            heapClassInst.heap32[(r5 + 2)] = Int32(r7);
            r5 = Int64(heapClassInst.heap32[(r6)]);
            r5 = r5 | 1;
            r5 = r5 & (-3);
            heapClassInst.heap32[(r6)] = Int32(r5);
            heapClassInst.heap32[(g0)] = Int32(r1);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            block_merge_next(i7);
            r4 = commonVariable.r_g0;
            r5 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r5 + 1)]);
            r6 = r5 & (-4);
            if (`UIntNative`(r6) > `UIntNative`(255)) {
                r5 = r6 >> 1;
                r5 = r6 | r5;
                r7 = r5 >> 2;
                r5 = r5 | r7;
                r7 = r5 >> 4;
                r5 = r5 | r7;
                r7 = r5 >> 8;
                r5 = r5 | r7;
                r7 = r5 >> 16;
                r5 = r5 | r7;
                r7 = r5 ^ (-1);
                r8 = 1431655765;
                r7 = r7 >> 1;
                r5 = r8 & (!r5);
                r7 = r7 & 1431655765;
                r5 = (r5 + r7) | 0;
                r7 = r5 >> 2;
                r5 = r5 & 858993459;
                r7 = r7 & 858993459;
                r5 = (r5 + r7) | 0;
                r7 = r5 >> 4;
                r5 = r5 & 252645135;
                r7 = r7 & 252645135;
                r5 = (r5 + r7) | 0;
                r7 = r5 >> 8;
                r5 = r5 & 16711935;
                r7 = r7 & 16711935;
                r5 = (r5 + r7) | 0;
                r7 = r5 & 65535;
                r5 = r5 >> 16;
                r8 = 26;
                r5 = (r7 + r5) | 0;
                r7 = (r8 - r5) | 0;
                r6 = r6 >> r7;
                r7 = 24;
                r6 = r6 ^ 32;
                r5 = (r7 - r5) | 0;
            }
            else {
                r6 = r5 >> 3;
                r5 = 0;
            }
            r7 = r5 << 7;
            r7 = (r1 + r7) | 0;
            r8 = r6 << 2;
            r7 = (r7 + r8) | 0;
            r7 = r7 >> 2;
            r8 = Int64(heapClassInst.heap32[(r7 + 24)]);
            r10 = r4 >> 2;
            r11 = block_null;
            heapClassInst.heap32[(r10 + 2)] = Int32(r8);
            r8 = r8 >> 2;
            heapClassInst.heap32[(r10 + 3)] = Int32(r11);
            heapClassInst.heap32[(r8 + 3)] = Int32(r4);
            r8 = 1;
            r10 = r1 >> 2;
            heapClassInst.heap32[(r7 + 24)] = Int32(r4);
            r4 = r5 << 2;
            r5 = r8 << r5;
            r7 = Int64(heapClassInst.heap32[(r10)]);
            r4 = (r1 + r4) | 0;
            r1 = r7 | r5;
            r4 = r4 >> 2;
            heapClassInst.heap32[(r10)] = Int32(r1);
            r1 = r8 << r6;
            r5 = Int64(heapClassInst.heap32[(r4 + 1)]);
            r1 = r5 | r1;
            heapClassInst.heap32[(r4 + 1)] = Int32(r1);
            r4 = Int64(heapClassInst.heap32[(r3 + (-1))]);
        }
        r1 = r4 & (-4);
        r1 = (r2 + r1) | 0;
        r2 = s_max_memory;
        r2 = r2 >> 2;
        heapClassInst.heap32[(r9)] = Int32(r1);
        r9 = Int64(heapClassInst.heap32[(r2)]);
        if (!(`UIntNative`(r1) <= `UIntNative`(r9))) {
            heapClassInst.heap32[(r2)] = Int32(r1);
        }
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        r0 = (r2 + (-1)) | 0;
        if (`UIntNative`(r0) < `UIntNative`(1073741823)) {
            r0 = (r2 + 7) | 0;
            r0 = r0 & (-8);
            r2 = 12;
            if (`UIntNative`(r0) < `UIntNative`(r2)) {
                r0 = r2
            }
        }
        else {
            r0 = 0;
        }
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r0);
        block_locate_free(i7);
        r2 = commonVariable.r_g0;
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
        r0 = s_current_memory;
        block_prepare_used(i7);
        r1 = commonVariable.r_g0;
        r2 = r2 >> 2;
        r0 = r0 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r3 = Int64(heapClassInst.heap32[(r0)]);
        r2 = r2 & (-4);
        r2 = (r3 + r2) | 0;
        r3 = s_max_memory;
        r3 = r3 >> 2;
        heapClassInst.heap32[(r0)] = Int32(r2);
        r0 = Int64(heapClassInst.heap32[(r3)]);
        if (!(`UIntNative`(r2) <= `UIntNative`(r0))) {
            heapClassInst.heap32[(r3)] = Int32(r2);
        }
        commonVariable.r_g0 = r1;
        return;
    }
}
    
func mandreel_writels(sp: Int64) : Unit {
}
    
func mandreel_openls(sp: Int64) : Unit
{
    var lsp = sp
    var ptr_name = Int64(heapClassInst.heap32[lsp >> 2])
    lsp += 4
    var key = get_string_from_ptr(ptr_name)
    var my_localStorage = mandreel_getlocalstorage()
    var value: ?String = my_localStorage.getOrThrow().getItem(key);
    if (value == Option<String>.None) {
        commonVariable.r_g0 = (-1);
        return;
    }

    var length = my_localStorage.getOrThrow().getItem(key + "_size");
    match(length){
        case Some(v) => ()
        case None => commonVariable.r_g0 = (-1); return;
    }
    dump("mandreel_openls " + key + " return " + length.getOrThrow());
    commonVariable.r_g0 = Int64.parse(length.getOrThrow());
}
    
func mandreel_readcloud(sp: Int64) : Unit
{
}
    
func mandreel_fopen(sp: Int64) : Unit
{
    var lsp = sp
    var ptr_name = heapClassInst.heap32[lsp >> 2];
    lsp += 4;
    var ptr_flags = heapClassInst.heap32[lsp >> 2];
    lsp += 4;
    var name = get_string_from_ptr(Int64(ptr_name));
    var flags = get_string_from_ptr(Int64(ptr_flags));
    name = name.toAsciiLower();
    var buffer: ?Int64 = if (mandreel_cache_files.contains(name)) {mandreel_cache_files[name]} else {Option<Int64>.None}
    if (buffer.isNone()) {
        commonVariable.r_g0 = 0;
        return;
    }
    unsafe{
        file_ids[current_file_id] = CreateFileId(malloc(UIntNative(buffer.getOrThrow())));
    }
    
    var old_id: Int64 = current_file_id;
    current_file_id += 1
    commonVariable.r_g0 = old_id;
}
    
func mandreel_readls(sp: Int64) : Unit
{
}
    
func mandreel_opencloud(param: Int64) : Unit {
}
    
func mandreel_writecloud(param: Int64) : Unit {
}
    
func llvm_writeDouble(addr: Int64, src: Float64) : Unit
{
    heapClassInst.heapFloat64[llvm_Float64_addr >> 3] = Float64(src);
    var val0 = heapClassInst.heap32[(llvm_Float64_addr) >> 2];
    var val1 = heapClassInst.heap32[(llvm_Float64_addr + 4) >> 2];
    heapClassInst.heap32[(addr) >> 2] = val0;
    heapClassInst.heap32[(addr + 4) >> 2] = val1;
}
    
func `UIntNative`(value: Int64) : Int64 {
    if (value >= 0) {
        return value;
    }
    return 4294967296 + value;
}
    
func tlsf_create(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r0 = (r0 + (-3048)) | 0;
    r1 = r0 & (-8);
    r2 = (r1 + (-12)) | 0;
    if (`UIntNative`(r2) < `UIntNative`(1073741813)) {
        r2 = Int64(heapClassInst.heap32[(fp)]);
        r3 = block_null;
        r4 = r3 >> 2;
        heapClassInst.heap32[(r4 + 2)] = Int32(r3);
        r5 = (-1);
        r6 = r2 >> 2;
        heapClassInst.heap32[(r4 + 3)] = Int32(r3);
        heapClassInst.heap32[(r6)] = 0;
        while (true) {
            r4 = r5 << 2;
            r7 = r5 << 7;
            r4 = (r2 - r4) | 0;
            r7 = (r2 - r7) | 0;
            r4 = r4 >> 2;
            r7 = r7 >> 2;
            heapClassInst.heap32[(r4)] = 0;
            heapClassInst.heap32[(r7 + (-8))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-7))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-6))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-5))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-4))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-3))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-2))] = Int32(r3);
            heapClassInst.heap32[(r7 + (-1))] = Int32(r3);
            heapClassInst.heap32[(r7)] = Int32(r3);
            heapClassInst.heap32[(r7 + 1)] = Int32(r3);
            heapClassInst.heap32[(r7 + 2)] = Int32(r3);
            heapClassInst.heap32[(r7 + 3)] = Int32(r3);
            heapClassInst.heap32[(r7 + 4)] = Int32(r3);
            heapClassInst.heap32[(r7 + 5)] = Int32(r3);
            heapClassInst.heap32[(r7 + 6)] = Int32(r3);
            heapClassInst.heap32[(r7 + 7)] = Int32(r3);
            heapClassInst.heap32[(r7 + 8)] = Int32(r3);
            heapClassInst.heap32[(r7 + 9)] = Int32(r3);
            heapClassInst.heap32[(r7 + 10)] = Int32(r3);
            heapClassInst.heap32[(r7 + 11)] = Int32(r3);
            heapClassInst.heap32[(r7 + 12)] = Int32(r3);
            heapClassInst.heap32[(r7 + 13)] = Int32(r3);
            heapClassInst.heap32[(r7 + 14)] = Int32(r3);
            heapClassInst.heap32[(r7 + 15)] = Int32(r3);
            heapClassInst.heap32[(r7 + 16)] = Int32(r3);
            heapClassInst.heap32[(r7 + 17)] = Int32(r3);
            heapClassInst.heap32[(r7 + 18)] = Int32(r3);
            heapClassInst.heap32[(r7 + 19)] = Int32(r3);
            heapClassInst.heap32[(r7 + 20)] = Int32(r3);
            heapClassInst.heap32[(r7 + 21)] = Int32(r3);
            r5 = (r5 + (-1)) | 0;
            heapClassInst.heap32[(r7 + 22)] = Int32(r3);
            heapClassInst.heap32[(r7 + 23)] = Int32(r3);
            if (!(r5 != (-24))) {
                break 
            }
        }
        r4 = r0 | 1;
        r5 = (r2 + 3036) | 0;
        r4 = r4 & (-7);
        heapClassInst.heap32[(r6 + 760)] = Int32(r4);
        if (`UIntNative`(r1) > `UIntNative`(255)) {
            r0 = r1 >> 1;
            r0 = r1 | r0;
            r4 = r0 >> 2;
            r0 = r0 | r4;
            r4 = r0 >> 4;
            r0 = r0 | r4;
            r4 = r0 >> 8;
            r0 = r0 | r4;
            r4 = r0 >> 16;
            r0 = r0 | r4;
            r4 = r0 ^ (-1);
            r7 = 1431655765;
            r4 = r4 >> 1;
            r0 = r7 & (!r0);
            r4 = r4 & 1431655765;
            r0 = (r0 + r4) | 0;
            r4 = r0 >> 2;
            r0 = r0 & 858993459;
            r4 = r4 & 858993459;
            r0 = (r0 + r4) | 0;
            r4 = r0 >> 4;
            r0 = r0 & 252645135;
            r4 = r4 & 252645135;
            r0 = (r0 + r4) | 0;
            r4 = r0 >> 8;
            r0 = r0 & 16711935;
            r4 = r4 & 16711935;
            r0 = (r0 + r4) | 0;
            r4 = r0 & 65535;
            r0 = r0 >> 16;
            r7 = 26;
            r0 = (r4 + r0) | 0;
            r4 = (r7 - r0) | 0;
            r1 = r1 >> r4;
            r4 = 24;
            r1 = r1 ^ 32;
            r0 = (r4 - r0) | 0;
        }
        else {
            r1 = r0 >> 3;
            r0 = 0;
        }
        r4 = r0 << 7;
        r4 = (r2 + r4) | 0;
        r7 = r1 << 2;
        r4 = (r4 + r7) | 0;
        r4 = r4 >> 2;
        r7 = Int64(heapClassInst.heap32[(r4 + 24)]);
        heapClassInst.heap32[(r6 + 761)] = Int32(r7);
        r7 = r7 >> 2;
        heapClassInst.heap32[(r6 + 762)] = Int32(r3);
        heapClassInst.heap32[(r7 + 3)] = Int32(r5);
        r3 = 1;
        heapClassInst.heap32[(r4 + 24)] = Int32(r5);
        r4 = r0 << 2;
        r0 = r3 << r0;
        r7 = Int64(heapClassInst.heap32[(r6)]);
        r4 = (r2 + r4) | 0;
        r0 = r7 | r0;
        r4 = r4 >> 2;
        heapClassInst.heap32[(r6)] = Int32(r0);
        r0 = r3 << r1;
        r1 = Int64(heapClassInst.heap32[(r4 + 1)]);
        r0 = r1 | r0;
        heapClassInst.heap32[(r4 + 1)] = Int32(r0);
        r0 = Int64(heapClassInst.heap32[(r6 + 760)]);
        r0 = (r0 + 3040) | 0;
        r0 = r0 & (-4);
        r0 = (r2 + r0) | 0;
        r0 = r0 >> 2;
        heapClassInst.heap32[(r0)] = Int32(r5);
        heapClassInst.heap32[(r0 + 1)] = 2;
        commonVariable.r_g0 = r2;
        return;
    }
    else {
        r0 = _E2_str643;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = 3060;
        heapClassInst.heap32[(g0 + 2)] = 1073744872;
        printf(i7);
        r0 = 0;
        commonVariable.r_g0 = r0;
        return;
    }
}
    
func printf(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16408);
    var g0 = i7 >> 2;
    r0 = (sp + 4) | 0;
    heapClassInst.heap32[(fp + (-4097))] = Int32(r0);
    r1 = sp + (-16384);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = 16384;
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    heapClassInst.heap32[(g0 + 3)] = Int32(r0);
    r0 = g_msgcallback;
    r0 = r0 >> 2;
    vsnprintf(i7);
    r0 = Int64(heapClassInst.heap32[(r0)]);
    if (!(r0 == 0)) {
        heapClassInst.heap32[(g0)] = Int32(r1);
        __sandbox_OutputDebugString(i7);
    }
    return;
}
    
func __sandbox_OutputDebugString(sp: Int64) : Unit
{
    puts(sp);
}
    
func puts(sp: Int64, addr!: String = "") : Unit
{
    var addr1: UInt32 = heapClassInst.heapU32[sp >> 2];
    var name = get_string_from_ptr(Int64(addr1));
    name += "\n";
    dump(name);
}
    
func get_string_from_ptr(ptr: Int64) : String
{
    var ret = "";
    if (ptr == 0) {
        return ret;
    }
    var i = 0;
    while (true) {
        if (heapClassInst.heapU8[ptr + i] == 0) {
            break;
        }
        
        let t = String.fromUtf8([UInt8(heapClassInst.heap8[ptr + i])])
        ret += t;
        i += 1;
    }
    return ret;
}
    
func strtol(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap8[r0]);
    r2 = r1 << 2;
    r3 = my_ctype;
    r2 = (r2 + r3) | 0;
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heapU8[r2 + 4]);
    r2 = r2 & 8;
    if (r2 == 0) {
        r2 = r0;
    }
    else {
        r2 = r0;
        while (true) {
            r1 = Int64(heapClassInst.heap8[r2 + 1]);
            r5 = r1 << 2;
            r5 = (r5 + r3) | 0;
            r2 = (r2 + 1) | 0;
            r5 = Int64(heapClassInst.heapU8[r5 + 4]);
            r5 = r5 & 8;
            if (r5 != 0) {
                continue 
            }
            else {
                break 
            }
        }
    }
    r1 = r1 & 255;
    if (r1 == 45) {
        r1 = Int64(heapClassInst.heap8[r2 + 1]);
        r1 = r1 << 2;
        r3 = (r1 + r3) | 0;
        r3 = Int64(heapClassInst.heapU16[(r3 + 4) >> 1]);
        r3 = r3 & 263;
        if (r3 == 0) {
            __label__ = 5;
        }
        else {
            r2 = (r2 + 1) | 0;
            r3 = (-1);
            __label__ = 8;
        }
    }
    else {
        __label__ = 5;
    }
    if (__label__ == 5) {
        r3 = 0;
    }
    heapClassInst.heap32[(g0)] = Int32(r2);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    strtoul(i7);
    r1 = commonVariable.r_g0;
    if (!(r4 == 0)) {
        r4 = r4 >> 2;
        r5 = Int64(heapClassInst.heap32[(r4)]);
        if (!(r5 != r2)) {
            heapClassInst.heap32[(r4)] = Int32(r0);
        }
    }
    if (r1 > (-1)) {
        r0 = 0;
        r0 = (r0 - r1) | 0;
        r0 = if (r3 == 0) {r1} else {r0};
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        _errno(i7);
        r0 = commonVariable.r_g0;
        if (!(r1 != (-2147483648))) {
            if (!(r3 == 0)) {
                r0 = r0 >> 2;
                heapClassInst.heap32[(r0)] = 0;
                commonVariable.r_g0 = r1;
                return;
            }
        }
        r1 = r0 >> 2;
        r0 = 2147483647;
        r2 = (-2147483648);
        heapClassInst.heap32[(r1)] = 34;
        r1 = if (r3 == 0)  {r0} else {r2};
        commonVariable.r_g0 = r1;
        return;
    }
}
    
func _errno(sp: Int64) : Unit
{
    commonVariable.r_g0 = llvm_errno;
}
    
func strtoul(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap8[r0]);
    r2 = r1 << 2;
    r3 = my_ctype;
    r2 = (r2 + r3) | 0;
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heapU8[r2 + 4]);
    r2 = r2 & 8;
    if (r2 == 0) {
        r2 = r0;
    }
    else {
        r2 = r0;
        while (true) {
            r1 = Int64(heapClassInst.heap8[r2 + 1]);
            r5 = r1 << 2;
            r5 = (r5 + r3) | 0;
            r2 = (r2 + 1) | 0;
            r5 = Int64(heapClassInst.heapU8[r5 + 4]);
            r5 = r5 & 8;
            if (r5 != 0) {
                continue 
            }
            else {
                break 
            }
        }
    }
    r1 = r1 & 255;
    if (r1 == 43) {
        r2 = (r2 + 1) | 0;
        r1 = 0;
    }
    else {
        if (r1 == 45) {
            r2 = (r2 + 1) | 0;
            r1 = 1;
        }
        else {
            r1 = 0;
        }
    }
    r3 = 0;
    r5 = r3;
    r6 = r3;
    r11 = (-1);
    while (true) {
        r8 = (r2 - r3) | 0;
        r7 = Int64(heapClassInst.heapU8[r8]);
        if (r7 == 0) {
            break 
        }
        else {
            if (`UIntNative`(r7) < `UIntNative`(65)) {
                r9 = r7 & 255;
                r10 = 58;
                r7 = (r7 + (-48)) | 0;
                r7 = if (`UIntNative`(r9) < `UIntNative`(r10)) {r7} else {r11};
                r7 = r7 & 255;
                if (`UIntNative`(r7) > `UIntNative`(9)) {
                    break 
                }
                else {
                    r8 = r6 & 255;
                    r8 = (r8 * 10) | 0;
                    r7 = (r7 + r8) | 0;
                    r6 = r6 >> 8;
                    r8 = r7 >> 8;
                    r6 = (r6 * 10) | 0;
                    r6 = (r8 + r6) | 0;
                    r8 = 16777215;
                    r9 = 1;
                    r10 = r6 << 8;
                    r7 = r7 & 255;
                    r5 = if (`UIntNative`(r6) > `UIntNative`(r8)) {r9} else {r5};
                    r6 = r10 | r7;
                    r3 = (r3 + (-1)) | 0;
                    continue 
                }
            }
            else {
                break 
            }
        }
    }
    if (r3 == 0) {
        _errno(i7);
        r6 = 0;
        r8 = commonVariable.r_g0 >> 2;
        heapClassInst.heap32[(r8)] = 22;
        r8 = r0;
    }
    if (!(r4 == 0)) {
        r0 = r4 >> 2;
        heapClassInst.heap32[(r0)] = Int32(r8);
    }
    if (r5 == 0) {
        r0 = 0;
        r0 = (r0 - r6) | 0;
        r0 = if (r1 == 0) {r6} else {r0};
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        _errno(i7);
        r1 = commonVariable.r_g0 >> 2;
        heapClassInst.heap32[(r1)] = 34;
        r1 = (-1);
        commonVariable.r_g0 = r1;
        return;
    }
}
    
func __v_printf(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var r21: Int64 = 0
    var r22: Int64 = 0
    var r23: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-184);
    var g0 = i7 >> 2;
    r0 = sp + (-136);
    r1 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    r0 = (r0 + 1) | 0;
    heapClassInst.heap32[(fp + (-1))] = Int32(r1);
    heapClassInst.heap32[(fp + (-2))] = 0;
    while (true) {
        r4 = Int64(heapClassInst.heapU8[r3]);
        if (r4 == 0) {
            __label__ = 197;
            break 
        }
        else {
            r1 = 0;
            r5 = r4;
            while (true) {
                r5 = r5 & 255;
                if (r5 == 0) {
                    break 
                }
                else {
                    if (r5 != 37) {
                        r5 = (r3 - r1) | 0;
                        r5 = Int64(heapClassInst.heapU8[r5 + 1]);
                        r1 = (r1 + (-1)) | 0;
                    }
                    else {
                        break 
                    }
                }
            }
            r5 = 0;
            if (r1 != 0) {
                r4 = (r5 - r1) | 0;
                if (r4 < 0) {
                    __label__ = 198;
                    break 
                }
                else {
                    r6 = Int64(heapClassInst.heap32[(fp + (-2))]);
                    r7 = (r6 - r1) | 0;
                    if (`UIntNative`(r7) < `UIntNative`(r6)) {
                        __label__ = 198;
                        break 
                    }
                    else {
                        r6 = (r3 - r1) | 0;
                        r7 = r2 >> 2;
                        r8 = Int64(heapClassInst.heap32[(r7 + 1)]);
                        r7 = Int64(heapClassInst.heap32[(r7)]);
                        heapClassInst.heap32[(g0)] = Int32(r3);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r7);
                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                        r4 = Int64(heapClassInst.heap32[(fp + (-2))]);
                        r4 = (r4 - r1) | 0;
                        r1 = (r3 - r1) | 0;
                        heapClassInst.heap32[(fp + (-2))] = Int32(r4);
                        r4 = Int64(heapClassInst.heapU8[r1]);
                        r3 = r6;
                    }
                }
            }
            r1 = r4 & 255;
            if (r1 != 37) {
                continue 
            }
            else {
                r3 = (r3 + 1) | 0;
                r1 = 32;
                r4 = r5;
                r6 = r5;
                r7 = r5;
                r8 = r5;
                r9 = r5;
                r10 = r5;
                r11 = r5;
                while (true) {
                    r12 = r4;
                    r13 = r3;
                    r14 = Int64(heapClassInst.heapU8[r13]);
                    r3 = (r13 + 1) | 0;
                    heapClassInst.heap8[sp + (-145)] = Int8(r14);
                    do {
                        if (r14 > 99) {
                            if (r14 > 110) {
                                if (r14 > 114) {
                                    if (r14 > 119) {
                                        if (r14 == 122) {
                                            __label__ = 50;
                                            break 
                                        }
                                        else {
                                            __label__ = 44;
                                            break 
                                        }
                                    }
                                    else {
                                        __label__ = 41;
                                        break 
                                    }
                                }
                                else {
                                    if (r14 == 111) {
                                        __label__ = 99;
                                        break 
                                    }
                                    else {
                                        if (r14 == 112) {
                                            __label__ = 91;
                                            break 
                                        }
                                        else {
                                            if (r14 == 113) {
                                                __label__ = 49;
                                                break 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                            }
                            else {
                                if (r14 > 104) {
                                    if (r14 == 105) {
                                        __label__ = 102;
                                        break 
                                    }
                                    else {
                                        if (r14 == 106) {
                                            __label__ = 49;
                                            break 
                                        }
                                        else {
                                            if (r14 == 108) {
                                                __label__ = 50;
                                                break 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                                else {
                                    if (r14 == 100) {
                                        __label__ = 102;
                                        break 
                                    }
                                    else {
                                        r4 = (r14 + (-102)) | 0;
                                        if (`UIntNative`(r4) < `UIntNative`(2)) {
                                            __label__ = 129;
                                            break 
                                        }
                                        else {
                                            if (r14 == 104) {
                                                __label__ = 48;
                                                break 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else {
                            if (r14 > 44) {
                                if (r14 > 75) {
                                    if (r14 > 97) {
                                        __label__ = 26;
                                        break 
                                    }
                                    else {
                                        if (r14 == 76) {
                                            __label__ = 49;
                                            break 
                                        }
                                        else {
                                            __label__ = 25;
                                            break 
                                        }
                                    }
                                }
                                else {
                                    r4 = 1;
                                    if (r14 == 45) {
                                        continue 
                                    }
                                    else {
                                        if (r14 == 46) {
                                            r4 = Int64(heapClassInst.heapU8[r3]);
                                            if (r4 != 42) {
                                                r4 = sp + (-144);
                                                heapClassInst.heap32[(g0)] = Int32(r3);
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                                                strtol(i7);
                                                r14 = 0;
                                                r11 = if (commonVariable.r_g0 < 0) {r14} else {commonVariable.r_g0};
                                                r3 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                            }
                                            else {
                                                r4 = sp + (-4);
                                                heapClassInst.heap32[(g0)] = Int32(r4);
                                                heapClassInst.heap32[(g0 + 1)] = 4;
                                                my_arg_test(i7);
                                                r4 = commonVariable.r_g0 >> 2;
                                                r4 = Int64(heapClassInst.heap32[(r4)]);
                                                r14 = 0;
                                                r11 = if (r4 < 0) {r14} else {r4};
                                                r3 = (r13 + 2) | 0;
                                            }
                                            r8 = 1;
                                            r4 = r12;
                                            if (`UIntNative`(r11) > `UIntNative`(10240)) {
                                                __label__ = 198;
                                                break 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                        else {
                                            r4 = (r14 + (-48)) | 0;
                                            if (`UIntNative`(r4) < `UIntNative`(10)) {
                                                r4 = r8 & 255;
                                                if (r4 != 0) {
                                                    __label__ = 198;
                                                    break 
                                                }
                                                else {
                                                    r4 = sp + (-144);
                                                    heapClassInst.heap32[(g0)] = Int32(r13);
                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                                                    strtoul(i7);
                                                    r10 = commonVariable.r_g0;
                                                    if (`UIntNative`(r10) > `UIntNative`(10240)) {
                                                        __label__ = 198;
                                                        break 
                                                    }
                                                    else {
                                                        r8 = 0;
                                                        r4 = r12 & 255;
                                                        r13 = Int64(heapClassInst.heapU8[sp + (-145)]);
                                                        r14 = 48;
                                                        r13 = if (r13 == r14) {1} else {0};
                                                        r4 = if (r4 == r8) {1} else {0};
                                                        r4 = r13 & r4;
                                                        r1 = if (r4 != 0) {r14} else {r1};
                                                        r3 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                                        r4 = r12;
                                                        continue 
                                                    }
                                                }
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                            }
                            else {
                                if (r14 > 36) {
                                    if (r14 == 37) {
                                        __label__ = 62;
                                        break 
                                    }
                                    else {
                                        if (r14 == 42) {
                                            r4 = sp + (-4);
                                            heapClassInst.heap32[(g0)] = Int32(r4);
                                            heapClassInst.heap32[(g0 + 1)] = 4;
                                            my_arg_test(i7);
                                            r4 = commonVariable.r_g0 >> 2;
                                            r4 = Int64(heapClassInst.heap32[(r4)]);
                                            r13 = r4 >> 31;
                                            r14 = (r4 + r13) | 0;
                                            r15 = 1;
                                            r10 = r14 ^ r13;
                                            r4 = if (r4 < 0) {r15} else {r12};
                                            if (`UIntNative`(r10) > `UIntNative`(10240)) {
                                                __label__ = 198;
                                                break 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                        else {
                                            if (r14 == 43) {
                                                r7 = 1;
                                                r4 = r12;
                                                continue 
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                                else {
                                    if (r14 == 0) {
                                        __label__ = 198;
                                        break 
                                    }
                                    else {
                                        if (r14 == 32) {
                                            r6 = 1;
                                            r4 = r12;
                                            continue 
                                        }
                                        else {
                                            if (r14 == 35) {
                                                r5 = 255;
                                                __label__ = 48;
                                            }
                                            else {
                                                continue 
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } while (false);
                    match (__label__) {
                        case 49=>
                            r9 = (r9 + 1) | 0;
                        case 48=>
                            r9 = (r9 + (-1)) | 0;
                            r4 = r12;
                            println("continue3268")
                            continue 
                        case _ =>
                            println("break3270")
                    }
                    r9 = (r9 + 1) | 0;
                    r4 = r12;
                }
                do {
                    match (__label__) {
                        case 26 =>
                            if (r14 == 98) {
                                r4 = 0;
                                r13 = 2;
                                r14 = r4;
                                r15 = r4;
                                __label__ = 104;
                                break 
                            }
                            else {
                                if (r14 == 99) {
                                    r1 = sp + (-4);
                                    heapClassInst.heap32[(g0)] = Int32(r1);
                                    heapClassInst.heap32[(g0 + 1)] = 4;
                                    my_arg_test(i7);
                                    r1 = commonVariable.r_g0 >> 2;
                                    r1 = Int64(heapClassInst.heap32[(r1)]);
                                    heapClassInst.heap8[sp + (-145)] = Int8(r1);
                                    __label__ = 62;
                                    break 
                                }
                                else {
                                    println("continue3300")
                                    continue 
                                }
                            }
                        case 25 =>
                            if (r14 == 88) {
                                __label__ = 92;
                                break 
                            }
                            else {
                                println("continue3310")
                                continue 
                            }
                        case 44 =>
                            if (r14 != 120) {
                                println("continue3315")
                                continue 
                            }
                            else {
                                r4 = 0;
                                __label__ = 93;
                                break 
                            }
                        case 41 =>
                            if (r14 == 115) {
                                r1 = sp + (-4);
                                heapClassInst.heap32[(g0)] = Int32(r1);
                                heapClassInst.heap32[(g0 + 1)] = 4;
                                my_arg_test(i7);
                                r1 = commonVariable.r_g0 >> 2;
                                r4 = _E2_str38684;
                                r1 = Int64(heapClassInst.heap32[(r1)]);
                                r1 = if (r1 == 0) {r4} else {r1};
                                heapClassInst.heap32[(fp + (-36))] = Int32(r1);
                                r4 = Int64(heapClassInst.heapU8[r1]);
                                do {
                                    if (r4 != 0) {
                                        r4 = (r1 + 1) | 0;
                                        r14 = 0;
                                        while (true) {
                                            r1 = (r14 + 1) | 0;
                                            r6 = Int64(heapClassInst.heapU8[r4 + r14]);
                                            r14 = r1;
                                            if (!(r6 != 0)) {
                                                break 
                                            }
                                        }
                                    }
                                    else {
                                        r1 = 0;
                                    }
                                } while (false);
                                r16 = 0;
                                r4 = r8 & 255;
                                if (r4 != r16){
                                    r4 = 1
                                }else{
                                    r4 = 0
                                }
                                if(`UIntNative`(r1) > `UIntNative`(r11) ){
                                    r14 = 1
                                }else{
                                    r14 = 0
                                }
                                r4 = r4 & r14;
                                r14 = 32;
                                if (r4 != 0){
                                    r4 = r11
                                }else{
                                    r4 = r1
                                }
                                r1 = r14;
                                r8 = r16;
                                r11 = r16;
                                __label__ = 69;
                                break 
                            }
                            else {
                                if (r14 == 117) {
                                    r4 = 0;
                                    r13 = 10;
                                    r14 = r4;
                                    r15 = r4;
                                    __label__ = 104;
                                    break 
                                }
                                else {
                                    println("continue3387")
                                    continue 
                                }
                            }
                        case 99 =>
                            r4 = r5 & 255;
                            if (r4 != 0) {
                                r5 = 1;
                                r4 = 0;
                                r13 = 8;
                                r14 = 48;
                                heapClassInst.heap8[sp + (-135)] = Int8(r14);
                                r14 = r4;
                                r15 = r5;
                                __label__ = 104;
                                break 
                            }
                            else {
                                r4 = 0;
                                r13 = 8;
                                r14 = r4;
                                r5 = r4;
                                r15 = r4;
                                __label__ = 104;
                                break 
                            }
                        case 91 =>
                            r14 = 120;
                            r5 = 2;
                            r9 = 1;
                            heapClassInst.heap8[sp + (-145)] = Int8(r14);
                            __label__ = 92;
                            break 
                        case 102 =>
                            r4 = 0;
                            r14 = 1;
                            r13 = 10;
                            r15 = r4;
                            __label__ = 104;
                            break 
                        case 129 =>
                            r4 = sp + (-4);
                            heapClassInst.heap32[(g0)] = Int32(r4);
                            heapClassInst.heap32[(g0 + 1)] = 8;
                            my_arg_test(i7);
                            f0 = llvm_readDouble((commonVariable.r_g0));
                            heapClassInst.heap32[(fp + (-36))] = Int32(r0);
                            r4 = 103;
                            if (r14 == r4){
                                r4 = 1
                            }else{
                                r4 = 0
                            }
                            r8 = r8 & 255;
                            r16 = 1;
                            r9 = 6;
                            if(r10 == 0){
                                r10 = r16
                            }
                            if (r8 == 0){
                                r11 = r9
                            }
                            r4 = r4 & 1;
                            f1 = 0.0;
                            r9 = r7 & 255;
                            r13 = 0;
                            llvm_writeDouble((i7), f0);
                            heapClassInst.heap32[(g0 + 2)] = Int32(r0);
                            heapClassInst.heap32[(g0 + 3)] = 127;
                            heapClassInst.heap32[(g0 + 4)] = Int32(r10);
                            heapClassInst.heap32[(g0 + 5)] = Int32(r11);
                            heapClassInst.heap32[(g0 + 6)] = Int32(r4);
                            if(r9!=r13){
                                r4 = 1
                            }else{
                                r4 = 0
                            }
                            r16 = if (f0 < f1) {1} else {0};
                            r4 = r4 | r16;
                            r16 = r4 & 1;
                            __dtostr(i7);
                            r4 = commonVariable.r_g0;
                            do {
                                if (r8 != 0) {
                                    r8 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                    r15 = r13;
                                    while (true) {
                                        r17 = Int64(heapClassInst.heapU8[r8 + r13]);
                                        if (r17 == 0) {
                                            __label__ = 151;
                                            break 
                                        }
                                        else {
                                            r18 = (r8 + r13) | 0;
                                            if (r17 == 46) {
                                                __label__ = 142;
                                                break 
                                            }
                                            else {
                                                r17 = Int64(heapClassInst.heapU8[r18 + 1]);
                                                if (r17 == 0) {
                                                    __label__ = 151;
                                                    break 
                                                }
                                                else {
                                                    r19 = r15 << 2;
                                                    if (r17 != 46) {
                                                        r17 = Int64(heapClassInst.heapU8[r18 + 2]);
                                                        if (r17 == 0) {
                                                            __label__ = 151;
                                                            break 
                                                        }
                                                        else {
                                                            if (r17 != 46) {
                                                                r17 = Int64(heapClassInst.heapU8[r18 + 3]);
                                                                if (r17 == 0) {
                                                                    __label__ = 151;
                                                                    break 
                                                                }
                                                                else {
                                                                    if (r17 == 46) {
                                                                        __label__ = 143;
                                                                        break 
                                                                    }
                                                                    else {
                                                                        r15 = (r15 + 1) | 0;
                                                                        r13 = (r13 + 4) | 0;
                                                                    }
                                                                }
                                                            }
                                                            else {
                                                                __label__ = 138;
                                                                break 
                                                            }
                                                        }
                                                    }
                                                    else {
                                                        __label__ = 135;
                                                        break 
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    do {
                                        match (__label__) {
                                            case 142  =>
                                                if (r18 == 0) {
                                                    __label__ = 151;
                                                    break 
                                                }
                                                else {
                                                    __label__ = 144;
                                                    break 
                                                }
                                            case 143 =>
                                                r18 = (r18 + 3) | 0;
                                                __label__ = 144;
                                                break 
                                            case 138 =>
                                                r4 = r19 | 2;
                                                r18 = (r8 + r4) | 0;
                                                __label__ = 144;
                                                break 
                                            case 135 =>
                                                r4 = r19 | 1;
                                                r18 = (r8 + r4) | 0;
                                                __label__ = 144;
                                            case _  =>
                                                println("break3556")
                                        }
                                    } while (false);
                                    match (__label__) {
                                        case 151 =>
                                            r5 = r5 & 255;
                                            if (r5 == 0) {
                                                break 
                                            }
                                            else {
                                                r5 = 46;
                                                heapClassInst.heap8[r8 + r4] = Int8(r5);
                                                r5 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                                r4 = (r4 + r5) | 0;
                                                r5 = 0;
                                                heapClassInst.heap8[r4 + 1] = Int8(r5);
                                            }
                                        case 144 =>
                                            if (r11 != 0) {
                                                __label__ = 146;
                                            }
                                            else {
                                                r4 = r5 & 255;
                                                if (r4 != 0) {
                                                    __label__ = 146;
                                                }
                                                else {
                                                    __label__ = 147;
                                                }
                                            }
                                            if (__label__ == 146) {
                                                r18 = (r18 + 1) | 0;
                                            }
                                            while (true) {
                                                r4 = r11;
                                                if (r4 != 0) {
                                                    r11 = (r4 + (-1)) | 0;
                                                    r5 = (r18 + 1) | 0;
                                                    r8 = Int64(heapClassInst.heapU8[r18 + 1]);
                                                    r18 = r5;
                                                    if (r8 != 0) {
                                                        __label__ = 147;
                                                    }
                                                    else {
                                                        __label__ = 149;
                                                        break 
                                                    }
                                                }
                                                else {
                                                    __label__ = 150;
                                                    break 
                                                }
                                            }
                                            if (__label__ == 149) {
                                                r18 = r5;
                                            }
                                            r5 = 0;
                                            heapClassInst.heap8[r18] = Int8(r5);
                                            r11 = r4;
                                        case _  =>
                                            println("break3616")
                                    }
                                }
                            } while (false);
                            do {
                                if (!(r14 != 103)) {
                                    r4 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                    r5 = 0;
                                    r8 = r5;
                                    while (true) {
                                        r14 = Int64(heapClassInst.heapU8[r4 + r5]);
                                        if (r14 == 0) {
                                            break 
                                        }
                                        else {
                                            r13 = (r4 + r5) | 0;
                                            if (r14 == 46) {
                                                __label__ = 166;
                                                break 
                                            }
                                            else {
                                                r14 = Int64(heapClassInst.heapU8[r13 + 1]);
                                                if (r14 == 0) {
                                                    break 
                                                }
                                                else {
                                                    r15 = r8 << 2;
                                                    if (r14 != 46) {
                                                        r14 = Int64(heapClassInst.heapU8[r13 + 2]);
                                                        if (r14 == 0) {
                                                            break 
                                                        }
                                                        else {
                                                            if (r14 != 46) {
                                                                r14 = Int64(heapClassInst.heapU8[r13 + 3]);
                                                                if (r14 == 0) {
                                                                    break 
                                                                }
                                                                else {
                                                                    if (r14 == 46) {
                                                                        __label__ = 167;
                                                                        break 
                                                                    }
                                                                    else {
                                                                        r8 = (r8 + 1) | 0;
                                                                        r5 = (r5 + 4) | 0;
                                                                    }
                                                                }
                                                            }
                                                            else {
                                                                __label__ = 162;
                                                                break 
                                                            }
                                                        }
                                                    }
                                                    else {
                                                        __label__ = 159;
                                                        break 
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    match (__label__) {
                                        case 166 =>
                                            if (r13 == 0) {
                                                break 
                                            }
                                        case 167 =>
                                            r13 = (r13 + 3) | 0;
                                        case 162 =>
                                            r5 = r15 | 2;
                                            r13 = (r4 + r5) | 0;
                                        case 159 =>
                                            r5 = r15 | 1;
                                            r13 = (r4 + r5) | 0;
                                        case _  =>
                                            println("break3693")
                                    }
                                    r4 = 0;
                                    r5 = r13;
                                    while (true) {
                                        r8 = Int64(heapClassInst.heapU8[r5]);
                                        if (r8 != 101) {
                                            if (r8 != 0) {
                                                r8 = r4 << 2;
                                                r14 = Int64(heapClassInst.heapU8[r5 + 1]);
                                                if (r14 != 101) {
                                                    if (r14 == 0) {
                                                        __label__ = 171;
                                                        break 
                                                    }
                                                    else {
                                                        r14 = Int64(heapClassInst.heapU8[r5 + 2]);
                                                        if (r14 != 101) {
                                                            if (r14 == 0) {
                                                                __label__ = 171;
                                                                break 
                                                            }
                                                            else {
                                                                r14 = Int64(heapClassInst.heapU8[r5 + 3]);
                                                                if (r14 != 101) {
                                                                    if (r14 == 0) {
                                                                        __label__ = 171;
                                                                        break 
                                                                    }
                                                                    else {
                                                                        r4 = (r4 + 1) | 0;
                                                                        r5 = (r5 + 4) | 0;
                                                                    }
                                                                }
                                                                else {
                                                                    __label__ = 179;
                                                                    break 
                                                                }
                                                            }
                                                        }
                                                        else {
                                                            __label__ = 176;
                                                            break 
                                                        }
                                                    }
                                                }
                                                else {
                                                    __label__ = 173;
                                                    break 
                                                }
                                            }
                                            else {
                                                __label__ = 171;
                                                break 
                                            }
                                        }
                                        else {
                                            __label__ = 182;
                                            break 
                                        }
                                    }
                                    match (__label__) {
                                        case 171  =>
                                            r5 = 0;
                                        case 179  =>
                                            r4 = r8 | 3;
                                            r5 = (r13 + r4) | 0;
                                        case 176 =>
                                            r4 = r8 | 2;
                                            r5 = (r13 + r4) | 0;
                                        case 173  =>
                                            r4 = r8 | 1;
                                            r5 = (r13 + r4) | 0;
                                        case _ =>
                                            println("break")
                                    }
                                    while (true) {
                                        r4 = (r13 + 1) | 0;
                                        r8 = Int64(heapClassInst.heapU8[r13 + 1]);
                                        r13 = r4;
                                        if (!(r8 != 0)) {
                                            break 
                                        }
                                    }
                                    r4 = if (r5 == 0) {r4} else {r5};
                                    while (true) {
                                        r8 = Int64(heapClassInst.heapU8[r4 + (-1)]);
                                        r4 = (r4 + (-1)) | 0;
                                        if (!(r8 == 48)) {
                                            break 
                                        }
                                    }
                                    r14 = (r4 + 1) | 0;
                                    r4 = if (r8 == 46) {r4} else {r14};
                                    r8 = 0;
                                    heapClassInst.heap8[r4] = Int8(r8);
                                    if (!(r5 == 0)) {
                                        heapClassInst.heap32[(g0)] = Int32(r4);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r5);
                                        strcpy(i7);
                                    }
                                }
                            } while (false)
                            r4 = r7 | r6;
                            r4 = r4 & 255;
                            if (!(r4 == 0)) {
                                if (!(f0 < f1)) {
                                    r4 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                    r5 = (r4 + (-1)) | 0;
                                    r8 = 32;
                                    r14 = 43;
                                    r8 = if (r9 == 0) {r8} else {r14};
                                    heapClassInst.heap32[(fp + (-36))] = Int32(r5);
                                    heapClassInst.heap8[r4 + (-1)] = Int8(r8);
                                }
                            }
                            r4 = Int64(heapClassInst.heap32[(fp + (-36))]);
                            r5 = Int64(heapClassInst.heapU8[r4]);
                            do {
                                if (r5 != 0) {
                                    r5 = (r4 + 1) | 0;
                                    r8 = 0;
                                    while (true) {
                                        r4 = (r8 + 1) | 0;
                                        r14 = Int64(heapClassInst.heapU8[r5 + r8]);
                                        r8 = r4;
                                        if (!(r14 != 0)) {
                                            break 
                                        }
                                    }
                                }
                                else {
                                    r4 = 0;
                                }
                            } while (false);
                            r10 = if (`UIntNative`(r10) < `UIntNative`(r4)) {r4} else {r10};
                            r14 = 48;
                            r5 = 0;
                            r8 = r5;
                            __label__ = 69;
                        case _ =>
                            println("break3834")
                    }
                } while (false);
                match (__label__) {
                    case 62 =>
                        r1 = Int64(heapClassInst.heap32[(fp + (-2))]);
                        if (r1 == (-1)) {
                            __label__ = 198;
                            break 
                        }
                        else {
                            r1 = r2 >> 2;
                            r4 = Int64(heapClassInst.heap32[(r1 + 1)]);
                            r1 = Int64(heapClassInst.heap32[(r1)]);
                            r5 = sp + (-145);
                            heapClassInst.heap32[(g0)] = Int32(r5);
                            heapClassInst.heap32[(g0 + 1)] = 1;
                            heapClassInst.heap32[(g0 + 2)] = Int32(r1);
                            __FUNCTION_TABLE__[(r4) >> 2](i7);
                            r1 = Int64(heapClassInst.heap32[(fp + (-2))]);
                            r1 = (r1 + 1) | 0;
                            heapClassInst.heap32[(fp + (-2))] = Int32(r1);
                            println("continue3856")
                            continue 
                        }
                    case 92 =>
                        r4 = r14 & 255;
                        r13 = 88;
                        r4 = if (r4 == r13) {1}  else {0};
                        r4 = r4 & 1;
                        __label__ = 93;
                    case _ =>
                        println("break")
                }
                if (__label__ == 93) {
                    r5 = r5 & 255;
                    if (r5 != 0) {
                        r13 = 48;
                        r5 = 2;
                        heapClassInst.heap8[sp + (-135)] = Int8(r13);
                        heapClassInst.heap8[sp + (-134)] = Int8(r14);
                        r15 = r5;
                    }
                    else {
                        r5 = 0;
                        r15 = r5;
                    }
                    if (`UIntNative`(r11) > `UIntNative`(r10)) {
                        r14 = 0;
                        r13 = 16;
                        r10 = r11;
                        __label__ = 104;
                    }
                    else {
                        r14 = 0;
                        r13 = 16;
                        __label__ = 104;
                    }
                }
                do {
                    if (__label__ == 104) {
                        heapClassInst.heap32[(fp + (-36))] = Int32(r0)
                        r16 = sp + (-4)
                        heapClassInst.heap32[(g0)] = Int32(r16)
                        heapClassInst.heap32[(g0 + 1)] = 4
                        my_arg_test(i7)
                        r17 = commonVariable.r_g0 >> 2
                        r18 = r14 & 255
                        r16 = 0
                        r17 = Int64(heapClassInst.heap32[(r17)])
                        if(r18 != r16){
                            r18 = 1
                        }else{
                            r18 = 0
                        }
                        if(r17 < r16){
                            r19 = 1
                        }else{
                            r19 = 0
                        }
                        r20 = (r16 - r17) | 0;
                        r18 = r18 & r19;
                        r9 = r9 << 24;
                        if(r18 != 0){
                            r17 = r20
                        }
                        r9 = r9 >> 24;
                        r19 = r17 & 65535;
                        if(r9 < 0){
                            r17 = r19
                        }
                        r19 = Int64(heapClassInst.heap32[(fp + (-36))]);
                        r20 = r17 & 255;
                        r21 = 2;
                        if(r9 < -1){
                            r9 = r20
                        }else{
                            r9 = r17
                        }
                        if(r18 != 0){
                            r17 = r21
                        }else{
                            r17 = r14
                        }
                        r14 = (r19 + r15) | 0
                        heapClassInst.heap8[r14 + 122] = Int8(r16);
                        if (r9 != 0) {
                            r18 = (r13 + (-1)) | 0;
                            r19 = 35;
                            r20 = 10;
                            if(`UIntNative`(r18) > `UIntNative`(r19)){
                                r18 = r20
                            }else{
                                r18 = r13
                            }
                            r4 = r4 & 255
                            r13 = 39;
                            r19 = 7;
                            r4 = if (r4 == 0) {r13} else {r19};
                            r19 = (r15 + 121) | 0;
                            r20 = (-122);
                            while (true) {
                                r13 = Int64(floor(Float64(`UIntNative`(r9) % `UIntNative`(r18))));
                                r13 = (r13 + 48) | 0;
                                r22 = r13 & 255;
                                r23 = 57;
                                r22 = if (`UIntNative`(r22) > `UIntNative`(r23)) {r4} else {r16};
                                r23 = (r20 + 1) | 0;
                                r13 = (r13 + r22) | 0;
                                r20 = (r14 - r20) | 0;
                                heapClassInst.heap8[r20 + (-1)] = Int8(r13);
                                if (r19 <= r15) {
                                    break 
                                }
                                else {
                                    r9 = Int64(floor(Float64(`UIntNative`(r9) / `UIntNative`(r18))));
                                    r19 = (r19 + (-1)) | 0;
                                    r20 = r23;
                                    if (!(r9 != 0)) {
                                        break 
                                    }
                                }
                            }
                            r18 = (r23 + 122) | 0;
                            r9 = (r14 - r23) | 0;
                        }
                        else {
                            r4 = (r15 + r19) | 0;
                            r13 = 48;
                            r9 = (r4 + 121) | 0;
                            r18 = 1;
                            heapClassInst.heap8[r4 + 121] = Int8(r13);
                        }
                        do {
                            if (!(r9 == r14)) {
                                if (`UIntNative`(r9) <= `UIntNative`(r14)) {
                                    if (!(r18 == (-1))) {
                                        r4 = (r16 - r18) | 0;
                                        while (true) {
                                            r13 = r4;
                                            r19 = (r9 - r13) | 0;
                                            r4 = (r13 + 1) | 0;
                                            r20 = (r14 - r13) | 0;
                                            r19 = Int64(heapClassInst.heapU8[r19]);
                                            heapClassInst.heap8[r20] = Int8(r19);
                                            if (!(r13 != 0)) {
                                                break 
                                            }
                                        }
                                    }
                                }
                                else {
                                    if (!(r18 == (-1))) {
                                        r4 = (r9 + 1) | 0;
                                        r9 = r18;
                                        while (true) {
                                            heapClassInst.heap8[r14] = Int8(r13);
                                            if (r9 == 0) {
                                                break 
                                            }
                                            else {
                                                r13 = Int64(heapClassInst.heapU8[r4]);
                                                r4 = (r4 + 1) | 0;
                                                r9 = (r9 + (-1)) | 0;
                                                r14 = (r14 + 1) | 0;
                                            }
                                        }
                                    }
                                }
                            }
                        } while (false);
                        r4 = 1;
                        if(r18 != r4){ 
                            r4 = 1
                        }else{
                            r4 = 0
                        }
                        r4 = r4 & 1
                        r14 = r8 ^ 1
                        r4 = r4 | r14
                        r4 = r4 & 255
                        if (r4 != 0) {
                            __label__ = 122;
                        }
                        else {
                            r4 = Int64(heapClassInst.heap32[(fp + (-36))]);
                            r4 = Int64(heapClassInst.heapU8[r4 + r15]);
                            if (r4 != 48) {
                                __label__ = 122;
                            }
                            else {
                                r4 = r5 << 24;
                                r5 = 0;
                                r4 = r4 >> 24;
                                r14 = if (r11 == r5) {1}  else {0};
                                r4 = if (r4 > r5) {1}  else {0};
                                r4 = r14 | r4;
                                r4 = if (r4 != 0) {r5} else {r15};
                                __label__ = 123;
                            }
                        }
                        if (__label__ == 122) {
                            r4 = (r18 + r15) | 0;
                        }
                        r14 = r17 & 255;
                        if (r14 == 2) {
                            r6 = Int64(heapClassInst.heap32[(fp + (-36))])
                            r7 = (r6 + (-1)) | 0
                            r4 = (r4 + 1) | 0
                            r14 = 48
                            r16 = 45
                            heapClassInst.heap32[(fp + (-36))] = Int32(r7)
                            heapClassInst.heap8[r6 + (-1)] = Int8(r16)
                            r16 = r21;
                        }
                        else {
                            if (r14 != 0) {
                                r14 = r7 | r6;
                                r14 = r14 & 255;
                                if (!(r14 == 0)) {
                                    r6 = Int64(heapClassInst.heap32[(fp + (-36))])
                                    r16 = (r6 + (-1)) | 0
                                    r7 = r7 & 255;
                                    r9 = 32;
                                    r13 = 43;
                                    r4 = (r4 + 1) | 0
                                    r14 = 48
                                    if(r7 == 0){
                                        r7 = r9
                                    }else{
                                        r7 = r13
                                    }
                                    heapClassInst.heap32[(fp + (-36))] = Int32(r16);
                                    heapClassInst.heap8[r6 + (-1)] = Int8(r7);
                                    r16 = r17;
                                    break 
                                }
                            }
                            r14 = 48;
                        }
                    }
                } while (false);
                r6 = Int64(heapClassInst.heap32[(fp + (-36))]);
                r7 = r11 | r10;
                if (r7 != 0) {
                    r7 = 0;
                    r5 = r5 << 24;
                    r5 = r5 >> 24;
                    if (r5 < 1) {
                        r9 = r16 & 255;
                        if(r9 != r7){
                            r5 = 1
                        }else{
                            r5 = 0
                        }
                        r5 = r5 & 1;
                        if (r9 != 0) {
                            __label__ = 75;
                        }
                        else {
                            __label__ = 76;
                        }
                    }
                    else {
                        __label__ = 75;
                    }
                    if (__label__ == 75) {
                        r4 = (r4 - r5) | 0;
                        r10 = (r10 - r5) | 0;
                        r9 = (r6 + r5) | 0;
                        heapClassInst.heap32[(fp + (-36))] = Int32(r9);
                    }
                    r8 = r8 & 255;
                    r9 = if (r8 != r7) {1}  else {0};
                    r7 = if (r10 == r7) {1}  else {0};
                    r7 = r9 & r7;
                    r7 = if (r7 != 0) {r11} else {r10};
                    r8 = if (r8 == 0) {r4} else {r11};
                    r9 = r12 & 255;
                    if (!(r9 != 0)) {
                        r10 = r1 & 255;
                        if (!(r10 != 32)) {
                            r11 = sp + (-8);
                            r12 = (r7 - r8) | 0;
                            heapClassInst.heap32[(g0)] = Int32(r11);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                            heapClassInst.heap32[(g0 + 2)] = Int32(r12);
                            heapClassInst.heap32[(g0 + 3)] = Int32(r10);
                            write_pad(i7);
                            r10 = commonVariable.r_g0;
                            if (r10 != 0) {
                                __label__ = 198;
                                break 
                            }
                        }
                    }
                    if (!(r5 == 0)) {
                        if (r5 < 0) {
                            __label__ = 198;
                            break 
                        }
                        else {
                            r10 = Int64(heapClassInst.heap32[(fp + (-2))]);
                            r11 = (r10 + r5) | 0;
                            if (`UIntNative`(r11) < `UIntNative`(r10)) {
                                __label__ = 198;
                                break 
                            }
                            else {
                                r10 = r2 >> 2;
                                r11 = Int64(heapClassInst.heap32[(r10 + 1)]);
                                r10 = Int64(heapClassInst.heap32[(r10)]);
                                heapClassInst.heap32[(g0)] = Int32(r6);
                                heapClassInst.heap32[(g0 + 1)] = Int32(r5);
                                heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                                __FUNCTION_TABLE__[(r11) >> 2](i7);
                                r6 = Int64(heapClassInst.heap32[(fp + (-2))]);
                                r5 = (r6 + r5) | 0;
                                heapClassInst.heap32[(fp + (-2))] = Int32(r5);
                            }
                        }
                    }
                    if (!(r9 != 0)) {
                        r5 = r1 & 255;
                        if (!(r5 == 32)) {
                            r6 = sp + (-8);
                            r10 = (r7 - r8) | 0;
                            heapClassInst.heap32[(g0)] = Int32(r6);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                            heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                            heapClassInst.heap32[(g0 + 3)] = Int32(r5);
                            write_pad(i7);
                            r5 = commonVariable.r_g0;
                            if (r5 != 0) {
                                __label__ = 198;
                                break 
                            }
                        }
                    }
                    r5 = sp + (-8);
                    r6 = (r8 - r4) | 0;
                    heapClassInst.heap32[(g0)] = Int32(r5);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
                    heapClassInst.heap32[(g0 + 3)] = Int32(r14);
                    write_pad(i7);
                    r14 = commonVariable.r_g0;
                    if (r14 != 0) {
                        __label__ = 198;
                        break 
                    }
                    else {
                        if (r4 < 0) {
                            __label__ = 198;
                            break 
                        }
                        else {
                            r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                            r6 = (r14 + r4) | 0;
                            if (`UIntNative`(r6) < `UIntNative`(r14)) {
                                __label__ = 198;
                                break 
                            }
                            else {
                                r14 = r2 >> 2;
                                r6 = Int64(heapClassInst.heap32[(r14 + 1)]);
                                r14 = Int64(heapClassInst.heap32[(r14)]);
                                r10 = Int64(heapClassInst.heap32[(fp + (-36))]);
                                heapClassInst.heap32[(g0)] = Int32(r10);
                                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                                heapClassInst.heap32[(g0 + 2)] = Int32(r14);
                                __FUNCTION_TABLE__[(r6) >> 2](i7);
                                r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                                r4 = (r14 + r4) | 0;
                                heapClassInst.heap32[(fp + (-2))] = Int32(r4);
                                if (r9 == 0) {
                                    continue 
                                }
                                else {
                                    r4 = (r7 - r8) | 0;
                                    r14 = r1 & 255;
                                    heapClassInst.heap32[(g0)] = Int32(r5);
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                                    heapClassInst.heap32[(g0 + 3)] = Int32(r14);
                                    write_pad(i7);
                                    r4 = commonVariable.r_g0;
                                    if (r4 == 0) {
                                        continue 
                                    }
                                    else {
                                        __label__ = 198;
                                        break 
                                    }
                                }
                            }
                        }
                    }
                }
                else {
                    if (r4 < 0) {
                        __label__ = 198;
                        break 
                    }
                    else {
                        r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                        r1 = (r14 + r4) | 0;
                        if (`UIntNative`(r1) < `UIntNative`(r14)) {
                            __label__ = 198;
                            break 
                        }
                        else {
                            r14 = r2 >> 2;
                            r1 = Int64(heapClassInst.heap32[(r14 + 1)]);
                            r14 = Int64(heapClassInst.heap32[(r14)]);
                            heapClassInst.heap32[(g0)] = Int32(r6);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                            heapClassInst.heap32[(g0 + 2)] = Int32(r14);
                            __FUNCTION_TABLE__[(r1) >> 2](i7);
                            r14 = Int64(heapClassInst.heap32[(fp + (-2))]);
                            r4 = (r14 + r4) | 0;
                            heapClassInst.heap32[(fp + (-2))] = Int32(r4);
                            continue 
                        }
                    }
                }
            }
        }
    }
    match (__label__) {
        case 197=>
            r0 = Int64(heapClassInst.heap32[(fp + (-2))]);
            commonVariable.r_g0 = r0;
            return;
        case 198 =>
            r0 = (-1);
            commonVariable.r_g0 = r0;
            return;
        case _ =>
            println("break")
    }
}
    
func write_pad(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    if (r0 > 0) {
        r1 = Int64(heapClassInst.heap32[(fp)]);
        r1 = r1 >> 2;
        r2 = Int64(heapClassInst.heap32[(r1)]);
        r2 = (r2 + r0) | 0;
        if (`UIntNative`(r2) >= `UIntNative`(r0)) {
            r2 = Int64(heapClassInst.heap32[(fp + 1)]);
            r3 = Int64(heapClassInst.heap32[(fp + 3)]);
            if (`UIntNative`(r0) > `UIntNative`(15)) {
                r4 = 48;
                r4 = if (r3 == r4) {1}  else {0};
                r4 = r4 & 1;
                r5 = _ZL8pad_line;
                r4 = r4 << 5;
                r4 = (r5 + r4) | 0;
                r5 = 0;
                while (true) {
                    r6 = r2 >> 2;
                    r7 = Int64(heapClassInst.heap32[(r6 + 1)]);
                    r6 = Int64(heapClassInst.heap32[(r6)]);
                    heapClassInst.heap32[(g0)] = Int32(r4);
                    heapClassInst.heap32[(g0 + 1)] = 16;
                    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
                    r5 = (r5 + (-16)) | 0;
                    __FUNCTION_TABLE__[(r7) >> 2](i7);
                    r6 = (r0 + r5) | 0;
                    if (!(`UIntNative`(r6) > `UIntNative`(15))) {
                        break 
                    }
                }
                r0 = 0;
                r4 = (r0 - r5) | 0
                if (r6 == 0) {
                    __label__ = 11
                }
                else {
                    r0 = r6
                    __label__ = 10
                }
            }
            else {
                r4 = 0;
                __label__ = 10;
            }
            if (__label__ == 10) {
                r5 = 48;
                r2 = r2 >> 2;
                r3 = if (r3 == r5) {1}  else {0};
                r3 = r3 & 1;
                r5 = Int64(heapClassInst.heap32[(r2 + 1)]);
                r2 = Int64(heapClassInst.heap32[(r2)]);
                r6 = _ZL8pad_line;
                r3 = r3 << 5;
                r3 = (r6 + r3) | 0;
                heapClassInst.heap32[(g0)] = Int32(r3);
                heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                heapClassInst.heap32[(g0 + 2)] = Int32(r2);
                r4 = (r4 + r0) | 0;
                __FUNCTION_TABLE__[(r5) >> 2](i7);
            }
            r0 = Int64(heapClassInst.heap32[(r1)]);
            r0 = (r0 + r4) | 0;
            heapClassInst.heap32[(r1)] = Int32(r0);
            r0 = 0;
        }
        else {
            r0 = (-1);
        }
    }
    else {
        r0 = 0;
    }
    commonVariable.r_g0 = r0;
    return;
}
    
func memcpy(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = r1 ^ r0;
    r3 = r3 & 3;
    do {
        if (r3 != 0) {
            __label__ = 2;
        }
        else {
            if (`UIntNative`(r2) > `UIntNative`(4)) {
                r3 = r0 & 3;
                if (r3 != 0) {
                    r3 = (r3 + (-5)) | 0;
                    r4 = r2 ^ (-1);
                    r3 = if (`UIntNative`(r3) < `UIntNative`(r4)) {r4} else {r3};
                    r4 = (r3 + r2) | 0;
                    r3 = r3 ^ (-1);
                    r4 = (r4 + 1) | 0;
                    r6 = (r1 + r3) | 0;
                    r5 = (r0 + r3) | 0;
                    r3 = r0 | (-4);
                    r7 = r0;
                    while (true) {
                        if (r3 == 0) {
                            break 
                        }
                        else {
                            if (r2 == 0) {
                                __label__ = 19;
                                break 
                            }
                            else {
                                r8 = Int64(heapClassInst.heapU8[r1]);
                                r2 = (r2 + (-1)) | 0;
                                r3 = (r3 + 1) | 0;
                                r1 = (r1 + 1) | 0;
                                r9 = (r7 + 1) | 0;
                                heapClassInst.heap8[r7] = Int8(r8);
                                r7 = r9;
                            }
                        }
                    }
                    if (r4 == (-1)) {
                        __label__ = 19;
                        break 
                    }
                    else {
                        r2 = r4;
                        r1 = r6;
                    }
                }
                else {
                    r5 = r0;
                }
                if (`UIntNative`(r2) > `UIntNative`(3)) {
                    r6 = r5;
                    r4 = r1;
                    while (true) {
                        r7 = r4 >> 2;
                        r2 = (r2 + (-4)) | 0;
                        r4 = (r4 + 4) | 0;
                        r3 = (r6 + 4) | 0;
                        r6 = r6 >> 2;
                        r7 = Int64(heapClassInst.heap32[(r7)]);
                        heapClassInst.heap32[(r6)] = Int32(r7);
                        r6 = r3;
                        if (`UIntNative`(r2) > `UIntNative`(3)) {
                            continue 
                        }
                        else {
                            __label__ = 15;
                            break 
                        }
                    }
                }
                else {
                    r4 = r1;
                    r3 = r5;
                    __label__ = 15;
                }
            }
            else {
                __label__ = 2;
            }
        }
    } while (false);
    if (__label__ == 2) {
        r3 = 0;
        r4 = r3;
        r5 = r0;
        __label__ = 15;
    }
    do {
        if (__label__ == 15) {
            if (!(r2 == 0)) {
                if (r3 != 0) {
                    r1 = r4;
                    r5 = r3;
                }
                while (true) {
                    r3 = Int64(heapClassInst.heapU8[r1]);
                    r2 = (r2 + (-1)) | 0;
                    r4 = (r5 + 1) | 0;
                    r1 = (r1 + 1) | 0;
                    heapClassInst.heap8[r5] = Int8(r3);
                    r5 = r4;
                    if (r2 != 0) {
                        continue 
                    }
                    else {
                        break 
                    }
                }
            }
        }
    } while (false);
    commonVariable.r_g0 = r0;
    return;
}
    
func vsnprintf(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-40);
    var g0 = i7 >> 2;
    r0 = sp + (-16);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(fp)]);
    heapClassInst.heap32[(r2 + 1)] = 0;
    r4 = (r1 + (-1)) | 0;
    r5 = 0;
    r6 = sp + (-24);
    r7 = if (r1 == 0) {r5} else {r4};
    heapClassInst.heap32[(fp + (-4))] = Int32(r3);
    r8 = r6 >> 2;
    r9 = swrite_Index.swrite__index__;
    heapClassInst.heap32[(r2 + 2)] = Int32(r7);
    heapClassInst.heap32[(r8 + 1)] = Int32(r9);
    heapClassInst.heap32[(fp + (-6))] = Int32(r0);
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = Int64(heapClassInst.heap32[(fp + 3)]);
    heapClassInst.heap32[(g0)] = Int32(r6);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    heapClassInst.heap32[(g0 + 2)] = Int32(r2);
    __v_printf(i7);
    r0 = commonVariable.r_g0;
    if (!(r3 == 0)) {
        if (!(r1 == 0)) {
            if (!(r0 < 0)) {
                if (!(r1 == (-1))) {
                    if (!(`UIntNative`(r0) < `UIntNative`(r1))) {
                        heapClassInst.heap8[r3 + r4] = Int8(r5);
                        commonVariable.r_g0 = r0;
                        return;
                    }
                }
                heapClassInst.heap8[r3 + r0] = Int8(r5);
            }
        }
    }
    commonVariable.r_g0 = r0;
    return;
}
    
func alert(message: String) : Unit{
}
    
func tlsf_malloc(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = (r0 + (-1)) | 0;
    if (`UIntNative`(r2) < `UIntNative`(1073741823)) {
        r0 = (r0 + 7) | 0;
        r0 = r0 & (-8);
        r2 = 12;
        r0 = if (`UIntNative`(r0) < `UIntNative`(r2)) {r2} else {r0};
    }
    else {
        r0 = 0;
    }
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
    block_locate_free(i7);
    r2 = commonVariable.r_g0;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = Int32(r0);
    r0 = s_current_memory;
    block_prepare_used(i7);
    r1 = commonVariable.r_g0;
    r2 = r2 >> 2;
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
    r3 = Int64(heapClassInst.heap32[(r0)]);
    r2 = r2 & (-4);
    r2 = (r3 + r2) | 0;
    r3 = s_max_memory;
    r3 = r3 >> 2;
    heapClassInst.heap32[(r0)] = Int32(r2);
    r0 = Int64(heapClassInst.heap32[(r3)]);
    if (!(`UIntNative`(r2) <= `UIntNative`(r0))) {
        heapClassInst.heap32[(r3)] = Int32(r2);
    }
    commonVariable.r_g0 = r1;
    return;
}
    
func block_locate_free(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    do {
        if (!(r0 == 0)) {
            r1 = Int64(heapClassInst.heap32[(fp)]);
            if (`UIntNative`(r0) > `UIntNative`(31)) {
                r2 = r0 >> 1;
                r2 = r0 | r2;
                r3 = r2 >> 2;
                r2 = r2 | r3;
                r3 = r2 >> 4;
                r2 = r2 | r3;
                r3 = r2 >> 8;
                r2 = r2 | r3;
                r3 = r2 >> 16;
                r2 = r2 | r3;
                r3 = r2 ^ (-1);
                r4 = 1431655765;
                r3 = r3 >> 1;
                r2 = r4 & (!r2);
                r3 = r3 & 1431655765;
                r2 = (r2 + r3) | 0;
                r3 = r2 >> 2;
                r2 = r2 & 858993459;
                r3 = r3 & 858993459;
                r2 = (r2 + r3) | 0;
                r3 = r2 >> 4;
                r2 = r2 & 252645135;
                r3 = r3 & 252645135;
                r2 = (r2 + r3) | 0;
                r3 = r2 >> 8;
                r2 = r2 & 16711935;
                r3 = r3 & 16711935;
                r2 = (r2 + r3) | 0;
                r3 = r2 & 65535;
                r2 = r2 >> 16;
                r5 = 26
                r2 = (r3 + r2) | 0;
                r3 = 1
                r2 = (r5 - r2) | 0;
                r2 = r3 << r2
                r0 = (r0 + r2) | 0;
                r0 = (r0 + (-1)) | 0;
                if (`UIntNative`(r0) > `UIntNative`(255)) {
                    r2 = r0 >> 1;
                    r2 = r0 | r2;
                    r3 = r2 >> 2;
                    r2 = r2 | r3;
                    r3 = r2 >> 4;
                    r2 = r2 | r3;
                    r3 = r2 >> 8;
                    r2 = r2 | r3;
                    r3 = r2 >> 16;
                    r2 = r2 | r3;
                    r3 = r2 ^ (-1);
                    r3 = r3 >> 1;
                    r4 = r4 & (!r2);
                    r2 = r3 & 1431655765;
                    r4 = (r4 + r2) | 0;
                    r2 = r4 >> 2;
                    r4 = r4 & 858993459;
                    r2 = r2 & 858993459;
                    r4 = (r4 + r2) | 0;
                    r2 = r4 >> 4;
                    r4 = r4 & 252645135;
                    r2 = r2 & 252645135;
                    r4 = (r4 + r2) | 0;
                    r2 = r4 >> 8;
                    r4 = r4 & 16711935;
                    r2 = r2 & 16711935;
                    r4 = (r4 + r2) | 0;
                    r2 = r4 & 65535;
                    r4 = r4 >> 16;
                    r4 = (r2 + r4) | 0;
                    r2 = (r5 - r4) | 0;
                    r0 = r0 >> r2;
                    r2 = 24;
                    r0 = r0 ^ 32;
                    r4 = (r2 - r4) | 0;
                    __label__ = 5;
                }
                else {
                    __label__ = 3;
                }
            }
            else {
                __label__ = 3;
            }
            if (__label__ == 3) {
                r0 = r0 >> 3;
                r4 = 0;
            }
            r2 = r4 << 2;
            r2 = (r1 + r2) | 0;
            r2 = r2 >> 2;
            r3 = (-1);
            r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
            r0 = r3 << r0;
            r0 = r2 & r0;
            if (r0 == 0) {
                r0 = r1 >> 2;
                r4 = (r4 + 1) | 0;
                r0 = Int64(heapClassInst.heap32[(r0)]);
                r4 = r3 << r4;
                r0 = r0 & r4;
                if (r0 == 0) {
                    break 
                }
                else {
                    r4 = (r0 + (-1)) | 0;
                    r0 = r4 & (!r0);
                    r4 = r0 >> 1;
                    r0 = r0 & 1431655765;
                    r4 = r4 & 1431655765;
                    r0 = (r0 + r4) | 0;
                    r4 = r0 >> 2;
                    r0 = r0 & 858993459;
                    r4 = r4 & 858993459;
                    r0 = (r0 + r4) | 0;
                    r4 = r0 >> 4;
                    r0 = r0 & 252645135;
                    r4 = r4 & 252645135;
                    r0 = (r0 + r4) | 0;
                    r4 = r0 >> 8;
                    r0 = r0 & 16711935;
                    r4 = r4 & 16711935;
                    r0 = (r0 + r4) | 0;
                    r4 = r0 & 65535;
                    r0 = r0 >> 16;
                    r4 = (r4 + r0) | 0;
                    r0 = r4 << 2;
                    r0 = (r1 + r0) | 0;
                    r0 = r0 >> 2;
                    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
                }
            }
            r2 = (r0 + (-1)) | 0;
            r2 = r2 & (!r0);
            r5 = r2 >> 1;
            r2 = r2 & 1431655765;
            r5 = r5 & 1431655765;
            r2 = (r2 + r5) | 0;
            r5 = r2 >> 2;
            r2 = r2 & 858993459;
            r5 = r5 & 858993459;
            r2 = (r2 + r5) | 0;
            r5 = r2 >> 4;
            r2 = r2 & 252645135;
            r5 = r5 & 252645135;
            r2 = (r2 + r5) | 0;
            r5 = r2 >> 8;
            r2 = r2 & 16711935;
            r5 = r5 & 16711935;
            r2 = (r2 + r5) | 0;
            r5 = r2 & 65535;
            r2 = r2 >> 16;
            r2 = (r5 + r2) | 0;
            r0 = if (r0 == 0) {r3} else {r2};
            r2 = r4 << 7;
            r2 = (r1 + r2) | 0;
            r3 = r0 << 2;
            r2 = (r2 + r3) | 0;
            r3 = r2 >> 2;
            r3 = Int64(heapClassInst.heap32[(r3 + 24)]);
            if (!(r3 == 0)) {
                r2 = (r2 + 96) | 0;
                r5 = r3 >> 2;
                r6 = Int64(heapClassInst.heap32[(r5 + 2)]);
                r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
                r7 = r6 >> 2;
                r8 = r5 >> 2;
                heapClassInst.heap32[(r7 + 3)] = Int32(r5);
                r2 = r2 >> 2;
                heapClassInst.heap32[(r8 + 2)] = Int32(r6);
                r5 = Int64(heapClassInst.heap32[(r2)]);
                if (!(r5 != r3)) {
                    r5 = block_null;
                    heapClassInst.heap32[(r2)] = Int32(r6);
                    if (!(r6 != r5)) {
                        r2 = r4 << 2;
                        r2 = (r1 + r2) | 0;
                        r2 = r2 >> 2;
                        r5 = 1;
                        r0 = Int64(Int32(r5) << Int32(r0));
                        r6 = Int64(heapClassInst.heap32[(r2 + 1)]);
                        r0 = r6 & (!r0);
                        heapClassInst.heap32[(r2 + 1)] = Int32(r0);
                        if (!(r0 != 0)) {
                            r0 = r1 >> 2;
                            r1 = r5 << r4;
                            r2 = Int64(heapClassInst.heap32[(r0)]);
                            r1 = r2 & (!r1);
                            heapClassInst.heap32[(r0)] = Int32(r1);
                        }
                    }
                }
                commonVariable.r_g0 = r3;
                return;
            }
        }
    } while (false);
    r0 = 0;
    commonVariable.r_g0 = r0;
    return;
}
    
func block_prepare_used(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    if (r0 == 0) {
        r0 = 0;
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        r1 = Int64(heapClassInst.heap32[(fp + 2)]);
        r2 = r0 >> 2;
        r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r4 = r3 & (-4);
        r5 = (r1 + 16) | 0;
        if (`UIntNative`(r4) >= `UIntNative`(r5)) {
            r3 = Int64(heapClassInst.heap32[(fp)]);
            r5 = (r0 + 8) | 0;
            r6 = (r5 + r1) | 0;
            r7 = r6 >> 2;
            r8 = (-4);
            r9 = Int64(heapClassInst.heap32[(r7)]);
            r8 = (r8 - r1) | 0;
            r9 = r9 & 3;
            r4 = (r8 + r4) | 0;
            r4 = r9 | r4;
            heapClassInst.heap32[(r7)] = Int32(r4);
            r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
            r4 = r4 & 3;
            r4 = r4 | r1;
            heapClassInst.heap32[(r2 + 1)] = Int32(r4);
            r4 = Int64(heapClassInst.heap32[(r7)]);
            r4 = (r4 + (-4)) | 0;
            r8 = (r1 + 4) | 0;
            r4 = r4 & (-4);
            r1 = (r1 + 8) | 0;
            r9 = (r4 + r8) | 0;
            r4 = (r4 + r1) | 0;
            r9 = (r5 + r9) | 0;
            r4 = (r5 + r4) | 0;
            r6 = (r6 + (-4)) | 0;
            r9 = r9 >> 2;
            r4 = r4 >> 2;
            heapClassInst.heap32[(r9)] = Int32(r6);
            r9 = Int64(heapClassInst.heap32[(r4)]);
            r9 = r9 | 2;
            heapClassInst.heap32[(r4)] = Int32(r9);
            r4 = Int64(heapClassInst.heap32[(r7)]);
            r4 = r4 | 1;
            heapClassInst.heap32[(r7)] = Int32(r4);
            r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
            r4 = (r4 + (-4)) | 0;
            r4 = r4 & (-4);
            r4 = (r5 + r4) | 0;
            r4 = r4 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r0);
            r4 = Int64(heapClassInst.heap32[(r7)]);
            r9 = r4 & (-4);
            r10 = r4 | 2;
            heapClassInst.heap32[(r7)] = Int32(r10);
            if (`UIntNative`(r9) > `UIntNative`(255)) {
                r4 = r9 >> 1;
                r4 = r9 | r4;
                r7 = r4 >> 2;
                r4 = r4 | r7;
                r7 = r4 >> 4;
                r4 = r4 | r7;
                r7 = r4 >> 8;
                r4 = r4 | r7;
                r7 = r4 >> 16;
                r4 = r4 | r7;
                r7 = r4 ^ (-1);
                r10 = 1431655765;
                r7 = r7 >> 1;
                r4 = r10 & (!r4);
                r7 = r7 & 1431655765;
                r4 = (r4 + r7) | 0;
                r7 = r4 >> 2;
                r4 = r4 & 858993459;
                r7 = r7 & 858993459;
                r4 = (r4 + r7) | 0;
                r7 = r4 >> 4;
                r4 = r4 & 252645135;
                r7 = r7 & 252645135;
                r4 = (r4 + r7) | 0;
                r7 = r4 >> 8;
                r4 = r4 & 16711935;
                r7 = r7 & 16711935;
                r4 = (r4 + r7) | 0;
                r7 = r4 & 65535;
                r4 = r4 >> 16;
                r10 = 26;
                r4 = (r7 + r4) | 0;
                r7 = (r10 - r4) | 0;
                r9 = r9 >> r7;
                r7 = 24;
                r9 = r9 ^ 32;
                r4 = (r7 - r4) | 0;
            }
            else {
                r9 = r4 >> 3;
                r4 = 0;
            }
            r7 = r4 << 7;
            r7 = (r3 + r7) | 0;
            r10 = r9 << 2;
            r7 = (r7 + r10) | 0;
            r7 = r7 >> 2;
            r8 = (r5 + r8) | 0;
            r1 = (r5 + r1) | 0;
            r5 = Int64(heapClassInst.heap32[(r7 + 24)]);
            r8 = r8 >> 2;
            r1 = r1 >> 2;
            r10 = block_null;
            heapClassInst.heap32[(r8)] = Int32(r5);
            r5 = r5 >> 2;
            heapClassInst.heap32[(r1)] = Int32(r10);
            heapClassInst.heap32[(r5 + 3)] = Int32(r6);
            r1 = 1;
            r5 = r3 >> 2;
            heapClassInst.heap32[(r7 + 24)] = Int32(r6);
            r6 = r4 << 2;
            r4 = r1 << r4;
            r7 = Int64(heapClassInst.heap32[(r5)]);
            r3 = (r3 + r6) | 0;
            r4 = r7 | r4;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r5)] = Int32(r4);
            r1 = Int64(Int32(r1) << Int32(r9));
            r4 = Int64(heapClassInst.heap32[(r3 + 1)]);
            r1 = r4 | r1;
            heapClassInst.heap32[(r3 + 1)] = Int32(r1);
            r3 = Int64(heapClassInst.heap32[(r2 + 1)]);
        }
        r1 = r3 & (-4);
        r0 = (r0 + 8) | 0;
        r1 = (r0 + r1) | 0;
        r1 = r1 >> 2;
        r3 = Int64(heapClassInst.heap32[(r1)]);
        r3 = r3 & (-3);
        heapClassInst.heap32[(r1)] = Int32(r3);
        r1 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r1 = r1 & (-2);
        heapClassInst.heap32[(r2 + 1)] = Int32(r1);
        commonVariable.r_g0 = r0;
        return;
    }
}
    
func assert(condition: Bool, text!: String = "") : Unit {
    if (!condition) {
        let errorMessage = "Assertion failed: " + text
    }
}
       
func strcpy(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = r1 ^ r0;
    r2 = r2 & 3;
    do {
        if (r2 == 0) {
            r2 = r0 & 3;
            if (r2 != 0) {
                r2 = r0 | (-4);
                while (true) {
                    if (r2 != 0) {
                        r3 = Int64(heapClassInst.heapU8[r1]);
                        r4 = (r0 + 1) | 0;
                        r1 = (r1 + 1) | 0;
                        r2 = (r2 + 1) | 0;
                        heapClassInst.heap8[r0] = Int8(r3);
                        r0 = r4;
                        if (!(r3 != 0)) {
                            break 
                        }
                    }
                    else {
                        break 
                    }
                }
            }
            r2 = r1 >> 2;
            r2 = Int64(heapClassInst.heap32[(r2)]);
            r3 = r2 & (-2139062144);
            r3 = r3 ^ (-2139062144);
            r4 = (r2 + (-16843009)) | 0;
            r3 = r3 & r4;
            do {
                if (r3 == 0) {
                    r1 = (r1 + 4) | 0;
                    while (true) {
                        r3 = r0 >> 2;
                        r4 = r1 >> 2;
                        heapClassInst.heap32[(r3)] = Int32(r2);
                        r2 = Int64(heapClassInst.heap32[(r4)]);
                        r3 = r2 & (-2139062144);
                        r0 = (r0 + 4) | 0;
                        r1 = (r1 + 4) | 0;
                        r3 = r3 ^ (-2139062144);
                        r4 = (r2 + (-16843009)) | 0;
                        r3 = r3 & r4;
                        if (!(r3 == 0)) {
                            break 
                        }
                    }
                }
            } while (false);
            r1 = r2 & 255;
            heapClassInst.heap8[r0] = Int8(r2);
            if (!(r1 == 0)) {
                r0 = (r0 + 1) | 0;
                while (true) {
                    r2 = r2 >> 8;
                    r1 = (r0 + 1) | 0;
                    heapClassInst.heap8[r0] = Int8(r2);
                    r3 = r2 & 255;
                    r0 = r1;
                    if (r3 == 0) {
                        break 
                    }
                    else {
                        continue 
                    }
                }
            }
        }
        else {
            while (true) {
                r2 = Int64(heapClassInst.heapU8[r1]);
                r3 = (r0 + 1) | 0;
                r1 = (r1 + 1) | 0;
                heapClassInst.heap8[r0] = Int8(r2);
                r0 = r3;
                if (r2 == 0) {
                    break 
                }
                else {
                    continue 
                }
            }
        }
    } while (false);
    return;
}
    
func mallocNew(sp1: Int64) : Unit
{
    var sp = sp1
    var size = heapClassInst.heapU32[sp >> 2];
    if (size == 0) {
        size = 4;
    }
    if (tlsfPtr.tlsf_ptr == 0) {
        var addr = Malloc(mandreel_heap_memory);
        sp -= 8;
        heapClassInst.heap32[sp >> 2] = Int32(addr);
        heapClassInst.heap32[(sp + 4) >> 2] = Int32(mandreel_heap_memory);
        tlsf_create(sp);
        tlsfPtr.tlsf_ptr = commonVariable.r_g0;
    }
    sp -= 8;
    heapClassInst.heap32[sp >> 2] = Int32(tlsfPtr.tlsf_ptr);
    heapClassInst.heap32[(sp + 4) >> 2] = Int32(size);
    tlsf_malloc(sp);
    if (commonVariable.r_g0 == 0) {
        dump("malloc failed ${size} \n");
        assert(false);
    }
}
    
func my_arg_test(sp: Int64) : Unit
{
    var ptr = Int64(heapClassInst.heapU32[sp >> 2]);
    var size = heapClassInst.heapU32[(sp + 4) >> 2];
    var arg = Int64(heapClassInst.heapU32[ptr >> 2]);
    if (size == 4) {
        heapClassInst.heap32[ptr >> 2] = Int32(arg + 4);
        arg = Int64(heapClassInst.heap32[arg >> 2]);
        heapClassInst.heap32[arg_test_local >> 2] = Int32(arg);
    }
    else {
        arg = (arg + 7) & (!7);
        heapClassInst.heap32[ptr >> 2] = Int32(arg + 8);
        var value0 = heapClassInst.heap32[arg >> 2];
        var value1 = heapClassInst.heap32[(arg + 4) >> 2];
        heapClassInst.heap32[arg_test_local >> 2] = value0;
        heapClassInst.heap32[(arg_test_local + 4) >> 2] = value1;
    }
    commonVariable.r_g0 = arg_test_local;
}
    
func llvm_readDouble(addr: Int64) : Float64
{
    var val0 = heapClassInst.heap32[(addr) >> 2];
    var val1 = heapClassInst.heap32[(addr + 4) >> 2];
    heapClassInst.heap32[(llvm_Float64_addr) >> 2] = val0;
    heapClassInst.heap32[(llvm_Float64_addr + 4) >> 2] = val1;
    var result = heapClassInst.heapFloat64[llvm_Float64_addr >> 3];
    return Float64(result);
}
    
func llvm_move_double(addr_dst: Int64, addr_src: Int64) : Unit
{
    var val0 = heapClassInst.heapU32[(addr_src) >> 2];
    var val1 = heapClassInst.heapU32[(addr_src + 4) >> 2];
    heapClassInst.heapU32[(addr_dst) >> 2] = val0;
    heapClassInst.heapU32[(addr_dst + 4) >> 2] = val1;
}
    
func __dtostr(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40);
    var g0 = i7 >> 2;
    f0 = llvm_readDouble(sp);
    r0 = sp + (-8);
    llvm_writeDouble((sp + (-8)), f0);
    r0 = r0 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = Int64(heapClassInst.heap32[(fp + 3)]);
    r3 = Int64(heapClassInst.heap32[(fp + 4)]);
    r4 = Int64(heapClassInst.heap32[(fp + 5)]);
    r5 = Int64(heapClassInst.heap32[(fp + 6)]);
    r6 = Int64(heapClassInst.heap32[(fp + (-2))]);
    if (r0 > 2146435071) {
        r7 = r0 ^ 2146959360;
        r7 = r6 | r7;
        if (r7 == 0) {
            __label__ = 13;
        }
        else {
            r7 = r0 ^ 2146435072;
            r6 = r6 | r7;
            if (r6 != 0) {
                __label__ = 20;
            }
            else {
                __label__ = 5;
            }
        }
    }
    else {
        r7 = r0 ^ (-1048576);
        r7 = r6 | r7;
        if (r7 == 0) {
            __label__ = 5;
        }
        else {
            r7 = r0 ^ (-524288);
            r6 = r6 | r7;
            if (r6 == 0) {
                __label__ = 13;
            }
            else {
                __label__ = 20;
            }
        }
    }
    do {
        match (__label__) {
            case 13  =>
                if (r2 > 0) {
                    r0 = (r2 + (-1)) | 0;
                    r3 = 2;
                    r4 = 0;
                    r5 = (r2 + 2) | 0;
                    r0 = if (`UIntNative`(r0) > `UIntNative`(r3)) {r0} else {r3};
                    r3 = (r4 - r2) | 0;
                    r0 = (r5 - r0) | 0;
                    r4 = _E2_str9655;
                    r5 = r1;
                    while (true) {
                        r6 = Int64(heapClassInst.heapU8[r4]);
                        r0 = (r0 + (-1)) | 0;
                        r7 = (r5 + 1) | 0;
                        r4 = (r4 + 1) | 0;
                        heapClassInst.heap8[r5] = Int8(r6);
                        r5 = r7;
                        if (!(r0 != 0)) {
                            break 
                        }
                    }
                    r0 = (-3);
                    r4 = 3;
                    r0 = if (`UIntNative`(r3) > `UIntNative`(r0)) {r2} else {r4};
                }
                else {
                    r0 = 0;
                }
                if (r0 >= r2) {
                    commonVariable.r_g0 = r0;
                    return;
                }
                else {
                    __label__ = 11;
                    break 
                }
            case 20  =>
                f1 = 0.0;
                if (f0 != f1) {
                    r0 = r0 >> 20;
                    r0 = r0 & 2047;
                    r0 = (r0 + (-1023)) | 0;
                    f2 = Float64(r0);
                    f3 = 0.3010299956639812;
                    f2 = f2 * f3;
                    r0 = Int64(f2) | 0;
                    r6 = (r0 + 1) | 0;
                    if (f0 < f1) {
                        f1 = -f0;
                        r2 = (r2 + (-1)) | 0;
                        r7 = (r1 + 1) | 0;
                        r8 = 45;
                        heapClassInst.heap8[r1] = Int8(r8);
                    }
                    else {
                        r7 = r1;
                        f1 = f0;
                    }
                    do {
                        if (r4 == 0) {
                            f2 = 0.5;
                        }
                        else {
                            f2 = 0.5;
                            r8 = r4;
                            f3 = 0.10000000000000001;
                            while (true) {
                                r8 = (r8 + (-1)) | 0;
                                f2 = f2 * f3;
                                if (!(r8 != 0)) {
                                    break 
                                }
                            }
                        }
                    } while (false);
                    f1 = f1 + f2;
                    f2 = 1.0
                    if (f1 < f2) {
                        r2 = (r2 + (-1)) | 0;
                        r8 = (r7 + 1) | 0;
                        r9 = 48;
                        heapClassInst.heap8[r7] = Int8(r9);
                        r7 = r8;
                    }
                    do {
                        if (r6 > 0) {
                            do {
                                if (`UIntNative`(r6) > `UIntNative`(10)) {
                                    r0 = (r0 + 1) | 0;
                                    f2 = 10.0;
                                    f3 = 10000000000.0;
                                    while (true) {
                                        r0 = (r0 + (-10)) | 0;
                                        f2 = f2 * f3;
                                        if (!(`UIntNative`(r0) > `UIntNative`(10))) {
                                            break 
                                        }
                                    }
                                }
                                else {
                                    f2 = 10.0
                                    r0 = r6;
                                }
                            } while (false);
                            if (`UIntNative`(r0) > `UIntNative`(1)) {
                                r0 = (r0 + (-1)) | 0;
                                f3 = 10.0;
                                while (true) {
                                    r0 = (r0 + (-1)) | 0;
                                    f2 = f2 * f3;
                                    if (!(r0 != 0)) {
                                        break 
                                    }
                                }
                                r0 = 1;
                            }
                            else {
                                r0 = 1;
                            }
                            while (true) {
                                f3 = 0.90000000000000002;
                                if (f2 > f3) {
                                    f3 = f1 / f2;
                                    r8 = Int64(f3) | 0;
                                    if (r0 == 0) {
                                        __label__ = 52;
                                    }
                                    else {
                                        r9 = r8 & 255;
                                        if (r9 != 0) {
                                            __label__ = 52;
                                        }
                                        else {
                                            __label__ = 64;
                                        }
                                    }
                                    if (__label__ == 52) {
                                        r0 = (r8 + 48) | 0;
                                        heapClassInst.heap8[r7] = Int8(r0);
                                        if (r2 != 0) {
                                            r0 = r8 << 24;
                                            r0 = r0 >> 24;
                                            f3 = Float64(r0);
                                            f3 = f3 * f2;
                                            r7 = (r7 + 1) | 0;
                                            f1 = f1 - f3;
                                            r2 = (r2 + (-1)) | 0;
                                            r0 = 0;
                                        }
                                        else {
                                            break 
                                        }
                                    }
                                    f3 = 10.0;
                                    f2 = f2 / f3;
                                }
                                else {
                                    __label__ = 66;
                                    break 
                                }
                            }
                            f0 = f0 / f2;
                            llvm_writeDouble((i7), f0);
                            heapClassInst.heap32[(g0 + 2)] = Int32(r1);
                            heapClassInst.heap32[(g0 + 3)] = Int32(r2);
                            heapClassInst.heap32[(g0 + 4)] = Int32(r3);
                            heapClassInst.heap32[(g0 + 5)] = Int32(r4);
                            heapClassInst.heap32[(g0 + 6)] = 0;
                            __dtostr(i7);
                            r0 = commonVariable.r_g0;
                            if (r0 == 0) {
                                __label__ = 83;
                            }
                            else {
                                r3 = (r0 + r7) | 0;
                                r7 = (r3 + 1) | 0;
                                if (r2 != r0) {
                                    r3 = (r3 + 2) | 0;
                                    r4 = 101;
                                    heapClassInst.heap8[r7] = Int8(r4);
                                    r7 = r3;
                                }
                                r2 = (r2 + (-1)) | 0;
                                r3 = (r2 - r0) | 0;
                                do {
                                    if (r6 < 1000) {
                                        if (r6 < 100) {
                                            if (r6 > 9) {
                                                __label__ = 90;
                                                break 
                                            }
                                            else {
                                                __label__ = 91;
                                                break 
                                            }
                                        }
                                        else {
                                            __label__ = 87;
                                            break 
                                        }
                                    }
                                    else {
                                        if (r2 != r0) {
                                            r0 = (r6 / 1000) | 0;
                                            r2 = (r7 + 1) | 0;
                                            r0 = (r0 + 48) | 0;
                                            heapClassInst.heap8[r7] = Int8(r0);
                                            r7 = r2;
                                        }
                                        r3 = (r3 + (-1)) | 0;
                                        r6 = (r6 % 1000) | 0;
                                        __label__ = 87;
                                    }
                                } while (false);
                                if (__label__ == 87) {
                                    if (r3 != 0) {
                                        r0 = (r6 / 100) | 0;
                                        r2 = (r7 + 1) | 0;
                                        r0 = (r0 + 48) | 0;
                                        heapClassInst.heap8[r7] = Int8(r0);
                                        r7 = r2;
                                    }
                                    r3 = (r3 + (-1)) | 0;
                                    r6 = (r6 % 100) | 0;
                                    __label__ = 90;
                                }
                                if (__label__ == 90) {
                                    if (r3 != 0) {
                                        r0 = (r6 / 10) | 0;
                                        r2 = (r7 + 1) | 0;
                                        r0 = (r0 + 48) | 0;
                                        heapClassInst.heap8[r7] = Int8(r0);
                                        r7 = r2;
                                    }
                                    r3 = (r3 + (-1)) | 0;
                                    r6 = (r6 % 10) | 0;
                                }
                                if (r3 != 0) {
                                    r0 = (r6 + 48) | 0;
                                    heapClassInst.heap8[r7] = Int8(r0);
                                    if (r3 == 1) {
                                        __label__ = 83;
                                    }
                                    else {
                                        r7 = (r7 + 1) | 0;
                                        __label__ = 82;
                                    }
                                }
                                else {
                                    __label__ = 82;
                                }
                            }
                        }
                        else {
                            f2 = 0.10000000000000001;
                            __label__ = 66;
                        }
                    } while (false);
                    do {
                        if (__label__ == 66) {
                            if (r7 == r1) {
                                if (r2 == 0) {
                                    __label__ = 83;
                                    break 
                                }
                                else {
                                    r2 = (r2 + (-1)) | 0;
                                    r6 = (r7 + 1) | 0;
                                    r0 = 48;
                                    heapClassInst.heap8[r7] = Int8(r0);
                                    r7 = r6;
                                }
                            }
                            if (!(r4 != 0)) {
                                r6 = 1;
                                r6 = (r6 - r1) | 0;
                                r6 = (r6 + r7) | 0;
                                if (!(`UIntNative`(r6) < `UIntNative`(r3))) {
                                    __label__ = 82;
                                    break 
                                }
                            }
                            if (r2 == 0) {
                                __label__ = 83;
                            }
                            else {
                                r6 = (r2 + (-1)) | 0;
                                r0 = (r7 + 1) | 0;
                                r2 = 46;
                                heapClassInst.heap8[r7] = Int8(r2);
                                if (r5 == 0) {
                                    if (!(r4 != 0)) {
                                        r3 = (r1 + r3) | 0;
                                        r3 = (r3 + 1) | 0;
                                        r4 = (r3 - r0) | 0;
                                    }
                                }
                                else {
                                    r3 = if (r4 == 0) {r3} else {r4};
                                    r3 = (r1 + r3) | 0;
                                    r3 = (r3 + 1) | 0;
                                    r4 = (r3 - r0) | 0;
                                }
                                if (`UIntNative`(r4) > `UIntNative`(r6)) {
                                    __label__ = 83;
                                }
                                else {
                                    if (r4 != 0) {
                                        r3 = (r4 + 1) | 0;
                                        r6 = (r7 + 1) | 0;
                                        f3 = 10.0;
                                        while (true) {
                                            f0 = f1 / f2;
                                            r0 = Int64(f0) | 0;
                                            r2 = r0 << 24;
                                            r2 = r2 >> 24;
                                            f0 = Float64(r2);
                                            f0 = f0 * f2;
                                            r4 = (r4 + (-1)) | 0;
                                            f2 = f2 / f3;
                                            f1 = f1 - f0;
                                            r2 = (r6 + 1) | 0;
                                            r0 = (r0 + 48) | 0;
                                            heapClassInst.heap8[r6] = Int8(r0);
                                            r6 = r2;
                                            if (!(r4 != 0)) {
                                                break 
                                            }
                                        }
                                        r7 = (r7 + r3) | 0;
                                        __label__ = 82;
                                    }
                                    else {
                                        r7 = r0;
                                        __label__ = 82;
                                    }
                                }
                            }
                        }
                    } while (false);
                    match (__label__) {
                        case 83 =>
                            r1 = 0;
                            commonVariable.r_g0 = r1;
                            return
                        case 82 =>
                            r3 = 0
                            heapClassInst.heap8[r7] = Int8(r3)
                            r1 = (r7 - r1) | 0
                            commonVariable.r_g0 = r1
                            return
                        case _ => println("break")
                    }
                }
                else {
                    r3 = 1;
                    r5 = (r4 + 2) | 0;
                    r4 = if (r4 == 0) {r3} else {r5};
                    r5 = 8;
                    r2 = if (`UIntNative`(r4) > `UIntNative`(r2)) {r5} else {r4};
                    if (r2 == 0) {
                        __label__ = 23;
                    }
                    else {
                        if (r0 < 0) {
                            r0 = 45;
                            heapClassInst.heap8[r1] = Int8(r0);
                            r0 = r3;
                            __label__ = 25;
                        }
                        else {
                            __label__ = 23;
                        }
                    }
                    if (__label__ == 23) {
                        r0 = 0;
                    }
                    if (`UIntNative`(r0) < `UIntNative`(r2)) {
                        r5 = 48;
                        while (true) {
                            r4 = (r0 + 1) | 0;
                            heapClassInst.heap8[r1 + r0] = Int8(r5);
                            r0 = r4;
                            if (!(r2 != r4)) {
                                break 
                            }
                        }
                        r0 = r2;
                    }
                    r2 = 2;
                    r4 = Int64(heapClassInst.heapU8[r1]);
                    r2 = if (r4 == 48) {r3} else {r2};
                    r3 = 46;
                    r4 = 0;
                    heapClassInst.heap8[r1 + r2] = Int8(r3);
                    heapClassInst.heap8[r1 + r0] = Int8(r4);
                    commonVariable.r_g0 = r0;
                    return;
                }
            case 5  =>
                if (r2 > 0) {
                    r0 = (r2 + (-1)) | 0;
                    r3 = 2;
                    r4 = 0;
                    r5 = (r2 + 2) | 0;
                    r0 = if (`UIntNative`(r0) > `UIntNative`(r3)) {r0} else {r3};
                    r3 = (r4 - r2) | 0;
                    r0 = (r5 - r0) | 0;
                    r4 = _E2_str7654;
                    r5 = r1;
                    while (true) {
                        r6 = Int64(heapClassInst.heapU8[r4]);
                        r0 = (r0 + (-1)) | 0;
                        r7 = (r5 + 1) | 0;
                        r4 = (r4 + 1) | 0;
                        heapClassInst.heap8[r5] = Int8(r6);
                        r5 = r7;
                        if (!(r0 != 0)) {
                            break 
                        }
                    }
                    r0 = (-3);
                    r4 = 3;
                    r0 = if (`UIntNative`(r3) > `UIntNative`(r0)) {r2} else {r4};
                }
                else {
                    r0 = 0;
                }
                if (r0 >= r2) {
                    __label__ = 12;
                }
                else {
                    __label__ = 11;
                }
            case _ => println("break")
        }
    } while (false);
    if (__label__ == 11) {
        r2 = 0;
        heapClassInst.heap8[r1 + r0] = Int8(r2);
        r0 = (r0 + 1) | 0;
    }
    commonVariable.r_g0 = r0;
    return;
}
    
func swrite(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r2 = Int64(heapClassInst.heap32[(r0 + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    if (!(r2 == r1)) {
        r2 = (r2 - r1) | 0;
        r4 = Int64(heapClassInst.heap32[(r0)]);
        r2 = if (`UIntNative`(r2) < `UIntNative`(r3)) {r2} else {r3};
        if (r4 != 0) {
            r5 = Int64(heapClassInst.heap32[(fp)]);
            r1 = (r4 + r1) | 0;
            heapClassInst.heap32[(g0)] = Int32(r1);
            heapClassInst.heap32[(g0 + 1)] = Int32(r5);
            heapClassInst.heap32[(g0 + 2)] = Int32(r2);
            memcpy(i7);
            r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
            r4 = Int64(heapClassInst.heap32[(r0)]);
            r1 = (r1 + r2) | 0;
            r5 = 0;
            heapClassInst.heap8[r4 + r1] = Int8(r5);
            r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
        }
        r1 = (r1 + r2) | 0;
        heapClassInst.heap32[(r0 + 1)] = Int32(r1);
    }
    commonVariable.r_g0 = r3;
    return;
}
        
func register_delegate(ptr_func: (Int64) -> Unit) : Int64
{
    var funcId = mandreel_pos_function_table;
    __FUNCTION_TABLE__.add(ptr_func)
    mandreel_pos_function_table += 1;
    deBugLog("funcId : ${funcId * 4}")
    return funcId * 4;
}
    
func mandreel_getlocalstorage() : ?GetItemARR
{
    return mandreelWindow.localStorage
}
    
func sinf(sp: Int64) : Unit
{
    var value = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(sin(value))
}
    
func sqrtf(sp: Int64) : Unit
{
    var value = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(sqrt(value))
}
    
func _assert(sp1: Int64) : Unit
{
    var sp = sp1
    var p0 = heapClassInst.heap32[sp >> 2];
    sp += 4;
    var p1 = heapClassInst.heap32[sp >> 2];
    sp += 4;
    var line = heapClassInst.heap32[sp >> 2];
    sp += 4;
    var name = get_string_from_ptr(Int64(p0));
    var file = get_string_from_ptr(Int64(p1));
    assert(false, text: "${name} ${file} ${line}");
}
    
func _Znwj(sp: Int64) : Unit
{
    mallocNew(sp);
}
    
func _ZdlPv(sp: Int64) : Unit
{
    free(sp);
}
    
func pause(milliseconds: Int64) : Unit {
}
    
func acosf(sp: Int64) : Unit
{
    var value = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(acos(value))
}

func atan2(y: Float32, x: Float32): Float32{
    if (x > 0.0) {
        return atan(y/x)
    }
    else if ( x < 0.0 && y >= 0.0) {
        return atan(y/x) + Float32.GetPI()
    }
    else if ( x < 0.0 && y < 0.0) {
        return atan(y/x) - Float32.GetPI()
    }
    else if ( x == 0.0 && y > 0.0) {
        return Float32.GetPI()/2.0
    }
    else if ( x == 0.0 && y < 0.0) {
        return -Float32.GetPI()/2.0
    }
    else if ( x == 0.0 && y == 0.0) {
        return 0.0
    }  
    return 0.0
}

    
func atan2f(sp1: Int64) : Unit
{
    var sp = sp1
    var x = heapClassInst.heapFloat[sp >> 2];
    sp += 4;
    var y = heapClassInst.heapFloat[sp >> 2];
    commonVariable.f_g0 = Float64(atan2(x, y))
}

@OverflowWrapping
func _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var r21: Int64 = 0
    var r22: Int64 = 0
    var r23: Int64 = 0
    var r24: Int64 = 0
    var r25: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = (r0 + r1) | 0;
    r3 = r2 >> 31;
    r4 = Int64(heapClassInst.heap32[(fp)]);
    r2 = (r2 + r3) | 0;
    r3 = r4 >> 2;
    r2 = r2 & 536870910;
    r5 = Int64(heapClassInst.heap32[(r3 + 3)]);
    r2 = r2 << 3;
    r2 = (r5 + r2) | 0;
    r2 = r2 >> 2;
    r5 = Int64(heapClassInst.heap32[(r2)]);
    r6 = Int64(heapClassInst.heap32[(r2 + 1)]);
    r2 = Int64(heapClassInst.heap32[(r2 + 2)]);
    r7 = r1;
    r8 = r0;
    while (true) {
        r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
        r10 = r7 << 4;
        r10 = (r9 + r10) | 0;
        r11 = 0;
        while (true) {
            r12 = r11 << 4;
            r12 = (r10 + r12) | 0;
            r12 = r12 >> 2;
            r13 = r11 << 2;
            r14 = Int64(heapClassInst.heap32[(r12)]);
            if (r14 != 0) {
                r15 = r14 >> 2;
                r15 = Int64(heapClassInst.heap32[(r15 + 3)]);
            }
            else {
                r15 = (-1);
            }
            if (r5 != 0) {
                r16 = r5 >> 2;
                r16 = Int64(heapClassInst.heap32[(r16 + 3)]);
            }
            else {
                r16 = (-1);
            }
            r17 = r13 << 2;
            r17 = (r10 + r17) | 0;
            r17 = r17 >> 2;
            r17 = Int64(heapClassInst.heap32[(r17 + 1)]);
            if (r17 != 0) {
                r18 = r17 >> 2;
                r18 = Int64(heapClassInst.heap32[(r18 + 3)]);
            }
            else {
                r18 = (-1);
            }
            if (r6 != 0) {
                r19 = r6 >> 2;
                r19 = Int64(heapClassInst.heap32[(r19 + 3)]);
            }
            else {
                r19 = (-1);
            }
            do {
                if (!(r15 > r16)) {
                    if (!(r14 != r5)) {
                        if (r18 > r19) {
                            break 
                        }
                    }
                    if (r14 != r5) {
                        break 
                    }
                    else {
                        if (r17 != r6) {
                            break 
                        }
                        else {
                            r15 = r13 << 2;
                            r15 = (r10 + r15) | 0;
                            r15 = r15 >> 2;
                            r15 = Int64(heapClassInst.heap32[(r15 + 2)]);
                            if (!(`UIntNative`(/*truncatingIfNeeded:*/ r15) > `UIntNative`(/*truncatingIfNeeded:*/ r2))) {
                                break 
                            }
                        }
                    }
                }
            } while (false);
            r11 = (r11 + 1) | 0;
            continue 
        }
        r18 = r8 << 4;
        r15 = (r7 + r11) | 0;
        r9 = (r9 + r18) | 0;
        r16 = 0;
        while (true) {
            r19 = r16 << 2;
            if (r5 != 0) {
                r20 = r5 >> 2;
                r20 = Int64(heapClassInst.heap32[(r20 + 3)]);
            }
            else {
                r20 = (-1);
            }
            r21 = r19 << 2;
            r21 = (r9 + r21) | 0;
            r21 = r21 >> 2;
            r21 = Int64(heapClassInst.heap32[(r21)]);
            if (r21 != 0) {
                r22 = r21 >> 2;
                r22 = Int64(heapClassInst.heap32[(r22 + 3)]);
            }
            else {
                r22 = (-1);
            }
            if (r6 != 0) {
                r23 = r6 >> 2;
                r23 = Int64(heapClassInst.heap32[(r23 + 3)]);
            }
            else {
                r23 = (-1);
            }
            r24 = r19 << 2;
            r24 = (r9 + r24) | 0;
            r24 = r24 >> 2;
            r24 = Int64(heapClassInst.heap32[(r24 + 1)]);
            if (r24 != 0) {
                r25 = r24 >> 2;
                r25 = Int64(heapClassInst.heap32[(r25 + 3)]);
            }
            else {
                r25 = (-1);
            }
            do {
                if (!(r20 > r22)) {
                    if (!(r5 != r21)) {
                        if (r23 > r25) {
                            break 
                        }
                    }
                    if (r5 != r21) {
                        break 
                    }
                    else {
                        if (r6 != r24) {
                            break 
                        }
                        else {
                            r20 = r19 << 2;
                            r20 = (r9 + r20) | 0;
                            r20 = r20 >> 2;
                            r20 = Int64(heapClassInst.heap32[(r20 + 2)]);
                            if (!(`UIntNative`(/*truncatingIfNeeded:*/ r2) > `UIntNative`(/*truncatingIfNeeded:*/ r20))) {
                                break 
                            }
                        }
                    }
                }
            } while (false);
            r16 = (r16 + (-1)) | 0;
            continue 
        }
        r20 = (r8 + r16) | 0;
        if (r15 <= r20) {
            r13 = r13 << 2;
            r10 = (r10 + r13) | 0;
            r10 = r10 >> 2;
            r13 = Int64(heapClassInst.heap32[(r12 + 3)]);
            r15 = Int64(heapClassInst.heap32[(r10 + 2)]);
            r19 = r19 << 2;
            r19 = (r9 + r19) | 0;
            heapClassInst.heap32[(r10)] = Int32(/*truncatingIfNeeded:*/ r21);
            r20 = r16 << 4;
            r19 = r19 >> 2;
            heapClassInst.heap32[(r10 + 1)] = Int32(/*truncatingIfNeeded:*/ r24);
            r19 = Int64(heapClassInst.heap32[(r19 + 2)]);
            r9 = (r9 + r20) | 0;
            r9 = r9 >> 2;
            heapClassInst.heap32[(r10 + 2)] = Int32(/*truncatingIfNeeded: */r19);
            r9 = Int64(heapClassInst.heap32[(r9 + 3)]);
            heapClassInst.heap32[(r12 + 3)] = Int32(/*truncatingIfNeeded:*/ r9);
            r9 = Int64(heapClassInst.heap32[(r3 + 3)]);
            r9 = (r9 + r18) | 0;
            r9 = (r9 + r20) | 0;
            r9 = r9 >> 2;
            heapClassInst.heap32[(r9)] = Int32(/*truncatingIfNeeded:*/ r14);
            r7 = (r7 + r11) | 0;
            r8 = (r8 + r16) | 0;
            heapClassInst.heap32[(r9 + 1)] = Int32(/*truncatingIfNeeded:*/ r17);
            r7 = (r7 + 1) | 0;
            r8 = (r8 + (-1)) | 0;
            heapClassInst.heap32[(r9 + 2)] = Int32(/*truncatingIfNeeded:*/ r15);
            heapClassInst.heap32[(r9 + 3)] = Int32(/*truncatingIfNeeded:*/ r13);
        }
        else {
            r7 = r15;
            r8 = r20;
        }
        if (r7 <= r8) {
            continue 
        }
        else {
            break 
        }
    }
    if (!(r8 <= r1)) {
        heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r1);
        heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r8);
        _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(i7);
    }
    if (!(r7 >= r0)) {
        heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r4);
        heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r7);
        heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r0);
        _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(i7);
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE11sortMaxDownEitP12btDispatcherb(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r0 << 2;
    r2 = (r1 + r2) | 0;
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 17)]);
    r4 = r3 << 2;
    r5 = (r2 + r4) | 0;
    r4 = Int64(heapClassInst.heapU16[(r2 + r4) >> 1]);
    r6 = Int64(heapClassInst.heapU16[(r5 + (-4)) >> 1]);
    if (!(`UIntNative`(/*truncatingIfNeeded:*/ r4) >= `UIntNative`(/*truncatingIfNeeded:*/ r6))) {
        r1 = r1 >> 2;
        r4 = Int64(heapClassInst.heap32[(fp + 3)]);
        r6 = Int64(heapClassInst.heap32[(fp + 4)]);
        r7 = Int64(heapClassInst.heap32[(r1 + 15)]);
        r3 = r3 << 2;
        r2 = (r2 + r3) | 0;
        r2 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1]);
        r3 = 1;
        r8 = r3 << r0;
        r2 = r2 << 6;
        r8 = r8 & 3;
        r2 = (r7 + r2) | 0;
        r0 = r0 << 1;
        r3 = r3 << r8;
        r2 = (r2 + r0) | 0;
        r3 = r3 & 3;
        r2 = (r2 + 54) | 0;
        r5 = (r5 + 2) | 0;
        while (true) {
            r9 = Int64(heapClassInst.heapU8[r5 + (-6)]);
            r10 = Int64(heapClassInst.heapU16[(r5 + (-4)) >> 1]);
            r9 = r9 & 1;
            if (r9 != 0) {
                r9 = r10 << 6;
                r7 = (r7 + r9) | 0;
                r7 = (r7 + r0) | 0;
                r9 = Int64(heapClassInst.heapU16[(r7 + 54) >> 1]);
                r9 = (r9 + 1) | 0;
                heapClassInst.heap16[(r7 + 54) >> 1] = Int16(/*truncatingIfNeeded:*/ r9);
            }
            else {
                if (!(r6 == 0)) {
                    r9 = Int64(heapClassInst.heapU16[(r5) >> 1]);
                    r9 = r9 << 6;
                    r11 = r10 << 6;
                    r9 = (r7 + r9) | 0;
                    r12 = r8 << 1;
                    r11 = (r7 + r11) | 0;
                    r13 = (r9 + r12) | 0;
                    r12 = (r11 + r12) | 0;
                    r14 = Int64(heapClassInst.heapU16[(r13 + 54) >> 1]);
                    r15 = Int64(heapClassInst.heapU16[(r12 + 48) >> 1]);
                    if (!(`UIntNative`(/*truncatingIfNeeded:*/ r14) < `UIntNative`(/*truncatingIfNeeded:*/ r15))) {
                        r12 = Int64(heapClassInst.heapU16[(r12 + 54) >> 1]);
                        r13 = Int64(heapClassInst.heapU16[(r13 + 48) >> 1]);
                        if (!(`UIntNative`(/*truncatingIfNeeded:*/ r12) < `UIntNative`(/*truncatingIfNeeded:*/ r13))) {
                            r12 = r3 << 1;
                            r13 = (r9 + r12) | 0;
                            r12 = (r11 + r12) | 0;
                            r14 = Int64(heapClassInst.heapU16[(r13 + 54) >> 1]);
                            r15 = Int64(heapClassInst.heapU16[(r12 + 48) >> 1]);
                            if (!(`UIntNative`(/*truncatingIfNeeded:*/ r14) < `UIntNative`(/*truncatingIfNeeded:*/ r15))) {
                                r12 = Int64(heapClassInst.heapU16[(r12 + 54) >> 1]);
                                r13 = Int64(heapClassInst.heapU16[(r13 + 48) >> 1]);
                                if (!(`UIntNative`(/*truncatingIfNeeded:*/ r12) < `UIntNative`(/*truncatingIfNeeded:*/ r13))) {
                                    r12 = Int64(heapClassInst.heap32[(r1 + 23)]);
                                    r13 = r12 >> 2;
                                    r13 = Int64(heapClassInst.heap32[(r13)]);
                                    r13 = r13 >> 2;
                                    r13 = Int64(heapClassInst.heap32[(r13 + 3)]);
                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r12);
                                    heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r9);
                                    heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r11);
                                    heapClassInst.heap32[(g0 + 3)] = Int32(/*truncatingIfNeeded:*/ r4);
                                    __FUNCTION_TABLE__[(r13) >> 2](i7);
                                    r12 = Int64(heapClassInst.heap32[(r1 + 24)]);
                                    if (!(r12 == 0)) {
                                        r13 = r12 >> 2;
                                        r13 = Int64(heapClassInst.heap32[(r13)]);
                                        r13 = r13 >> 2;
                                        r13 = Int64(heapClassInst.heap32[(r13 + 3)]);
                                        heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r12);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r9);
                                        heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r11);
                                        heapClassInst.heap32[(g0 + 3)] = Int32(/*truncatingIfNeeded:*/ r4);
                                        __FUNCTION_TABLE__[(r13) >> 2](i7);
                                    }
                                }
                            }
                        }
                    }
                }
                r10 = r10 << 6;
                r7 = (r7 + r10) | 0;
                r7 = (r7 + r0) | 0;
                r10 = Int64(heapClassInst.heapU16[(r7 + 48) >> 1]);
                r10 = (r10 + 1) | 0;
                heapClassInst.heap16[(r7 + 48) >> 1] = Int16(/*truncatingIfNeeded:*/ r10);
            }
            r7 = Int64(heapClassInst.heapU16[(r2) >> 1]);
            r7 = (r7 + (-1)) | 0;
            heapClassInst.heap16[(r2) >> 1] = Int16(/*truncatingIfNeeded:*/ r7);
            r7 = Int64(heapClassInst.heapU16[(r5 + (-2)) >> 1]);
            r9 = Int64(heapClassInst.heapU16[(r5) >> 1]);
            r10 = Int64(heapClassInst.heapU16[(r5 + (-4)) >> 1]);
            r11 = Int64(heapClassInst.heapU16[(r5 + (-6)) >> 1]);
            heapClassInst.heap16[(r5 + (-2)) >> 1] = Int16(/*truncatingIfNeeded:*/ r11);
            heapClassInst.heap16[(r5) >> 1] = Int16(/*truncatingIfNeeded:*/ r10);
            heapClassInst.heap16[(r5 + (-6)) >> 1] = Int16(/*truncatingIfNeeded:*/ r7);
            heapClassInst.heap16[(r5 + (-4)) >> 1] = Int16(/*truncatingIfNeeded:*/ r9);
            r9 = Int64(heapClassInst.heapU16[(r5 + (-10)) >> 1]);
            if (`UIntNative`(/*truncatingIfNeeded:*/ r7) >= `UIntNative`(/*truncatingIfNeeded:*/ r9)) {
                break 
            }
            else {
                r7 = Int64(heapClassInst.heap32[(r1 + 15)]);
                r5 = (r5 + (-4)) | 0;
                continue 
            }
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE11sortMinDownEitP12btDispatcherb(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = r0 << 2;
    r2 = (r1 + r2) | 0;
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = r2 >> 2;
    r2 = Int64(heapClassInst.heap32[(r2 + 17)]);
    r3 = r3 << 2;
    r4 = (r2 + r3) | 0;
    r2 = Int64(heapClassInst.heapU16[(r2 + r3) >> 1]);
    r3 = Int64(heapClassInst.heapU16[(r4 + (-4)) >> 1]);
    if (!(`UIntNative`(/*truncatingIfNeeded:*/ r2) >= `UIntNative`(/*truncatingIfNeeded:*/ r3))) {
        r1 = r1 >> 2;
        r2 = Int64(heapClassInst.heap32[(fp + 3)]);
        r3 = Int64(heapClassInst.heap32[(r1 + 15)]);
        r5 = Int64(heapClassInst.heapU16[(r4 + 2) >> 1]);
        r6 = 1;
        r7 = r6 << r0;
        r7 = r7 & 3;
        r6 = r6 << r7;
        r5 = r5 << 6;
        r5 = (r3 + r5) | 0;
        r6 = r6 & 3;
        r0 = r0 << 1;
        r8 = (r5 + 48) | 0;
        r7 = r7 << 1;
        r9 = (r5 + 54) | 0;
        r6 = r6 << 1;
        r10 = (r8 + r0) | 0;
        r11 = (r9 + r7) | 0;
        r12 = (r8 + r7) | 0;
        r9 = (r9 + r6) | 0;
        r8 = (r8 + r6) | 0;
        r4 = (r4 + 2) | 0;
        while (true) {
            r13 = Int64(heapClassInst.heapU8[r4 + (-6)]);
            r14 = Int64(heapClassInst.heapU16[(r4 + (-4)) >> 1]);
            r13 = r13 & 1;
            if (r13 == 0) {
                r13 = r14 << 6;
                r3 = (r3 + r13) | 0;
                r3 = (r3 + r0) | 0;
                r13 = Int64(heapClassInst.heapU16[(r3 + 48) >> 1]);
                r13 = (r13 + 1) | 0;
                heapClassInst.heap16[(r3 + 48) >> 1] = Int16(/*truncatingIfNeeded:*/ r13);
            }
            else {
                if (!(r2 == 0)) {
                    r13 = r14 << 6;
                    r13 = (r3 + r13) | 0;
                    r15 = (r13 + r7) | 0;
                    r16 = Int64(heapClassInst.heapU16[(r11) >> 1]);
                    r17 = Int64(heapClassInst.heapU16[(r15 + 48) >> 1]);
                    if (!(`UIntNative`(/*truncatingIfNeeded:*/ r16) < `UIntNative`(/*truncatingIfNeeded:*/ r17))) {
                        r15 = Int64(heapClassInst.heapU16[(r15 + 54) >> 1]);
                        r16 = Int64(heapClassInst.heapU16[(r12) >> 1]);
                        if (!(`UIntNative`(/*truncatingIfNeeded:*/ r15) < `UIntNative`(/*truncatingIfNeeded:*/ r16))) {
                            r15 = (r13 + r6) | 0;
                            r16 = Int64(heapClassInst.heapU16[(r9) >> 1]);
                            r17 = Int64(heapClassInst.heapU16[(r15 + 48) >> 1]);
                            if (!(`UIntNative`(/*truncatingIfNeeded:*/ r16) < `UIntNative`(/*truncatingIfNeeded:*/ r17))) {
                                r15 = Int64(heapClassInst.heapU16[(r15 + 54) >> 1]);
                                r16 = Int64(heapClassInst.heapU16[(r8) >> 1]);
                                if (!(`UIntNative`(/*truncatingIfNeeded:*/ r15) < `UIntNative`(/*truncatingIfNeeded:*/ r16))) {
                                    r15 = Int64(heapClassInst.heap32[(r1 + 23)]);
                                    r16 = r15 >> 2;
                                    r16 = Int64(heapClassInst.heap32[(r16)]);
                                    r16 = r16 >> 2;
                                    r16 = Int64(heapClassInst.heap32[(r16 + 2)]);
                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r15);
                                    heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r5);
                                    heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r13);
                                    __FUNCTION_TABLE__[(r16) >> 2](i7);
                                    r15 = Int64(heapClassInst.heap32[(r1 + 24)]);
                                    if (!(r15 == 0)) {
                                        r16 = r15 >> 2;
                                        r16 = Int64(heapClassInst.heap32[(r16)]);
                                        r16 = r16 >> 2;
                                        r16 = Int64(heapClassInst.heap32[(r16 + 2)]);
                                        heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r15);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r5);
                                        heapClassInst.heap32[(g0 + 2)] = Int32(/*truncatingIfNeeded:*/ r13);
                                        __FUNCTION_TABLE__[(r16) >> 2](i7);
                                    }
                                }
                            }
                        }
                    }
                }
                r14 = r14 << 6;
                r3 = (r3 + r14) | 0;
                r3 = (r3 + r0) | 0;
                r14 = Int64(heapClassInst.heapU16[(r3 + 54) >> 1]);
                r14 = (r14 + 1) | 0;
                heapClassInst.heap16[(r3 + 54) >> 1] = Int16(/*truncatingIfNeeded:*/ r14);
            }
            r3 = Int64(heapClassInst.heapU16[(r10) >> 1]);
            r3 = (r3 + (-1)) | 0;
            heapClassInst.heap16[(r10) >> 1] = Int16(/*truncatingIfNeeded:*/ r3);
            r3 = Int64(heapClassInst.heapU16[(r4 + (-2)) >> 1]);
            r13 = Int64(heapClassInst.heapU16[(r4) >> 1]);
            r14 = Int64(heapClassInst.heapU16[(r4 + (-4)) >> 1]);
            r15 = Int64(heapClassInst.heapU16[(r4 + (-6)) >> 1]);
            heapClassInst.heap16[(r4 + (-2)) >> 1] = Int16(/*truncatingIfNeeded:*/ r15);
            heapClassInst.heap16[(r4) >> 1] = Int16(/*truncatingIfNeeded:*/ r14);
            heapClassInst.heap16[(r4 + (-6)) >> 1] = Int16(/*truncatingIfNeeded:*/ r3);
            heapClassInst.heap16[(r4 + (-4)) >> 1] = Int16(/*truncatingIfNeeded:*/ r13);
            r13 = Int64(heapClassInst.heapU16[(r4 + (-10)) >> 1]);
            if (`UIntNative`(/*truncatingIfNeeded:*/ r3) >= `UIntNative`(/*truncatingIfNeeded:*/ r13)) {
                break 
            }
            else {
                r3 = Int64(heapClassInst.heap32[(r1 + 15)]);
                r4 = (r4 + (-4)) | 0;
                continue 
            }
        }
    }
    return;
}

@OverflowWrapping
func _ZNK20btAxisSweep3InternalItE8quantizeEPtRK9btVector3i(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp + 2)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
    f2 = Float64(heapClassInst.heapFloat[(fp + 4)]);
    f3 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
    f4 = Float64(heapClassInst.heapFloat[(fp + 3)]);
    f5 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
    f0 = f0 - f1;
    f1 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
    f2 = f2 - f3;
    f3 = Float64(heapClassInst.heapFloat[(r1 + 12)]);
    f4 = f4 - f5;
    f5 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
    f0 = f0 * f1;
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 5)]);
    f1 = f2 * f3;
    f2 = f4 * f5;
    f3 = 0.0
    if (f0 > f3) {
        r3 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
        f4 = Float64(r3);
        if (f0 < f4) {
            r3 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r4 = Int64(floor(f0));
            r3 = r3 & r4;
            r3 = r3 | r2;
        }
        else {
            r4 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r3 = r4 & r3;
            r3 = r3 | r2;
        }
    }
    else {
        r3 = r2;
    }
    heapClassInst.heap16[(r1) >> 1] = Int16(/*truncatingIfNeeded:*/ r3);
    if (f2 > f3) {
        r3 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
        f0 = Float64(r3);
        if (f2 < f0) {
            r3 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r4 = Int64(floor(f2));
            r3 = r3 & r4;
            r3 = r3 | r2;
        }
        else {
            r4 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r3 = r4 & r3;
            r3 = r3 | r2;
        }
    }
    else {
        r3 = r2;
    }
    heapClassInst.heap16[(r1 + 2) >> 1] = Int16(/*truncatingIfNeeded:*/ r3);
    if (f1 > f3) {
        r3 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
        f0 = Float64(r3);
        if (f1 < f0) {
            r0 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r3 = Int64(floor(f1));
            r0 = r0 & r3;
            r2 = r0 | r2;
        }
        else {
            r0 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
            r0 = r0 & r3;
            r2 = r0 | r2;
        }
    }
    heapClassInst.heap16[(r1 + 4) >> 1] = Int16(/*truncatingIfNeeded:*/ r2);
    return;
}
    
func wa_mandreel_audio_update(sp: Int64) : Unit
{
}
    
func mandreel_audio_isLogEnabled(sp: Int64) : Unit
{
    commonVariable.r_g0 = 0;
}
    
func mandreel_flash_sockets_getFlashMovieObject(movieName: String) : Unit
{
}
    
func mandreel_audio_getAudioDriverName(sp1: Int64) : Unit
{
    var sp = sp1
    var name_ptr = heapClassInst.heap32[sp >> 2];
    sp += 4;
    fill_ptr_from_string(Int64(name_ptr), commonVariable.MandreelAudioDriver);
}
    
func _ZN20btAlignedObjectArrayI18btQuantizedBvhNodeE7reserveEi(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2 + 2)]);
    if (!(r3 >= r1)) {
        if (r1 != 0) {
            r3 = gNumAlignedAllocs;
            r3 = r3 >> 2;
            r4 = Int64(heapClassInst.heap32[(r3)]);
            r5 = r1 << 4;
            r4 = (r4 + 1) | 0;
            r5 = r5 | 3;
            heapClassInst.heap32[(r3)] = Int32(r4);
            r3 = (r5 + 16) | 0;
            heapClassInst.heap32[(g0)] = Int32(r3);
            mallocNew(i7);
            r3 = commonVariable.r_g0;
            if (r3 != 0) {
                r4 = 0;
                r5 = (r3 + 4) | 0;
                r4 = (r4 - r5) | 0;
                r4 = r4 & 15;
                r4 = (r3 + r4) | 0;
                r5 = (r4 + 4) | 0;
                r4 = r4 >> 2;
                heapClassInst.heap32[(r4)] = Int32(r3);
                r3 = r5;
            }
        }
        else {
            r3 = 0;
        }
        r4 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r5 = (r0 + 12) | 0;
        if (r4 < 1) {
            r4 = r5 >> 2;
            r7 = Int64(heapClassInst.heap32[(r4)]);
        }
        else {
            r6 = 0;
            while (true) {
                r7 = r5 >> 2;
                r7 = Int64(heapClassInst.heap32[(r7)]);
                r8 = r6 << 4;
                r9 = Int64(heapClassInst.heapU16[(r7 + r8) >> 1]);
                r10 = (r7 + r8) | 0;
                heapClassInst.heap16[(r3 + r8) >> 1] = Int16(r9);
                r8 = (r3 + r8) | 0;
                r9 = Int64(heapClassInst.heapU16[(r10 + 2) >> 1]);
                heapClassInst.heap16[(r8 + 2) >> 1] = Int16(r9);
                r9 = Int64(heapClassInst.heapU16[(r10 + 4) >> 1]);
                heapClassInst.heap16[(r8 + 4) >> 1] = Int16(r9);
                r9 = Int64(heapClassInst.heapU16[(r10 + 6) >> 1]);
                heapClassInst.heap16[(r8 + 6) >> 1] = Int16(r9);
                r9 = Int64(heapClassInst.heapU16[(r10 + 8) >> 1]);
                heapClassInst.heap16[(r8 + 8) >> 1] = Int16(r9);
                r9 = Int64(heapClassInst.heapU16[(r10 + 10) >> 1]);
                r10 = r10 >> 2;
                heapClassInst.heap16[(r8 + 10) >> 1] = Int16(r9);
                r6 = (r6 + 1) | 0;
                r8 = r8 >> 2;
                r9 = Int64(heapClassInst.heap32[(r10 + 3)]);
                heapClassInst.heap32[(r8 + 3)] = Int32(r9);
                if (!(r4 != r6)) {
                    break 
                }
            }
            r5 = (r0 + 12) | 0;
        }
        if (!(r7 == 0)) {
            r4 = Int64(heapClassInst.heapU8[r0 + 16]);
            if (!(r4 == 0)) {
                r4 = gNumAlignedFree;
                r4 = r4 >> 2;
                r6 = Int64(heapClassInst.heap32[(r4)]);
                r6 = (r6 + 1) | 0;
                r7 = r7 >> 2;
                heapClassInst.heap32[(r4)] = Int32(r6);
                r4 = Int64(heapClassInst.heap32[(r7 + (-1))]);
                heapClassInst.heap32[(g0)] = Int32(r4);
                free(i7);
            }
            r4 = r5 >> 2;
            heapClassInst.heap32[(r4)] = 0;
        }
        r4 = 1;
        r5 = r5 >> 2;
        heapClassInst.heap8[r0 + 16] = Int8(r4);
        heapClassInst.heap32[(r5)] = Int32(r3);
        heapClassInst.heap32[(r2 + 2)] = Int32(r1);
    }
    return;
}
    
func _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0 + 60]);
    if (r1 != 0) {
        r1 = Int64(heapClassInst.heap32[(fp + 2)]);
        r1 = r1 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r1)]);
        r0 = r0 >> 2;
        f1 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
        if (f0 <= f1) {
            f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
            f2 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
            if (f1 <= f2) {
                f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
                f3 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
                if (f2 <= f3) {
                    f3 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
                    if (f0 >= f3) {
                        f4 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
                        if (f1 >= f4) {
                            f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
                            if (f2 >= f5) {
                                r1 = Int64(heapClassInst.heap32[(fp + 1)]);
                                r2 = Int64(heapClassInst.heap32[(fp + 3)]);
                                f2 = f2 - f5;
                                f5 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                                f1 = f1 - f4;
                                f4 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
                                f0 = f0 - f3;
                                f3 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
                                f2 = f2 * f5;
                                f1 = f1 * f4;
                                f0 = f0 * f3;
                                if (r2 == 0) {
                                    r0 = Int64(floor(f0));
                                    r2 = Int64(Int64(floor(f1)));
                                    r0 = r0 & 65534;
                                    r3 = Int64(floor(f2));
                                    r2 = r2 & 65534;
                                    heapClassInst.heap16[(r1) >> 1] = Int16(r0);
                                    r0 = r3 & 65534;
                                }
                                else {
                                    f3 = 1.0;
                                    f0 = f0 + f3;
                                    f1 = f1 + f3;
                                    r0 = Int64(floor(f0));
                                    f0 = f2 + f3;
                                    r2 = Int64(floor(f1));
                                    r0 = r0 | 1;
                                    r3 = Int64(floor(f0));
                                    r2 = r2 | 1;
                                    heapClassInst.heap16[(r1) >> 1] = Int16(r0);
                                    r0 = r3 | 1;
                                }
                                heapClassInst.heap16[(r1 + 2) >> 1] = Int16(r2);
                                heapClassInst.heap16[(r1 + 4) >> 1] = Int16(r0);
                                return;
                            }
                            else {
                                r0 = _E2_str9;
                                r1 = _E2_str313;
                                heapClassInst.heap32[(g0)] = Int32(r0);
                                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                                heapClassInst.heap32[(g0 + 2)] = 361;
                                _assert(i7);
                            }
                        }
                        else {
                            r0 = _E2_str820;
                            r1 = _E2_str313;
                            heapClassInst.heap32[(g0)] = Int32(r0);
                            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                            heapClassInst.heap32[(g0 + 2)] = 360;
                            _assert(i7);
                        }
                    }
                    else {
                        r0 = _E2_str717;
                        r1 = _E2_str313;
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                        heapClassInst.heap32[(g0 + 2)] = 359;
                        _assert(i7);
                    }
                }
                else {
                    r0 = _E2_str616;
                    r1 = _E2_str313;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                    heapClassInst.heap32[(g0 + 2)] = 357;
                    _assert(i7);
                }
            }
            else {
                r0 = _E2_str515;
                r1 = _E2_str313;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = 356;
                _assert(i7);
            }
        }
        else {
            r0 = _E2_str414;
            r1 = _E2_str313;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = 355;
            _assert(i7);
        }
    }
    else {
        r0 = _E2_str212;
        r1 = _E2_str313;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 353;
        _assert(i7);
    }
}

@OverflowWrapping
func _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    if (!(r0 == 0)) {
        r1 = Int64(heapClassInst.heap32[(fp + 1)]);
        r2 = Int64(heapClassInst.heap32[(fp + 2)]);
        r3 = gNumAlignedAllocs;
        r1 = r1 >> 2;
        r3 = r3 >> 2;
        r4 = Int64(heapClassInst.heap32[(r3)]);
        f0 = Float64(heapClassInst.heapFloat[(r1)]);
        f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f2 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
        f5 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
        r1 = (r4 + 1) | 0;
        heapClassInst.heap32[(r3)] = Int32(/*truncatingIfNeeded:*/ r1);
        heapClassInst.heap32[(g0)] = 275;
        mallocNew(i7);
        r1 = commonVariable.r_g0;
        if (r1 != 0) {
            r4 = 0;
            r5 = (r1 + 4) | 0;
            r4 = (r4 - r5) | 0;
            r4 = r4 & 15;
            r4 = (r1 + r4) | 0;
            r5 = (r4 + 4) | 0;
            r4 = r4 >> 2;
            heapClassInst.heap32[(r4)] = Int32(/*truncatingIfNeeded:*/ r1);
            r1 = r5;
        }
        r4 = 1;
        r5 = 64;
        r6 = r1 >> 2;
        heapClassInst.heap32[(r6)] = Int32(/*truncatingIfNeeded:*/ r0);
        while (true) {
            r0 = r4;
            r4 = (r0 + (-1)) | 0;
            r6 = r4 << 2;
            r6 = (r1 + r6) | 0;
            r6 = r6 >> 2;
            r6 = Int64(heapClassInst.heap32[(r6)]);
            r7 = r6 >> 2;
            f6 = Float64(heapClassInst.heapFloat[(r7)]);
            if (f6 <= f3) {
                f6 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                if (!(f6 < f0)) {
                    f6 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                    if (!(f6 > f4)) {
                        f6 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                        if (!(f6 < f1)) {
                            f6 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                            if (!(f6 > f5)) {
                                f6 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                                if (!(f6 < f2)) {
                                    r8 = Int64(heapClassInst.heap32[(r7 + 10)]);
                                    if (r8 == 0) {
                                        r0 = r2 >> 2;
                                        r0 = Int64(heapClassInst.heap32[(r0)]);
                                        r0 = r0 >> 2;
                                        r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
                                        heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r2);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(/*truncatingIfNeeded:*/ r6);
                                        __FUNCTION_TABLE__[(r0) >> 2](i7);
                                    }
                                    else {
                                        r6 = Int64(heapClassInst.heap32[(r7 + 9)]);
                                        if (r5 == r4) {
                                            r8 = 1;
                                            r9 = r4 << 1;
                                            r8 = if (r4 == 0) {r8} else {r9};
                                            if (!(r5 >= r8)) {
                                                if (r8 != 0) {
                                                    r5 = Int64(heapClassInst.heap32[(r3)]);
                                                    r9 = r8 << 2;
                                                    r5 = (r5 + 1) | 0;
                                                    r9 = r9 | 3;
                                                    heapClassInst.heap32[(r3)] = Int32(/*truncatingIfNeeded:*/ r5);
                                                    r5 = (r9 + 16) | 0;
                                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r5);
                                                    mallocNew(i7);
                                                    r9 = commonVariable.r_g0;
                                                    if (r9 != 0) {
                                                        r5 = 0;
                                                        r10 = (r9 + 4) | 0;
                                                        r5 = (r5 - r10) | 0;
                                                        r5 = r5 & 15;
                                                        r5 = (r9 + r5) | 0;
                                                        r10 = (r5 + 4) | 0;
                                                        r5 = r5 >> 2;
                                                        heapClassInst.heap32[(r5)] = Int32(/*truncatingIfNeeded:*/ r9);
                                                        r9 = r10;
                                                    }
                                                }
                                                else {
                                                    r9 = 0;
                                                }
                                                if (!(r4 < 1)) {
                                                    r4 = (r0 + (-1)) | 0;
                                                    r5 = r1;
                                                    r10 = r9;
                                                    while (true) {
                                                        r11 = r5 >> 2;
                                                        r4 = (r4 + (-1)) | 0;
                                                        r12 = (r10 + 4) | 0;
                                                        r5 = (r5 + 4) | 0;
                                                        r10 = r10 >> 2;
                                                        r11 = Int64(heapClassInst.heap32[(r11)]);
                                                        heapClassInst.heap32[(r10)] = Int32(/*truncatingIfNeeded:*/ r11);
                                                        r10 = r12;
                                                        if (!(r4 != 0)) {
                                                            break 
                                                        }
                                                    }
                                                }
                                                if (r1 != 0) {
                                                    r4 = gNumAlignedFree;
                                                    r4 = r4 >> 2;
                                                    r5 = Int64(heapClassInst.heap32[(r4)]);
                                                    r5 = (r5 + 1) | 0;
                                                    r1 = r1 >> 2;
                                                    heapClassInst.heap32[(r4)] = Int32(/*truncatingIfNeeded:*/ r5);
                                                    r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
                                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r1);
                                                    free(i7);
                                                    r5 = r8;
                                                    r1 = r9;
                                                }
                                                else {
                                                    r5 = r8;
                                                    r1 = r9;
                                                }
                                            }
                                        }
                                        r4 = r0 << 2;
                                        r8 = (r1 + r4) | 0;
                                        r8 = r8 >> 2;
                                        heapClassInst.heap32[(r8 + (-1))] = Int32(/*truncatingIfNeeded:*/ r6);
                                        r6 = Int64(heapClassInst.heap32[(r7 + 10)]);
                                        if (r5 == r0) {
                                            r7 = 1;
                                            r8 = r0 << 1;
                                            r7 = if (r0 == 0) {r7} else {r8};
                                            if (!(r5 >= r7)) {
                                                if (r7 != 0) {
                                                    r5 = Int64(heapClassInst.heap32[(r3)]);
                                                    r8 = r7 << 2;
                                                    r5 = (r5 + 1) | 0;
                                                    r8 = r8 | 3;
                                                    heapClassInst.heap32[(r3)] = Int32(/*truncatingIfNeeded:*/ r5);
                                                    r5 = (r8 + 16) | 0;
                                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r5);
                                                    mallocNew(i7);
                                                    r8 = commonVariable.r_g0;
                                                    if (r8 != 0) {
                                                        r5 = 0;
                                                        r9 = (r8 + 4) | 0;
                                                        r5 = (r5 - r9) | 0;
                                                        r5 = r5 & 15;
                                                        r5 = (r8 + r5) | 0;
                                                        r9 = (r5 + 4) | 0;
                                                        r5 = r5 >> 2;
                                                        heapClassInst.heap32[(r5)] = Int32(/*truncatingIfNeeded:*/ r8);
                                                        r8 = r9;
                                                    }
                                                }
                                                else {
                                                    r8 = 0;
                                                }
                                                do {
                                                    if (!(r0 < 1)) {
                                                        r5 = r1;
                                                        r9 = r8;
                                                        r10 = r0;
                                                        while (true) {
                                                            r11 = r5 >> 2;
                                                            r10 = (r10 + (-1)) | 0;
                                                            r12 = (r9 + 4) | 0;
                                                            r5 = (r5 + 4) | 0;
                                                            r9 = r9 >> 2;
                                                            r11 = Int64(heapClassInst.heap32[(r11)]);
                                                            heapClassInst.heap32[(r9)] = Int32(/*truncatingIfNeeded:*/ r11);
                                                            r9 = r12;
                                                            if (!(r10 != 0)) {
                                                                break 
                                                            }
                                                        }
                                                    }
                                                } while (false);
                                                if (r1 != 0) {
                                                    r5 = gNumAlignedFree;
                                                    r5 = r5 >> 2;
                                                    r9 = Int64(heapClassInst.heap32[(r5)]);
                                                    r9 = (r9 + 1) | 0;
                                                    r1 = r1 >> 2;
                                                    heapClassInst.heap32[(r5)] = Int32(/*truncatingIfNeeded:*/ r9);
                                                    r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
                                                    heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r1);
                                                    free(i7);
                                                    r5 = r7;
                                                    r1 = r8;
                                                }
                                                else {
                                                    r5 = r7;
                                                    r1 = r8;
                                                }
                                            }
                                        }
                                        r7 = (r1 + r4) | 0;
                                        r4 = (r0 + 1) | 0;
                                        r0 = r7 >> 2;
                                        heapClassInst.heap32[(r0)] = Int32(/*truncatingIfNeeded:*/ r6);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (!(r4 > 0)) {
                break 
            }
        }
        if (!(r1 == 0)) {
            r0 = gNumAlignedFree;
            r0 = r0 >> 2;
            r2 = Int64(heapClassInst.heap32[(r0)]);
            r2 = (r2 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r0)] = Int32(/*truncatingIfNeeded:*/ r2);
            r0 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(/*truncatingIfNeeded:*/ r0);
            free(i7);
        }
    }
    return;
}
    
func _ZNK14btQuantizedBvh9serializeEPvjb(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 38)]);
    r3 = Int64(heapClassInst.heap32[(r1 + 42)]);
    if (r3 == r2) {
        r3 = Int64(heapClassInst.heap32[(fp + 1)]);
        r4 = Int64(heapClassInst.heap32[(fp + 3)]);
        r5 = _ZTV14btQuantizedBvh;
        r6 = r3 >> 2;
        r5 = (r5 + 8) | 0;
        heapClassInst.heap32[(r1 + 42)] = Int32(r2);
        heapClassInst.heap32[(r6)] = Int32(r5);
        r2 = 0;
        heapClassInst.heap32[(r6 + 13)] = 277;
        r5 = 1;
        heapClassInst.heap8[r3 + 60] = Int8(r2);
        heapClassInst.heap8[r3 + 80] = Int8(r5);
        heapClassInst.heap32[(r6 + 19)] = 0;
        heapClassInst.heap32[(r6 + 17)] = 0;
        heapClassInst.heap32[(r6 + 18)] = 0;
        heapClassInst.heap8[r3 + 100] = Int8(r5);
        heapClassInst.heap32[(r6 + 24)] = 0;
        heapClassInst.heap32[(r6 + 22)] = 0;
        heapClassInst.heap32[(r6 + 23)] = 0;
        heapClassInst.heap8[r3 + 120] = Int8(r5);
        heapClassInst.heap32[(r6 + 29)] = 0;
        heapClassInst.heap32[(r6 + 27)] = 0;
        heapClassInst.heap32[(r6 + 28)] = 0;
        heapClassInst.heap8[r3 + 140] = Int8(r5);
        heapClassInst.heap32[(r6 + 34)] = 0;
        heapClassInst.heap32[(r6 + 32)] = 0;
        heapClassInst.heap32[(r6 + 33)] = 0;
        heapClassInst.heap32[(r6 + 36)] = 0;
        heapClassInst.heap8[r3 + 164] = Int8(r5);
        heapClassInst.heap32[(r6 + 40)] = 0;
        heapClassInst.heap32[(r6 + 38)] = 0;
        heapClassInst.heap32[(r6 + 39)] = 0;
        heapClassInst.heap32[(r6 + 42)] = 0;
        heapClassInst.heap32[(r6 + 1)] = (-8388609);
        heapClassInst.heap32[(r6 + 2)] = (-8388609);
        heapClassInst.heap32[(r6 + 3)] = (-8388609);
        heapClassInst.heap32[(r6 + 4)] = 0;
        heapClassInst.heap32[(r6 + 5)] = 2139095039;
        heapClassInst.heap32[(r6 + 6)] = 2139095039;
        heapClassInst.heap32[(r6 + 7)] = 2139095039;
        heapClassInst.heap32[(r6 + 8)] = 0;
        r7 = Int64(heapClassInst.heap32[(r1 + 14)]);
        if (r4 == 0) {
            heapClassInst.heap32[(r6 + 14)] = Int32(r7);
            heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(r1 + 1)];
            heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r1 + 2)];
            heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r1 + 3)];
            heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r1 + 4)];
            heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r1 + 5)];
            heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r1 + 6)];
            heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r1 + 7)];
            heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r1 + 8)];
            heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r1 + 9)];
            heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r1 + 10)];
            heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r1 + 11)];
            heapClassInst.heap32[(r6 + 12)] = heapClassInst.heap32[(r1 + 12)];
            r7 = Int64(heapClassInst.heap32[(r1 + 36)]);
            heapClassInst.heap32[(r6 + 36)] = Int32(r7);
            r7 = Int64(heapClassInst.heap32[(r1 + 42)]);
        }
        else {
            r8 = r7 << 8;
            r9 = r7 >> 8;
            r10 = r7 << 24;
            r8 = r8 & 16711680;
            r9 = r9 & 65280;
            r7 = r7 >> 24;
            r8 = r10 | r8;
            r7 = r9 | r7;
            r7 = r8 | r7;
            heapClassInst.heap32[(r6 + 14)] = Int32(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 7]);
            heapClassInst.heap8[r3 + 4] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 6]);
            heapClassInst.heap8[r3 + 5] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 5]);
            heapClassInst.heap8[r3 + 6] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 4]);
            heapClassInst.heap8[r3 + 7] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 11]);
            heapClassInst.heap8[r3 + 8] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 10]);
            heapClassInst.heap8[r3 + 9] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 9]);
            heapClassInst.heap8[r3 + 10] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 8]);
            heapClassInst.heap8[r3 + 11] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 15]);
            heapClassInst.heap8[r3 + 12] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 14]);
            heapClassInst.heap8[r3 + 13] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 13]);
            heapClassInst.heap8[r3 + 14] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 12]);
            heapClassInst.heap8[r3 + 15] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 19]);
            heapClassInst.heap8[r3 + 16] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 18]);
            heapClassInst.heap8[r3 + 17] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 17]);
            heapClassInst.heap8[r3 + 18] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 16]);
            heapClassInst.heap8[r3 + 19] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 23]);
            heapClassInst.heap8[r3 + 20] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 22]);
            heapClassInst.heap8[r3 + 21] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 21]);
            heapClassInst.heap8[r3 + 22] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 20]);
            heapClassInst.heap8[r3 + 23] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 27]);
            heapClassInst.heap8[r3 + 24] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 26]);
            heapClassInst.heap8[r3 + 25] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 25]);
            heapClassInst.heap8[r3 + 26] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 24]);
            heapClassInst.heap8[r3 + 27] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 31]);
            heapClassInst.heap8[r3 + 28] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 30]);
            heapClassInst.heap8[r3 + 29] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 29]);
            heapClassInst.heap8[r3 + 30] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 28]);
            heapClassInst.heap8[r3 + 31] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 35]);
            heapClassInst.heap8[r3 + 32] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 34]);
            heapClassInst.heap8[r3 + 33] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 33]);
            heapClassInst.heap8[r3 + 34] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 32]);
            heapClassInst.heap8[r3 + 35] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 39]);
            heapClassInst.heap8[r3 + 36] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 38]);
            heapClassInst.heap8[r3 + 37] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 37]);
            heapClassInst.heap8[r3 + 38] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 36]);
            heapClassInst.heap8[r3 + 39] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 43]);
            heapClassInst.heap8[r3 + 40] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 42]);
            heapClassInst.heap8[r3 + 41] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 41]);
            heapClassInst.heap8[r3 + 42] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 40]);
            heapClassInst.heap8[r3 + 43] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 47]);
            heapClassInst.heap8[r3 + 44] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 46]);
            heapClassInst.heap8[r3 + 45] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 45]);
            heapClassInst.heap8[r3 + 46] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 44]);
            heapClassInst.heap8[r3 + 47] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 51]);
            heapClassInst.heap8[r3 + 48] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 50]);
            heapClassInst.heap8[r3 + 49] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 49]);
            heapClassInst.heap8[r3 + 50] = Int8(r7);
            r7 = Int64(heapClassInst.heapU8[r0 + 48]);
            heapClassInst.heap8[r3 + 51] = Int8(r7);
            r7 = Int64(heapClassInst.heap32[(r1 + 36)]);
            r8 = r7 << 8;
            r9 = r7 >> 8;
            r10 = r7 << 24;
            r8 = r8 & 16711680;
            r9 = r9 & 65280;
            r7 = r7 >> 24;
            r8 = r10 | r8;
            r7 = r9 | r7;
            r7 = r8 | r7;
            heapClassInst.heap32[(r6 + 36)] = Int32(r7);
            r7 = Int64(heapClassInst.heap32[(r1 + 42)]);
            r8 = r7 << 8;
            r9 = r7 >> 8;
            r10 = r7 << 24;
            r8 = r8 & 16711680;
            r9 = r9 & 65280;
            r7 = r7 >> 24;
            r8 = r10 | r8;
            r7 = r9 | r7;
            r7 = r8 | r7;
        }
        heapClassInst.heap32[(r6 + 42)] = Int32(r7);
        r7 = Int64(heapClassInst.heapU8[r0 + 60]);
        heapClassInst.heap8[r3 + 60] = Int8(r7);
        r7 = (r3 + 172) | 0;
        r8 = Int64(heapClassInst.heap32[(r1 + 14)]);
        r0 = Int64(heapClassInst.heapU8[r0 + 60]);
        if (r0 == 0) {
            r0 = 0;
            heapClassInst.heap8[r3 + 100] = Int8(r0);
            heapClassInst.heap32[(r6 + 24)] = Int32(r7);
            heapClassInst.heap32[(r6 + 22)] = Int32(r8);
            heapClassInst.heap32[(r6 + 23)] = Int32(r8);
            do  {
                if (r4 != 0) {
                    if (!(r8 < 1)) {
                        r5 = (r5 - r8) | 0;
                        while (true) {
                            r2 = r0 << 6;
                            r9 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r9 = (r9 - r2) | 0;
                            r10 = Int64(heapClassInst.heapU8[r9 + 3]);
                            r7 = (r7 - r2) | 0;
                            heapClassInst.heap8[r7] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 2]);
                            heapClassInst.heap8[r7 + 1] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 1]);
                            heapClassInst.heap8[r7 + 2] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9]);
                            heapClassInst.heap8[r7 + 3] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 7]);
                            heapClassInst.heap8[r7 + 4] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 6]);
                            heapClassInst.heap8[r7 + 5] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 5]);
                            heapClassInst.heap8[r7 + 6] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 4]);
                            heapClassInst.heap8[r7 + 7] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 11]);
                            heapClassInst.heap8[r7 + 8] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 10]);
                            heapClassInst.heap8[r7 + 9] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 9]);
                            heapClassInst.heap8[r7 + 10] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 8]);
                            heapClassInst.heap8[r7 + 11] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 15]);
                            heapClassInst.heap8[r7 + 12] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 14]);
                            heapClassInst.heap8[r7 + 13] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r9 + 13]);
                            heapClassInst.heap8[r7 + 14] = Int8(r10);
                            r9 = Int64(heapClassInst.heapU8[r9 + 12]);
                            heapClassInst.heap8[r7 + 15] = Int8(r9);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r10 = Int64(heapClassInst.heapU8[r7 + 19]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap8[r9 + 16] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 18]);
                            heapClassInst.heap8[r9 + 17] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 17]);
                            heapClassInst.heap8[r9 + 18] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 16]);
                            heapClassInst.heap8[r9 + 19] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 23]);
                            heapClassInst.heap8[r9 + 20] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 22]);
                            heapClassInst.heap8[r9 + 21] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 21]);
                            heapClassInst.heap8[r9 + 22] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 20]);
                            heapClassInst.heap8[r9 + 23] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 27]);
                            heapClassInst.heap8[r9 + 24] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 26]);
                            heapClassInst.heap8[r9 + 25] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 25]);
                            heapClassInst.heap8[r9 + 26] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 24]);
                            heapClassInst.heap8[r9 + 27] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 31]);
                            heapClassInst.heap8[r9 + 28] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 30]);
                            heapClassInst.heap8[r9 + 29] = Int8(r10);
                            r10 = Int64(heapClassInst.heapU8[r7 + 29]);
                            heapClassInst.heap8[r9 + 30] = Int8(r10);
                            r7 = Int64(heapClassInst.heapU8[r7 + 28]);
                            heapClassInst.heap8[r9 + 31] = Int8(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r7 = Int64(heapClassInst.heap32[(r7 + 8)]);
                            r9 = r7 << 8;
                            r10 = r7 >> 8;
                            r11 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r12 = r7 << 24;
                            r9 = r9 & 16711680;
                            r10 = r10 & 65280;
                            r7 = r7 >> 24;
                            r11 = (r11 - r2) | 0;
                            r9 = r12 | r9;
                            r7 = r10 | r7;
                            r10 = r11 >> 2;
                            r7 = r9 | r7;
                            heapClassInst.heap32[(r10 + 8)] = Int32(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r7 = Int64(heapClassInst.heap32[(r7 + 9)]);
                            r9 = r7 << 8;
                            r10 = r7 >> 8;
                            r11 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r12 = r7 << 24;
                            r9 = r9 & 16711680;
                            r10 = r10 & 65280;
                            r7 = r7 >> 24;
                            r11 = (r11 - r2) | 0;
                            r9 = r12 | r9;
                            r7 = r10 | r7;
                            r10 = r11 >> 2;
                            r7 = r9 | r7;
                            heapClassInst.heap32[(r10 + 9)] = Int32(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r7 = Int64(heapClassInst.heap32[(r7 + 10)]);
                            r9 = r7 << 8;
                            r10 = r7 >> 8;
                            r11 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r12 = r7 << 24;
                            r9 = r9 & 16711680;
                            r10 = r10 & 65280;
                            r7 = r7 >> 24;
                            r2 = (r11 - r2) | 0;
                            r9 = r12 | r9;
                            r7 = r10 | r7;
                            r2 = r2 >> 2;
                            r7 = r9 | r7;
                            heapClassInst.heap32[(r2 + 10)] = Int32(r7);
                            if (r5 == r0) {
                                break 
                            }
                            else {
                                r7 = Int64(heapClassInst.heap32[(r6 + 24)]);
                                r0 = (r0 + (-1)) | 0;
                            }
                        }
                    }
                }
                else {
                    if (r8 > 0) {
                        r5 = (r5 - r8) | 0;
                        r0 = 0;
                        while (true) {
                            r2 = r0 << 6;
                            r9 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r9 = (r9 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = r9 >> 2;
                            heapClassInst.heap32[(r7)] = heapClassInst.heap32[(r9)];
                            heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r9 + 1)];
                            heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r9 + 2)];
                            heapClassInst.heap32[(r7 + 3)] = heapClassInst.heap32[(r9 + 3)];
                            r7 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r9 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r9 = (r9 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = r9 >> 2;
                            heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r9 + 4)];
                            heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r9 + 5)];
                            heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r9 + 6)];
                            heapClassInst.heap32[(r7 + 7)] = heapClassInst.heap32[(r9 + 7)];
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r9 = (r9 - r2) | 0;
                            r7 = Int64(heapClassInst.heap32[(r7 + 8)]);
                            r9 = r9 >> 2;
                            heapClassInst.heap32[(r9 + 8)] = Int32(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r9 = (r9 - r2) | 0;
                            r7 = Int64(heapClassInst.heap32[(r7 + 9)]);
                            r9 = r9 >> 2;
                            heapClassInst.heap32[(r9 + 9)] = Int32(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 24)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)]);
                            r2 = (r9 - r2) | 0;
                            r7 = Int64(heapClassInst.heap32[(r7 + 10)]);
                            r2 = r2 >> 2;
                            heapClassInst.heap32[(r2 + 10)] = Int32(r7);
                            if (r5 == r0) {
                                break 
                            }
                            else {
                                r7 = Int64(heapClassInst.heap32[(r6 + 24)]);
                                r0 = (r0 + (-1)) | 0;
                            }
                        }
                    }
                }
            } while (false);
            r5 = Int64(heapClassInst.heap32[(r6 + 24)]);
            if (!(r5 == 0)) {
                r0 = Int64(heapClassInst.heapU8[r3 + 100]);
                if (!(r0 == 0)) {
                    r0 = gNumAlignedFree;
                    r0 = r0 >> 2;
                    r2 = Int64(heapClassInst.heap32[(r0)]);
                    r2 = (r2 + 1) | 0;
                    r5 = r5 >> 2;
                    heapClassInst.heap32[(r0)] = Int32(r2);
                    r5 = Int64(heapClassInst.heap32[(r5 + (-1))]);
                    heapClassInst.heap32[(g0)] = Int32(r5);
                    free(i7);
                }
                heapClassInst.heap32[(r6 + 24)] = 0;
            }
            r5 = r8 << 6;
            r0 = 0;
            heapClassInst.heap8[r3 + 100] = Int8(r0);
            heapClassInst.heap32[(r6 + 24)] = 0;
            heapClassInst.heap32[(r6 + 22)] = 0;
            heapClassInst.heap32[(r6 + 23)] = 0;
        }
        else {
            heapClassInst.heap8[r3 + 140] = Int8(r2);
            heapClassInst.heap32[(r6 + 34)] = Int32(r7);
            heapClassInst.heap32[(r6 + 32)] = Int32(r8);
            heapClassInst.heap32[(r6 + 33)] = Int32(r8);
            do {
                if (r4 != 0) {
                    if (!(r8 < 1)) {
                        r5 = (r5 - r8) | 0;
                        while (true) {
                            r0 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r9 = r2 << 4;
                            r0 = (r0 - r9) | 0;
                            r0 = Int64(heapClassInst.heapU16[(r0) >> 1]);
                            r10 = r0 << 8;
                            r0 = r0 << 24;
                            r10 = r10 & 16711680;
                            r0 = r0 | r10;
                            r7 = (r7 - r9) | 0;
                            r0 = r0 >> 16;
                            heapClassInst.heap16[(r7) >> 1] = Int16(r0);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = Int64(heapClassInst.heapU16[(r7 + 2) >> 1]);
                            r0 = r7 << 8;
                            r7 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = r7 | r0;
                            r0 = (r10 - r9) | 0;
                            r7 = r7 >> 16;
                            heapClassInst.heap16[(r0 + 2) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = Int64(heapClassInst.heapU16[(r7 + 4) >> 1]);
                            r0 = r7 << 8;
                            r7 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = r7 | r0;
                            r0 = (r10 - r9) | 0;
                            r7 = r7 >> 16;
                            heapClassInst.heap16[(r0 + 4) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1]);
                            r0 = r7 << 8;
                            r7 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = r7 | r0;
                            r0 = (r10 - r9) | 0;
                            r7 = r7 >> 16;
                            heapClassInst.heap16[(r0 + 6) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = Int64(heapClassInst.heapU16[(r7 + 8) >> 1]);
                            r0 = r7 << 8;
                            r7 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = r7 | r0;
                            r0 = (r10 - r9) | 0;
                            r7 = r7 >> 16;
                            heapClassInst.heap16[(r0 + 8) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = Int64(heapClassInst.heapU16[(r7 + 10) >> 1]);
                            r0 = r7 << 8;
                            r7 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = r7 | r0;
                            r0 = (r10 - r9) | 0;
                            r7 = r7 >> 16;
                            heapClassInst.heap16[(r0 + 10) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r9) | 0;
                            r7 = r7 >> 2;
                            r7 = Int64(heapClassInst.heap32[(r7 + 3)]);
                            r0 = r7 << 8;
                            r10 = r7 >> 8;
                            r11 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r12 = r7 << 24;
                            r0 = r0 & 16711680;
                            r10 = r10 & 65280;
                            r7 = r7 >> 24;
                            r9 = (r11 - r9) | 0;
                            r0 = r12 | r0;
                            r7 = r10 | r7;
                            r9 = r9 >> 2;
                            r7 = r0 | r7;
                            heapClassInst.heap32[(r9 + 3)] = Int32(r7);
                            if (r5 == r2) {
                                break 
                            }
                            else {
                                r7 = Int64(heapClassInst.heap32[(r6 + 34)]);
                                r2 = (r2 + (-1)) | 0;
                            }
                        }
                    }
                }
                else {
                    if (r8 > 0) {
                        r5 = (r5 - r8) | 0;
                        r0 = 0;
                        while (true) {
                            r2 = r0 << 4;
                            r9 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r9 = (r9 - r2) | 0;
                            r9 = Int64(heapClassInst.heapU16[(r9) >> 1]);
                            r7 = (r7 - r2) | 0;
                            heapClassInst.heap16[(r7) >> 1] = Int16(r9);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = Int64(heapClassInst.heapU16[(r7 + 2) >> 1]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap16[(r9 + 2) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = Int64(heapClassInst.heapU16[(r7 + 4) >> 1]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap16[(r9 + 4) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = Int64(heapClassInst.heapU16[(r7 + 6) >> 1]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap16[(r9 + 6) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = Int64(heapClassInst.heapU16[(r7 + 8) >> 1]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap16[(r9 + 8) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r7 = Int64(heapClassInst.heapU16[(r7 + 10) >> 1]);
                            r9 = (r9 - r2) | 0;
                            heapClassInst.heap16[(r9 + 10) >> 1] = Int16(r7);
                            r7 = Int64(heapClassInst.heap32[(r1 + 34)]);
                            r7 = (r7 - r2) | 0;
                            r7 = r7 >> 2;
                            r9 = Int64(heapClassInst.heap32[(r6 + 34)]);
                            r2 = (r9 - r2) | 0;
                            r7 = Int64(heapClassInst.heap32[(r7 + 3)]);
                            r2 = r2 >> 2;
                            heapClassInst.heap32[(r2 + 3)] = Int32(r7);
                            if (r5 == r0) {
                                break 
                            }
                            else {
                                r7 = Int64(heapClassInst.heap32[(r6 + 34)]);
                                r0 = (r0 + (-1)) | 0;
                            }
                        }
                    }
                }
            } while (false);
            r5 = Int64(heapClassInst.heap32[(r6 + 34)]);
            if (!(r5 == 0)) {
                r7 = Int64(heapClassInst.heapU8[r3 + 140]);
                if (!(r7 == 0)) {
                    r7 = gNumAlignedFree;
                    r7 = r7 >> 2;
                    r0 = Int64(heapClassInst.heap32[(r7)]);
                    r0 = (r0 + 1) | 0;
                    r5 = r5 >> 2;
                    heapClassInst.heap32[(r7)] = Int32(r0);
                    r5 = Int64(heapClassInst.heap32[(r5 + (-1))]);
                    heapClassInst.heap32[(g0)] = Int32(r5);
                    free(i7);
                }
                heapClassInst.heap32[(r6 + 34)] = 0;
            }
            r5 = r8 << 4;
            r7 = 0;
            heapClassInst.heap8[r3 + 140] = Int8(r7);
            heapClassInst.heap32[(r6 + 34)] = 0;
            heapClassInst.heap32[(r6 + 32)] = 0;
            heapClassInst.heap32[(r6 + 33)] = 0;
        }
        r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
        r2 = Int64(heapClassInst.heap32[(r1 + 42)]);
        if (!(r0 == 0)) {
            r7 = Int64(heapClassInst.heapU8[r3 + 164]);
            if (!(r7 == 0)) {
                r7 = gNumAlignedFree;
                r7 = r7 >> 2;
                r8 = Int64(heapClassInst.heap32[(r7)]);
                r8 = (r8 + 1) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r7)] = Int32(r8);
                r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
                heapClassInst.heap32[(g0)] = Int32(r0);
                free(i7);
            }
            heapClassInst.heap32[(r6 + 40)] = 0;
        }
        r0 = (r5 + r3) | 0;
        r0 = (r0 + 172) | 0;
        r5 = 0;
        heapClassInst.heap8[r3 + 164] = Int8(r5);
        heapClassInst.heap32[(r6 + 40)] = Int32(r0);
        heapClassInst.heap32[(r6 + 38)] = Int32(r2);
        heapClassInst.heap32[(r6 + 39)] = Int32(r2);
        r2 = Int64(heapClassInst.heap32[(r1 + 42)]);
        do {
            if (r4 != 0) {
                if (!(r2 < 1)) {
                    __label__ = 41;
                    while (true) {
                        r2 = r5 << 5;
                        r4 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r4 = Int64(heapClassInst.heapU16[(r4 + r2) >> 1]);
                        r7 = r4 << 8;
                        r4 = r4 << 24;
                        r7 = r7 & 16711680;
                        r4 = r4 | r7;
                        r4 = r4 >> 16;
                        heapClassInst.heap16[(r0 + r2) >> 1] = Int16(r4);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = Int64(heapClassInst.heapU16[(r0 + 2) >> 1]);
                        r4 = r0 << 8;
                        r0 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = r0 | r4;
                        r4 = (r7 + r2) | 0;
                        r0 = r0 >> 16;
                        heapClassInst.heap16[(r4 + 2) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
                        r4 = r0 << 8;
                        r0 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = r0 | r4;
                        r4 = (r7 + r2) | 0;
                        r0 = r0 >> 16;
                        heapClassInst.heap16[(r4 + 4) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
                        r4 = r0 << 8;
                        r0 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = r0 | r4;
                        r4 = (r7 + r2) | 0;
                        r0 = r0 >> 16;
                        heapClassInst.heap16[(r4 + 6) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = Int64(heapClassInst.heapU16[(r0 + 8) >> 1]);
                        r4 = r0 << 8;
                        r0 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = r0 | r4;
                        r4 = (r7 + r2) | 0;
                        r0 = r0 >> 16;
                        heapClassInst.heap16[(r4 + 8) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = Int64(heapClassInst.heapU16[(r0 + 10) >> 1]);
                        r4 = r0 << 8;
                        r0 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = r0 | r4;
                        r4 = (r7 + r2) | 0;
                        r0 = r0 >> 16;
                        heapClassInst.heap16[(r4 + 10) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = r0 >> 2;
                        r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
                        r4 = r0 << 8;
                        r7 = r0 >> 8;
                        r8 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r9 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = r7 & 65280;
                        r0 = r0 >> 24;
                        r8 = (r8 + r2) | 0;
                        r4 = r9 | r4;
                        r0 = r7 | r0;
                        r7 = r8 >> 2;
                        r0 = r4 | r0;
                        heapClassInst.heap32[(r7 + 3)] = Int32(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r2) | 0;
                        r0 = r0 >> 2;
                        r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
                        r4 = r0 << 8;
                        r7 = r0 >> 8;
                        r8 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r9 = r0 << 24;
                        r4 = r4 & 16711680;
                        r7 = r7 & 65280;
                        r0 = r0 >> 24;
                        r2 = (r8 + r2) | 0;
                        r4 = r9 | r4;
                        r0 = r7 | r0;
                        r5 = (r5 + 1) | 0;
                        r2 = r2 >> 2;
                        r0 = r4 | r0;
                        heapClassInst.heap32[(r2 + 4)] = Int32(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 42)]);
                        if (r0 <= r5) {
                            break 
                        }
                        else {
                            r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        }
                    }
                }
            }
            else {
                if (r2 > 0) {
                    r2 = 0;
                    while (true) {
                        r4 = r2 << 5;
                        r5 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r5 = Int64(heapClassInst.heapU16[(r5 + r4) >> 1]);
                        heapClassInst.heap16[(r0 + r4) >> 1] = Int16(r5);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = Int64(heapClassInst.heapU16[(r0 + 2) >> 1]);
                        r5 = (r5 + r4) | 0;
                        heapClassInst.heap16[(r5 + 2) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
                        r5 = (r5 + r4) | 0;
                        heapClassInst.heap16[(r5 + 4) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
                        r5 = (r5 + r4) | 0;
                        heapClassInst.heap16[(r5 + 6) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = Int64(heapClassInst.heapU16[(r0 + 8) >> 1]);
                        r5 = (r5 + r4) | 0;
                        heapClassInst.heap16[(r5 + 8) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = Int64(heapClassInst.heapU16[(r0 + 10) >> 1]);
                        r5 = (r5 + r4) | 0;
                        heapClassInst.heap16[(r5 + 10) >> 1] = Int16(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r0 = r0 >> 2;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r5 = (r5 + r4) | 0;
                        r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
                        r5 = r5 >> 2;
                        heapClassInst.heap32[(r5 + 3)] = Int32(r0);
                        r0 = Int64(heapClassInst.heap32[(r1 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r0 = r0 >> 2;
                        r5 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r5 = (r5 + r4) | 0;
                        r0 = Int64(heapClassInst.heap32[(r0 + 4)]);
                        r5 = r5 >> 2;
                        heapClassInst.heap32[(r5 + 4)] = Int32(r0);
                        r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r0 = r0 >> 2;
                        heapClassInst.heap32[(r0 + 5)] = 0;
                        r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r0 = r0 >> 2;
                        heapClassInst.heap32[(r0 + 6)] = 0;
                        r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        r0 = (r0 + r4) | 0;
                        r2 = (r2 + 1) | 0;
                        r0 = r0 >> 2;
                        heapClassInst.heap32[(r0 + 7)] = 0;
                        r0 = Int64(heapClassInst.heap32[(r1 + 42)]);
                        if (r0 <= r2) {
                            break 
                        }
                        else {
                            r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
                        }
                    }
                }
            }
        } while (false);
        r0 = Int64(heapClassInst.heap32[(r6 + 40)]);
        if (!(r0 == 0)) {
            r1 = Int64(heapClassInst.heapU8[r3 + 164]);
            if (!(r1 == 0)) {
                r1 = gNumAlignedFree;
                r1 = r1 >> 2;
                r2 = Int64(heapClassInst.heap32[(r1)]);
                r2 = (r2 + 1) | 0;
                r0 = r0 >> 2;
                heapClassInst.heap32[(r1)] = Int32(r2);
                r0 = Int64(heapClassInst.heap32[(r0 + (-1))]);
                heapClassInst.heap32[(g0)] = Int32(r0);
                free(i7);
            }
            heapClassInst.heap32[(r6 + 40)] = 0;
        }
        r0 = 0;
        heapClassInst.heap8[r3 + 164] = Int8(r0);
        heapClassInst.heap32[(r6 + 40)] = 0;
        heapClassInst.heap32[(r6 + 38)] = 0;
        heapClassInst.heap32[(r6 + 39)] = 0;
        heapClassInst.heap32[(r6)] = 0;
        r0 = 1;
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        r0 = _E2_str638;
        r1 = _E2_str537;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 847;
        _assert(i7);
    }
}
    
func _Z15btTransformAabbRK9btVector3S1_fRK11btTransformRS_S5_(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r0 = r0 >> 2;
    r1 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r0)]);
    f1 = Float64(heapClassInst.heapFloat[(r1)]);
    if (f0 <= f1) {
        f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        if (f2 <= f3) {
            f4 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
            f5 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
            if (f4 <= f5) {
                f6 = Float64(heapClassInst.heapFloat[(fp + 2)]);
                r0 = Int64(heapClassInst.heap32[(fp + 3)]);
                r1 = Int64(heapClassInst.heap32[(fp + 4)]);
                r2 = Int64(heapClassInst.heap32[(fp + 5)]);
                f7 = f1 - f0;
                f8 = 0.5;
                f9 = f3 - f2;
                f10 = f5 - f4;
                r0 = r0 >> 2;
                f4 = f5 + f4;
                f2 = f3 + f2;
                f0 = f1 + f0;
                f1 = f7 * f8;
                f3 = f9 * f8;
                f5 = f10 * f8;
                f7 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
                f1 = f1 + f6;
                f3 = f3 + f6;
                f5 = f5 + f6;
                f4 = f4 * f8;
                f2 = f2 * f8;
                f0 = f0 * f8;
                f6 = 0.0;
                if (f7 < f6) {
                    f8 = -f7;
                }
                else {
                    f8 = f7;
                }
                f9 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
                if (f9 < f6) {
                    f10 = -f9;
                }
                else {
                    f10 = f9;
                }
                f11 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
                if (f11 < f6) {
                    f12 = -f11;
                }
                else {
                    f12 = f11;
                }
                f13 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
                if (f13 < f6) {
                    f14 = -f13;
                }
                else {
                    f14 = f13;
                }
                f15 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
                if (f15 < f6) {
                    f16 = -f15;
                }
                else {
                    f16 = f15;
                }
                f17 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
                if (f17 < f6) {
                    f18 = -f17;
                }
                else {
                    f18 = f17;
                }
                f19 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
                if (f19 < f6) {
                    f20 = -f19;
                }
                else {
                    f20 = f19;
                }
                f21 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
                if (f21 < f6) {
                    f22 = -f21;
                }
                else {
                    f22 = f21;
                }
                f23 = Float64(heapClassInst.heapFloat[(r0)]);
                if (f23 < f6) {
                    f6 = -f23;
                }
                else {
                    f6 = f23;
                }
                f23 = f23 * f0;
                f21 = f21 * f2;
                f17 = f17 * f0;
                f15 = f15 * f2;
                f21 = f23 + f21;
                f19 = f19 * f4;
                f6 = f6 * f1;
                f22 = f22 * f3;
                f0 = f11 * f0;
                f2 = f9 * f2;
                f9 = f17 + f15;
                f11 = f13 * f4;
                f13 = f18 * f1;
                f15 = f16 * f3;
                f16 = f21 + f19;
                f17 = Float64(heapClassInst.heapFloat[(r0 + 12)]);
                f6 = f6 + f22;
                f18 = f20 * f5;
                f0 = f0 + f2;
                f2 = f7 * f4;
                f1 = f12 * f1;
                f3 = f10 * f3;
                f4 = f9 + f11;
                f7 = Float64(heapClassInst.heapFloat[(r0 + 13)]);
                f9 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
                f10 = f13 + f15;
                f11 = f14 * f5;
                f12 = f16 + f17;
                f6 = f6 + f18;
                f0 = f0 + f2;
                r0 = r1 >> 2;
                f1 = f1 + f3;
                f2 = f8 * f5;
                f3 = f4 + f7;
                f4 = f10 + f11;
                f5 = f12 - f6;
                f0 = f0 + f9;
                f1 = f1 + f2;
                f2 = f3 - f4;
                heapClassInst.heapFloat[(r0)] = Float32(f5);
                f5 = f0 - f1;
                heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
                heapClassInst.heapFloat[(r0 + 2)] = Float32(f5);
                r1 = r2 >> 2;
                f2 = f12 + f6;
                heapClassInst.heap32[(r0 + 3)] = 0;
                f3 = f3 + f4;
                heapClassInst.heapFloat[(r1)] = Float32(f2);
                f0 = f0 + f1;
                heapClassInst.heapFloat[(r1 + 1)] = Float32(f3);
                heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
                heapClassInst.heap32[(r1 + 3)] = 0;
                return;
            }
            else {
                r0 = _E2_str5104;
                r1 = _E2_str3102;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = 199;
                _assert(i7);
            }
        }
        else {
            r0 = _E2_str4103;
            r1 = _E2_str3102;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = 198;
            _assert(i7);
        }
    }
    else {
        r0 = _E2_str2101;
        r1 = _E2_str3102;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 197;
        _assert(i7);
    }
}
    
func _ZN14btQuantizedBvh9buildTreeEii(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var r21: Int64 = 0
    var r22: Int64 = 0
    var r23: Int64 = 0
    var r24: Int64 = 0
    var r25: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-112);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp + 2)]);
    r2 = (r1 - r0) | 0;
    if (r2 > 0) {
        r3 = Int64(heapClassInst.heap32[(fp)]);
        r4 = r3 >> 2;
        r5 = Int64(heapClassInst.heap32[(r4 + 14)]);
        if (r2 != 1) {
            do {
                if (r0 < r1) {
                    r6 = Int64(heapClassInst.heapU8[r3 + 60]);
                    f1 = 0.0;
                    r7 = r0;
                    f2 = f1;
                    f3 = f1;
                    while (true) {
                        r8 = r6 & 255;
                        if (r8 == 0) {
                            r9 = Int64(heapClassInst.heap32[(r4 + 19)]);
                            r10 = r7 << 6;
                            r9 = (r9 + r10) | 0;
                            r9 = r9 >> 2;
                            f0 = Float64(heapClassInst.heapFloat[(r9)]);
                            f5 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
                            f8 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
                            f4 = Float64(heapClassInst.heapFloat[(r9 + 4)]);
                            f6 = Float64(heapClassInst.heapFloat[(r9 + 5)]);
                            f7 = Float64(heapClassInst.heapFloat[(r9 + 6)]);
                        }
                        else {
                            r9 = Int64(heapClassInst.heap32[(r4 + 29)]);
                            r10 = r7 << 4;
                            r11 = (r9 + r10) | 0;
                            r9 = Int64(heapClassInst.heapU16[(r9 + r10) >> 1]);
                            r10 = Int64(heapClassInst.heapU16[(r11 + 2) >> 1]);
                            r12 = Int64(heapClassInst.heapU16[(r11 + 4) >> 1]);
                            r13 = Int64(heapClassInst.heapU16[(r11 + 6) >> 1]);
                            r14 = Int64(heapClassInst.heapU16[(r11 + 8) >> 1]);
                            r11 = Int64(heapClassInst.heapU16[(r11 + 10) >> 1]);
                            f0 = Float64(`UIntNative`(r9));
                            f4 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                            f5 = Float64(`UIntNative`(r13));
                            f6 = Float64(`UIntNative`(r10));
                            f7 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                            f8 = Float64(`UIntNative`(r14));
                            f9 = Float64(`UIntNative`(r12));
                            f10 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
                            f11 = Float64(`UIntNative`(r11));
                            f0 = f0 / f4;
                            f12 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                            f4 = f5 / f4;
                            f5 = f6 / f7;
                            f6 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                            f7 = f8 / f7;
                            f8 = f9 / f10;
                            f9 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
                            f10 = f11 / f10;
                            f0 = f0 + f12;
                            f5 = f5 + f6;
                            f8 = f8 + f9;
                            f4 = f4 + f12;
                            f6 = f7 + f6;
                            f7 = f10 + f9;
                        }
                        f0 = f4 + f0;
                        f4 = 0.5;
                        f5 = f6 + f5;
                        f6 = f7 + f8;
                        f0 = f0 * f4;
                        f5 = f5 * f4;
                        f6 = f6 * f4;
                        r7 = (r7 + 1) | 0;
                        f3 = f3 + f0;
                        f2 = f2 + f5;
                        f1 = f1 + f6;
                        if (!(r1 != r7)) {
                            break 
                        }
                    }
                    f0 = Float64(r2);
                    if (r0 < r1) {
                        f5 = 1.0
                        f5 = f5 / f0;
                        f6 = f3 * f5;
                        f7 = f2 * f5;
                        f5 = f1 * f5;
                        f1 = 0.0;
                        r6 = r0;
                        f2 = f1;
                        f3 = f1;
                        while (true) {
                            if (r8 == 0) {
                                r7 = Int64(heapClassInst.heap32[(r4 + 19)]);
                                r9 = r6 << 6;
                                r7 = (r7 + r9) | 0;
                                r7 = r7 >> 2;
                                f8 = Float64(heapClassInst.heapFloat[(r7)]);
                                f10 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                                f13 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                                f9 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                                f11 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                                f12 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                            }
                            else {
                                r7 = Int64(heapClassInst.heap32[(r4 + 29)]);
                                r9 = r6 << 4;
                                r10 = (r7 + r9) | 0;
                                r7 = Int64(heapClassInst.heapU16[(r7 + r9) >> 1]);
                                r9 = Int64(heapClassInst.heapU16[(r10 + 2) >> 1]);
                                r11 = Int64(heapClassInst.heapU16[(r10 + 4) >> 1]);
                                r12 = Int64(heapClassInst.heapU16[(r10 + 6) >> 1]);
                                r13 = Int64(heapClassInst.heapU16[(r10 + 8) >> 1]);
                                r10 = Int64(heapClassInst.heapU16[(r10 + 10) >> 1]);
                                f8 = Float64(`UIntNative`(r7));
                                f9 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                                f10 = Float64(`UIntNative`(r12));
                                f11 = Float64(`UIntNative`(r9));
                                f12 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                                f13 = Float64(`UIntNative`(r13));
                                f14 = Float64(`UIntNative`(r11));
                                f15 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
                                f16 = Float64(`UIntNative`(r10));
                                f8 = f8 / f9;
                                f17 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                                f9 = f10 / f9;
                                f10 = f11 / f12;
                                f11 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                                f12 = f13 / f12;
                                f13 = f14 / f15;
                                f14 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
                                f15 = f16 / f15;
                                f8 = f8 + f17;
                                f10 = f10 + f11;
                                f13 = f13 + f14;
                                f9 = f9 + f17;
                                f11 = f12 + f11;
                                f12 = f15 + f14;
                            }
                            f8 = f9 + f8;
                            f9 = f11 + f10;
                            f10 = f12 + f13;
                            f8 = f8 * f4;
                            f9 = f9 * f4;
                            f10 = f10 * f4;
                            f8 = f8 - f6;
                            f9 = f9 - f7;
                            f10 = f10 - f5;
                            f8 = f8 * f8;
                            f9 = f9 * f9;
                            f10 = f10 * f10;
                            r6 = (r6 + 1) | 0;
                            f3 = f3 + f8;
                            f2 = f2 + f9;
                            f1 = f1 + f10;
                            if (!(r1 != r6)) {
                                break 
                            }
                        }
                    }
                    else {
                        f1 = 0.0;
                        f2 = f1;
                        f3 = f1;
                    }
                }
                else {
                    f0 = Float64(r2);
                    f1 = 0.0;
                    f2 = f1;
                    f3 = f1;
                }
            } while (false);
            f4 = (-1.0);
            f5 = 1.0;
            f0 = f0 + f4;
            f0 = f5 / f0;
            f3 = f3 * f0;
            f2 = f2 * f0;
            f0 = f1 * f0;
            if (f3 >= f2) {
                r6 = 2;
                r7 = 0;
                r6 = if (f3 < f0) {r6} else {r7};
            }
            else {
                r6 = 2;
                r7 = 1;
                r6 = if (f2 < f0) {r6} else {r7};
            }
            r7 = sp + (-32);
            r8 = r7 >> 2;
            heapClassInst.heap32[(fp + (-8))] = 0;
            heapClassInst.heap32[(r8 + 1)] = 0;
            heapClassInst.heap32[(r8 + 2)] = 0;
            heapClassInst.heap32[(r8 + 3)] = 0;
            if (r0 < r1) {
                r9 = Int64(heapClassInst.heapU8[r3 + 60]);
                f0 = 0.0;
                r10 = r0;
                f1 = f0;
                f2 = f0;
                while (true) {
                    r11 = r9 & 255;
                    if (r11 == 0) {
                        r11 = Int64(heapClassInst.heap32[(r4 + 19)]);
                        r12 = r10 << 6;
                        r11 = (r11 + r12) | 0;
                        r11 = r11 >> 2;
                        f3 = Float64(heapClassInst.heapFloat[(r11)]);
                        f6 = Float64(heapClassInst.heapFloat[(r11 + 1)]);
                        f9 = Float64(heapClassInst.heapFloat[(r11 + 2)]);
                        f4 = Float64(heapClassInst.heapFloat[(r11 + 4)]);
                        f7 = Float64(heapClassInst.heapFloat[(r11 + 5)]);
                        f8 = Float64(heapClassInst.heapFloat[(r11 + 6)]);
                    }
                    else {
                        r11 = Int64(heapClassInst.heap32[(r4 + 29)]);
                        r12 = r10 << 4;
                        r13 = (r11 + r12) | 0;
                        r11 = Int64(heapClassInst.heapU16[(r11 + r12) >> 1]);
                        r12 = Int64(heapClassInst.heapU16[(r13 + 2) >> 1]);
                        r14 = Int64(heapClassInst.heapU16[(r13 + 4) >> 1]);
                        r15 = Int64(heapClassInst.heapU16[(r13 + 6) >> 1]);
                        r16 = Int64(heapClassInst.heapU16[(r13 + 8) >> 1]);
                        r13 = Int64(heapClassInst.heapU16[(r13 + 10) >> 1]);
                        f3 = Float64(`UIntNative`(r11));
                        f4 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                        f6 = Float64(`UIntNative`(r15));
                        f7 = Float64(`UIntNative`(r12));
                        f8 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                        f9 = Float64(`UIntNative`(r16));
                        f10 = Float64(`UIntNative`(r14));
                        f11 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
                        f12 = Float64(`UIntNative`(r13));
                        f3 = f3 / f4;
                        f13 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                        f4 = f6 / f4;
                        f6 = f7 / f8;
                        f7 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                        f8 = f9 / f8;
                        f9 = f10 / f11;
                        f10 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
                        f11 = f12 / f11;
                        f3 = f3 + f13;
                        f6 = f6 + f7;
                        f9 = f9 + f10;
                        f4 = f4 + f13;
                        f7 = f8 + f7;
                        f8 = f11 + f10;
                    }
                    f3 = f4 + f3;
                    f4 = 0.5;
                    f6 = f7 + f6;
                    f7 = f8 + f9;
                    f3 = f3 * f4;
                    f6 = f6 * f4;
                    f4 = f7 * f4;
                    r10 = (r10 + 1) | 0;
                    f2 = f2 + f3;
                    f1 = f1 + f6;
                    f0 = f0 + f4;
                    if (!(r1 != r10)) {
                        break 
                    }
                }
                heapClassInst.heapFloat[(r8 + 2)] = Float32(f0);
                heapClassInst.heapFloat[(r8 + 1)] = Float32(f1);
                heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
            }
            else {
                f0 = 0.0;
                f1 = f0;
                f2 = f0;
            }
            f3 = Float64(r2);
            f3 = f5 / f3;
            f2 = f2 * f3;
            f1 = f1 * f3;
            heapClassInst.heapFloat[(fp + (-8))] = Float32(f2);
            f0 = f0 * f3;
            heapClassInst.heapFloat[(r8 + 1)] = Float32(f1);
            heapClassInst.heapFloat[(r8 + 2)] = Float32(f0);
            do {
                if (r0 < r1) {
                    r8 = r6 << 2;
                    r6 = (r7 + r8) | 0;
                    r6 = r6 >> 2;
                    f0 = Float64(heapClassInst.heapFloat[(r6)]);
                    r6 = r0 << 4;
                    r7 = (r0 - r1) | 0;
                    r9 = r0 << 6;
                    r10 = r6 | 12;
                    r11 = 0;
                    r12 = r9;
                    r6 = r0;
                    while (true) {
                        r13 = Int64(heapClassInst.heapU8[r3 + 60]);
                        if (r13 == 0) {
                            r14 = r11 << 4;
                            r15 = Int64(heapClassInst.heap32[(r4 + 19)]);
                            r15 = (r15 + r9) | 0;
                            r14 = r14 << 2;
                            r14 = (r15 - r14) | 0;
                            r14 = r14 >> 2;
                            f1 = Float64(heapClassInst.heapFloat[(r14)]);
                            f3 = Float64(heapClassInst.heapFloat[(r14 + 1)]);
                            f6 = Float64(heapClassInst.heapFloat[(r14 + 2)]);
                            f2 = Float64(heapClassInst.heapFloat[(r14 + 4)]);
                            f4 = Float64(heapClassInst.heapFloat[(r14 + 5)]);
                            f5 = Float64(heapClassInst.heapFloat[(r14 + 6)]);
                        }
                        else {
                            r14 = Int64(heapClassInst.heap32[(r4 + 29)]);
                            r14 = (r14 + r10) | 0;
                            r15 = r11 << 4;
                            r14 = (r14 - r15) | 0;
                            r15 = Int64(heapClassInst.heapU16[(r14 + (-12)) >> 1]);
                            r16 = Int64(heapClassInst.heapU16[(r14 + (-10)) >> 1]);
                            r17 = Int64(heapClassInst.heapU16[(r14 + (-8)) >> 1]);
                            r18 = Int64(heapClassInst.heapU16[(r14 + (-6)) >> 1]);
                            r19 = Int64(heapClassInst.heapU16[(r14 + (-4)) >> 1]);
                            r14 = Int64(heapClassInst.heapU16[(r14 + (-2)) >> 1]);
                            f1 = Float64(`UIntNative`(r15));
                            f2 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                            f3 = Float64(`UIntNative`(r18));
                            f4 = Float64(`UIntNative`(r16));
                            f5 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                            f6 = Float64(`UIntNative`(r19));
                            f7 = Float64(`UIntNative`(r17));
                            f8 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
                            f9 = Float64(`UIntNative`(r14));
                            f1 = f1 / f2;
                            f10 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                            f2 = f3 / f2;
                            f3 = f4 / f5;
                            f4 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                            f5 = f6 / f5;
                            f6 = f7 / f8;
                            f7 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
                            f8 = f9 / f8;
                            f1 = f1 + f10;
                            f3 = f3 + f4;
                            f6 = f6 + f7;
                            f2 = f2 + f10;
                            f4 = f5 + f4;
                            f5 = f8 + f7;
                        }
                        f1 = f2 + f1;
                        f2 = 0.5;
                        r14 = sp + (-48);
                        f3 = f4 + f3;
                        f1 = f1 * f2;
                        f4 = f5 + f6;
                        r15 = r14 >> 2;
                        f3 = f3 * f2;
                        heapClassInst.heapFloat[(fp + (-12))] = Float32(f1);
                        f1 = f4 * f2;
                        heapClassInst.heapFloat[(r15 + 1)] = Float32(f3);
                        r14 = (r14 + r8) | 0;
                        heapClassInst.heapFloat[(r15 + 2)] = Float32(f1);
                        r14 = r14 >> 2;
                        heapClassInst.heap32[(r15 + 3)] = 0;
                        f1 = Float64(heapClassInst.heapFloat[(r14)]);
                        if (f1 > f0) {
                            if (r13 == 0) {
                                r13 = r11 << 4;
                                r14 = Int64(heapClassInst.heap32[(r4 + 19)]);
                                r15 = (r14 + r9) | 0;
                                r13 = r13 << 2;
                                r13 = (r15 - r13) | 0;
                                r13 = r13 >> 2;
                                r15 = Int64(heapClassInst.heap32[(r13 + 15)]);
                                r16 = Int64(heapClassInst.heap32[(r13 + 14)]);
                                r17 = Int64(heapClassInst.heap32[(r13 + 13)]);
                                r18 = Int64(heapClassInst.heap32[(r13 + 12)]);
                                r19 = Int64(heapClassInst.heap32[(r13 + 11)]);
                                r20 = Int64(heapClassInst.heap32[(r13 + 10)]);
                                r21 = Int64(heapClassInst.heap32[(r13 + 9)]);
                                r22 = Int64(heapClassInst.heap32[(r13 + 8)]);
                                f1 = Float64(heapClassInst.heapFloat[(r13 + 7)]);
                                f2 = Float64(heapClassInst.heapFloat[(r13 + 6)]);
                                f3 = Float64(heapClassInst.heapFloat[(r13 + 5)]);
                                f4 = Float64(heapClassInst.heapFloat[(r13 + 4)]);
                                f5 = Float64(heapClassInst.heapFloat[(r13 + 3)]);
                                f6 = Float64(heapClassInst.heapFloat[(r13 + 2)]);
                                f7 = Float64(heapClassInst.heapFloat[(r13 + 1)]);
                                f8 = Float64(heapClassInst.heapFloat[(r13)]);
                                r13 = r6 << 6;
                                r23 = (r14 + r12) | 0;
                                r14 = (r14 + r13) | 0;
                                heapClassInst.heap32[(g0)] = Int32(r23);
                                heapClassInst.heap32[(g0 + 1)] = Int32(r14);
                                heapClassInst.heap32[(g0 + 2)] = 64;
                                memcpy(i7);
                                r14 = Int64(heapClassInst.heap32[(r4 + 19)]);
                                r13 = (r14 + r13) | 0;
                                r13 = r13 >> 2;
                                heapClassInst.heapFloat[(r13)] = Float32(f8);
                                heapClassInst.heapFloat[(r13 + 1)] = Float32(f7);
                                heapClassInst.heapFloat[(r13 + 2)] = Float32(f6);
                                heapClassInst.heapFloat[(r13 + 3)] = Float32(f5);
                                heapClassInst.heapFloat[(r13 + 4)] = Float32(f4);
                                heapClassInst.heapFloat[(r13 + 5)] = Float32(f3);
                                heapClassInst.heapFloat[(r13 + 6)] = Float32(f2);
                                heapClassInst.heapFloat[(r13 + 7)] = Float32(f1);
                                heapClassInst.heap32[(r13 + 8)] = Int32(r22);
                                heapClassInst.heap32[(r13 + 9)] = Int32(r21);
                                heapClassInst.heap32[(r13 + 10)] = Int32(r20);
                                heapClassInst.heap32[(r13 + 11)] = Int32(r19);
                                heapClassInst.heap32[(r13 + 12)] = Int32(r18);
                                heapClassInst.heap32[(r13 + 13)] = Int32(r17);
                                heapClassInst.heap32[(r13 + 14)] = Int32(r16);
                                heapClassInst.heap32[(r13 + 15)] = Int32(r15);
                            }
                            else {
                                r13 = Int64(heapClassInst.heap32[(r4 + 29)]);
                                r14 = (r13 + r10) | 0;
                                r15 = r11 << 4;
                                r14 = (r14 - r15) | 0;
                                r15 = r6 << 4;
                                r16 = r14 >> 2;
                                r17 = Int64(heapClassInst.heap32[(r16)]);
                                r18 = Int64(heapClassInst.heapU16[(r14 + (-2)) >> 1]);
                                r19 = Int64(heapClassInst.heapU16[(r14 + (-4)) >> 1]);
                                r20 = Int64(heapClassInst.heapU16[(r14 + (-6)) >> 1]);
                                r21 = Int64(heapClassInst.heapU16[(r14 + (-8)) >> 1]);
                                r22 = Int64(heapClassInst.heapU16[(r14 + (-10)) >> 1]);
                                r23 = Int64(heapClassInst.heapU16[(r13 + r15) >> 1]);
                                r24 = Int64(heapClassInst.heapU16[(r14 + (-12)) >> 1]);
                                r13 = (r13 + r15) | 0;
                                heapClassInst.heap16[(r14 + (-12)) >> 1] = Int16(r23);
                                r23 = Int64(heapClassInst.heapU16[(r13 + 2) >> 1]);
                                heapClassInst.heap16[(r14 + (-10)) >> 1] = Int16(r23);
                                r23 = Int64(heapClassInst.heapU16[(r13 + 4) >> 1]);
                                heapClassInst.heap16[(r14 + (-8)) >> 1] = Int16(r23);
                                r23 = Int64(heapClassInst.heapU16[(r13 + 6) >> 1]);
                                heapClassInst.heap16[(r14 + (-6)) >> 1] = Int16(r23);
                                r23 = Int64(heapClassInst.heapU16[(r13 + 8) >> 1]);
                                heapClassInst.heap16[(r14 + (-4)) >> 1] = Int16(r23);
                                r23 = Int64(heapClassInst.heapU16[(r13 + 10) >> 1]);
                                r13 = r13 >> 2;
                                heapClassInst.heap16[(r14 + (-2)) >> 1] = Int16(r23);
                                r13 = Int64(heapClassInst.heap32[(r13 + 3)]);
                                heapClassInst.heap32[(r16)] = Int32(r13);
                                r13 = Int64(heapClassInst.heap32[(r4 + 29)]);
                                r14 = (r13 + r15) | 0;
                                heapClassInst.heap16[(r13 + r15) >> 1] = Int16(r24);
                                heapClassInst.heap16[(r14 + 2) >> 1] = Int16(r22);
                                heapClassInst.heap16[(r14 + 4) >> 1] = Int16(r21);
                                heapClassInst.heap16[(r14 + 6) >> 1] = Int16(r20);
                                heapClassInst.heap16[(r14 + 8) >> 1] = Int16(r19);
                                r13 = r14 >> 2;
                                heapClassInst.heap16[(r14 + 10) >> 1] = Int16(r18);
                                heapClassInst.heap32[(r13 + 3)] = Int32(r17);
                            }
                            r6 = (r6 + 1) | 0;
                        }
                        r11 = (r11 + (-1)) | 0;
                        r12 = (r12 + 64) | 0;
                        if (!(r7 != r11)) {
                            break 
                        }
                    }
                }
                else {
                    r6 = r0;
                }
            } while (false);
            r7 = (r2 / 3) | 0;
            r8 = (r7 + r0) | 0;
            if (r8 >= r6) {
                __label__ = 46;
            }
            else {
                r8 = (r1 + (-1)) | 0;
                r7 = (r8 - r7) | 0;
                if (r7 <= r6) {
                    __label__ = 46;
                }
                else {
                    __label__ = 47;
                }
            }
            if (__label__ == 46) {
                r6 = r2 >> 1;
                r6 = (r6 + r0) | 0;
            }
            if (!(r6 == r0)) {
                if (r6 != r1) {
                    r2 = Int64(heapClassInst.heap32[(r4 + 14)]);
                    heapClassInst.heap32[(fp + (-21))] = Int32(r2);
                    r2 = Int64(heapClassInst.heapU8[r3 + 60]);
                    if (r2 == 0) {
                        r2 = Int64(heapClassInst.heap32[(fp + (-21))]);
                        r2 = r2 << 6;
                        r7 = Int64(heapClassInst.heap32[(r4 + 24)]);
                        r2 = (r7 + r2) | 0;
                        r2 = r2 >> 2;
                        heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4 + 5)];
                        heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r4 + 6)];
                        heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r4 + 7)];
                        heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r4 + 8)];
                    }
                    else {
                        r2 = Int64(heapClassInst.heap32[(r4 + 34)]);
                        r7 = Int64(heapClassInst.heap32[(fp + (-21))]);
                        r7 = r7 << 4;
                        r2 = (r2 + r7) | 0;
                        r7 = (r3 + 20) | 0;
                        heapClassInst.heap32[(g0)] = Int32(r3);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r7);
                        heapClassInst.heap32[(g0 + 3)] = 0;
                        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
                    }
                    r2 = Int64(heapClassInst.heap32[(r4 + 14)]);
                    r7 = Int64(heapClassInst.heapU8[r3 + 60]);
                    if (r7 == 0) {
                        r2 = r2 << 6;
                        r7 = Int64(heapClassInst.heap32[(r4 + 24)]);
                        r2 = (r7 + r2) | 0;
                        r2 = r2 >> 2;
                        heapClassInst.heap32[(r2 + 4)] = heapClassInst.heap32[(r4 + 1)];
                        heapClassInst.heap32[(r2 + 5)] = heapClassInst.heap32[(r4 + 2)];
                        heapClassInst.heap32[(r2 + 6)] = heapClassInst.heap32[(r4 + 3)];
                        heapClassInst.heap32[(r2 + 7)] = heapClassInst.heap32[(r4 + 4)];
                    }
                    else {
                        r7 = Int64(heapClassInst.heap32[(r4 + 34)]);
                        r2 = r2 << 4;
                        r2 = (r7 + r2) | 0;
                        r2 = (r2 + 6) | 0;
                        r7 = (r3 + 4) | 0;
                        heapClassInst.heap32[(g0)] = Int32(r3);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r7);
                        heapClassInst.heap32[(g0 + 3)] = 1;
                        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
                    }
                    do {
                        if (!(r0 >= r1)) {
                            r2 = r0;
                            while (true) {
                                r7 = Int64(heapClassInst.heapU8[r3 + 60]);
                                do {
                                    if (r7 == 0) {
                                        r7 = Int64(heapClassInst.heap32[(r4 + 19)]);
                                        r8 = r2 << 6;
                                        r7 = (r7 + r8) | 0;
                                        r7 = r7 >> 2;
                                        f0 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                                        r8 = sp + (-80);
                                        heapClassInst.heapFloat[(fp + (-20))] = Float32(f0);
                                        f1 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                                        r8 = r8 >> 2;
                                        heapClassInst.heapFloat[(r8 + 1)] = Float32(f1);
                                        f2 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                                        heapClassInst.heapFloat[(r8 + 2)] = Float32(f2);
                                        f3 = Float64(heapClassInst.heapFloat[(r7 + 7)]);
                                        heapClassInst.heapFloat[(r8 + 3)] = Float32(f3);
                                        f4 = Float64(heapClassInst.heapFloat[(r7)]);
                                        r8 = sp + (-64);
                                        heapClassInst.heapFloat[(fp + (-16))] = Float32(f4);
                                        f5 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                                        r8 = r8 >> 2;
                                        heapClassInst.heapFloat[(r8 + 1)] = Float32(f5);
                                        f6 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                                        heapClassInst.heapFloat[(r8 + 2)] = Float32(f6);
                                        f7 = Float64(heapClassInst.heapFloat[(r7 + 3)]);
                                        heapClassInst.heapFloat[(r8 + 3)] = Float32(f7);
                                        r7 = Int64(heapClassInst.heap32[(r4 + 14)]);
                                        r8 = Int64(heapClassInst.heap32[(r4 + 24)]);
                                        r7 = r7 << 6;
                                        r8 = (r8 + r7) | 0;
                                        r8 = r8 >> 2;
                                        f8 = Float64(heapClassInst.heapFloat[(r8)]);
                                        if (!(f4 >= f8)) {
                                            heapClassInst.heapFloat[(r8)] = Float32(f4);
                                        }
                                        f4 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                                        if (!(f5 >= f4)) {
                                            heapClassInst.heapFloat[(r8 + 1)] = Float32(f5);
                                        }
                                        f4 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                                        if (!(f6 >= f4)) {
                                            heapClassInst.heapFloat[(r8 + 2)] = Float32(f6);
                                        }
                                        f4 = Float64(heapClassInst.heapFloat[(r8 + 3)]);
                                        if (!(f7 >= f4)) {
                                            heapClassInst.heapFloat[(r8 + 3)] = Float32(f7);
                                        }
                                        r8 = Int64(heapClassInst.heap32[(r4 + 24)]);
                                        r7 = (r8 + r7) | 0;
                                        r7 = r7 >> 2;
                                        f4 = Float64(heapClassInst.heapFloat[(r7 + 4)]);
                                        if (!(f4 >= f0)) {
                                            heapClassInst.heapFloat[(r7 + 4)] = Float32(f0);
                                        }
                                        f0 = Float64(heapClassInst.heapFloat[(r7 + 5)]);
                                        if (!(f0 >= f1)) {
                                            heapClassInst.heapFloat[(r7 + 5)] = Float32(f1);
                                        }
                                        f0 = Float64(heapClassInst.heapFloat[(r7 + 6)]);
                                        if (!(f0 >= f2)) {
                                            heapClassInst.heapFloat[(r7 + 6)] = Float32(f2);
                                        }
                                        f0 = Float64(heapClassInst.heapFloat[(r7 + 7)]);
                                        if (f0 >= f3) {
                                            break 
                                        }
                                        else {
                                            heapClassInst.heapFloat[(r7 + 7)] = Float32(f3);
                                        }
                                    }
                                    else {
                                        r7 = Int64(heapClassInst.heap32[(r4 + 29)]);
                                        r8 = r2 << 4;
                                        r9 = (r7 + r8) | 0;
                                        r10 = sp + (-80);
                                        r11 = Int64(heapClassInst.heapU16[(r9 + 10) >> 1]);
                                        r12 = Int64(heapClassInst.heapU16[(r9 + 8) >> 1]);
                                        r13 = Int64(heapClassInst.heapU16[(r9 + 6) >> 1]);
                                        f0 = Float64(heapClassInst.heapFloat[(r4 + 11)]);
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 10)]);
                                        f2 = Float64(heapClassInst.heapFloat[(r4 + 9)]);
                                        r14 = r10 >> 2;
                                        f3 = Float64(`UIntNative`(r13));
                                        heapClassInst.heap32[(r14 + 3)] = 0;
                                        f3 = f3 / f2;
                                        f4 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                                        f3 = f3 + f4;
                                        f5 = Float64(`UIntNative`(r12));
                                        heapClassInst.heapFloat[(fp + (-20))] = Float32(f3);
                                        f3 = f5 / f1;
                                        f5 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                                        f3 = f3 + f5;
                                        f6 = Float64(`UIntNative`(r11));
                                        heapClassInst.heapFloat[(r14 + 1)] = Float32(f3);
                                        f3 = f6 / f0;
                                        f6 = Float64(heapClassInst.heapFloat[(r4 + 3)]);
                                        f3 = f3 + f6;
                                        heapClassInst.heapFloat[(r14 + 2)] = Float32(f3);
                                        r7 = Int64(heapClassInst.heapU16[(r7 + r8) >> 1]);
                                        r8 = sp + (-64);
                                        f3 = Float64(`UIntNative`(r7));
                                        r7 = Int64(heapClassInst.heapU16[(r9 + 4) >> 1]);
                                        r9 = Int64(heapClassInst.heapU16[(r9 + 2) >> 1]);
                                        f7 = Float64(`UIntNative`(r9));
                                        f2 = f3 / f2;
                                        r9 = r8 >> 2;
                                        f3 = Float64(`UIntNative`(r7));
                                        f1 = f7 / f1;
                                        f2 = f2 + f4;
                                        heapClassInst.heap32[(r9 + 3)] = 0;
                                        f0 = f3 / f0;
                                        f1 = f1 + f5;
                                        heapClassInst.heapFloat[(fp + (-16))] = Float32(f2);
                                        f0 = f0 + f6;
                                        heapClassInst.heapFloat[(r9 + 1)] = Float32(f1);
                                        heapClassInst.heapFloat[(r9 + 2)] = Float32(f0);
                                        r7 = Int64(heapClassInst.heap32[(r4 + 14)]);
                                        r9 = sp + (-6);
                                        heapClassInst.heap32[(g0)] = Int32(r3);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r9);
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r8);
                                        heapClassInst.heap32[(g0 + 3)] = 0;
                                        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
                                        r8 = sp + (-12);
                                        heapClassInst.heap32[(g0)] = Int32(r3);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8);
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                                        heapClassInst.heap32[(g0 + 3)] = 1;
                                        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
                                        r8 = Int64(heapClassInst.heapU16[(sp + (-6)) >> 1]);
                                        r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        r7 = r7 << 4;
                                        r10 = Int64(heapClassInst.heapU16[(r9 + r7) >> 1]);
                                        if (`UIntNative`(r10) > `UIntNative`(r8)) {
                                            heapClassInst.heap16[(r9 + r7) >> 1] = Int16(r8);
                                            r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        }
                                        r8 = (r9 + r7) | 0;
                                        r10 = Int64(heapClassInst.heapU16[(sp + (-12)) >> 1]);
                                        r11 = Int64(heapClassInst.heapU16[(r8 + 6) >> 1]);
                                        if (`UIntNative`(r11) < `UIntNative`(r10)) {
                                            heapClassInst.heap16[(r8 + 6) >> 1] = Int16(r10);
                                            r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        }
                                        r8 = (r9 + r7) | 0;
                                        r10 = Int64(heapClassInst.heapU16[(sp + (-4)) >> 1]);
                                        r11 = Int64(heapClassInst.heapU16[(r8 + 2) >> 1]);
                                        if (`UIntNative`(r11) > `UIntNative`(r10)) {
                                            heapClassInst.heap16[(r8 + 2) >> 1] = Int16(r10);
                                            r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        }
                                        r8 = (r9 + r7) | 0;
                                        r10 = Int64(heapClassInst.heapU16[(sp + (-10)) >> 1]);
                                        r11 = Int64(heapClassInst.heapU16[(r8 + 8) >> 1]);
                                        if (`UIntNative`(r11) < `UIntNative`(r10)) {
                                            heapClassInst.heap16[(r8 + 8) >> 1] = Int16(r10);
                                            r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        }
                                        r8 = (r9 + r7) | 0;
                                        r10 = Int64(heapClassInst.heapU16[(sp + (-2)) >> 1]);
                                        r11 = Int64(heapClassInst.heapU16[(r8 + 4) >> 1]);
                                        if (`UIntNative`(r11) > `UIntNative`(r10)) {
                                            heapClassInst.heap16[(r8 + 4) >> 1] = Int16(r10);
                                            r9 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                        }
                                        r7 = (r9 + r7) | 0;
                                        r8 = Int64(heapClassInst.heapU16[(sp + (-8)) >> 1]);
                                        r9 = Int64(heapClassInst.heapU16[(r7 + 10) >> 1]);
                                        if (`UIntNative`(r9) < `UIntNative`(r8)) {
                                            heapClassInst.heap16[(r7 + 10) >> 1] = Int16(r8);
                                        }
                                    }
                                } while (false);
                                r2 = (r2 + 1) | 0;
                                if (!(r1 != r2)) {
                                    break 
                                }
                            }
                        }
                    } while (false);
                    r2 = Int64(heapClassInst.heap32[(r4 + 14)]);
                    r7 = (r2 + 1) | 0;
                    heapClassInst.heap32[(r4 + 14)] = Int32(r7);
                    heapClassInst.heap32[(g0)] = Int32(r3);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r6);
                    _ZN14btQuantizedBvh9buildTreeEii(i7);
                    r0 = Int64(heapClassInst.heap32[(r4 + 14)]);
                    heapClassInst.heap32[(fp + (-23))] = Int32(r0);
                    heapClassInst.heap32[(g0)] = Int32(r3);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r6);
                    heapClassInst.heap32[(g0 + 2)] = Int32(r1);
                    _ZN14btQuantizedBvh9buildTreeEii(i7);
                    r0 = Int64(heapClassInst.heap32[(r4 + 14)]);
                    r0 = (r0 - r5) | 0;
                    heapClassInst.heap32[(fp + (-22))] = Int32(r0);
                    r0 = Int64(heapClassInst.heapU8[r3 + 60]);
                    do  {
                        if (!(r0 == 0)) {
                            r0 = Int64(heapClassInst.heap32[(fp + (-22))]);
                            r0 = r0 << 4;
                            if (!(r0 < 2049)) {
                                r0 = Int64(heapClassInst.heap32[(r4 + 34)]);
                                r1 = Int64(heapClassInst.heap32[(fp + (-23))]);
                                r1 = r1 << 4;
                                heapClassInst.heap32[(fp + (-24))] = Int32(r1);
                                r2 = r2 << 4;
                                r1 = (r0 + r1) | 0;
                                r2 = (r0 + r2) | 0;
                                r5 = r1 >> 2;
                                r6 = r2 >> 2;
                                r5 = Int64(heapClassInst.heap32[(r5 + 3)]);
                                r8 = 0;
                                r6 = Int64(heapClassInst.heap32[(r6 + 7)]);
                                r9 = 1;
                                r10 = (r8 - r6) | 0;
                                r6 = if (r6 < 0) {r10} else {r9};
                                r10 = r6 << 4;
                                if (!(r10 > 2048)) {
                                    r10 = Int64(heapClassInst.heap32[(r4 + 39)]);
                                    r11 = Int64(heapClassInst.heap32[(r4 + 38)]);
                                    if (r10 == r11) {
                                        r12 = r11 << 1;
                                        r12 = if (r11 == 0) {r9} else {r12};
                                        if (r10 >= r12) {
                                            __label__ = 92;
                                        }
                                        else {
                                            if (r12 != 0) {
                                                r10 = gNumAlignedAllocs;
                                                r10 = r10 >> 2;
                                                r13 = Int64(heapClassInst.heap32[(r10)]);
                                                r13 = (r13 + 1) | 0;
                                                r14 = r12 << 5;
                                                heapClassInst.heap32[(r10)] = Int32(r13);
                                                r10 = r14 | 19;
                                                heapClassInst.heap32[(g0)] = Int32(r10);
                                                mallocNew(i7);
                                                r13 = commonVariable.r_g0;
                                                if (r13 != 0) {
                                                    r10 = 0;
                                                    r14 = (r13 + 4) | 0;
                                                    r10 = (r10 - r14) | 0;
                                                    r10 = r10 & 15;
                                                    r10 = (r13 + r10) | 0;
                                                    r14 = (r10 + 4) | 0;
                                                    r10 = r10 >> 2;
                                                    heapClassInst.heap32[(r10)] = Int32(r13);
                                                    r13 = r14;
                                                }
                                            }
                                            else {
                                                r13 = 0;
                                            }
                                            r14 = (r3 + 160) | 0;
                                            if (r11 < 1) {
                                                r10 = r14 >> 2;
                                                r16 = Int64(heapClassInst.heap32[(r10)]);
                                            }
                                            else {
                                                r10 = 0;
                                                r15 = r11;
                                                while (true) {
                                                    r16 = r14 >> 2;
                                                    r16 = Int64(heapClassInst.heap32[(r16)]);
                                                    r17 = (r16 + r10) | 0;
                                                    r17 = r17 >> 2;
                                                    r18 = (r13 + r10) | 0;
                                                    r15 = (r15 + (-1)) | 0;
                                                    r10 = (r10 + 32) | 0;
                                                    r19 = Int64(heapClassInst.heap32[(r17)]);
                                                    r18 = r18 >> 2;
                                                    r20 = Int64(heapClassInst.heap32[(r17 + 1)]);
                                                    r21 = Int64(heapClassInst.heap32[(r17 + 2)]);
                                                    r22 = Int64(heapClassInst.heap32[(r17 + 3)]);
                                                    r23 = Int64(heapClassInst.heap32[(r17 + 4)]);
                                                    r24 = Int64(heapClassInst.heap32[(r17 + 5)]);
                                                    r25 = Int64(heapClassInst.heap32[(r17 + 6)]);
                                                    r17 = Int64(heapClassInst.heap32[(r17 + 7)]);
                                                    heapClassInst.heap32[(r18)] = Int32(r19);
                                                    heapClassInst.heap32[(r18 + 1)] = Int32(r20);
                                                    heapClassInst.heap32[(r18 + 2)] = Int32(r21);
                                                    heapClassInst.heap32[(r18 + 3)] = Int32(r22);
                                                    heapClassInst.heap32[(r18 + 4)] = Int32(r23);
                                                    heapClassInst.heap32[(r18 + 5)] = Int32(r24);
                                                    heapClassInst.heap32[(r18 + 6)] = Int32(r25);
                                                    heapClassInst.heap32[(r18 + 7)] = Int32(r17);
                                                    if (!(r15 != 0)) {
                                                        break 
                                                    }
                                                }
                                                r14 = (r3 + 160) | 0;
                                            }
                                            if (r16 != 0) {
                                                r10 = Int64(heapClassInst.heapU8[r3 + 164]);
                                                if (r10 != 0) {
                                                    r10 = gNumAlignedFree;
                                                    r10 = r10 >> 2;
                                                    r15 = Int64(heapClassInst.heap32[(r10)]);
                                                    r15 = (r15 + 1) | 0;
                                                    r16 = r16 >> 2;
                                                    heapClassInst.heap32[(r10)] = Int32(r15);
                                                    r10 = Int64(heapClassInst.heap32[(r16 + (-1))]);
                                                    heapClassInst.heap32[(g0)] = Int32(r10);
                                                    free(i7);
                                                    r10 = Int64(heapClassInst.heap32[(r4 + 38)]);
                                                }
                                                else {
                                                    r10 = r11;
                                                }
                                                r15 = r14 >> 2;
                                                heapClassInst.heap32[(r15)] = 0;
                                            }
                                            else {
                                                r10 = r11;
                                            }
                                            r14 = r14 >> 2;
                                            heapClassInst.heap8[r3 + 164] = Int8(r9);
                                            heapClassInst.heap32[(r14)] = Int32(r13);
                                            heapClassInst.heap32[(r4 + 39)] = Int32(r12);
                                            __label__ = 110;
                                        }
                                    }
                                    else {
                                        __label__ = 92;
                                    }
                                    if (__label__ == 92) {
                                        r10 = r11;
                                    }
                                    r10 = (r10 + 1) | 0;
                                    heapClassInst.heap32[(r4 + 38)] = Int32(r10);
                                    r10 = Int64(heapClassInst.heap32[(r4 + 40)]);
                                    r12 = Int64(heapClassInst.heapU16[(r2 + 16) >> 1]);
                                    r11 = r11 << 5;
                                    heapClassInst.heap16[(r10 + r11) >> 1] = Int16(r12);
                                    r10 = (r10 + r11) | 0;
                                    r11 = Int64(heapClassInst.heapU16[(r2 + 18) >> 1]);
                                    heapClassInst.heap16[(r10 + 2) >> 1] = Int16(r11);
                                    r11 = Int64(heapClassInst.heapU16[(r2 + 20) >> 1]);
                                    heapClassInst.heap16[(r10 + 4) >> 1] = Int16(r11);
                                    r11 = Int64(heapClassInst.heapU16[(r2 + 22) >> 1]);
                                    heapClassInst.heap16[(r10 + 6) >> 1] = Int16(r11);
                                    r11 = Int64(heapClassInst.heapU16[(r2 + 24) >> 1]);
                                    heapClassInst.heap16[(r10 + 8) >> 1] = Int16(r11);
                                    r2 = Int64(heapClassInst.heapU16[(r2 + 26) >> 1]);
                                    r11 = r10 >> 2;
                                    heapClassInst.heap16[(r10 + 10) >> 1] = Int16(r2);
                                    heapClassInst.heap32[(r11 + 3)] = Int32(r7);
                                    heapClassInst.heap32[(r11 + 4)] = Int32(r6);
                                }
                                r2 = (r8 - r5) | 0;
                                r2 = if (r5 < 0) {r2} else {r9};
                                r5 = r2 << 4;
                                if (!(r5 > 2048)) {
                                    r5 = Int64(heapClassInst.heap32[(r4 + 39)]);
                                    r6 = Int64(heapClassInst.heap32[(r4 + 38)]);
                                    if (r5 == r6) {
                                        r7 = r6 << 1;
                                        r7 = if (r6 == 0) {r9} else {r7};
                                        if (r5 >= r7) {
                                            __label__ = 113;
                                        }
                                        else {
                                            if (r7 != 0) {
                                                r5 = gNumAlignedAllocs;
                                                r5 = r5 >> 2;
                                                r10 = Int64(heapClassInst.heap32[(r5)]);
                                                r10 = (r10 + 1) | 0;
                                                r11 = r7 << 5;
                                                heapClassInst.heap32[(r5)] = Int32(r10);
                                                r5 = r11 | 19;
                                                heapClassInst.heap32[(g0)] = Int32(r5);
                                                mallocNew(i7);
                                                r10 = commonVariable.r_g0;
                                                if (r10 != 0) {
                                                    r5 = (r10 + 4) | 0;
                                                    r5 = (r8 - r5) | 0;
                                                    r5 = r5 & 15;
                                                    r5 = (r10 + r5) | 0;
                                                    r11 = (r5 + 4) | 0;
                                                    r5 = r5 >> 2;
                                                    heapClassInst.heap32[(r5)] = Int32(r10);
                                                    r10 = r11;
                                                }
                                            }
                                            else {
                                                r10 = 0;
                                            }
                                            r11 = (r3 + 160) | 0;
                                            if (r6 < 1) {
                                                r5 = r11 >> 2;
                                                r12 = Int64(heapClassInst.heap32[(r5)]);
                                            }
                                            else {
                                                r5 = r6;
                                                while (true) {
                                                    r12 = r11 >> 2;
                                                    r12 = Int64(heapClassInst.heap32[(r12)]);
                                                    r13 = (r12 + r8) | 0;
                                                    r13 = r13 >> 2;
                                                    r14 = (r10 + r8) | 0;
                                                    r5 = (r5 + (-1)) | 0;
                                                    r8 = (r8 + 32) | 0;
                                                    r15 = Int64(heapClassInst.heap32[(r13)]);
                                                    r14 = r14 >> 2;
                                                    r16 = Int64(heapClassInst.heap32[(r13 + 1)]);
                                                    r17 = Int64(heapClassInst.heap32[(r13 + 2)]);
                                                    r18 = Int64(heapClassInst.heap32[(r13 + 3)]);
                                                    r19 = Int64(heapClassInst.heap32[(r13 + 4)]);
                                                    r20 = Int64(heapClassInst.heap32[(r13 + 5)]);
                                                    r21 = Int64(heapClassInst.heap32[(r13 + 6)]);
                                                    r13 = Int64(heapClassInst.heap32[(r13 + 7)]);
                                                    heapClassInst.heap32[(r14)] = Int32(r15);
                                                    heapClassInst.heap32[(r14 + 1)] = Int32(r16);
                                                    heapClassInst.heap32[(r14 + 2)] = Int32(r17);
                                                    heapClassInst.heap32[(r14 + 3)] = Int32(r18);
                                                    heapClassInst.heap32[(r14 + 4)] = Int32(r19);
                                                    heapClassInst.heap32[(r14 + 5)] = Int32(r20);
                                                    heapClassInst.heap32[(r14 + 6)] = Int32(r21);
                                                    heapClassInst.heap32[(r14 + 7)] = Int32(r13);
                                                    if (!(r5 != 0)) {
                                                        break 
                                                    }
                                                }
                                                r11 = (r3 + 160) | 0;
                                            }
                                            if (r12 != 0) {
                                                r5 = Int64(heapClassInst.heapU8[r3 + 164]);
                                                if (r5 != 0) {
                                                    r5 = gNumAlignedFree;
                                                    r5 = r5 >> 2;
                                                    r8 = Int64(heapClassInst.heap32[(r5)]);
                                                    r8 = (r8 + 1) | 0;
                                                    r12 = r12 >> 2;
                                                    heapClassInst.heap32[(r5)] = Int32(r8);
                                                    r5 = Int64(heapClassInst.heap32[(r12 + (-1))]);
                                                    heapClassInst.heap32[(g0)] = Int32(r5);
                                                    free(i7);
                                                    r5 = Int64(heapClassInst.heap32[(r4 + 38)]);
                                                }
                                                else {
                                                    r5 = r6;
                                                }
                                                r8 = r11 >> 2;
                                                heapClassInst.heap32[(r8)] = 0;
                                            }
                                            else {
                                                r5 = r6;
                                            }
                                            r8 = r11 >> 2;
                                            heapClassInst.heap8[r3 + 164] = Int8(r9);
                                            heapClassInst.heap32[(r8)] = Int32(r10);
                                            heapClassInst.heap32[(r4 + 39)] = Int32(r7);
                                            __label__ = 131;
                                        }
                                    }
                                    else {
                                        __label__ = 113;
                                    }
                                    if (__label__ == 113) {
                                        r5 = r6;
                                    }
                                    r5 = (r5 + 1) | 0;
                                    heapClassInst.heap32[(r4 + 38)] = Int32(r5);
                                    r5 = Int64(heapClassInst.heap32[(r4 + 40)]);
                                    r7 = Int64(heapClassInst.heap32[(fp + (-24))]);
                                    r0 = Int64(heapClassInst.heapU16[(r0 + r7) >> 1]);
                                    r6 = r6 << 5;
                                    heapClassInst.heap16[(r5 + r6) >> 1] = Int16(r0);
                                    r0 = (r5 + r6) | 0;
                                    r5 = Int64(heapClassInst.heapU16[(r1 + 2) >> 1]);
                                    heapClassInst.heap16[(r0 + 2) >> 1] = Int16(r5);
                                    r5 = Int64(heapClassInst.heapU16[(r1 + 4) >> 1]);
                                    heapClassInst.heap16[(r0 + 4) >> 1] = Int16(r5);
                                    r5 = Int64(heapClassInst.heapU16[(r1 + 6) >> 1]);
                                    heapClassInst.heap16[(r0 + 6) >> 1] = Int16(r5);
                                    r5 = Int64(heapClassInst.heapU16[(r1 + 8) >> 1]);
                                    heapClassInst.heap16[(r0 + 8) >> 1] = Int16(r5);
                                    r1 = Int64(heapClassInst.heapU16[(r1 + 10) >> 1]);
                                    r5 = r0 >> 2;
                                    heapClassInst.heap16[(r0 + 10) >> 1] = Int16(r1);
                                    r0 = Int64(heapClassInst.heap32[(fp + (-23))]);
                                    heapClassInst.heap32[(r5 + 3)] = Int32(r0);
                                    heapClassInst.heap32[(r5 + 4)] = Int32(r2);
                                }
                                r0 = Int64(heapClassInst.heap32[(r4 + 38)]);
                                heapClassInst.heap32[(r4 + 42)] = Int32(r0);
                                r0 = Int64(heapClassInst.heapU8[r3 + 60]);
                                if (r0 == 0) {
                                    break 
                                }
                            }
                            r0 = Int64(heapClassInst.heap32[(fp + (-21))]);
                            r0 = r0 << 4;
                            r4 = Int64(heapClassInst.heap32[(r4 + 34)]);
                            r4 = (r4 + r0) | 0;
                            r0 = 0;
                            r4 = r4 >> 2;
                            r1 = Int64(heapClassInst.heap32[(fp + (-22))]);
                            r0 = (r0 - r1) | 0;
                            heapClassInst.heap32[(r4 + 3)] = Int32(r0);
                            return;
                        }
                    } while (false);
                    r0 = Int64(heapClassInst.heap32[(fp + (-21))]);
                    r0 = r0 << 6;
                    r1 = Int64(heapClassInst.heap32[(r4 + 24)]);
                    r0 = (r1 + r0) | 0;
                    r0 = r0 >> 2;
                    r1 = Int64(heapClassInst.heap32[(fp + (-22))]);
                    heapClassInst.heap32[(r0 + 8)] = Int32(r1);
                    return;
                }
            }
            r0 = _E2_str21;
            r1 = _E2_str537;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = 278;
            _assert(i7);
        }
        else {
            r1 = Int64(heapClassInst.heapU8[r3 + 60]);
            if (r1 == 0) {
                r1 = Int64(heapClassInst.heap32[(r4 + 24)]);
                r2 = Int64(heapClassInst.heap32[(r4 + 19)]);
                r3 = r5 << 6;
                r0 = r0 << 6;
                r1 = (r1 + r3) | 0;
                r0 = (r2 + r0) | 0;
                heapClassInst.heap32[(g0)] = Int32(r1);
                heapClassInst.heap32[(g0 + 1)] = Int32(r0);
                heapClassInst.heap32[(g0 + 2)] = 64;
                memcpy(i7);
            }
            else {
                r0 = r0 << 4;
                r1 = Int64(heapClassInst.heap32[(r4 + 29)]);
                r2 = Int64(heapClassInst.heap32[(r4 + 34)]);
                r3 = Int64(heapClassInst.heapU16[(r1 + r0) >> 1]);
                r5 = r5 << 4;
                r0 = (r1 + r0) | 0;
                heapClassInst.heap16[(r2 + r5) >> 1] = Int16(r3);
                r1 = (r2 + r5) | 0;
                r2 = Int64(heapClassInst.heapU16[(r0 + 2) >> 1]);
                heapClassInst.heap16[(r1 + 2) >> 1] = Int16(r2);
                r2 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
                heapClassInst.heap16[(r1 + 4) >> 1] = Int16(r2);
                r2 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
                heapClassInst.heap16[(r1 + 6) >> 1] = Int16(r2);
                r2 = Int64(heapClassInst.heapU16[(r0 + 8) >> 1]);
                heapClassInst.heap16[(r1 + 8) >> 1] = Int16(r2);
                r2 = Int64(heapClassInst.heapU16[(r0 + 10) >> 1]);
                r0 = r0 >> 2;
                heapClassInst.heap16[(r1 + 10) >> 1] = Int16(r2);
                r1 = r1 >> 2;
                r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
                heapClassInst.heap32[(r1 + 3)] = Int32(r0);
            }
            r0 = Int64(heapClassInst.heap32[(r4 + 14)]);
            r0 = (r0 + 1) | 0;
            heapClassInst.heap32[(r4 + 14)] = Int32(r0);
            return;
        }
    }
    else {
        r0 = _E2_str2246;
        r1 = _E2_str537;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 127;
        _assert(i7);
    }
}
    
func _ZN14btQuantizedBvhD2Ev(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = _ZTV14btQuantizedBvh;
    r2 = r0 >> 2;
    r1 = (r1 + 8) | 0;
    heapClassInst.heap32[(r2)] = Int32(r1);
    r1 = Int64(heapClassInst.heap32[(r2 + 40)]);
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 164]);
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree;
            r3 = r3 >> 2;
            r4 = Int64(heapClassInst.heap32[(r3)]);
            r4 = (r4 + 1) | 0;
            r1 = r1 >> 2;
            heapClassInst.heap32[(r3)] = Int32(r4);
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r1);
            free(i7);
        }
        heapClassInst.heap32[(r2 + 40)] = 0;
    }
    r1 = 1;
    heapClassInst.heap8[r0 + 164] = Int8(r1);
    heapClassInst.heap32[(r2 + 40)] = 0;
    heapClassInst.heap32[(r2 + 38)] = 0;
    heapClassInst.heap32[(r2 + 39)] = 0;
    r3 = Int64(heapClassInst.heap32[(r2 + 34)]);
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 140]);
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            free(i7);
        }
        heapClassInst.heap32[(r2 + 34)] = 0;
    }
    heapClassInst.heap8[r0 + 140] = Int8(r1);
    heapClassInst.heap32[(r2 + 34)] = 0;
    heapClassInst.heap32[(r2 + 32)] = 0;
    heapClassInst.heap32[(r2 + 33)] = 0;
    r3 = Int64(heapClassInst.heap32[(r2 + 29)]);
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 120]);
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            free(i7);
        }
        heapClassInst.heap32[(r2 + 29)] = 0;
    }
    heapClassInst.heap8[r0 + 120] = Int8(r1);
    heapClassInst.heap32[(r2 + 29)] = 0;
    heapClassInst.heap32[(r2 + 27)] = 0;
    heapClassInst.heap32[(r2 + 28)] = 0;
    r3 = Int64(heapClassInst.heap32[(r2 + 24)]);
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 100]);
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            free(i7);
        }
        heapClassInst.heap32[(r2 + 24)] = 0;
    }
    heapClassInst.heap8[r0 + 100] = Int8(r1);
    heapClassInst.heap32[(r2 + 24)] = 0;
    heapClassInst.heap32[(r2 + 22)] = 0;
    heapClassInst.heap32[(r2 + 23)] = 0;
    r3 = Int64(heapClassInst.heap32[(r2 + 19)]);
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 80]);
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree;
            r4 = r4 >> 2;
            r5 = Int64(heapClassInst.heap32[(r4)]);
            r5 = (r5 + 1) | 0;
            r3 = r3 >> 2;
            heapClassInst.heap32[(r4)] = Int32(r5);
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            free(i7);
        }
        heapClassInst.heap32[(r2 + 19)] = 0;
    }
    heapClassInst.heap8[r0 + 80] = Int8(r1);
    heapClassInst.heap32[(r2 + 19)] = 0;
    heapClassInst.heap32[(r2 + 17)] = 0;
    heapClassInst.heap32[(r2 + 18)] = 0;
    return;
}
    
func _ZN28btCompoundCollisionAlgorithm26preallocateChildAlgorithmsEP17btCollisionObjectS1_(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0 + 28]);
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp + 2)]);
    r4 = if (r1 == 0) {r2} else {r3};
    r5 = r4 >> 2;
    r6 = Int64(heapClassInst.heap32[(r5 + 48)]);
    r6 = r6 >> 2;
    r7 = Int64(heapClassInst.heap32[(r6 + 1)]);
    if (r7 == 31) {
        r7 = r0 >> 2;
        r8 = Int64(heapClassInst.heap32[(r7 + 3)]);
        r9 = Int64(heapClassInst.heap32[(r6 + 4)]);
        do {
            if (!(r8 > r9)) {
                if (!(r8 >= r9)) {
                    r10 = Int64(heapClassInst.heap32[(r7 + 4)]);
                    if (!(r10 >= r9)) {
                        if (r9 != 0) {
                            r10 = gNumAlignedAllocs;
                            r10 = r10 >> 2;
                            r11 = Int64(heapClassInst.heap32[(r10)]);
                            r12 = r9 << 2;
                            r11 = (r11 + 1) | 0;
                            r12 = r12 | 3;
                            heapClassInst.heap32[(r10)] = Int32(r11);
                            r10 = (r12 + 16) | 0;
                            heapClassInst.heap32[(g0)] = Int32(r10);
                            mallocNew(i7);
                            r10 = commonVariable.r_g0;
                            if (r10 != 0) {
                                r11 = 0;
                                r12 = (r10 + 4) | 0;
                                r11 = (r11 - r12) | 0;
                                r11 = r11 & 15;
                                r11 = (r10 + r11) | 0;
                                r12 = (r11 + 4) | 0;
                                r11 = r11 >> 2;
                                heapClassInst.heap32[(r11)] = Int32(r10);
                                r10 = r12;
                            }
                        }
                        else {
                            r10 = 0;
                        }
                        r11 = (r0 + 20) | 0;
                        if (r8 < 1) {
                            r12 = r11 >> 2;
                            r13 = Int64(heapClassInst.heap32[(r12)]);
                        }
                        else {
                            r12 = 0;
                            while (true) {
                                r13 = r11 >> 2;
                                r13 = Int64(heapClassInst.heap32[(r13)]);
                                r14 = r12 << 2;
                                r15 = (r13 + r14) | 0;
                                r15 = r15 >> 2;
                                r14 = (r10 + r14) | 0;
                                r15 = Int64(heapClassInst.heap32[(r15)]);
                                r12 = (r12 + 1) | 0;
                                r14 = r14 >> 2;
                                heapClassInst.heap32[(r14)] = Int32(r15);
                                if (!(r8 != r12)) {
                                    break 
                                }
                            }
                            r11 = (r0 + 20) | 0;
                        }
                        if (!(r13 == 0)) {
                            r12 = Int64(heapClassInst.heapU8[r0 + 24]);
                            if (!(r12 == 0)) {
                                r12 = gNumAlignedFree;
                                r12 = r12 >> 2;
                                r14 = Int64(heapClassInst.heap32[(r12)]);
                                r14 = (r14 + 1) | 0;
                                r13 = r13 >> 2;
                                heapClassInst.heap32[(r12)] = Int32(r14);
                                r12 = Int64(heapClassInst.heap32[(r13 + (-1))]);
                                heapClassInst.heap32[(g0)] = Int32(r12);
                                free(i7);
                            }
                            r12 = r11 >> 2;
                            heapClassInst.heap32[(r12)] = 0;
                        }
                        r12 = 1;
                        r11 = r11 >> 2;
                        heapClassInst.heap8[r0 + 24] = Int8(r12);
                        heapClassInst.heap32[(r11)] = Int32(r10);
                        heapClassInst.heap32[(r7 + 4)] = Int32(r9);
                        if (r8 >= r9) {
                            break 
                        }
                    }
                    while (true) {
                        r0 = r8 << 2;
                        r10 = Int64(heapClassInst.heap32[(r7 + 5)]);
                        r0 = (r10 + r0) | 0;
                        r8 = (r8 + 1) | 0;
                        r0 = r0 >> 2;
                        heapClassInst.heap32[(r0)] = 0;
                        if (!(r9 != r8)) {
                            break 
                        }
                    }
                }
            }
        } while (false);
        heapClassInst.heap32[(r7 + 3)] = Int32(r9);
        do {
            if (!(r9 < 1)) {
                r0 = if (r1 == 0) {r3} else {r2};
                r1 = 0;
                while (true) {
                    r2 = Int64(heapClassInst.heap32[(r6 + 16)]);
                    if (r2 == 0) {
                        r2 = (r1 * 20) | 0;
                        r2 = r2 << 2;
                        r3 = Int64(heapClassInst.heap32[(r6 + 6)]);
                        r2 = (r3 + r2) | 0;
                        r2 = r2 >> 2;
                        r3 = Int64(heapClassInst.heap32[(r5 + 48)]);
                        r2 = Int64(heapClassInst.heap32[(r2 + 16)]);
                        heapClassInst.heap32[(r5 + 48)] = Int32(r2);
                        r2 = Int64(heapClassInst.heap32[(r7 + 1)]);
                        r8 = r2 >> 2;
                        r8 = Int64(heapClassInst.heap32[(r8)]);
                        r8 = r8 >> 2;
                        r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
                        r10 = Int64(heapClassInst.heap32[(r7 + 8)]);
                        r11 = Int64(heapClassInst.heap32[(r7 + 5)]);
                        r12 = r1 << 2;
                        heapClassInst.heap32[(g0)] = Int32(r2);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r0);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r10);
                        r2 = (r11 + r12) | 0;
                        r2 = r2 >> 2;
                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                        heapClassInst.heap32[(r2)] = Int32(commonVariable.r_g0);
                        heapClassInst.heap32[(r5 + 48)] = Int32(r3);
                    }
                    else {
                        r2 = r1 << 2;
                        r3 = Int64(heapClassInst.heap32[(r7 + 5)]);
                        r2 = (r3 + r2) | 0;
                        r2 = r2 >> 2;
                        heapClassInst.heap32[(r2)] = 0;
                    }
                    r1 = (r1 + 1) | 0;
                    if (!(r9 != r1)) {
                        break 
                    }
                }
            }
        } while (false);
        return;
    }
    else {
        r0 = _E2_str99;
        r1 = _E2_str1100;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 44;
        _assert(i7);
    }
}
    
func _ZNK14btQuantizedBvh26reportAabbOverlappingNodexEP21btNodeOverlapCallbackRK9btVector3S4_(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    r4 = Int64(heapClassInst.heapU8[r0 + 60]);
    do  {
        if (r4 == 0) {
            r0 = r0 >> 2;
            r4 = Int64(heapClassInst.heap32[(r0 + 24)]);
            r5 = 0;
            r6 = r5;
            while (true) {
                r7 = Int64(heapClassInst.heap32[(r0 + 14)]);
                if (r7 > r5) {
                    if (r7 > r6) {
                        r7 = r2 >> 2;
                        r8 = r4 >> 2;
                        r6 = (r6 + 1) | 0;
                        f0 = Float64(heapClassInst.heapFloat[(r7)]);
                        f1 = Float64(heapClassInst.heapFloat[(r8 + 4)]);
                        if (f0 > f1) {
                            __label__ = 26;
                        }
                        else {
                            r9 = r3 >> 2;
                            f0 = Float64(heapClassInst.heapFloat[(r9)]);
                            f1 = Float64(heapClassInst.heapFloat[(r8)]);
                            if (f0 < f1) {
                                __label__ = 26;
                            }
                            else {
                                r9 = 1;
                                __label__ = 27;
                            }
                        }
                        if (__label__ == 26) {
                            r9 = 0;
                        }
                        f0 = Float64(heapClassInst.heapFloat[(r7 + 2)]);
                        f1 = Float64(heapClassInst.heapFloat[(r8 + 6)]);
                        if (f0 > f1) {
                            __label__ = 29;
                        }
                        else {
                            r10 = r3 >> 2;
                            f0 = Float64(heapClassInst.heapFloat[(r10 + 2)]);
                            f1 = Float64(heapClassInst.heapFloat[(r8 + 2)]);
                            if (f0 < f1) {
                                __label__ = 29;
                            }
                            else {
                                __label__ = 30;
                            }
                        }
                        if (__label__ == 29) {
                            r9 = 0;
                        }
                        f0 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                        f1 = Float64(heapClassInst.heapFloat[(r8 + 5)]);
                        if (f0 <= f1) {
                            r7 = r3 >> 2;
                            f0 = Float64(heapClassInst.heapFloat[(r7 + 1)]);
                            f1 = Float64(heapClassInst.heapFloat[(r8 + 1)]);
                            r7 = 0;
                            r10 = Int64(heapClassInst.heap32[(r8 + 8)]);
                            r11 = (-1);
                            r9 = if (f0 < f1) {r7} else {r9};
                            r7 = if (r10 == r11) {1}  else {0};
                            r12 = r9 & 255;
                            if (!(r12 == 0)) {
                                r10 = if (r10 != r11) {1} else {0};
                                r10 = r10 & 1;
                                if (r10 == 0) {
                                    r10 = r1 >> 2;
                                    r10 = Int64(heapClassInst.heap32[(r10)]);
                                    r10 = r10 >> 2;
                                    r10 = Int64(heapClassInst.heap32[(r10 + 2)]);
                                    r11 = Int64(heapClassInst.heap32[(r8 + 10)]);
                                    r12 = Int64(heapClassInst.heap32[(r8 + 9)]);
                                    heapClassInst.heap32[(g0)] = Int32(r1);
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r11);
                                    __FUNCTION_TABLE__[(r10) >> 2](i7);
                                }
                            }
                        }
                        else {
                            r7 = Int64(heapClassInst.heap32[(r8 + 8)]);
                            r9 = (-1);
                            r7 = if (r7 == r9) {1} else {0};
                            r9 = 0;
                        }
                        r9 = r9 & 255;
                        if (!(r9 != 0)) {
                            r7 = r7 & 1;
                            if (r7 == 0) {
                                r7 = Int64(heapClassInst.heap32[(r8 + 8)]);
                                r8 = r7 << 6;
                                r4 = (r4 + r8) | 0;
                                r5 = (r7 + r5) | 0;
                                continue 
                            }
                        }
                        r4 = (r4 + 64) | 0;
                        r5 = (r5 + 1) | 0;
                    }
                    else {
                        __label__ = 22;
                        break 
                    }
                }
                else {
                    __label__ = 40;
                    break 
                }
            }
            match (__label__) {
                case 40 =>
                    r0 = maxIterations;
                    r0 = r0 >> 2;
                    r1 = Int64(heapClassInst.heap32[(r0)]);
                    if (r1 >= r6) {
                        break 
                    }
                    else {
                        heapClassInst.heap32[(r0)] = Int32(r6);
                        return;
                    }
                case 22 =>
                    r0 = _E2_str1921;
                    r1 = _E2_str537;
                    heapClassInst.heap32[(g0)] = Int32(r0);
                    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                    heapClassInst.heap32[(g0 + 2)] = 367;
                    _assert(i7);
                case _ =>
                    println("break9743")
            }
        }
        else {
            r4 = sp + (-6);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            heapClassInst.heap32[(g0 + 2)] = Int32(r2);
            heapClassInst.heap32[(g0 + 3)] = 0;
            _ZNK14btQuantizedBvh17quantizeWithClampEPtRK9btVector3i(i7);
            r2 = sp + (-12);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r2);
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            heapClassInst.heap32[(g0 + 3)] = 1;
            r3 = r0 >> 2;
            _ZNK14btQuantizedBvh17quantizeWithClampEPtRK9btVector3i(i7);
            r5 = Int64(heapClassInst.heap32[(r3 + 36)]);
            if (r5 == 2) {
                r3 = Int64(heapClassInst.heap32[(r3 + 34)]);
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                heapClassInst.heap32[(g0 + 2)] = Int32(r1);
                heapClassInst.heap32[(g0 + 3)] = Int32(r4);
                heapClassInst.heap32[(g0 + 4)] = Int32(r2);
                _ZNK14btQuantizedBvh42walkRecursiveQuantizedTreeAgainstQueryAabbEPK18btQuantizedBvhNodeP21btNodeOverlapCallbackPtS5_(i7);
                return;
            }
            else {
                if (r5 == 1) {
                    r5 = Int64(heapClassInst.heapU8[r0 + 60]);
                    if (r5 == 0) {
                        r2 = _E2_str212;
                        r3 = _E2_str537;
                        heapClassInst.heap32[(g0)] = Int32(r2);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r3);
                        heapClassInst.heap32[(g0 + 2)] = 735;
                        _assert(i7);
                    }
                    else {
                        r5 = Int64(heapClassInst.heap32[(r3 + 38)]);
                        if (r5 > 0) {
                            r5 = 0;
                            while (true) {
                                r6 = Int64(heapClassInst.heap32[(r3 + 40)]);
                                r7 = r5 << 5;
                                r8 = (r6 + r7) | 0;
                                r9 = Int64(heapClassInst.heapU16[(sp + (-6)) >> 1]);
                                r10 = Int64(heapClassInst.heapU16[(r8 + 6) >> 1]);
                                if (!(`UIntNative`(r9) > `UIntNative`(r10))) {
                                    r9 = Int64(heapClassInst.heapU16[(sp + (-12)) >> 1]);
                                    r6 = Int64(heapClassInst.heapU16[(r6 + r7) >> 1]);
                                    r7 = r9 & 65535;
                                    r6 = r6 & 65535;
                                    if (!(`UIntNative`(r7) < `UIntNative`(r6))) {
                                        r6 = Int64(heapClassInst.heapU16[(sp + (-2)) >> 1]);
                                        r7 = Int64(heapClassInst.heapU16[(r8 + 10) >> 1]);
                                        r6 = r6 & 65535;
                                        r7 = r7 & 65535;
                                        if (!(`UIntNative`(r6) > `UIntNative`(r7))) {
                                            r6 = Int64(heapClassInst.heapU16[(sp + (-8)) >> 1]);
                                            r7 = Int64(heapClassInst.heapU16[(r8 + 4) >> 1]);
                                            r6 = r6 & 65535;
                                            r7 = r7 & 65535;
                                            if (!(`UIntNative`(r6) < `UIntNative`(r7))) {
                                                r6 = Int64(heapClassInst.heapU16[(sp + (-4)) >> 1]);
                                                r7 = Int64(heapClassInst.heapU16[(r8 + 8) >> 1]);
                                                r6 = r6 & 65535;
                                                r7 = r7 & 65535;
                                                if (!(`UIntNative`(r6) > `UIntNative`(r7))) {
                                                    r6 = Int64(heapClassInst.heapU16[(sp + (-10)) >> 1]);
                                                    r7 = Int64(heapClassInst.heapU16[(r8 + 2) >> 1]);
                                                    r6 = r6 & 65535;
                                                    r7 = r7 & 65535;
                                                    if (!(`UIntNative`(r6) < `UIntNative`(r7))) {
                                                        r6 = r8 >> 2;
                                                        r7 = Int64(heapClassInst.heap32[(r6 + 3)]);
                                                        r6 = Int64(heapClassInst.heap32[(r6 + 4)]);
                                                        r6 = (r6 + r7) | 0;
                                                        heapClassInst.heap32[(g0)] = Int32(r0);
                                                        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                                                        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                                                        heapClassInst.heap32[(g0 + 3)] = Int32(r2);
                                                        heapClassInst.heap32[(g0 + 4)] = Int32(r7);
                                                        heapClassInst.heap32[(g0 + 5)] = Int32(r6);
                                                        _ZNK14btQuantizedBvh26walkStacklessQuantizedTreeEP21btNodeOverlapCallbackPtS2_ii(i7);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                r5 = (r5 + 1) | 0;
                                r6 = Int64(heapClassInst.heap32[(r3 + 38)]);
                                if (r6 > r5) {
                                    continue 
                                }
                                else {
                                    break 
                                }
                            }
                        }
                        else {
                            break 
                        }
                    }
                }
                else {
                    if (r5 != 0) {
                        r0 = _E2_str10;
                        r1 = _E2_str537;
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                        heapClassInst.heap32[(g0 + 2)] = 341;
                        _assert(i7);
                    }
                    else {
                        r3 = Int64(heapClassInst.heap32[(r3 + 14)]);
                        heapClassInst.heap32[(g0)] = Int32(r0);
                        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
                        heapClassInst.heap32[(g0 + 3)] = Int32(r2);
                        heapClassInst.heap32[(g0 + 4)] = 0;
                        heapClassInst.heap32[(g0 + 5)] = Int32(r3);
                        _ZNK14btQuantizedBvh26walkStacklessQuantizedTreeEP21btNodeOverlapCallbackPtS2_ii(i7);
                        return;
                    }
                }
            }
        }
    } while (false);
    return;
}
    
func _ZNK14btQuantizedBvh17quantizeWithClampEPtRK9btVector3i(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-32);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0 + 60]);
    if (r1 != 0) {
        r1 = Int64(heapClassInst.heap32[(fp + 1)]);
        r2 = Int64(heapClassInst.heap32[(fp + 2)]);
        r3 = Int64(heapClassInst.heap32[(fp + 3)]);
        r2 = r2 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r2)]);
        r4 = sp + (-16);
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f0);
        f1 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
        r5 = r4 >> 2;
        heapClassInst.heapFloat[(r5 + 1)] = Float32(f1);
        f2 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
        heapClassInst.heapFloat[(r5 + 2)] = Float32(f2);
        f3 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
        r2 = r0 >> 2;
        heapClassInst.heapFloat[(r5 + 3)] = Float32(f3);
        f4 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
        if (f0 < f4) {
            heapClassInst.heapFloat[(fp + (-4))] = Float32(f4);
            f0 = f4;
        }
        f4 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
        if (f1 < f4) {
            heapClassInst.heapFloat[(r5 + 1)] = Float32(f4);
            f1 = f4;
        }
        f4 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
        if (f2 < f4) {
            heapClassInst.heapFloat[(r5 + 2)] = Float32(f4);
            f2 = f4;
        }
        f4 = Float64(heapClassInst.heapFloat[(r2 + 4)]);
        if (f3 < f4) {
            heapClassInst.heapFloat[(r5 + 3)] = Float32(f4);
            f3 = f4;
        }
        f4 = Float64(heapClassInst.heapFloat[(r2 + 5)]);
        if (!(f4 >= f0)) {
            heapClassInst.heapFloat[(fp + (-4))] = Float32(f4);
        }
        f0 = Float64(heapClassInst.heapFloat[(r2 + 6)]);
        if (!(f0 >= f1)) {
            heapClassInst.heapFloat[(r5 + 1)] = Float32(f0);
        }
        f0 = Float64(heapClassInst.heapFloat[(r2 + 7)]);
        if (!(f0 >= f2)) {
            heapClassInst.heapFloat[(r5 + 2)] = Float32(f0);
        }
        f0 = Float64(heapClassInst.heapFloat[(r2 + 8)]);
        if (!(f0 >= f3)) {
            heapClassInst.heapFloat[(r5 + 3)] = Float32(f0);
        }
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = Int32(r4);
        heapClassInst.heap32[(g0 + 3)] = Int32(r3);
        _ZNK14btQuantizedBvh8quantizeEPtRK9btVector3i(i7);
        return;
    }
    else {
        r0 = _E2_str212;
        r1 = _E2_str313;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 420;
        _assert(i7);
    }
}

    
func _ZNK14btQuantizedBvh26walkStacklessQuantizedTreeEP21btNodeOverlapCallbackPtS2_ii(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heapU8[r0 + 60]);
    if (r1 != 0) {
        r1 = Int64(heapClassInst.heap32[(fp + 1)]);
        r2 = Int64(heapClassInst.heap32[(fp + 2)]);
        r3 = Int64(heapClassInst.heap32[(fp + 3)]);
        r4 = Int64(heapClassInst.heap32[(fp + 4)]);
        r5 = Int64(heapClassInst.heap32[(fp + 5)]);
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 34)]);
        r6 = r4 << 4;
        r7 = (r5 - r4) | 0;
        r0 = (r0 + r6) | 0;
        r6 = 0;
        while (true) {
            if (r4 < r5) {
                if (r6 < r7) {
                    r8 = Int64(heapClassInst.heapU16[(r2) >> 1]);
                    r9 = Int64(heapClassInst.heapU16[(r0 + 6) >> 1]);
                    r10 = Int64(heapClassInst.heapU16[(r3) >> 1]);
                    r11 = Int64(heapClassInst.heapU16[(r0) >> 1]);
                    r8 = if (`UIntNative`(r8) > `UIntNative`(r9)) {1} else {0}
                    r9 = if (`UIntNative`(r10) < `UIntNative`(r11)) {1}  else {0}
                    r10 = Int64(heapClassInst.heapU16[(r2 + 4) >> 1]);
                    r11 = Int64(heapClassInst.heapU16[(r0 + 10) >> 1]);
                    r8 = r8 | r9;
                    r9 = if (`UIntNative`(r10) > `UIntNative`(r11)) {1}  else {0}
                    r10 = Int64(heapClassInst.heapU16[(r3 + 4) >> 1]);
                    r11 = Int64(heapClassInst.heapU16[(r0 + 4) >> 1]);
                    r8 = r8 | r9;
                    r9 = if (`UIntNative`(r10) < `UIntNative`(r11)) {1}  else {0}
                    r10 = Int64(heapClassInst.heapU16[(r2 + 2) >> 1]);
                    r11 = Int64(heapClassInst.heapU16[(r0 + 8) >> 1]);
                    r8 = r8 | r9;
                    r9 = if (`UIntNative`(r10) > `UIntNative`(r11)) {1}  else {0}
                    r10 = Int64(heapClassInst.heapU16[(r3 + 2) >> 1]);
                    r11 = Int64(heapClassInst.heapU16[(r0 + 2) >> 1]);
                    r12 = r0 >> 2;
                    r8 = r8 | r9;
                    r9 = if (`UIntNative`(r10) < `UIntNative`(r11)) {1}  else {0}
                    r10 = Int64(heapClassInst.heap32[(r12 + 3)]);
                    r6 = (r6 + 1) | 0;
                    r8 = r8 | r9;
                    if (r10 < 0) {
                        __label__ = 10;
                    }
                    else {
                        if (r8 != 0) {
                            __label__ = 10;
                        }
                        else {
                            if (r10 > (-1)) {
                                r8 = r1 >> 2;
                                r8 = Int64(heapClassInst.heap32[(r8)]);
                                r8 = r8 >> 2;
                                r8 = Int64(heapClassInst.heap32[(r8 + 2)]);
                                r12 = r10 >> 21;
                                r10 = r10 & 2097151;
                                heapClassInst.heap32[(g0)] = Int32(r1);
                                heapClassInst.heap32[(g0 + 1)] = Int32(r12);
                                heapClassInst.heap32[(g0 + 2)] = Int32(r10);
                                __FUNCTION_TABLE__[(r8) >> 2](i7);
                                __label__ = 11;
                            }
                            else {
                                __label__ = 8;
                                break 
                            }
                        }
                    }
                    if (__label__ == 10) {
                        r9 = 0;
                        r9 = if (r10 < r9) {1}  else {0};
                        r8 = r9 & r8;
                        if (r8 != 0) {
                            r8 = Int64(heapClassInst.heap32[(r12 + 3)]);
                            if (r8 < 0) {
                                r9 = r8 << 4;
                                r0 = (r0 - r9) | 0;
                                r4 = (r4 - r8) | 0;
                                continue 
                            }
                            else {
                                __label__ = 13;
                                break 
                            }
                        }
                    }
                    r0 = (r0 + 16) | 0;
                    r4 = (r4 + 1) | 0;
                }
                else {
                    __label__ = 4;
                    break 
                }
            }
            else {
                __label__ = 16;
                break 
            }
        }
        match (__label__) {
            case 16=>
                r0 = maxIterations;
                r0 = r0 >> 2;
                r1 = Int64(heapClassInst.heap32[(r0)]);
                if (!(r1 >= r6)) {
                    heapClassInst.heap32[(r0)] = Int32(r6);
                }
                return;
            case 13=>
                r0 = _E2_str941;
                r1 = _E2_str313;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = 75;
                _assert(i7);
            case 8=>
                r0 = _E2_str739;
                r1 = _E2_str313;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = 80;
                _assert(i7);
            case 4=>
                r0 = _E2_str1143;
                r1 = _E2_str537;
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                heapClassInst.heap32[(g0 + 2)] = 703;
                _assert(i7);
            case _ =>
                println("break")
        }
    }
    else {
        r0 = _E2_str212;
        r1 = _E2_str537;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 669;
        _assert(i7);
    }
}

    
func _ZNK14btQuantizedBvh42walkRecursiveQuantizedTreeAgainstQueryAabbEPK18btQuantizedBvhNodeP21btNodeOverlapCallbackPtS5_(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    r4 = Int64(heapClassInst.heap32[(fp + 4)]);
    while (true) {
        r5 = Int64(heapClassInst.heapU8[r0 + 60]);
        if (r5 != 0) {
            r5 = Int64(heapClassInst.heapU16[(r3) >> 1]);
            r6 = Int64(heapClassInst.heapU16[(r1 + 6) >> 1]);
            if (`UIntNative`(r5) > `UIntNative`(r6)) {
                __label__ = 14;
                break 
            }
            else {
                r5 = Int64(heapClassInst.heapU16[(r4) >> 1]);
                r6 = Int64(heapClassInst.heapU16[(r1) >> 1]);
                r5 = r5 & 65535;
                r6 = r6 & 65535;
                if (`UIntNative`(r5) < `UIntNative`(r6)) {
                    __label__ = 14;
                    break 
                }
                else {
                    r5 = Int64(heapClassInst.heapU16[(r3 + 4) >> 1]);
                    r6 = Int64(heapClassInst.heapU16[(r1 + 10) >> 1]);
                    r5 = r5 & 65535;
                    r6 = r6 & 65535;
                    if (`UIntNative`(r5) > `UIntNative`(r6)) {
                        __label__ = 14;
                        break 
                    }
                    else {
                        r5 = Int64(heapClassInst.heapU16[(r4 + 4) >> 1]);
                        r6 = Int64(heapClassInst.heapU16[(r1 + 4) >> 1]);
                        r5 = r5 & 65535;
                        r6 = r6 & 65535;
                        if (`UIntNative`(r5) < `UIntNative`(r6)) {
                            __label__ = 14;
                            break 
                        }
                        else {
                            r5 = Int64(heapClassInst.heapU16[(r3 + 2) >> 1]);
                            r6 = Int64(heapClassInst.heapU16[(r1 + 8) >> 1]);
                            r5 = r5 & 65535;
                            r6 = r6 & 65535;
                            if (`UIntNative`(r5) > `UIntNative`(r6)) {
                                __label__ = 14;
                                break 
                            }
                            else {
                                r5 = Int64(heapClassInst.heapU16[(r4 + 2) >> 1]);
                                r6 = Int64(heapClassInst.heapU16[(r1 + 2) >> 1]);
                                r5 = r5 & 65535;
                                r6 = r6 & 65535;
                                if (`UIntNative`(r5) < `UIntNative`(r6)) {
                                    __label__ = 14;
                                    break 
                                }
                                else {
                                    r5 = r1 >> 2;
                                    r6 = Int64(heapClassInst.heap32[(r5 + 3)]);
                                    if (r6 < 0) {
                                        r6 = (r1 + 16) | 0;
                                        heapClassInst.heap32[(g0)] = Int32(r0);
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r6);
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r2);
                                        heapClassInst.heap32[(g0 + 3)] = Int32(r3);
                                        heapClassInst.heap32[(g0 + 4)] = Int32(r4);
                                        _ZNK14btQuantizedBvh42walkRecursiveQuantizedTreeAgainstQueryAabbEPK18btQuantizedBvhNodeP21btNodeOverlapCallbackPtS5_(i7);
                                        r5 = Int64(heapClassInst.heap32[(r5 + 7)]);
                                        if (r5 < 0) {
                                            r6 = 1;
                                            r5 = (r6 - r5) | 0;
                                            r5 = r5 << 4;
                                            r1 = (r1 + r5) | 0;
                                            continue 
                                        }
                                        else {
                                            r1 = (r1 + 32) | 0;
                                            continue 
                                        }
                                    }
                                    else {
                                        __label__ = 10;
                                        break 
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        else {
            __label__ = 2;
            break 
        }
    }
    match (__label__) {
        case 14=>
            return;
        case 2=>
            r0 = _E2_str212;
            r1 = _E2_str537;
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = 419;
            _assert(i7);
        case 10=>
            r0 = r2 >> 2;
            r0 = Int64(heapClassInst.heap32[(r0)]);
            r0 = r0 >> 2;
            r0 = Int64(heapClassInst.heap32[(r0 + 2)]);
            r1 = r6 >> 21;
            r3 = r6 & 2097151;
            heapClassInst.heap32[(g0)] = Int32(r2);
            heapClassInst.heap32[(g0 + 1)] = Int32(r1);
            heapClassInst.heap32[(g0 + 2)] = Int32(r3);
            __FUNCTION_TABLE__[(r0) >> 2](i7);
            return;
        case _ =>
            println("break10269")
    }
}

    
func _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-80);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
    f1 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
    f2 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
    f3 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
    f4 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
    f5 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    f6 = f4 * f5;
    f7 = f2 * f1;
    f8 = f2 * f3;
    f9 = f0 * f5;
    f10 = Float64(heapClassInst.heapFloat[(r0)]);
    f11 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f6 = f6 - f7;
    f7 = f8 - f9;
    f8 = f0 * f1;
    f9 = f4 * f3;
    f12 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f8 = f8 - f9;
    f9 = f10 * f6;
    f13 = f11 * f7;
    f9 = f9 + f13;
    f13 = f12 * f8;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    f14 = 1.0;
    f9 = f9 + f13;
    r0 = r0 >> 2;
    f9 = f14 / f9;
    f13 = f12 * f1;
    f15 = f11 * f5;
    f5 = f10 * f5;
    f16 = f12 * f3;
    f13 = f13 - f15;
    f5 = f5 - f16;
    f15 = f11 * f2;
    f16 = f12 * f4;
    f12 = f12 * f0;
    f2 = f10 * f2;
    f3 = f11 * f3;
    f1 = f10 * f1;
    f6 = f6 * f9;
    f17 = Float64(heapClassInst.heapFloat[(r0)]);
    f7 = f7 * f9;
    f18 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f15 = f15 - f16;
    f2 = f12 - f2;
    f12 = f13 * f9;
    f5 = f5 * f9;
    f1 = f3 - f1;
    f3 = f10 * f4;
    f0 = f11 * f0;
    f4 = f6 * f17;
    f10 = f7 * f18;
    f8 = f8 * f9;
    f11 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f13 = Float64(heapClassInst.heapFloat[(r0 + 8)]);
    f15 = f15 * f9;
    f16 = Float64(heapClassInst.heapFloat[(r0 + 4)]);
    f19 = Float64(heapClassInst.heapFloat[(r0 + 9)]);
    f2 = f2 * f9;
    f20 = Float64(heapClassInst.heapFloat[(r0 + 5)]);
    f0 = f3 - f0;
    f1 = f1 * f9;
    f3 = Float64(heapClassInst.heapFloat[(r0 + 10)]);
    f21 = Float64(heapClassInst.heapFloat[(r0 + 6)]);
    f22 = f12 * f17;
    f23 = f5 * f18;
    f4 = f4 + f10;
    f10 = f8 * f11;
    f0 = f0 * f9;
    r0 = sp + (-48);
    f9 = f15 * f17;
    f17 = f2 * f18;
    f18 = f22 + f23;
    f22 = f1 * f11;
    f4 = f4 + f10;
    r1 = r0 >> 2;
    f9 = f9 + f17;
    f10 = f0 * f11;
    f11 = f18 + f22;
    heapClassInst.heapFloat[(fp + (-12))] = Float32(f4);
    f4 = f6 * f16;
    f17 = f7 * f20;
    f9 = f9 + f10;
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f11);
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f9);
    f9 = f12 * f16;
    f10 = f5 * f20;
    f4 = f4 + f17;
    f11 = f8 * f21;
    f16 = f15 * f16;
    f17 = f2 * f20;
    f9 = f9 + f10;
    f10 = f1 * f21;
    f4 = f4 + f11;
    heapClassInst.heap32[(r1 + 3)] = 0;
    f11 = f16 + f17;
    f16 = f0 * f21;
    f9 = f9 + f10;
    heapClassInst.heapFloat[(r1 + 4)] = Float32(f4);
    f4 = f6 * f13;
    f6 = f7 * f19;
    f7 = f11 + f16;
    heapClassInst.heapFloat[(r1 + 5)] = Float32(f9);
    heapClassInst.heapFloat[(r1 + 6)] = Float32(f7);
    f7 = f12 * f13;
    f5 = f5 * f19;
    f4 = f4 + f6;
    f6 = f8 * f3;
    f8 = f15 * f13;
    f2 = f2 * f19;
    f5 = f7 + f5;
    f1 = f1 * f3;
    f4 = f4 + f6;
    heapClassInst.heap32[(r1 + 7)] = 0;
    f2 = f8 + f2;
    f0 = f0 * f3;
    f1 = f5 + f1;
    heapClassInst.heapFloat[(r1 + 8)] = Float32(f4);
    f0 = f2 + f0;
    heapClassInst.heapFloat[(r1 + 9)] = Float32(f1);
    heapClassInst.heapFloat[(r1 + 10)] = Float32(f0);
    heapClassInst.heap32[(r1 + 11)] = 0;
    r1 = sp + (-64);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    _ZNK11btMatrix3x311getRotationER12btQuaternion(i7);
    r0 = r1 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f3 = f0 * f0;
    f4 = f1 * f1;
    f5 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
    f3 = f3 + f4;
    f4 = f2 * f2;
    f3 = f3 + f4;
    f4 = f5 * f5;
    f3 = f3 + f4;
    heapClassInst.heapFloat[(g0)] = Float32(f3);
    sqrtf(i7);
    f3 = commonVariable.f_g0;
    f4 = 0.0;
    if (f3 != f4) {
        r1 = Int64(heapClassInst.heap32[(fp + 2)]);
        r2 = Int64(heapClassInst.heap32[(fp + 3)]);
        f3 = f14 / f3;
        f0 = f0 * f3;
        f1 = f1 * f3;
        heapClassInst.heapFloat[(fp + (-16))] = Float32(f0);
        f2 = f2 * f3;
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f1);
        f4 = (-1.0);
        f3 = f5 * f3;
        heapClassInst.heapFloat[(r0 + 2)] = Float32(f2);
        f4 = if (f3 < f4) {f4} else {f3}
        heapClassInst.heapFloat[(r0 + 3)] = Float32(f3);
        f3 = if (f4 > f14) {f14} else {f4}
        heapClassInst.heapFloat[(g0)] = Float32(f3);
        acosf(i7);
        r0 = r2 >> 2;
        f3 = commonVariable.f_g0 + commonVariable.f_g0;
        r1 = r1 >> 2;
        heapClassInst.heapFloat[(r0)] = Float32(f3);
        heapClassInst.heapFloat[(r1)] = Float32(f0);
        f0 = f0 * f0;
        f3 = f1 * f1;
        heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
        f0 = f0 + f3;
        f1 = f2 * f2;
        f0 = f0 + f1;
        heapClassInst.heapFloat[(r1 + 2)] = Float32(f2);
        heapClassInst.heap32[(r1 + 3)] = 0;
        f1 = 1.4210854715202004e-014;
        if (f0 >= f1) {
            heapClassInst.heapFloat[(g0)] = Float32(f0);
            sqrtf(i7);
            f0 = f14 / commonVariable.f_g0;
            f1 = Float64(heapClassInst.heapFloat[(r1)]);
            f1 = f1 * f0;
            heapClassInst.heapFloat[(r1)] = Float32(f1);
            f1 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
            f1 = f1 * f0;
            heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
            f1 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
            f0 = f1 * f0;
            heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
            return;
        }
        else {
            heapClassInst.heap32[(r1)] = 1065353216;
            heapClassInst.heap32[(r1 + 1)] = 0;
            heapClassInst.heap32[(r1 + 2)] = 0;
            heapClassInst.heap32[(r1 + 3)] = 0;
            return;
        }
    }
    else {
        r0 = _E2_str584;
        r1 = _E2_str685;
        heapClassInst.heap32[(g0)] = Int32(r0);
        heapClassInst.heap32[(g0 + 1)] = Int32(r1);
        heapClassInst.heap32[(g0 + 2)] = 188;
        _assert(i7);
    }
}

    
func _ZNK11btMatrix3x311getRotationER12btQuaternion(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-24);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r1)]);
    f1 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 10)]);
    f3 = f0 + f1;
    f3 = f3 + f2;
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    f4 = 0.0;
    if (f3 <= f4) {
        if (f0 >= f1) {
            r1 = 2;
            r3 = 0;
            r1 = if (f0 < f2) {r1} else {r3};
        }
        else {
            r1 = 2;
            r3 = 1;
            r1 = if (f1 < f2) {r1} else {r3};
        }
        r3 = (r1 + 1) | 0;
        r3 = (r3 % 3) | 0;
        r4 = (r1 + 2) | 0;
        r4 = (r4 % 3) | 0;
        r5 = r1 << 4;
        r6 = r3 << 4;
        r7 = r4 << 4;
        r5 = (r0 + r5) | 0;
        r1 = r1 << 2;
        r6 = (r0 + r6) | 0;
        r3 = r3 << 2;
        r0 = (r0 + r7) | 0;
        r4 = r4 << 2;
        r7 = (r5 + r1) | 0;
        r8 = (r6 + r3) | 0;
        r7 = r7 >> 2;
        r8 = r8 >> 2;
        r9 = (r0 + r4) | 0;
        r9 = r9 >> 2;
        f0 = Float64(heapClassInst.heapFloat[(r7)]);
        f1 = Float64(heapClassInst.heapFloat[(r8)]);
        f2 = Float64(heapClassInst.heapFloat[(r9)]);
        f0 = f0 - f1;
        f0 = f0 - f2;
        f1 = 1.0
        f0 = f0 + f1;
        r7 = sp + (-16);
        heapClassInst.heapFloat[(g0)] = Float32(f0);
        r8 = (r7 + r1) | 0;
        f0 = 0.5;
        sqrtf(i7);
        r9 = (r0 + r3) | 0;
        r10 = (r6 + r4) | 0;
        r8 = r8 >> 2;
        f2 = commonVariable.f_g0 * f0;
        r9 = r9 >> 2;
        heapClassInst.heapFloat[(r8)] = Float32(f2);
        r8 = r10 >> 2;
        f2 = Float64(heapClassInst.heapFloat[(r9)]);
        f3 = Float64(heapClassInst.heapFloat[(r8)]);
        f2 = f2 - f3;
        f0 = f0 / commonVariable.f_g0;
        r6 = (r6 + r1) | 0;
        r8 = (r5 + r3) | 0;
        r9 = r7 >> 2;
        f1 = f2 * f0;
        r6 = r6 >> 2;
        heapClassInst.heapFloat[(r9 + 3)] = Float32(f1);
        r8 = r8 >> 2;
        f1 = Float64(heapClassInst.heapFloat[(r6)]);
        f2 = Float64(heapClassInst.heapFloat[(r8)]);
        r3 = (r7 + r3) | 0;
        f1 = f1 + f2;
        r0 = (r0 + r1) | 0;
        r1 = (r5 + r4) | 0;
        r3 = r3 >> 2;
        f1 = f1 * f0;
        r0 = r0 >> 2;
        heapClassInst.heapFloat[(r3)] = Float32(f1);
        r1 = r1 >> 2;
        f1 = Float64(heapClassInst.heapFloat[(r0)]);
        f2 = Float64(heapClassInst.heapFloat[(r1)]);
        r0 = (r7 + r4) | 0;
        f1 = f1 + f2;
        r0 = r0 >> 2;
        f0 = f1 * f0;
        heapClassInst.heapFloat[(r0)] = Float32(f0);
        f1 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
        f3 = Float64(heapClassInst.heapFloat[(r9 + 1)]);
        f0 = Float64(heapClassInst.heapFloat[(r9 + 2)]);
        f2 = Float64(heapClassInst.heapFloat[(r9 + 3)]);
    }
    else {
        f0 = 1.0;
        f0 = f3 + f0;
        heapClassInst.heapFloat[(g0)] = Float32(f0);
        r0 = sp + (-16);
        f0 = 0.5;
        sqrtf(i7);
        f2 = commonVariable.f_g0 * f0;
        r0 = r0 >> 2;
        heapClassInst.heapFloat[(r0 + 3)] = Float32(f2);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 6)]);
        f3 = f3 - f4;
        f0 = f0 / commonVariable.f_g0;
        f1 = f3 * f0;
        heapClassInst.heapFloat[(fp + (-4))] = Float32(f1);
        f3 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
        f3 = f3 - f4;
        f3 = f3 * f0;
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f3);
        f4 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
        f5 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
        f4 = f4 - f5;
        f0 = f4 * f0;
        heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
    }
    r0 = r2 >> 2;
    heapClassInst.heapFloat[(r0)] = Float32(f1);
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f3);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
    heapClassInst.heapFloat[(r0 + 3)] = Float32(f2);
    return;
}

    
func _ZNK13btConvexShape31localGetSupportVertexNonVirtualERK9btVector3(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-48);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    r0 = r0 >> 2;
    f0 = Float64(heapClassInst.heapFloat[(r0)]);
    r1 = sp + (-32);
    heapClassInst.heapFloat[(fp + (-8))] = Float32(f0);
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    r2 = r1 >> 2;
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = Int64(heapClassInst.heap32[(fp + 1)]);
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f2);
    f3 = f0 * f0;
    f4 = f1 * f1;
    f3 = f3 + f4;
    f4 = f2 * f2;
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 3)];
    f3 = f3 + f4;
    f4 = 1.4210854715202004e-014;
    if (f3 < f4) {
        heapClassInst.heap32[(fp + (-8))] = (-1082130432);
        heapClassInst.heap32[(r2 + 1)] = (-1082130432);
        f2 = (-1.0);
        heapClassInst.heap32[(r2 + 2)] = (-1082130432);
        heapClassInst.heap32[(r2 + 3)] = 0;
        f1 = f2;
        f0 = f2;
    }
    f0 = f0 * f0;
    f1 = f1 * f1;
    f0 = f0 + f1;
    f1 = f2 * f2;
    f0 = f0 + f1;
    heapClassInst.heapFloat[(g0)] = Float32(f0);
    sqrtf(i7);
    f1 = 1.0
    f0 = f1 / commonVariable.f_g0;
    f1 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
    f1 = f1 * f0;
    heapClassInst.heapFloat[(fp + (-8))] = Float32(f1);
    f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
    f2 = f2 * f0;
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f2);
    f3 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
    f0 = f3 * f0;
    r0 = r4 >> 2;
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f0);
    r5 = Int64(heapClassInst.heap32[(r0 + 1)]);
    do {
        if (r5 > 7) {
            if (r5 == 13) {
                f3 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                __label__ = 16;
                break 
            }
            else {
                if (r5 == 10) {
                    f3 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                    __label__ = 16;
                    break 
                }
                else {
                    if (r5 != 8) {
                        __label__ = 15;
                        break 
                    }
                    else {
                        f3 = Float64(heapClassInst.heapFloat[(r0 + 7)]);
                        f4 = Float64(heapClassInst.heapFloat[(r0 + 3)]);
                        f3 = f3 * f4;
                        __label__ = 16;
                        break 
                    }
                }
            }
        }
        else {
            if (r5 == 0) {
                f3 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                __label__ = 16;
                break 
            }
            else {
                if (r5 == 1) {
                    f3 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                    __label__ = 16;
                }
                else {
                    r5 = (r5 + (-4)) | 0;
                    if (`UIntNative`(r5) < `UIntNative`(2)) {
                        f3 = Float64(heapClassInst.heapFloat[(r0 + 11)]);
                        __label__ = 16;
                    }
                    else {
                        __label__ = 15;
                    }
                }
            }
        }
    } while (false);
    if (__label__ == 15) {
        r0 = Int64(heapClassInst.heap32[(r0)]);
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0 + 11)]);
        heapClassInst.heap32[(g0)] = Int32(r4);
        __FUNCTION_TABLE__[(r0) >> 2](i7);
        f3 = commonVariable.f_g0;
        f0 = Float64(heapClassInst.heapFloat[(r2 + 2)]);
        f2 = Float64(heapClassInst.heapFloat[(r2 + 1)]);
        f1 = Float64(heapClassInst.heapFloat[(fp + (-8))]);
    }
    r0 = sp + (-16);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r1);
    _ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(i7);
    r0 = r0 >> 2;
    f1 = f1 * f3;
    f4 = Float64(heapClassInst.heapFloat[(fp + (-4))]);
    f5 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
    f6 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
    f2 = f2 * f3;
    r0 = r3 >> 2;
    f1 = f4 + f1;
    f0 = f0 * f3;
    f2 = f6 + f2;
    heapClassInst.heapFloat[(r0)] = Float32(f1);
    f0 = f5 + f0;
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
    heapClassInst.heap32[(r0 + 3)] = 0;
    return;
}

    
func _ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-120);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r3 = Int64(heapClassInst.heap32[(fp)]);
    r4 = Int64(heapClassInst.heap32[(fp + 2)]);
    do {
        if (r2 > 4) {
            if (r2 > 9) {
                if (r2 == 10) {
                    r2 = Int64(heapClassInst.heap32[(r1 + 13)]);
                    r5 = (r2 + 2) | 0;
                    r4 = r4 >> 2;
                    r5 = (r5 % 3) | 0;
                    f0 = Float64(heapClassInst.heapFloat[(r4)]);
                    f1 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                    r2 = r2 << 2;
                    r0 = (r0 + 28) | 0;
                    r5 = r5 << 2;
                    f2 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                    r4 = (r0 + r2) | 0;
                    r0 = (r0 + r5) | 0;
                    f3 = f0 * f0;
                    f4 = f1 * f1;
                    r4 = r4 >> 2;
                    r0 = r0 >> 2;
                    f3 = f3 + f4;
                    f4 = f2 * f2;
                    f3 = f3 + f4;
                    f4 = Float64(heapClassInst.heapFloat[(r4)]);
                    f5 = Float64(heapClassInst.heapFloat[(r0)]);
                    f6 = 9.9999997473787516e-005;
                    if (f3 >= f6) {
                        heapClassInst.heapFloat[(g0)] = Float32(f3);
                        f3 = 1.0;
                        sqrtf(i7);
                        f3 = f3 / commonVariable.f_g0;
                        f0 = f0 * f3;
                        f1 = f1 * f3;
                        f2 = f2 * f3;
                    }
                    else {
                        f0 = 1.0
                        f1 = 0.0
                        f2 = f1;
                    }
                    r0 = sp + (-64);
                    r4 = r0 >> 2;
                    heapClassInst.heap32[(fp + (-16))] = 0;
                    heapClassInst.heap32[(r4 + 1)] = 0;
                    r0 = (r0 + r2) | 0;
                    heapClassInst.heap32[(r4 + 2)] = 0;
                    r0 = r0 >> 2;
                    heapClassInst.heap32[(r4 + 3)] = 0;
                    heapClassInst.heapFloat[(r0)] = Float32(f4);
                    f3 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
                    f6 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
                    f7 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
                    f3 = f1 * f3;
                    f6 = f0 * f6;
                    f8 = Float64(heapClassInst.heapFloat[(r1 + 11)]);
                    f7 = f2 * f7;
                    f3 = f3 * f5;
                    f9 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                    f6 = f6 * f5;
                    f10 = Float64(heapClassInst.heapFloat[(fp + (-16))]);
                    f5 = f7 * f5;
                    f7 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                    f11 = f1 * f8;
                    f9 = f9 + f3;
                    f12 = f0 * f8;
                    f10 = f10 + f6;
                    f9 = f9 - f11;
                    f10 = f10 - f12;
                    f8 = f2 * f8;
                    f7 = f7 + f5;
                    f7 = f7 - f8;
                    f13 = f0 * f10;
                    f14 = f1 * f9;
                    f13 = f13 + f14;
                    f14 = f2 * f7;
                    f13 = f13 + f14;
                    f14 = (-999999984306749440.0);
                    if (f13 > f14) {
                        f14 = f13;
                    }
                    else {
                        f10 = 0.0;
                        f9 = f10;
                        f7 = f10;
                    }
                    r0 = sp + (-80);
                    r1 = r0 >> 2;
                    heapClassInst.heap32[(fp + (-20))] = 0;
                    heapClassInst.heap32[(r1 + 1)] = 0;
                    r0 = (r0 + r2) | 0;
                    heapClassInst.heap32[(r1 + 2)] = 0;
                    r0 = r0 >> 2;
                    f4 = -f4;
                    heapClassInst.heap32[(r1 + 3)] = 0;
                    heapClassInst.heapFloat[(r0)] = Float32(f4);
                    f4 = Float64(heapClassInst.heapFloat[(r1 + 1)]);
                    f13 = Float64(heapClassInst.heapFloat[(fp + (-20))]);
                    f15 = Float64(heapClassInst.heapFloat[(r1 + 2)]);
                    f3 = f4 + f3;
                    f4 = f13 + f6;
                    f4 = f4 - f12;
                    f3 = f3 - f11;
                    f5 = f15 + f5;
                    f0 = f0 * f4;
                    f1 = f1 * f3;
                    f5 = f5 - f8;
                    f0 = f0 + f1;
                    f1 = f2 * f5;
                    f0 = f0 + f1;
                    r0 = r3 >> 2;
                    f1 = if (f0 > f14) {f4} else {f10};
                    f2 = if (f0 > f14) {f3} else {f9};
                    heapClassInst.heapFloat[(r0)] = Float32(f1);
                    f0 = if (f0 > f14) {f5} else {f7}
                    __label__ = 11;
                    break 
                }
                else {
                    if (r2 == 13) {
                        r0 = sp + (-16);
                        r2 = r0 >> 2;
                        heapClassInst.heap32[(fp + (-4))] = heapClassInst.heap32[(r1 + 7)];
                        heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r1 + 8)];
                        heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r1 + 9)];
                        r4 = r4 >> 2;
                        heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r1 + 10)];
                        r2 = sp + (-32);
                        heapClassInst.heap32[(fp + (-8))] = heapClassInst.heap32[(r4)];
                        f0 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                        r5 = r2 >> 2;
                        heapClassInst.heapFloat[(r5 + 1)] = Float32(f0);
                        f1 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                        heapClassInst.heapFloat[(r5 + 2)] = Float32(f1);
                        heapClassInst.heap32[(r5 + 3)] = 0;
                        r1 = Int64(heapClassInst.heap32[(r1 + 13)]);
                        if (r1 == 2) {
                            r4 = 0;
                            r5 = 2;
                            r6 = 1;
                            f1 = f0;
                        }
                        else {
                            if (r1 == 1) {
                                r4 = 0;
                                r5 = 1;
                                r6 = 2;
                            }
                            else {
                                if (r1 != 0) {
                                    r0 = _E2_str10;
                                    r1 = _E2_str7250;
                                    heapClassInst.heap32[(g0)] = Int32(r0);
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
                                    heapClassInst.heap32[(g0 + 2)] = 175;
                                    _assert(i7);
                                }
                                else {
                                    r4 = 1;
                                    r5 = 0;
                                    r6 = 2;
                                }
                            }
                        }
                        r1 = r1 << 2;
                        r4 = r4 << 2;
                        r7 = (r0 + r4) | 0;
                        r0 = (r0 + r1) | 0;
                        r1 = (r2 + r4) | 0;
                        r7 = r7 >> 2;
                        r0 = r0 >> 2;
                        r1 = r1 >> 2;
                        f0 = Float64(heapClassInst.heapFloat[(r1)]);
                        f2 = Float64(heapClassInst.heapFloat[(r7)]);
                        f3 = Float64(heapClassInst.heapFloat[(r0)]);
                        f4 = f0 * f0;
                        f5 = f1 * f1;
                        f4 = f4 + f5;
                        heapClassInst.heapFloat[(g0)] = Float32(f4);
                        sqrtf(i7);
                        f4 = commonVariable.f_g0;
                        f5 = 0.0;
                        if (f4 == f5) {
                            r0 = sp + (-48);
                            r1 = (r0 + r4) | 0;
                            r4 = r5 << 2;
                            r2 = (r2 + r4) | 0;
                            r1 = r1 >> 2;
                            r2 = r2 >> 2;
                            heapClassInst.heapFloat[(r1)] = Float32(f2);
                            f0 = Float64(heapClassInst.heapFloat[(r2)]);
                            if (f0 < f5) {
                                f3 = -f3;
                            }
                            r1 = r6 << 2;
                            r4 = (r0 + r4) | 0;
                            r1 = (r0 + r1) | 0;
                            r4 = r4 >> 2;
                            r1 = r1 >> 2;
                            heapClassInst.heapFloat[(r4)] = Float32(f3);
                            r3 = r3 >> 2;
                            heapClassInst.heap32[(r1)] = 0;
                            r0 = r0 >> 2;
                            heapClassInst.heap32[(r3)] = heapClassInst.heap32[(fp + (-12))];
                            heapClassInst.heap32[(r3 + 1)] = heapClassInst.heap32[(r0 + 1)];
                            heapClassInst.heap32[(r3 + 2)] = heapClassInst.heap32[(r0 + 2)];
                            heapClassInst.heap32[(r3 + 3)] = 0;
                            return;
                        }
                        else {
                            r0 = sp + (-48);
                            r4 = (r0 + r4) | 0;
                            f2 = f2 / f4;
                            r1 = r5 << 2;
                            r2 = (r2 + r1) | 0;
                            r4 = r4 >> 2;
                            f0 = f0 * f2;
                            r2 = r2 >> 2;
                            heapClassInst.heapFloat[(r4)] = Float32(f0);
                            f0 = Float64(heapClassInst.heapFloat[(r2)]);
                            if (f0 < f5) {
                                f3 = -f3;
                            }
                            r4 = r6 << 2;
                            r1 = (r0 + r1) | 0;
                            r4 = (r0 + r4) | 0;
                            r1 = r1 >> 2;
                            r4 = r4 >> 2;
                            f2 = f1 * f2;
                            heapClassInst.heapFloat[(r1)] = Float32(f3);
                            r1 = r3 >> 2;
                            heapClassInst.heapFloat[(r4)] = Float32(f2);
                            r4 = r0 >> 2;
                            heapClassInst.heap32[(r1)] = heapClassInst.heap32[(fp + (-12))];
                            heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r4 + 1)];
                            heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r4 + 2)];
                            heapClassInst.heap32[(r1 + 3)] = 0;
                            return;
                        }
                    }
                    else {
                        __label__ = 40;
                        break 
                    }
                }
            }
            else {
                if (r2 == 5) {
                    r0 = r4 >> 2;
                    f0 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
                    r4 = Int64(heapClassInst.heap32[(r1 + 22)]);
                    __label__ = 38;
                    break 
                }
                else {
                    if (r2 == 8) {
                        r0 = r3 >> 2;
                        heapClassInst.heap32[(r0)] = 0;
                        heapClassInst.heap32[(r0 + 1)] = 0;
                        heapClassInst.heap32[(r0 + 2)] = 0;
                        heapClassInst.heap32[(r0 + 3)] = 0;
                        return;
                    }
                    else {
                        __label__ = 40;
                        break 
                    }
                }
            }
        }
        else {
            if (r2 == 0) {
                r0 = r4 >> 2;
                f0 = Float64(heapClassInst.heapFloat[(r1 + 7)]);
                f1 = Float64(heapClassInst.heapFloat[(r1 + 9)]);
                f2 = Float64(heapClassInst.heapFloat[(r1 + 8)]);
                f3 = 0.0;
                f4 = -f0;
                f5 = Float64(heapClassInst.heapFloat[(r0)]);
                f6 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
                f7 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
                f8 = -f2;
                r0 = r3 >> 2;
                f0 = if (f5 < f3) {f4} else {f0}
                f4 = -f1;
                f2 = if (f7 < f3) {f8} else {f2}
                heapClassInst.heapFloat[(r0)] = Float32(f0);
                f0 = if (f6 < f3) {f4} else {f1}
                __label__ = 11;
                break 
            }
            else {
                if (r2 == 1) {
                    r4 = r4 >> 2;
                    f0 = Float64(heapClassInst.heapFloat[(r1 + 13)]);
                    f1 = Float64(heapClassInst.heapFloat[(r4)]);
                    f2 = Float64(heapClassInst.heapFloat[(r1 + 17)]);
                    f3 = Float64(heapClassInst.heapFloat[(r1 + 21)]);
                    f4 = Float64(heapClassInst.heapFloat[(r1 + 14)]);
                    f5 = Float64(heapClassInst.heapFloat[(r4 + 1)]);
                    f6 = Float64(heapClassInst.heapFloat[(r1 + 18)]);
                    f7 = Float64(heapClassInst.heapFloat[(r1 + 22)]);
                    f0 = f1 * f0;
                    f4 = f5 * f4;
                    f8 = Float64(heapClassInst.heapFloat[(r1 + 15)]);
                    f9 = Float64(heapClassInst.heapFloat[(r4 + 2)]);
                    f10 = Float64(heapClassInst.heapFloat[(r1 + 19)]);
                    f11 = Float64(heapClassInst.heapFloat[(r1 + 23)]);
                    f2 = f1 * f2;
                    f6 = f5 * f6;
                    f1 = f1 * f3;
                    f3 = f5 * f7;
                    f0 = f0 + f4;
                    f4 = f9 * f8;
                    f2 = f2 + f6;
                    f5 = f9 * f10;
                    f1 = f1 + f3;
                    f3 = f9 * f11;
                    f0 = f0 + f4;
                    f2 = f2 + f5;
                    f1 = f1 + f3;
                    if (f0 >= f2) {
                        r1 = 2;
                        r4 = 0;
                        r1 = if (f0 < f1) {r1} else {r4};
                    }
                    else {
                        r1 = 2;
                        r4 = 1;
                        r1 = if (f2 < f1) {r1} else {r4};
                    }
                    r1 = r1 << 4;
                    r0 = (r0 + r1) | 0;
                    r0 = r0 >> 2;
                    f0 = Float64(heapClassInst.heapFloat[(r0 + 15)]);
                    f1 = Float64(heapClassInst.heapFloat[(r0 + 14)]);
                    r1 = r3 >> 2;
                    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 13)];
                    heapClassInst.heapFloat[(r1 + 1)] = Float32(f1);
                    heapClassInst.heapFloat[(r1 + 2)] = Float32(f0);
                    heapClassInst.heap32[(r1 + 3)] = 0;
                    return;
                }
                else {
                    if (r2 == 4) {
                        r0 = r4 >> 2;
                        f0 = Float64(heapClassInst.heapFloat[(r1 + 5)]);
                        r4 = Int64(heapClassInst.heap32[(r1 + 25)]);
                        __label__ = 38;
                    }
                    else {
                        __label__ = 40;
                    }
                }
            }
        }
    } while (false);
    match (__label__) {
        case 11=>
            heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
            heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
            heapClassInst.heap32[(r0 + 3)] = 0;
            return;
        case 40=>
            r1 = Int64(heapClassInst.heap32[(r1)]);
            r1 = r1 >> 2;
            r1 = Int64(heapClassInst.heap32[(r1 + 16)]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            heapClassInst.heap32[(g0 + 2)] = Int32(r4);
            __FUNCTION_TABLE__[(r1) >> 2](i7);
            return;
        case 38 =>
            r2 = Int64(heapClassInst.heap32[(r1 + 23)]);
            f1 = Float64(heapClassInst.heapFloat[(r0)]);
            f2 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
            f3 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
            f4 = Float64(heapClassInst.heapFloat[(r1 + 3)]);
            f5 = Float64(heapClassInst.heapFloat[(r1 + 4)]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            heapClassInst.heapFloat[(g0 + 1)] = Float32(f1);
            heapClassInst.heapFloat[(g0 + 2)] = Float32(f2);
            heapClassInst.heapFloat[(g0 + 3)] = Float32(f3);
            heapClassInst.heap32[(g0 + 4)] = Int32(r4);
            heapClassInst.heap32[(g0 + 5)] = Int32(r2);
            heapClassInst.heapFloat[(g0 + 6)] = Float32(f4);
            heapClassInst.heapFloat[(g0 + 7)] = Float32(f5);
            heapClassInst.heapFloat[(g0 + 8)] = Float32(f0);
            _ZL17convexHullSupportRK9btVector3PS0_iS1_(i7);
            return;
        case _ =>
            println("break")
    }
}

    
func _ZL17convexHullSupportRK9btVector3PS0_iS1_(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 5)]);
    if (!(r0 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 8)]);
        f1 = Float64(heapClassInst.heapFloat[(fp + 3)]);
        f2 = Float64(heapClassInst.heapFloat[(fp + 7)]);
        f3 = Float64(heapClassInst.heapFloat[(fp + 2)]);
        f4 = Float64(heapClassInst.heapFloat[(fp + 6)]);
        f5 = Float64(heapClassInst.heapFloat[(fp + 1)]);
        r1 = Int64(heapClassInst.heap32[(fp)]);
        r2 = Int64(heapClassInst.heap32[(fp + 4)]);
        f1 = f1 * f0;
        f3 = f3 * f2;
        f5 = f5 * f4;
        r3 = 0;
        r4 = (-1);
        f6 = (-999999984306749440.0);
        while (true) {
            r5 = r3 << 4;
            r5 = (r2 + r5) | 0;
            r5 = r5 >> 2;
            f7 = Float64(heapClassInst.heapFloat[(r5)]);
            f8 = Float64(heapClassInst.heapFloat[(r5 + 1)]);
            f7 = f5 * f7;
            f8 = f3 * f8;
            f9 = Float64(heapClassInst.heapFloat[(r5 + 2)]);
            f7 = f7 + f8;
            f8 = f1 * f9;
            f7 = f7 + f8;
            r5 = (r3 + 1) | 0;
            r4 = if (f7 > f6) {r3} else {r4};
            f6 = if (f7 > f6) {f7} else {f6};
            r3 = r5;
            if (!(r0 != r5)) {
                break 
            }
        }
        if (r4 > (-1)) {
            r0 = r4 << 4;
            r0 = (r2 + r0) | 0;
            r0 = r0 >> 2;
            f1 = Float64(heapClassInst.heapFloat[(r0)]);
            f3 = Float64(heapClassInst.heapFloat[(r0 + 2)]);
            f5 = Float64(heapClassInst.heapFloat[(r0 + 1)]);
            r0 = r1 >> 2;
            f1 = f1 * f4;
            f2 = f5 * f2;
            heapClassInst.heapFloat[(r0)] = Float32(f1);
            f0 = f3 * f0;
            heapClassInst.heapFloat[(r0 + 1)] = Float32(f2);
            heapClassInst.heapFloat[(r0 + 2)] = Float32(f0);
            heapClassInst.heap32[(r0 + 3)] = 0;
            return;
        }
    }
    r1 = _E2_str6249;
    r2 = _E2_str7250;
    heapClassInst.heap32[(g0)] = Int32(r1);
    heapClassInst.heap32[(g0 + 1)] = Int32(r2);
    heapClassInst.heap32[(g0 + 2)] = 108;
    _assert(i7);
}

    
func _ZN15CProfileManager13Start_ProfileEPKc(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = _ZN15CProfileManager11CurrentNodeE;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0)]);
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r3 = r1 >> 2;
    r4 = Int64(heapClassInst.heap32[(r3)]);
    if (r4 != r2) {
        r4 = (r1 + 24) | 0;
        while (true) {
            r4 = r4 >> 2;
            r4 = Int64(heapClassInst.heap32[(r4)]);
            if (r4 != 0) {
                r5 = r4 >> 2;
                r5 = Int64(heapClassInst.heap32[(r5)]);
                if (r5 != r2) {
                    r4 = (r4 + 28) | 0;
                }
                else {
                    __label__ = 3;
                    break 
                }
            }
            else {
                __label__ = 6;
                break 
            }
        }
        match (__label__) {
            case 6 =>
                heapClassInst.heap32[(g0)] = 32;
                _Znwj(i7);
                r4 = commonVariable.r_g0;
                r5 = r4 >> 2;
                heapClassInst.heap32[(r5)] = Int32(r2);
                heapClassInst.heap32[(r5 + 1)] = 0;
                heapClassInst.heap32[(r5 + 2)] = 0;
                heapClassInst.heap32[(r5 + 3)] = 0;
                heapClassInst.heap32[(r5 + 4)] = 0;
                heapClassInst.heap32[(r5 + 5)] = Int32(r1);
                heapClassInst.heap32[(r5 + 6)] = 0;
                heapClassInst.heap32[(r5 + 7)] = 0;
                heapClassInst.heap32[(g0)] = Int32(r4);
                _ZN12CProfileNode5ResetEv(i7);
                r1 = Int64(heapClassInst.heap32[(r3 + 6)]);
                heapClassInst.heap32[(r5 + 7)] = Int32(r1);
                heapClassInst.heap32[(r3 + 6)] = Int32(r4);
                r1 = r4;
            case 3 =>
                r1 = r4;
            case _ =>
                println("break")
        }
        heapClassInst.heap32[(r0)] = Int32(r1);
    }
    r0 = r1 >> 2;
    r1 = Int64(heapClassInst.heap32[(r0 + 1)]);
    r1 = (r1 + 1) | 0;
    heapClassInst.heap32[(r0 + 1)] = Int32(r1);
    r1 = Int64(heapClassInst.heap32[(r0 + 4)]);
    r2 = (r1 + 1) | 0;
    heapClassInst.heap32[(r0 + 4)] = Int32(r2);
    if (!(r1 != 0)) {
        r1 = sp + (-8);
        heapClassInst.heap32[(g0)] = Int32(r1);
        heapClassInst.heap32[(g0 + 1)] = 0;
        r2 = _ZL13gProfileClock_2E_0;
        gettimeofday(i7);
        r2 = r2 >> 2;
        r2 = Int64(heapClassInst.heap32[(r2)]);
        r2 = r2 >> 2;
        r1 = r1 >> 2;
        r3 = Int64(heapClassInst.heap32[(fp + (-2))]);
        r4 = Int64(heapClassInst.heap32[(r2)]);
        r3 = (r3 - r4) | 0;
        r1 = Int64(heapClassInst.heap32[(r1 + 1)]);
        r2 = Int64(heapClassInst.heap32[(r2 + 1)]);
        r1 = (r1 - r2) | 0;
        r2 = (r3 * 1000000) | 0;
        r1 = (r1 + r2) | 0;
        heapClassInst.heap32[(r0 + 3)] = Int32(r1);
    }
    return;
}

    
func _ZN12CProfileNode5ResetEv(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    while (true) {
        r0 = r0 >> 2;
        heapClassInst.heap32[(r0 + 1)] = 0;
        heapClassInst.heap32[(r0 + 2)] = 0;
        r1 = Int64(heapClassInst.heap32[(r0 + 6)]);
        if (!(r1 == 0)) {
            heapClassInst.heap32[(g0)] = Int32(r1);
            _ZN12CProfileNode5ResetEv(i7);
        }
        r0 = Int64(heapClassInst.heap32[(r0 + 7)]);
        if (r0 != 0) {
            continue 
        }
        else {
            break 
        }
    }
    return;
}

    
func powf(sp: Int64) : Unit
{
    var value = heapClassInst.heapFloat[sp >> 2];
    var value2 = heapClassInst.heapFloat[(sp + 4) >> 2];
    commonVariable.f_g0 = Float64(pow(value, value2))
}

    
func abort(sp: Int64) : Unit
{
    assert(false);
}

    
func _Znaj(sp: Int64) : Unit
{
    mallocNew(sp);
}

    
func _ZdaPv(sp: Int64) : Unit
{
    free(sp);
}

    
func emit_OpenHarmony_32(data: Int64) : Unit
{
    heapClassInst.heapU32[commonVariable.g_addr_emit >> 2] = UInt32(data);
    commonVariable.g_addr_emit += 4;
}

    
func emit_OpenHarmony_start(addr: Int64) : Unit
{
    commonVariable.g_addr_emit = addr;
}

    
func emit_OpenHarmony_8(data: UInt8) : Unit
{
    heapClassInst.heapU8[commonVariable.g_addr_emit] = data;
    commonVariable.g_addr_emit += 1;
}

    
func emit_OpenHarmony_16(data: Int64) : Unit
{
    heapClassInst.heapU16[commonVariable.g_addr_emit >> 1] = UInt16(data);
    commonVariable.g_addr_emit += 2;
}

    
func emit_OpenHarmony_Fill(data: UInt8, size: Int64) : Unit
{
    for (j in 0 .. size)
    {
        heapClassInst.heapU8[commonVariable.g_addr_emit] = data;
        commonVariable.g_addr_emit += 1
    }
}

    
func emit_OpenHarmony_String(v: String) : Unit
{
    for (char1 in v) {
        heapClassInst.heapU8[commonVariable.g_addr_emit] = UInt8(char1)
        commonVariable.g_addr_emit += 1
    }
}

foreign {
    func malloc(size: UIntNative): CPointer<Unit>

    func free(cPointer: CPointer<Unit>): Unit
}
    
func initHeap() : Unit
{
    unsafe{
        heapClassInst.heap = malloc(UIntNative(mandreel_total_memory))
    }
    
    heapClassInst.size = Int64(mandreel_total_memory)

    for (i in 0..(mandreel_total_memory / 4))
    {
        heapClassInst.heapU32[i] = 0;
    }
}

    
func assert_unalign() : Unit
{
    dump("fatal error: unaligned memory access detected!!!!");
    assert(false);
}

    
func __cxa_pure_virtual(sp: Int64) : Unit
{
    assert(false);
}

    
func mandreel_call_constructors(_ptr: Int64, size: Int64, stackPos: Int64) : Unit
{
    var ptr = _ptr;
    ptr = ptr >> 2;
    for (i in 0..size)
    {
        var tag = heapClassInst.heap32[ptr];
        var ptr_id = heapClassInst.heap32[ptr + 1];
        __FUNCTION_TABLE__[Int64((ptr_id)) >> 2](stackPos);
        ptr += 2;
    }
}

    
func cmpfacets(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r0 = r0 >> 2;
    r1 = r1 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0)]);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r0 = r0 >> 2;
    r1 = r1 >> 2;
    r2 = Int64(heapClassInst.heap32[(r0 + 5)]);
    r3 = Int64(heapClassInst.heap32[(r1 + 5)]);
    if (r2 != r3) {
        r0 = (r3 - r2) | 0;
        commonVariable.r_g0 = r0;
        return;
    }
    else {
        r2 = Int64(heapClassInst.heap32[(r1 + 1)]);
        r3 = Int64(heapClassInst.heap32[(r0 + 1)]);
        r0 = _E2_str538;
        r3 = if (r3 == 0) {r0} else {r3};
        r2 = if (r2 == 0) {r0} else {r2};
        heapClassInst.heap32[(g0)] = Int32(r3);
        heapClassInst.heap32[(g0 + 1)] = Int32(r2);
        strcmp(i7);
        return;
    }
}

    
func strcmp(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = r1 ^ r0;
    r2 = r2 & 3;
    do {
        if (r2 == 0) {
            r2 = r0 & 3;
            do {
                if (r2 != 0) {
                    r2 = r0 | (-4);
                    while (true) {
                        if (r2 != 0) {
                            r3 = Int64(heapClassInst.heapU8[r0]);
                            r4 = Int64(heapClassInst.heapU8[r1]);
                            if (r3 == 0) {
                                break 
                            }
                            else {
                                r5 = r4 & 255;
                                if (r3 == r5) {
                                    r0 = (r0 + 1) | 0;
                                    r1 = (r1 + 1) | 0;
                                    r2 = (r2 + 1) | 0;
                                }
                                else {
                                    break 
                                }
                            }
                        }
                        else {
                            break 
                        }
                    }
                    r0 = r3 << 24;
                    r1 = r4 << 24;
                    break 
                }
            } while (false);
            while (true) {
                r2 = r0 >> 2;
                r2 = Int64(heapClassInst.heap32[(r2)]);
                r3 = r1 >> 2;
                r4 = r2 & (-2139062144);
                r3 = Int64(heapClassInst.heap32[(r3)]);
                r4 = r4 ^ (-2139062144);
                r5 = (r2 + (-16843009)) | 0;
                r4 = r4 & r5;
                if (r4 != 0) {
                    break 
                }
                else {
                    r4 = r3 & (-2139062144);
                    r4 = r4 ^ (-2139062144);
                    r5 = (r3 + (-16843009)) | 0;
                    r4 = r4 & r5;
                    if (r4 != 0) {
                        break 
                    }
                    else {
                        r0 = (r0 + 4) | 0;
                        r1 = (r1 + 4) | 0;
                        if (!(r2 == r3)) {
                            break 
                        }
                    }
                }
            }
            r0 = r2 & 255;
            do {
                if (!(r0 == 0)) {
                    r0 = r2 & 255;
                    r1 = r3 & 255;
                    if (!(r0 != r1)) {
                        __label__ = 19;
                        while (true) {
                            r2 = r2 >> 8;
                            r3 = r3 >> 8;
                            r0 = r2 & 255;
                            if (r0 == 0) {
                                break 
                            }
                            else {
                                r1 = r3 & 255;
                                if (!(r0 == r1)) {
                                    break 
                                }
                            }
                        }
                    }
                }
            } while (false);
            r2 = r2 & 255;
            r3 = r3 & 255;
            r2 = (r2 - r3) | 0;
            commonVariable.r_g0 = r2;
            return;
        }
        else {
            while (true) {
                r2 = Int64(heapClassInst.heapU8[r0]);
                r3 = Int64(heapClassInst.heapU8[r1]);
                if (r2 == 0) {
                    break 
                }
                else {
                    r4 = r3 & 255;
                    if (r2 == r4) {
                        r0 = (r0 + 1) | 0;
                        r1 = (r1 + 1) | 0;
                    }
                    else {
                        break 
                    }
                }
            }
            r0 = r2 << 24;
            r1 = r3 << 24;
        }
    } while (false);
    r0 = r0 >> 24;
    r1 = r1 >> 24;
    r0 = (r0 - r1) | 0;
    commonVariable.r_g0 = r0;
    return;
}

    
func cmplocales(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r0 = r0 >> 2;
    r1 = r1 >> 2;
    r0 = Int64(heapClassInst.heap32[(r0)]);
    r1 = Int64(heapClassInst.heap32[(r1)]);
    r1 = r1 >> 2;
    r0 = r0 >> 2;
    r1 = Int64(heapClassInst.heap32[(r1 + 38)]);
    r0 = Int64(heapClassInst.heap32[(r0 + 38)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    strcmp(i7);
    return;
}

    
func _ZN21btCollisionDispatcher19defaultNearCallbackER16btBroadphasePairRS_RK16btDispatcherInfo(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-184);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r2 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r2)]);
    r4 = Int64(heapClassInst.heap32[(r1)]);
    r5 = Int64(heapClassInst.heap32[(r1 + 1)]);
    r3 = r3 >> 2;
    r4 = r4 >> 2;
    r5 = r5 >> 2;
    r4 = Int64(heapClassInst.heap32[(r4)]);
    r5 = Int64(heapClassInst.heap32[(r5)]);
    r3 = Int64(heapClassInst.heap32[(r3 + 6)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r4);
    heapClassInst.heap32[(g0 + 2)] = Int32(r5);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = commonVariable.r_g0;
    do  {
        if (!(r3 == 0)) {
            r3 = Int64(heapClassInst.heap32[(fp + 2)]);
            r6 = Int64(heapClassInst.heap32[(r1 + 2)]);
            if (r6 == 0) {
                r6 = Int64(heapClassInst.heap32[(r2)]);
                r6 = r6 >> 2;
                r6 = Int64(heapClassInst.heap32[(r6 + 2)]);
                heapClassInst.heap32[(g0)] = Int32(r0);
                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                heapClassInst.heap32[(g0 + 2)] = Int32(r5);
                heapClassInst.heap32[(g0 + 3)] = 0;
                __FUNCTION_TABLE__[(r6) >> 2](i7);
                r6 = commonVariable.r_g0;
                heapClassInst.heap32[(r1 + 2)] = Int32(r6);
                if (r6 == 0) {
                    break 
                }
            }
            r0 = _ZTV16btManifoldResult;
            r1 = sp + (-160);
            r0 = (r0 + 8) | 0;
            r2 = r1 >> 2;
            heapClassInst.heap32[(fp + (-40))] = Int32(r0);
            heapClassInst.heap32[(r2 + 1)] = 0;
            heapClassInst.heap32[(r2 + 34)] = Int32(r4);
            r0 = r4 >> 2;
            heapClassInst.heap32[(r2 + 35)] = Int32(r5);
            heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 1)];
            heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 2)];
            heapClassInst.heap32[(r2 + 4)] = heapClassInst.heap32[(r0 + 3)];
            heapClassInst.heap32[(r2 + 5)] = heapClassInst.heap32[(r0 + 4)];
            heapClassInst.heap32[(r2 + 6)] = heapClassInst.heap32[(r0 + 5)];
            heapClassInst.heap32[(r2 + 7)] = heapClassInst.heap32[(r0 + 6)];
            heapClassInst.heap32[(r2 + 8)] = heapClassInst.heap32[(r0 + 7)];
            heapClassInst.heap32[(r2 + 9)] = heapClassInst.heap32[(r0 + 8)];
            heapClassInst.heap32[(r2 + 10)] = heapClassInst.heap32[(r0 + 9)];
            heapClassInst.heap32[(r2 + 11)] = heapClassInst.heap32[(r0 + 10)];
            heapClassInst.heap32[(r2 + 12)] = heapClassInst.heap32[(r0 + 11)];
            heapClassInst.heap32[(r2 + 13)] = heapClassInst.heap32[(r0 + 12)];
            heapClassInst.heap32[(r2 + 14)] = heapClassInst.heap32[(r0 + 13)];
            heapClassInst.heap32[(r2 + 15)] = heapClassInst.heap32[(r0 + 14)];
            heapClassInst.heap32[(r2 + 16)] = heapClassInst.heap32[(r0 + 15)];
            r7 = r5 >> 2;
            heapClassInst.heap32[(r2 + 17)] = heapClassInst.heap32[(r0 + 16)];
            heapClassInst.heap32[(r2 + 18)] = heapClassInst.heap32[(r7 + 1)];
            heapClassInst.heap32[(r2 + 19)] = heapClassInst.heap32[(r7 + 2)];
            heapClassInst.heap32[(r2 + 20)] = heapClassInst.heap32[(r7 + 3)];
            heapClassInst.heap32[(r2 + 21)] = heapClassInst.heap32[(r7 + 4)];
            heapClassInst.heap32[(r2 + 22)] = heapClassInst.heap32[(r7 + 5)];
            heapClassInst.heap32[(r2 + 23)] = heapClassInst.heap32[(r7 + 6)];
            heapClassInst.heap32[(r2 + 24)] = heapClassInst.heap32[(r7 + 7)];
            heapClassInst.heap32[(r2 + 25)] = heapClassInst.heap32[(r7 + 8)];
            heapClassInst.heap32[(r2 + 26)] = heapClassInst.heap32[(r7 + 9)];
            heapClassInst.heap32[(r2 + 27)] = heapClassInst.heap32[(r7 + 10)];
            heapClassInst.heap32[(r2 + 28)] = heapClassInst.heap32[(r7 + 11)];
            heapClassInst.heap32[(r2 + 29)] = heapClassInst.heap32[(r7 + 12)];
            heapClassInst.heap32[(r2 + 30)] = heapClassInst.heap32[(r7 + 13)];
            heapClassInst.heap32[(r2 + 31)] = heapClassInst.heap32[(r7 + 14)];
            heapClassInst.heap32[(r2 + 32)] = heapClassInst.heap32[(r7 + 15)];
            r0 = r6 >> 2;
            heapClassInst.heap32[(r2 + 33)] = heapClassInst.heap32[(r7 + 16)];
            r0 = Int64(heapClassInst.heap32[(r0)]);
            r2 = r3 >> 2;
            r7 = Int64(heapClassInst.heap32[(r2 + 2)]);
            if (r7 != 1) {
                r0 = r0 >> 2;
                r0 = Int64(heapClassInst.heap32[(r0 + 3)]);
                heapClassInst.heap32[(g0)] = Int32(r6);
                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                heapClassInst.heap32[(g0 + 2)] = Int32(r5);
                heapClassInst.heap32[(g0 + 3)] = Int32(r3);
                heapClassInst.heap32[(g0 + 4)] = Int32(r1);
                __FUNCTION_TABLE__[(r0) >> 2](i7);
                f0 = commonVariable.f_g0;
                f1 = Float64(heapClassInst.heapFloat[(r2 + 3)]);
                if (!(f1 <= f0)) {
                    heapClassInst.heapFloat[(r2 + 3)] = Float32(f0);
                }
            }
            else {
                r0 = r0 >> 2;
                r0 = Int64(heapClassInst.heap32[(r0 + 2)]);
                heapClassInst.heap32[(g0)] = Int32(r6);
                heapClassInst.heap32[(g0 + 1)] = Int32(r4);
                heapClassInst.heap32[(g0 + 2)] = Int32(r5);
                heapClassInst.heap32[(g0 + 3)] = Int32(r3);
                heapClassInst.heap32[(g0 + 4)] = Int32(r1);
                __FUNCTION_TABLE__[(r0) >> 2](i7);
                return;
            }
        }
    } while (false);
    return;
}

    
func imandreel_restore_glcontext(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    return;
}

    
func iMandreel_TextureAsync_GetPackOffset(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-1032);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = Int64(heapClassInst.heap32[(fp + 3)]);
    r4 = sp + (-1024);
    r5 = 0;
    while (true) {
        r6 = Int64(heapClassInst.heapU8[r0]);
        if (r6 == 0) {
            break 
        }
        else {
            r7 = r6 << 24;
            r7 = r7 >> 24;
            r7 = (r7 + (-65)) | 0;
            r8 = 26;
            r9 = (r6 + 32) | 0;
            r6 = if (`UIntNative`(r7) < `UIntNative`(r8)) {r9} else {r6};
            r7 = r6 & 255;
            r8 = 47;
            r6 = if (r7 == 92) {r8} else {r6};
            r0 = (r0 + 1) | 0;
            r7 = r6 & 255;
            if (!(r7 != 47)) {
                r7 = r5 & 255;
                r5 = r6;
                if (r7 == 47) {
                    continue 
                }
            }
            r5 = (r4 + 1) | 0;
            heapClassInst.heap8[r4] = Int8(r6);
            r4 = r5;
            r5 = r6;
            continue 
        }
    }
    r0 = _ZL24g_pFirstTextureAsyncInfo;
    r5 = 0;
    heapClassInst.heap8[r4] = Int8(r5);
    while (true) {
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        if (r0 != 0) {
            r4 = sp + (-1024);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r4);
            strcmp(i7);
            r4 = commonVariable.r_g0;
            if (!(r4 != 0)) {
                r4 = r0 >> 2;
                r5 = Int64(heapClassInst.heap32[(r4 + 64)]);
                if (!(r5 == (-1))) {
                    __label__ = 8;
                    break 
                }
            }
            r0 = (r0 + 280) | 0;
            continue 
        }
        else {
            __label__ = 11;
            break 
        }
    }
    match (__label__) {
        case 11 =>
            r0 = 0;
            commonVariable.r_g0 = r0;
            return;
        case 8 =>
            r0 = r1 >> 2;
            r1 = Int64(heapClassInst.heap32[(r4 + 68)]);
            heapClassInst.heap32[(r0)] = Int32(r1);
            r0 = r2 >> 2;
            r1 = Int64(heapClassInst.heap32[(r4 + 69)]);
            heapClassInst.heap32[(r0)] = Int32(r1);
            r0 = Int64(heapClassInst.heap32[(r4 + 64)]);
            r1 = _ZL17g_apPackFileNames;
            r0 = r0 << 2;
            r0 = (r1 + r0) | 0;
            r0 = r0 >> 2;
            r0 = Int64(heapClassInst.heap32[(r0)]);
            heapClassInst.heap32[(g0)] = Int32(r3);
            heapClassInst.heap32[(g0 + 1)] = Int32(r0);
            strcpy(i7);
            r0 = 1;
            commonVariable.r_g0 = r0;
            return;
        case _ =>
            println("break")
    }
}

    
func iMandreel_TextureAsync_IsCompressed(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-1032);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)]);
    r1 = Int64(heapClassInst.heap32[(fp + 1)]);
    r2 = Int64(heapClassInst.heap32[(fp + 2)]);
    r3 = sp + (-1024);
    r4 = 0;
    while (true) {
        r5 = Int64(heapClassInst.heapU8[r0]);
        if (r5 == 0) {
            break 
        }
        else {
            r6 = r5 << 24;
            r6 = r6 >> 24;
            r6 = (r6 + (-65)) | 0;
            r7 = 26;
            r8 = (r5 + 32) | 0;
            r5 = if (`UIntNative`(r6) < `UIntNative`(r7)) {r8} else {r5};
            r6 = r5 & 255;
            r7 = 47;
            r5 = if (r6 == 92) {r7} else {r5};
            r0 = (r0 + 1) | 0;
            r6 = r5 & 255;
            if (!(r6 != 47)) {
                r6 = r4 & 255;
                r4 = r5;
                if (r6 == 47) {
                    continue 
                }
            }
            r4 = (r3 + 1) | 0;
            heapClassInst.heap8[r3] = Int8(r5);
            r3 = r4;
            r4 = r5;
            continue 
        }
    }
    r0 = _ZL24g_pFirstTextureAsyncInfo;
    r4 = 0;
    heapClassInst.heap8[r3] = Int8(r4);
    while (true) {
        r0 = r0 >> 2;
        r0 = Int64(heapClassInst.heap32[(r0)]);
        if (r0 != 0) {
            r3 = sp + (-1024);
            heapClassInst.heap32[(g0)] = Int32(r0);
            heapClassInst.heap32[(g0 + 1)] = Int32(r3);
            strcmp(i7);
            r3 = commonVariable.r_g0;
            if (r3 != 0) {
                r0 = (r0 + 280) | 0;
                continue 
            }
            else {
                __label__ = 7;
                break 
            }
        }
        else {
            __label__ = 10;
            break 
        }
    }
    match (__label__) {
        case 10 =>
            r0 = (-1);
            commonVariable.r_g0 = r0;
            return;
        case 7 =>
            r0 = r0 >> 2;
            r1 = r1 >> 2;
            r3 = Int64(heapClassInst.heap32[(r0 + 65)]);
            heapClassInst.heap32[(r1)] = Int32(r3);
            r1 = r2 >> 2;
            r2 = Int64(heapClassInst.heap32[(r0 + 66)]);
            heapClassInst.heap32[(r1)] = Int32(r2);
            r0 = Int64(heapClassInst.heap32[(r0 + 67)]);
            commonVariable.r_g0 = r0;
            return;
        case _ =>
            println("break")
    }
}

    
func imandreel_viewport_resize(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    return;
}

    
func mandreel_flash_tcp_onError(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    return;
}

    
func _Z31MandreelDefaultDebugMsgCallbackiPKc(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    __sandbox_OutputDebugString(i7);
    return;
}

    
func __fwrite(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16);
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)]);
    r1 = Int64(heapClassInst.heap32[(fp)]);
    r2 = Int64(heapClassInst.heap32[(fp + 1)]);
    if (!(`UIntNative`(r0) > `UIntNative`(9))) {
        r0 = _ZL13s_file_stdout;
    }
    r3 = r0 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3)]);
    r3 = r3 >> 2;
    r3 = Int64(heapClassInst.heap32[(r3 + 2)]);
    heapClassInst.heap32[(g0)] = Int32(r0);
    heapClassInst.heap32[(g0 + 1)] = Int32(r1);
    heapClassInst.heap32[(g0 + 2)] = 1;
    heapClassInst.heap32[(g0 + 3)] = Int32(r2);
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    return;
}

    
func __mandreel_internal_SetResolution(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    r0 = _ZL25s_mandreel_internal_width;
    r1 = _ZL26s_mandreel_internal_height;
    r0 = r0 >> 2;
    r2 = Int64(heapClassInst.heap32[(fp)]);
    r1 = r1 >> 2;
    r3 = Int64(heapClassInst.heap32[(fp + 1)]);
    heapClassInst.heap32[(r0)] = Int32(r2);
    heapClassInst.heap32[(r1)] = Int32(r3);
    return;
}

    
func __resize(sp: Int64) : Unit
{
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0;
    var g0 = i7 >> 2;
    return;
}

    
func my_mandreel_call_constructors(ptr: Int64, size: Int64, stackPos: Int64) : Unit {
    my_heapNewPos = commonVariable.heapNewPos
    unsafe{
        heapClassInst.my_heap = malloc(UIntNative(mandreel_total_memory))
    }
    
    for (i in 0..(mandreel_total_memory / 4)) {
        heapClassInst.my_heap32[i] = heapClassInst.heap32[i];
    }
    mandreel_call_constructors(ptr, size, stackPos)
}
