/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


let cloneableStr1 = #"
public class FeatureGateImpl <: MutableFeatureGate & ToString {
    public static func newFeatureGate(): FeatureGateImpl {
        let known: Map < String, FeatureSpec >= HashMap < String, FeatureSpec >()
        for((feature, featureSpec) in DEFAULT_FEATURES) {
            known[feature] = featureSpec
        }
        let enabled: Map < String, Bool >= HashMap < String, Bool >()
        return FeatureGateImpl("todo: feature_gate.cj", known, SPECIAL_FEATURES, enabled)
    }
    
    private var featureGateName: String = String.empty
    private var special: Map < String, SpecialHandle >= HashMap < String, SpecialHandle >()
    private var lock: ReentrantMutex = ReentrantMutex()
    private var known: Map < String, FeatureSpec >= HashMap < String, FeatureSpec >()
    private var enableds: Map < String, Bool >= HashMap < String, Bool >()
    private var closed: Bool = false
    
    public init() { }
    
    public init(
    featureGateName: String,
    known: Map < String, FeatureSpec >,
    special: Map < String, SpecialHandle >,
    enableds: Map < String, Bool >,
    closed!: Bool = false
    ) {
        this.featureGateName = featureGateName
        this.known = known
        this.special = special
        this.enableds = enableds
        this.closed = closed
    }
    
    
    
    public func enabled(key: String): Bool {
        if(this.enableds.contains(key)) {
            return this.enableds[key]
        }
        if(this.known.contains(key)) {
            return this.known[key].default
        }
        throw Exception("feature ${key} is not registered in FeatureGate ${featureGateName}")
    }
    
    public func set(value: String): Option < Exception > {
        let map: Map < String, Bool >= HashMap < String, Bool >()
        
        for(sub in value.split(",")) {
            if(sub.isEmpty()) {
                continue
            }
            let arr = sub.split("=", 2)
            let key = arr[0].trimAscii()
            if(arr.size != 2) {
                return Exception("missing bool value for ${key}")
            }
            let val = arr[1].trimAscii()
            try {
                map[key] = Bool.parse(val)
            } catch(e: IllegalArgumentException) {
                return Exception("invalid value of ${key}=${val} error: ${e.message}")
            }
        }
        return setFromMap(map)
    }
    
    
    public func setFromMap(map: Map < String, Bool >): Option < Exception > {
        synchronized(lock) {
            
            let known = HashMap < String, FeatureSpec >()
            for((k, v) in this.known) {
                known[k] = v
            }
            let enabled = HashMap < String, Bool >()
            for((k, v) in this.enableds) {
                enabled[k] = v
            }
            
            for((k, v) in map) {
                if(! known.contains(k)) {
                    return Exception("unrecognized feature gate: ${k}")
                }
                let featureSpec = known[k]
                
                if(featureSpec.lockToDefault && featureSpec.default != v) {
                    return Exception(
                    "cannot set feature gate ${k} to ${v}, feature is locked to ${featureSpec.default}")
                }
                enabled[k] = v
                
                
                if(this.special.contains(k)) {
                    let fn = this.special[k]
                    fn(known, enabled, v)
                }
                
                if(featureSpec.preRelease == Featuregate.DEPRECATED) {
                    LOGGER.warn("Setting deprecated feature gate ${k}=${v}. It will be removed in a future release.")
                } else if(featureSpec.preRelease == Featuregate.GA) {
                    LOGGER.warn("Setting GA feature gate ${k}=${v}. It will be removed in a future release.")
                }
            }
            
            return None
        }
    }
    
    
    public func add(features: Map < String, FeatureSpec >): Option < Exception > {
        synchronized(lock) {
            if(this.closed) {
                return Exception("cannot add a feature gate after adding it to the flag set")
            }
            
            for((name, spec) in features) {
                if(this.known.contains(name)) {
                    if(this.known[name] == spec) {
                        continue
                    }
                    return Exception("feature gate ${name} with different spec already exists: ${this.known[name]}")
                }
                
                this.known[name] = spec
            }
            
            return None
        }
    }
    
    
    public func getAll(): Map < String, FeatureSpec > {
        let retval = HashMap < String, FeatureSpec >()
        for((k, v) in this.known) {
            retval[k] = v
        }
        return retval
    }
    
    
    public func addFlag(fs: FlagSet) {
        synchronized(lock) {
            this.closed = true
        }
        
        let known = knownFeatures()
        
        
        
        
        
        
        
    }
    
    
    
    public func knownFeatures(): ArrayList < String > {
        var known = ArrayList < String >()
        for((k, v) in this.known) {
            if(v.preRelease == Featuregate.GA || v.preRelease == Featuregate.DEPRECATED) {
                continue
            }
            known.add("${k}=true|false (${v.preRelease} - default=${v.default})")
        }
        known.sort()
        return known
    }
    
    
    public func toString(): String {
        let pairs = ArrayList < String >()
        for((k, v) in this.enableds) {
            pairs.add("${k}=${v}")
        }
        pairs.sort()
        return String.join(pairs.toArray(), delimiter: ",")
    }
    
    public func getType(): String {
        return "mapStringBool"
    }
    
    public func deepCopy(): MutableFeatureGate {
        let copyObj = this.deepClone()
        copyObj.featureGateName = String.empty
        return copyObj
    }
}
"#
let cloneableStr2 = #"
public class RawExtension <: Serializable < RawExtension > & LookupPatchMeta & LookupPatchMetaAccessor {
    public var raw: Array < Byte >= Array < Byte >()
    public var object:?RuntimeObject = None
    public init() {
    }
    public init(object:?RuntimeObject) {
        this.object = object
    }
    public func serialize(): DataModel {
        if(! raw.isEmpty()) {
            return DataModel.fromJson(JsonValue.fromStr(String.fromUtf8(this.raw)))
        }
        let realObj = match(object) {
            case Some(v) => v
            case _ => return DataModel.fromJson(JsonValue.fromStr("{}"))
        }
        return DataModel.fromJson(JsonValue.fromStr((realObj as JsonSerializable).getOrThrow().toJson()))
    }
    public static func deserialize(dm: DataModel): RawExtension {
        var result = RawExtension()
        result.raw = dm.toJson().toString().toArray()
        return result
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        
        if(key == "raw") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(raw is LookupPatchMeta) {
                schema =(raw as LookupPatchMeta).getOrThrow()
            } else if(raw is LookupPatchMetaAccessor) {
                schema =(raw as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "object") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(object is LookupPatchMeta) {
                schema =(object as LookupPatchMeta).getOrThrow()
            } else if(object is LookupPatchMetaAccessor) {
                schema =(object as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "RawExtension"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        RawExtension()
    }
}
"#
let cloneableStr3 = #"
public class APIResource <: LookupPatchMeta & LookupPatchMetaAccessor & Serializable < APIResource > {
    public var name: String = String.empty
    public var singularName: String = String.empty
    public var namespaced: Bool = false
    public var group: String = ""
    public var version: String = ""
    public var kind: String = ""
    public var verbs_: Verbs = Verbs()
    public var shortNames: ArrayList < String >= ArrayList < String >()
    public var categories: ArrayList < String >= ArrayList < String >()
    public var storageVersionHash: String = ""
    public mut prop verbs: ArrayList < String > {
        get() {
            this.verbs_.items
        }
        set(val) {
            this.verbs_.items = val
        }
    }
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        }
        else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        return schema.lookupPatchMetadata(key)
    }
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        if(key == "name") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(name is LookupPatchMeta) {
                schema =(name as LookupPatchMeta).getOrThrow()
            }
            else if(name is LookupPatchMetaAccessor) {
                schema =(name as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "singularName") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(singularName is LookupPatchMeta) {
                schema =(singularName as LookupPatchMeta).getOrThrow()
            }
            else if(singularName is LookupPatchMetaAccessor) {
                schema =(singularName as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "namespaced") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(namespaced is LookupPatchMeta) {
                schema =(namespaced as LookupPatchMeta).getOrThrow()
            }
            else if(namespaced is LookupPatchMetaAccessor) {
                schema =(namespaced as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "group") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(group is LookupPatchMeta) {
                schema =(group as LookupPatchMeta).getOrThrow()
            }
            else if(group is LookupPatchMetaAccessor) {
                schema =(group as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "version") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(version is LookupPatchMeta) {
                schema =(version as LookupPatchMeta).getOrThrow()
            }
            else if(version is LookupPatchMetaAccessor) {
                schema =(version as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "kind") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(kind is LookupPatchMeta) {
                schema =(kind as LookupPatchMeta).getOrThrow()
            }
            else if(kind is LookupPatchMetaAccessor) {
                schema =(kind as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "verbs") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(verbs_ is LookupPatchMeta) {
                schema =(verbs_ as LookupPatchMeta).getOrThrow()
            }
            else if(verbs_ is LookupPatchMetaAccessor) {
                schema =(verbs_ as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "shortNames") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(shortNames is LookupPatchMeta) {
                schema =(shortNames as LookupPatchMeta).getOrThrow()
            }
            else if(shortNames is LookupPatchMetaAccessor) {
                schema =(shortNames as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "categories") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(categories is LookupPatchMeta) {
                schema =(categories as LookupPatchMeta).getOrThrow()
            }
            else if(categories is LookupPatchMetaAccessor) {
                schema =(categories as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "storageVersionHash") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(storageVersionHash is LookupPatchMeta) {
                schema =(storageVersionHash as LookupPatchMeta).getOrThrow()
            }
            else if(storageVersionHash is LookupPatchMetaAccessor) {
                schema =(storageVersionHash as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        return Err(Exception("not supported key: ${key}"))
    }
    public func getPatchMetaName(): String {
        "APIResource"
    }
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    static public func getLookupPatchMetaForStatic(): LookupPatchMeta {
        APIResource()
    }
    
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        
        dms.add(field < String >("name", name))
        
        dms.add(field < String >("singularName", singularName))
        
        dms.add(field < Bool >("namespaced", namespaced))
        
        
        
        
        
        if(! group.isEmpty()) {
            dms.add(field < String >("group", group))
        }
        
        
        
        
        
        if(! version.isEmpty()) {
            dms.add(field < String >("version", version))
        }
        
        dms.add(field < String >("kind", kind))
        
        dms.add(field < Verbs >("verbs", verbs_))
        
        
        
        
        
        if(! shortNames.isEmpty()) {
            dms.add(field < ArrayList < String >>("shortNames", shortNames))
        }
        
        
        
        
        
        if(! categories.isEmpty()) {
            dms.add(field < ArrayList < String >>("categories", categories))
        }
        
        
        
        
        
        if(! storageVersionHash.isEmpty()) {
            dms.add(field < String >("storageVersionHash", storageVersionHash))
        }
        
        return dms
    }
    
    public static func deserialize(dm: DataModel): APIResource {
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
        var result = APIResource()
        
        
        fillFromDataModelStruct(dms, result)
        
        return result
    }
    
    private static func fillFromDataModelStruct(dms: DataModelStruct, result: APIResource) {
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("name"))) {
            result.name = t
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("singularName"))) {
            result.singularName = t
        }
        
        if(let Some(t) <- Option < Bool >.deserialize(dms.get("namespaced"))) {
            result.namespaced = t
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("group"))) {
            
            if(! t.isEmpty()) {
                result.group = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("version"))) {
            
            if(! t.isEmpty()) {
                result.version = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("kind"))) {
            result.kind = t
        }
        
        if(let Some(t) <- Option < Verbs >.deserialize(dms.get("verbs"))) {
            result.verbs_ = t
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("shortNames"))) {
            
            if(! t.isEmpty()) {
                result.shortNames = t
            }
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("categories"))) {
            
            if(! t.isEmpty()) {
                result.categories = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("storageVersionHash"))) {
            
            if(! t.isEmpty()) {
                result.storageVersionHash = t
            }
        }
        
    }
}
"#
let cloneableStr4 = #"
public class ServiceSpec <: LookupPatchMeta & LookupPatchMetaAccessor & Serializable < ServiceSpec > {
    public var ports: ArrayList < ServicePort >= ArrayList < ServicePort >()
    public var selector: HashMap < String, String >= HashMap < String, String >()
    public var clusterIP: String = String.empty
    public var clusterIPs: ArrayList < String >= ArrayList < String >()
    public var type_: String = ServiceType.SERVICE_TYPE_CLUSTER_IP
    public var externalIPs: ArrayList < String >= ArrayList < String >()
    public var sessionAffinity: String = ServiceAffinity.SERVICE_AFFINITY_NONE
    public var loadBalancerIP: String = String.empty
    public var loadBalancerSourceRanges: ArrayList < String >= ArrayList < String >()
    public var externalName: String = String.empty
    public var externalTrafficPolicy: String = ""
    public var healthCheckNodePort: Int32 = 0
    public var publishNotReadyAddresses: Bool = false
    public var sessionAffinityConfig:?SessionAffinityConfig = None
    public var ipFamilies: ArrayList < String >= ArrayList < String >()
    public var ipFamilyPolicy: Option < String >= None
    public var allocateLoadBalancerNodePorts: Bool = false
    public var loadBalancerClass: String = String.empty
    public var internalTrafficPolicy:?String = None
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        }
        else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        return schema.lookupPatchMetadata(key)
    }
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        if(key == "ports") {
            let patchMeta = PatchMeta(["merge"], "port")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(ports is LookupPatchMeta) {
                schema =(ports as LookupPatchMeta).getOrThrow()
            }
            else if(ports is LookupPatchMetaAccessor) {
                schema =(ports as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "selector") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(selector is LookupPatchMeta) {
                schema =(selector as LookupPatchMeta).getOrThrow()
            }
            else if(selector is LookupPatchMetaAccessor) {
                schema =(selector as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "clusterIP") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(clusterIP is LookupPatchMeta) {
                schema =(clusterIP as LookupPatchMeta).getOrThrow()
            }
            else if(clusterIP is LookupPatchMetaAccessor) {
                schema =(clusterIP as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "clusterIPs") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(clusterIPs is LookupPatchMeta) {
                schema =(clusterIPs as LookupPatchMeta).getOrThrow()
            }
            else if(clusterIPs is LookupPatchMetaAccessor) {
                schema =(clusterIPs as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "type") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(type_ is LookupPatchMeta) {
                schema =(type_ as LookupPatchMeta).getOrThrow()
            }
            else if(type_ is LookupPatchMetaAccessor) {
                schema =(type_ as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "externalIPs") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(externalIPs is LookupPatchMeta) {
                schema =(externalIPs as LookupPatchMeta).getOrThrow()
            }
            else if(externalIPs is LookupPatchMetaAccessor) {
                schema =(externalIPs as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "sessionAffinity") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(sessionAffinity is LookupPatchMeta) {
                schema =(sessionAffinity as LookupPatchMeta).getOrThrow()
            }
            else if(sessionAffinity is LookupPatchMetaAccessor) {
                schema =(sessionAffinity as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "loadBalancerIP") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(loadBalancerIP is LookupPatchMeta) {
                schema =(loadBalancerIP as LookupPatchMeta).getOrThrow()
            }
            else if(loadBalancerIP is LookupPatchMetaAccessor) {
                schema =(loadBalancerIP as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "loadBalancerSourceRanges") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(loadBalancerSourceRanges is LookupPatchMeta) {
                schema =(loadBalancerSourceRanges as LookupPatchMeta).getOrThrow()
            }
            else if(loadBalancerSourceRanges is LookupPatchMetaAccessor) {
                schema =(loadBalancerSourceRanges as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "externalName") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(externalName is LookupPatchMeta) {
                schema =(externalName as LookupPatchMeta).getOrThrow()
            }
            else if(externalName is LookupPatchMetaAccessor) {
                schema =(externalName as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "externalTrafficPolicy") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(externalTrafficPolicy is LookupPatchMeta) {
                schema =(externalTrafficPolicy as LookupPatchMeta).getOrThrow()
            }
            else if(externalTrafficPolicy is LookupPatchMetaAccessor) {
                schema =(externalTrafficPolicy as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "healthCheckNodePort") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(healthCheckNodePort is LookupPatchMeta) {
                schema =(healthCheckNodePort as LookupPatchMeta).getOrThrow()
            }
            else if(healthCheckNodePort is LookupPatchMetaAccessor) {
                schema =(healthCheckNodePort as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "publishNotReadyAddresses") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(publishNotReadyAddresses is LookupPatchMeta) {
                schema =(publishNotReadyAddresses as LookupPatchMeta).getOrThrow()
            }
            else if(publishNotReadyAddresses is LookupPatchMetaAccessor) {
                schema =(publishNotReadyAddresses as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "sessionAffinityConfig") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(sessionAffinityConfig is LookupPatchMeta) {
                schema =(sessionAffinityConfig as LookupPatchMeta).getOrThrow()
            }
            else if(sessionAffinityConfig is LookupPatchMetaAccessor) {
                schema =(sessionAffinityConfig as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "ipFamilies") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(ipFamilies is LookupPatchMeta) {
                schema =(ipFamilies as LookupPatchMeta).getOrThrow()
            }
            else if(ipFamilies is LookupPatchMetaAccessor) {
                schema =(ipFamilies as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "ipFamilyPolicy") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(ipFamilyPolicy is LookupPatchMeta) {
                schema =(ipFamilyPolicy as LookupPatchMeta).getOrThrow()
            }
            else if(ipFamilyPolicy is LookupPatchMetaAccessor) {
                schema =(ipFamilyPolicy as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "allocateLoadBalancerNodePorts") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(allocateLoadBalancerNodePorts is LookupPatchMeta) {
                schema =(allocateLoadBalancerNodePorts as LookupPatchMeta).getOrThrow()
            }
            else if(allocateLoadBalancerNodePorts is LookupPatchMetaAccessor) {
                schema =(allocateLoadBalancerNodePorts as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "loadBalancerClass") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(loadBalancerClass is LookupPatchMeta) {
                schema =(loadBalancerClass as LookupPatchMeta).getOrThrow()
            }
            else if(loadBalancerClass is LookupPatchMetaAccessor) {
                schema =(loadBalancerClass as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "internalTrafficPolicy") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(internalTrafficPolicy is LookupPatchMeta) {
                schema =(internalTrafficPolicy as LookupPatchMeta).getOrThrow()
            }
            else if(internalTrafficPolicy is LookupPatchMetaAccessor) {
                schema =(internalTrafficPolicy as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        return Err(Exception("not supported key: ${key}"))
    }
    public func getPatchMetaName(): String {
        "ServiceSpec"
    }
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    static public func getLookupPatchMetaForStatic(): LookupPatchMeta {
        ServiceSpec()
    }
    
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        
        
        
        
        
        if(! ports.isEmpty()) {
            dms.add(field < ArrayList < ServicePort >>("ports", ports))
        }
        
        
        
        
        
        if(! selector.isEmpty()) {
            dms.add(field < HashMap < String, String >>("selector", selector))
        }
        
        
        
        
        
        if(! clusterIP.isEmpty()) {
            dms.add(field < String >("clusterIP", clusterIP))
        }
        
        
        
        
        
        if(! clusterIPs.isEmpty()) {
            dms.add(field < ArrayList < String >>("clusterIPs", clusterIPs))
        }
        
        
        
        
        
        if(! type_.isEmpty()) {
            dms.add(field < String >("type", type_))
        }
        
        
        
        
        
        if(! externalIPs.isEmpty()) {
            dms.add(field < ArrayList < String >>("externalIPs", externalIPs))
        }
        
        
        
        
        
        if(! sessionAffinity.isEmpty()) {
            dms.add(field < String >("sessionAffinity", sessionAffinity))
        }
        
        
        
        
        
        if(! loadBalancerIP.isEmpty()) {
            dms.add(field < String >("loadBalancerIP", loadBalancerIP))
        }
        
        
        
        
        
        if(! loadBalancerSourceRanges.isEmpty()) {
            dms.add(field < ArrayList < String >>("loadBalancerSourceRanges", loadBalancerSourceRanges))
        }
        
        
        
        
        
        if(! externalName.isEmpty()) {
            dms.add(field < String >("externalName", externalName))
        }
        
        
        
        
        
        if(! externalTrafficPolicy.isEmpty()) {
            dms.add(field < String >("externalTrafficPolicy", externalTrafficPolicy))
        }
        
        
        
        
        
        if(healthCheckNodePort != 0) {
            dms.add(field < Int32 >("healthCheckNodePort", healthCheckNodePort))
        }
        
        
        if(publishNotReadyAddresses) {
            dms.add(field < Bool >("publishNotReadyAddresses", publishNotReadyAddresses))
        }
        
        if(let Some(t) <- sessionAffinityConfig) {
            dms.add(field < Option < SessionAffinityConfig >>("sessionAffinityConfig", sessionAffinityConfig))
        }
        
        
        
        
        
        if(! ipFamilies.isEmpty()) {
            dms.add(field < ArrayList < String >>("ipFamilies", ipFamilies))
        }
        
        if(let Some(t) <- ipFamilyPolicy) {
            dms.add(field < Option < String >>("ipFamilyPolicy", ipFamilyPolicy))
        }
        
        
        if(allocateLoadBalancerNodePorts) {
            dms.add(field < Bool >("allocateLoadBalancerNodePorts", allocateLoadBalancerNodePorts))
        }
        
        
        
        
        
        if(! loadBalancerClass.isEmpty()) {
            dms.add(field < String >("loadBalancerClass", loadBalancerClass))
        }
        
        if(let Some(t) <- internalTrafficPolicy) {
            dms.add(field < Option < String >>("internalTrafficPolicy", internalTrafficPolicy))
        }
        
        return dms
    }
    
    public static func deserialize(dm: DataModel): ServiceSpec {
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
        var result = ServiceSpec()
        
        
        fillFromDataModelStruct(dms, result)
        
        return result
    }
    
    private static func fillFromDataModelStruct(dms: DataModelStruct, result: ServiceSpec) {
        
        if(let Some(t) <- Option < ArrayList < ServicePort >>.deserialize(dms.get("ports"))) {
            
            if(! t.isEmpty()) {
                result.ports = t
            }
        }
        
        if(let Some(t) <- Option < HashMap < String, String >>.deserialize(dms.get("selector"))) {
            
            if(! t.isEmpty()) {
                result.selector = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("clusterIP"))) {
            
            if(! t.isEmpty()) {
                result.clusterIP = t
            }
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("clusterIPs"))) {
            
            if(! t.isEmpty()) {
                result.clusterIPs = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("type"))) {
            
            if(! t.isEmpty()) {
                result.type_ = t
            }
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("externalIPs"))) {
            
            if(! t.isEmpty()) {
                result.externalIPs = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("sessionAffinity"))) {
            
            if(! t.isEmpty()) {
                result.sessionAffinity = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("loadBalancerIP"))) {
            
            if(! t.isEmpty()) {
                result.loadBalancerIP = t
            }
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("loadBalancerSourceRanges"))) {
            
            if(! t.isEmpty()) {
                result.loadBalancerSourceRanges = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("externalName"))) {
            
            if(! t.isEmpty()) {
                result.externalName = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("externalTrafficPolicy"))) {
            
            if(! t.isEmpty()) {
                result.externalTrafficPolicy = t
            }
        }
        
        if(let Some(t) <- Option < Int32 >.deserialize(dms.get("healthCheckNodePort"))) {
            
            if(! t.isEmpty()) {
                result.healthCheckNodePort = t
            }
        }
        
        if(let Some(t) <- Option < Bool >.deserialize(dms.get("publishNotReadyAddresses"))) {
            
            if(! t.isEmpty()) {
                result.publishNotReadyAddresses = t
            }
        }
        
        if(let Some(t) <- Option <?SessionAffinityConfig >.deserialize(dms.get("sessionAffinityConfig"))) {
            
            if(! t.isEmpty()) {
                result.sessionAffinityConfig = t
            }
        }
        
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("ipFamilies"))) {
            
            if(! t.isEmpty()) {
                result.ipFamilies = t
            }
        }
        
        if(let Some(t) <- Option < Option < String >>.deserialize(dms.get("ipFamilyPolicy"))) {
            
            if(! t.isEmpty()) {
                result.ipFamilyPolicy = t
            }
        }
        
        if(let Some(t) <- Option < Bool >.deserialize(dms.get("allocateLoadBalancerNodePorts"))) {
            
            if(! t.isEmpty()) {
                result.allocateLoadBalancerNodePorts = t
            }
        }
        
        if(let Some(t) <- Option < String >.deserialize(dms.get("loadBalancerClass"))) {
            
            if(! t.isEmpty()) {
                result.loadBalancerClass = t
            }
        }
        
        if(let Some(t) <- Option <?String >.deserialize(dms.get("internalTrafficPolicy"))) {
            
            if(! t.isEmpty()) {
                result.internalTrafficPolicy = t
            }
        }
        
    }
}
"#
let protobufAttrStr1 = #"
public class IntOrString <: Serializable < IntOrString > & Equatable < IntOrString > & ToString {
    var `type`: Int64 = 0
    var intValue: Int64 = 0
    
    var strValue: String = String.empty
    
    mut prop isIntValue: Bool {
        get() {
            this.`type` == 0
        }
        set(val) {
            let value = match(val) {
                case true => 0
                case false => 1
            }
            
            this.`type` = value
        }
    }
    
    init() { }
    
    public init(intValue: Int64) {
        isIntValue = true
        this.intValue = intValue
    }
    
    public init(strValue: String) {
        isIntValue = false
        this.strValue = strValue
    }
    
    public func toString(): String {
        match(isIntValue) {
            case true => "${intValue}"
            case false => strValue
        }
    }
    
    public func serialize(): DataModel {
        match(isIntValue) {
            case true => intValue.serialize()
            case false => strValue.serialize()
        }
    }
    
    public static func deserialize(dm: DataModel): IntOrString {
        match(dm) {
            case data: DataModelString => IntOrString(data.getValue())
            case data: DataModelInt => IntOrString(data.getValue())
            case _ => throw DataModelException("this data is not DataModelString or DataModelInt")
        }
    }
    
    public operator func ==(other: IntOrString): Bool {
        return match((this.isIntValue, other.isIntValue)) {
            case(true, true) => this.intValue == other.intValue
            case(false, false) => this.strValue == other.strValue
            case(_, _) => false
        }
    }
    
    public operator func !=(other: IntOrString): Bool {
        !(this == other)
    }
    
    
    public func isInt(): Bool {
        isIntValue
    }
    
    
    public func getIntValueOrDefault(default: Int64): Int64 {
        match(isIntValue) {
            case true => intValue
            case false => default
        }
    }
    
    
    public func getStrValueOrDefault(default: String): String {
        match(isIntValue) {
            case true => default
            case false => strValue
        }
    }
    
    
    public func getIntValueOrThrow(): Int64 {
        match(isIntValue) {
            case true => intValue
            case false => throw Exception("this data is not Int")
        }
    }
    
    
    public func getStrValueOrThrow(): String {
        match(isIntValue) {
            case true => throw Exception("this data is not String")
            case false => strValue
        }
    }
    
    
    public func getIntOrPercent(): Result < IntOrPercent, Exception > {
        if(this.isIntValue) {
            return Ok(IntOrPercent.Int(this.intValue))
        } else {
            let isPercent = this.strValue.endsWith("%")
            if(! isPercent) {
                return Err(Exception("invalid percent value:${this.strValue} "))
            }
            if(let Some(value) <- Int64.tryParse(this.strValue.removeSuffix("%"))) {
                return Ok(IntOrPercent.Percent(value))
            }
            return Err(Exception("invalid percent value:${this.strValue} "))
        }
    }
}
"#
let protobufAttrStr2 = #"
public class TimeWrapper <: ToString & Serializable < TimeWrapper > & Equatable < TimeWrapper > & Cloneable < TimeWrapper > & LookupPatchMeta & LookupPatchMetaAccessor {
    var seconds: Int64 = 0
    var nanos: Int64 = 0
    private var zone: TimeZone = TimeZone.Local
    public mut prop time: DateTime {
        get() {
            DateTime.ofEpoch(second: this.seconds, nanosecond: this.nanos).inTimeZone(zone)
        }
        set(val) {
            this.seconds = val.toUnixTimeStamp().toSeconds()
            this.nanos = val.nanosecond
        }
    }
    public mut prop timeZone: TimeZone {
        get() {
            zone
        }
        set(val) {
            this.zone = val
        }
    }
    public func deepClone(): TimeWrapper {
        let ret = TimeWrapper()
        ret.seconds = this.seconds
        ret.nanos = this.nanos
        ret.zone = this.zone
        ret
    }
    public static func now(): TimeWrapper {
        var tw = TimeWrapper.zero()
        tw.time = DateTime.now()
        return tw
    }
    public static func fromTimestampInMicroSeconds(ts: Int64): TimeWrapper {
        TimeWrapper(DateTime.ofEpoch(second: ts / 1_000_000, nanosecond: ts % 1_000_000 * 1_000))
    }
    public static func zero(): TimeWrapper {
        TimeWrapper(DateTime.ofUTC(year: 1, month: 1, dayOfMonth: 1))
    }
    public static func parse(str: String): TimeWrapper {
        var tw = TimeWrapper.zero()
        tw.time = parseDataTime(str)
        return tw
    }
    public static func unmarshalQueryParameter(str: String): TimeWrapper {
        if(str.isEmpty() || str == "null") {
            return TimeWrapper.zero()
        }
        return TimeWrapper.parse(str)
    }
    private static func parseDataTime(timeStr: String): DateTime {
        let dotIndex = match(timeStr.indexOf(".")) {
            case Some(idx) => idx
            case None => return DateTime.parse(timeStr)
        }
        let nanoEndIdx = if(let Some(idx) <- timeStr.indexOf(UInt8(UInt32(r'+')), dotIndex)) {
            idx
        }
        else if(let Some(idx) <- timeStr.indexOf(UInt8(UInt32(r'-')), dotIndex)) {
            idx
        }
        else if(let Some(idx) <- timeStr.indexOf(UInt8(UInt32(r'Z')), dotIndex)) {
            idx
        }
        else {
            throw IllegalArgumentException("The ${timeStr} format is not RFC3339.")
        }
        
        let fraction = timeStr[dotIndex + 1 .. nanoEndIdx]
        let zeros = StringBuilder()
        for(i in 0 .. 9 - fraction.size) {
            zeros.append(r'0')
        }
        return DateTime.parse(timeStr[0 .. nanoEndIdx] + zeros.toString() + timeStr[nanoEndIdx ..], "yyyy-MM-ddTHH:mm:ss.SSSOOOO")
    }
    public static func parse(str: String, format: String): TimeWrapper {
        var tw = TimeWrapper.zero()
        tw.time = DateTime.parse(str, format)
        return tw
    }
    public init() {
        this.time = DateTime.ofUTC(year: 1, month: 1, dayOfMonth: 1)
    }
    public init(time: DateTime) {
        this.time = time
    }
    public func toString(): String {
        return this.time.inUTC().format(DateTimeFormat.RFC3339)
    }
    public func serialize(): DataModel {
        if(this.isZero()) {
            return DataModelNull()
        }
        return DataModelString(this.toString())
    }
    public static func deserialize(dm: DataModel): TimeWrapper {
        match(dm) {
            case data: DataModelString => TimeWrapper.parse(data.getValue())
            case data: DataModelNull => TimeWrapper.zero()
            case _ => throw Exception("this data is neither DataModelString DataModelNull")
        }
    }
    public func isZero(): Bool {
        return this == TimeWrapper.zero()
    }
    public operator func ==(rhs: TimeWrapper): Bool {
        return this.time == rhs.time
    }
    public operator func !=(rhs: TimeWrapper): Bool {
        return !(this == rhs)
    }
    public operator func >(rhs: TimeWrapper): Bool {
        return this.time > rhs.time
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        
        if(key == "seconds") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(seconds is LookupPatchMeta) {
                schema =(seconds as LookupPatchMeta).getOrThrow()
            } else if(seconds is LookupPatchMetaAccessor) {
                schema =(seconds as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "nanos") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(nanos is LookupPatchMeta) {
                schema =(nanos as LookupPatchMeta).getOrThrow()
            } else if(nanos is LookupPatchMetaAccessor) {
                schema =(nanos as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "zone") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(zone is LookupPatchMeta) {
                schema =(zone as LookupPatchMeta).getOrThrow()
            } else if(zone is LookupPatchMetaAccessor) {
                schema =(zone as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "TimeWrapper"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        TimeWrapper()
    }
}
"#
let protobufAttrStr3 = #"
public class PersistentVolume <: LookupPatchMeta & LookupPatchMetaAccessor & Serializable < PersistentVolume > & JsonSerializable & ObjectKind & Cloneable < PersistentVolume > & RuntimeObject & IObjectMeta & ObjectMetaAccessor & ObjectClassAccessor {
    static let OBJECT_CALSS_NAME: String = "model.taibai.model.core.v1.types.PersistentVolume"
    public var typeMeta: TypeMeta = TypeMeta()
    public var metadata: ObjectMeta = ObjectMeta()
    public var spec: PersistentVolumeSpec = PersistentVolumeSpec()
    public var status: PersistentVolumeStatus = PersistentVolumeStatus()
    public func postDeserialize(dm: DataModel): Unit {
        defaultForValue()
    }
    public func defaultForValue(): Unit {
        if(this.status.phase.isEmpty()) {
            this.status.phase = VOLUME_PENDING
        }
        if(this.spec.persistentVolumeReclaimPolicy.isEmpty()) {
            this.spec.persistentVolumeReclaimPolicy = PersistentVolumeReclaimDelete
        }
        if(let None <- this.spec.volumeMode) {
            this.spec.volumeMode = PERSISTENT_VOLUME_FILESYSTEM
        }
        resourceListDefaultForValue(this.spec.capacity)
    }
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        }
        else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        return schema.lookupPatchMetadata(key)
    }
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        inlineResultLookupPatchMetadataResult = inlineFieldsLookupPatchMetadata(typeMeta, key)
        if(inlineResultLookupPatchMetadataResult.isOk()) {
            return inlineResultLookupPatchMetadataResult
        }
        if(key == "metadata") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(metadata is LookupPatchMeta) {
                schema =(metadata as LookupPatchMeta).getOrThrow()
            }
            else if(metadata is LookupPatchMetaAccessor) {
                schema =(metadata as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "spec") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(spec is LookupPatchMeta) {
                schema =(spec as LookupPatchMeta).getOrThrow()
            }
            else if(spec is LookupPatchMetaAccessor) {
                schema =(spec as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "status") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(status is LookupPatchMeta) {
                schema =(status as LookupPatchMeta).getOrThrow()
            }
            else if(status is LookupPatchMetaAccessor) {
                schema =(status as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        return Err(Exception("not supported key: ${key}"))
    }
    public func getPatchMetaName(): String {
        "PersistentVolume"
    }
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    static public func getLookupPatchMetaForStatic(): LookupPatchMeta {
        PersistentVolume()
    }
    
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        
        let typeMetaDms =(this.typeMeta.serialize() as DataModelStruct).getOrThrow()
        var typeMetaInlineFields = typeMetaDms.getFields()
        for(inlineField in typeMetaInlineFields) {
            dms.add(inlineField)
        }
        
        
        match(metadata as EmptyExtension) {
            case None => dms.add(field < ObjectMeta >("metadata", metadata))
            case Some(empty) => if(! empty.isEmpty()) {
                dms.add(field < ObjectMeta >("metadata", metadata))
            }
        }
        
        
        
        match(spec as EmptyExtension) {
            case None => dms.add(field < PersistentVolumeSpec >("spec", spec))
            case Some(empty) => if(! empty.isEmpty()) {
                dms.add(field < PersistentVolumeSpec >("spec", spec))
            }
        }
        
        
        
        match(status as EmptyExtension) {
            case None => dms.add(field < PersistentVolumeStatus >("status", status))
            case Some(empty) => if(! empty.isEmpty()) {
                dms.add(field < PersistentVolumeStatus >("status", status))
            }
        }
        
        
        return dms
    }
    
    public static func deserialize(dm: DataModel): PersistentVolume {
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
        var result = PersistentVolume()
        
        
        fillFromDataModelStruct(dms, result)
        
        return result
    }
    
    private static func fillFromDataModelStruct(dms: DataModelStruct, result: PersistentVolume) {
        
        
        if(let Some(t) <- Option < TypeMeta >.deserialize(dms)) {
            result.typeMeta = t
        }
        
        if(let Some(t) <- Option < ObjectMeta >.deserialize(dms.get("metadata"))) {
            
            let assigned = match(t as EmptyExtension) {
                case Some(t) => ! t.isEmpty()
                case None => true
            }
            
            if(assigned) {
                result.metadata = t
            }
            
        }
        
        if(let Some(t) <- Option < PersistentVolumeSpec >.deserialize(dms.get("spec"))) {
            
            let assigned = match(t as EmptyExtension) {
                case Some(t) => ! t.isEmpty()
                case None => true
            }
            
            if(assigned) {
                result.spec = t
            }
            
        }
        
        if(let Some(t) <- Option < PersistentVolumeStatus >.deserialize(dms.get("status"))) {
            
            let assigned = match(t as EmptyExtension) {
                case Some(t) => ! t.isEmpty()
                case None => true
            }
            
            if(assigned) {
                result.status = t
            }
            
        }
        
        result.postDeserialize(dms)
        
    }
    
    public func toDataModel(): DataModel {
        return this.serialize()
    }
    
    public func toJson(): String {
        return this.serialize().toJson().toString()
    }
    
    public func toPrettyJson(): String {
        return this.serialize().toJson().toJsonString()
    }
    
    public func fillFromJson(jsonStr: String): Unit {
        let dm = DataModel.fromJson(JsonValue.fromStr(jsonStr))
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
        PersistentVolume.fillFromDataModelStruct(dms, this)
    }
    
    
    public func setGroupVersionKind(kind: GroupVersionKind): Unit {
        var(objVersion, objKind) = kind.toApiVersionAndKind()
        typeMeta.kind = objKind
        typeMeta.apiVersion = objVersion
    }
    
    public func groupVersionKind(): GroupVersionKind {
        return GroupVersionKind.fromApiVersionAndKind(typeMeta.apiVersion, typeMeta.kind)
    }
    
    
    public func deepClone(): PersistentVolume {
        
        var result = PersistentVolume()
        
        
        if(this.typeMeta is Cloneable < TypeMeta >) {
            var cloneTmp =(this.typeMeta as Cloneable < TypeMeta >).getOrThrow()
            result.typeMeta = cloneTmp.deepClone()
        } else {
            result.typeMeta = this.typeMeta
        }
        
        
        
        if(this.metadata is Cloneable < ObjectMeta >) {
            var cloneTmp =(this.metadata as Cloneable < ObjectMeta >).getOrThrow()
            result.metadata = cloneTmp.deepClone()
        } else {
            result.metadata = this.metadata
        }
        
        
        
        if(this.spec is Cloneable < PersistentVolumeSpec >) {
            var cloneTmp =(this.spec as Cloneable < PersistentVolumeSpec >).getOrThrow()
            result.spec = cloneTmp.deepClone()
        } else {
            result.spec = this.spec
        }
        
        
        
        if(this.status is Cloneable < PersistentVolumeStatus >) {
            var cloneTmp =(this.status as Cloneable < PersistentVolumeStatus >).getOrThrow()
            result.status = cloneTmp.deepClone()
        } else {
            result.status = this.status
        }
        
        
        return result
    }
    
    public func getObjectKind(): ObjectKind {
        return this
    }
    
    public func deepCopyObject(): RuntimeObject {
        return this.deepClone()
    }
    
    public func getNamespace(): String {
        return metadata.namespace
    }
    
    public func setNamespace(namespace: String): Unit {
        metadata.namespace = namespace
    }
    
    public func getName(): String {
        return metadata.name
    }
    
    public func setName(name: String): Unit {
        metadata.name = name
    }
    
    public func getGenerateName(): String {
        return metadata.generateName
    }
    
    public func setGenerateName(generateName: String): Unit {
        metadata.generateName = generateName
    }
    
    public func getUid(): String {
        return metadata.uid
    }
    
    public func getSelfLink(): String {
        return metadata.selfLink
    }
    
    public func setSelfLink(selfLink: String): Unit {
        metadata.selfLink = selfLink
    }
    
    public func setUid(uid: String): Unit {
        metadata.uid = uid
    }
    
    public func getResourceVersion(): String {
        return metadata.resourceVersion
    }
    
    public func setResourceVersion(version: String): Unit {
        metadata.resourceVersion = version
    }
    
    public func getGeneration(): Int64 {
        return metadata.generation
    }
    
    public func setGeneration(generation: Int64): Unit {
        metadata.generation = generation
    }
    
    public func getCreationTimestamp(): TimeWrapper {
        return metadata.creationTimestamp
    }
    
    public func setCreationTimestamp(timeStamp: TimeWrapper): Unit {
        metadata.creationTimestamp = timeStamp
    }
    
    public func getDeletionTimestamp():?TimeWrapper {
        return metadata.deletionTimestamp
    }
    
    public func setDeletionTimestamp(timeStamp:?TimeWrapper): Unit {
        metadata.deletionTimestamp = timeStamp
    }
    
    public func getDeletionGracePeriodSeconds(): Option < Int64 > {
        return metadata.deletionGracePeriodSeconds
    }
    
    public func setDeletionGracePeriodSeconds(deletionGracePeriodSeconds: Option < Int64 >): Unit {
        metadata.deletionGracePeriodSeconds = deletionGracePeriodSeconds
    }
    
    public func getLabels(): HashMap < String, String > {
        return metadata.labels
    }
    
    public func setLabels(labels: HashMap < String, String >): Unit {
        metadata.labels = labels
    }
    
    public func getAnnotations(): HashMap < String, String > {
        return metadata.annotations
    }
    
    public func setAnnotations(annotations: HashMap < String, String >): Unit {
        metadata.annotations = annotations
    }
    
    public func getFinalizers(): ArrayList < String > {
        return metadata.finalizers
    }
    
    public func setFinalizers(finalizers: ArrayList < String >): Unit {
        metadata.finalizers = finalizers
    }
    
    public func getOwnerReferences(): ArrayList < OwnerReference > {
        metadata.ownerReferences
    }
    
    public func setOwnerReferences(ownerReferences: ArrayList < OwnerReference >): Unit {
        metadata.ownerReferences = ownerReferences
    }
    
    public func getManagedFields(): ArrayList < ManagedFieldsEntry > {
        metadata.managedFields
    }
    
    public func setManagedFields(managedFields: ArrayList < ManagedFieldsEntry >): Unit {
        metadata.managedFields = managedFields
    }
    
    public func getZZZDeprecatedClusterName(): String {
        return metadata.clusterName
    }
    
    public func setZZZDeprecatedClusterName(clusterName: String): Unit {
        metadata.clusterName = clusterName
    }
    
    public func getObjectMeta(): IObjectMeta {
        return this
    }
    
    
    public static let OBJECT_CLASS: ObjectClass = ObjectClass(
    OBJECT_CALSS_NAME,
    "PersistentVolume",
    {
        => PersistentVolume()
    }
    )
    
    public func getObjectClass(): ObjectClass {
        return PersistentVolume.OBJECT_CLASS
    }
    
    public static prop objectClass: ObjectClass {
        get() {
            OBJECT_CLASS
        }
    }
    
}
"#
let protobufAttrStr4 = #"
public class Endpoint <: LookupPatchMeta & LookupPatchMetaAccessor & Serializable < Endpoint > & Cloneable < Endpoint > {
    public var addresses: ArrayList < String >= ArrayList < String >()
    public var conditions: EndpointConditions = EndpointConditions()
    public var hostname: Option < String >= None
    public var targetRef: Option < ObjectReference >= None
    public var topology: HashMap < String, String >= HashMap < String, String >()
    public var nodeName: Option < String >= None
    public var hints: Option < EndpointHints >= None
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        }
        else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        return schema.lookupPatchMetadata(key)
    }
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        if(key == "addresses") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(addresses is LookupPatchMeta) {
                schema =(addresses as LookupPatchMeta).getOrThrow()
            }
            else if(addresses is LookupPatchMetaAccessor) {
                schema =(addresses as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "conditions") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(conditions is LookupPatchMeta) {
                schema =(conditions as LookupPatchMeta).getOrThrow()
            }
            else if(conditions is LookupPatchMetaAccessor) {
                schema =(conditions as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "hostname") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(hostname is LookupPatchMeta) {
                schema =(hostname as LookupPatchMeta).getOrThrow()
            }
            else if(hostname is LookupPatchMetaAccessor) {
                schema =(hostname as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "targetRef") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(targetRef is LookupPatchMeta) {
                schema =(targetRef as LookupPatchMeta).getOrThrow()
            }
            else if(targetRef is LookupPatchMetaAccessor) {
                schema =(targetRef as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "topology") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(topology is LookupPatchMeta) {
                schema =(topology as LookupPatchMeta).getOrThrow()
            }
            else if(topology is LookupPatchMetaAccessor) {
                schema =(topology as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "nodeName") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(nodeName is LookupPatchMeta) {
                schema =(nodeName as LookupPatchMeta).getOrThrow()
            }
            else if(nodeName is LookupPatchMetaAccessor) {
                schema =(nodeName as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        if(key == "hints") {
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(hints is LookupPatchMeta) {
                schema =(hints as LookupPatchMeta).getOrThrow()
            }
            else if(hints is LookupPatchMetaAccessor) {
                schema =(hints as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            return Ok((schema, patchMeta))
        }
        return Err(Exception("not supported key: ${key}"))
    }
    public func getPatchMetaName(): String {
        "Endpoint"
    }
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    static public func getLookupPatchMetaForStatic(): LookupPatchMeta {
        Endpoint()
    }
    public func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(field < ArrayList < String >>("addresses", addresses))
        match(conditions as EmptyExtension) {
            case None => dms.add(field < EndpointConditions >("conditions", conditions))
            case Some(empty) => if(! empty.isEmpty()) {
                dms.add(field < EndpointConditions >("conditions", conditions))
            }
        }
        if(let Some(t) <- hostname) {
            dms.add(field < Option < String >>("hostname", hostname))
        }
        if(let Some(t) <- targetRef) {
            dms.add(field < Option < ObjectReference >>("targetRef", targetRef))
        }
        if(! topology.isEmpty()) {
            dms.add(field < HashMap < String, String >>("topology", topology))
        }
        if(let Some(t) <- nodeName) {
            dms.add(field < Option < String >>("nodeName", nodeName))
        }
        if(let Some(t) <- hints) {
            dms.add(field < Option < EndpointHints >>("hints", hints))
        }
        return dms
    }
    static public func deserialize(dm: DataModel): Endpoint {
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
        var result = Endpoint()
        fillFromDataModelStruct(dms, result)
        return result
    }
    static private func fillFromDataModelStruct(dms: DataModelStruct, result: Endpoint) {
        if(let Some(t) <- Option < ArrayList < String >>.deserialize(dms.get("addresses"))) {
            result.addresses = t
        }
        if(let Some(t) <- Option < EndpointConditions >.deserialize(dms.get("conditions"))) {
            let assigned = match(t as EmptyExtension) {
                case Some(t) => ! t.isEmpty()
                case None => true
            }
            if(assigned) {
                result.conditions = t
            }
        }
        if(let Some(t) <- Option < Option < String >>.deserialize(dms.get("hostname"))) {
            if(! t.isEmpty()) {
                result.hostname = t
            }
        }
        if(let Some(t) <- Option < Option < ObjectReference >>.deserialize(dms.get("targetRef"))) {
            if(! t.isEmpty()) {
                result.targetRef = t
            }
        }
        if(let Some(t) <- Option < HashMap < String, String >>.deserialize(dms.get("topology"))) {
            if(! t.isEmpty()) {
                result.topology = t
            }
        }
        if(let Some(t) <- Option < Option < String >>.deserialize(dms.get("nodeName"))) {
            if(! t.isEmpty()) {
                result.nodeName = t
            }
        }
        if(let Some(t) <- Option < Option < EndpointHints >>.deserialize(dms.get("hints"))) {
            if(! t.isEmpty()) {
                result.hints = t
            }
        }
    }
    
    
    public func deepClone(): Endpoint {
        
        var result = Endpoint()
        
        result.addresses = this.addresses.deepClone()
        
        
        if(this.conditions is Cloneable < EndpointConditions >) {
            var cloneTmp =(this.conditions as Cloneable < EndpointConditions >).getOrThrow()
            result.conditions = cloneTmp.deepClone()
        } else {
            result.conditions = this.conditions
        }
        
        
        result.hostname = this.hostname.deepClone()
        
        result.targetRef = this.targetRef.deepClone()
        
        result.topology = this.topology.deepClone()
        
        result.nodeName = this.nodeName.deepClone()
        
        result.hints = this.hints.deepClone()
        
        return result
    }
}
"#
let scoperStr1 = #"
public class Strategy <: CreateStrategy & UpdateStrategy & DeleteStrategy & GarbageCollectionDeleteStrategy & NameGenerator {
    let objectTyper: ObjectTyper
    let nameGenerator: NameGenerator
    public init(objectTyper: ObjectTyper, nameGenerator: NameGenerator) {
        this.objectTyper = objectTyper
        this.nameGenerator = nameGenerator
    }
    public func prepareForCreate(ctx: RequestContext, obj: RuntimeObject): Unit {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        controller.status = ReplicationControllerStatus()
        controller.setGeneration(1)
        dropDisabledTemplateFields(controller.spec.template, None)
    }
    public func prepareForUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): Unit {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        newController.status = oldController.status
        dropDisabledTemplateFields(newController.spec.template, oldController.spec.template)
        if(! deepEqual < ReplicationControllerSpec >(newController.spec, oldController.spec)) {
            newController.setGeneration(oldController.getGeneration() + 1)
        }
    }
    public func validate(ctx: RequestContext, obj: RuntimeObject): ArrayList < ExError > {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let options = getValidationOptionsFromPodTemplate(controller.spec.template, None)
        return validateReplicationController(controller, options)
    }
    public func warningsOnCreate(ctx: RequestContext, obj: RuntimeObject): ArrayList < String > {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        return getWarningsForPodTemplate(Path.newPath("spec",["template"]), controller.spec.template, None)
    }
    public func validateUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < ExError > {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        let options = getValidationOptionsFromPodTemplate(newController.spec.template, oldController.spec.template)
        let ret = validateReplicationController(newController, options)
        ret.add(all: validateReplicationControllerUpdate(newController, oldController, options))
        for((key, value) in nonConvertibleFields(oldController.getAnnotations())) {
            let parts = key.split("/")
            if(parts.size != 2) {
                continue
            }
            let errorField = parts[1]
            if(errorField.contains("selector")) {
                if(! deepEqual < HashMap < String, String >>(oldController.spec.selector, newController.spec.selector)) {
                    ret.add(ExError.invalid(Path.newPath("spec").child("selector"), newController.spec.selector, "cannot update non-convertible selector"))
                }
            }
            else {
                ret.add(ExError.create(ExError.ERROR_TYPE_NOT_FOUND, errorField, value, "unknown non-convertible field"))
            }
        }
        ret
    }
    public func warningsOnUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < String > {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        if(newController.getGeneration() != oldController.getGeneration()) {
            return getWarningsForPodTemplate(Path.newPath("spec",["template"]), oldController.spec.template, newController.spec.template)
        }
        return ArrayList < String >()
    }
    public static func getAttrs(obj: RuntimeObject): Result <(LabelSet, FieldSet), Exception > {
        if(let Some(value) <- convertAnyToResource < ReplicationController >(obj)) {
            return Ok((LabelSet(value.metadata.labels), toSelectableFields(value)))
        }
        return Err(Exception("given object is not a replication controller"))
    }
    public static func matcher(label: LabelSelector, field: FieldSelector): SelectionPredicate {
        SelectionPredicate(label: label, field: field, getAttrs: getAttrs)
    }
    public static func toSelectableFields(replicationController: ReplicationController): FieldSet {
        let objectMetaFieldsSet = FieldSet.objectMetaFieldsSet(replicationController.metadata, true)
        objectMetaFieldsSet.add("status.replicas", replicationController.status.replicas.toString())
        return objectMetaFieldsSet
    }
    static func nonConvertibleFields(annotations: HashMap < String, String >): HashMap < String, String > {
        let ret = HashMap < String, String >()
        for((key, value) in annotations) {
            if(! key.startsWith(AnnotationKeyConstants.NON_CONVERTIBLE_ANNOTATION_PREFIX)) {
                continue
            }
            ret[key] = value
        }
        ret
    }
    public func defaultGarbageCollectionPolicy(ctx: RequestContext): String {
        let reqeustInfo = ctx.requestInfo
        let groupVersion = GroupVersion(reqeustInfo.apiGroup, reqeustInfo.apiVersion)
        if(groupVersion == SCHEME_GROUP_VERSION) {
            return ORPHAN_DEPENDENTS
        }
        else {
            return DELETE_DEPENDENTS
        }
    }
    public func namespaceScoped(): Bool {
        return true
    }
    public func canonicalize(obj: RuntimeObject): Unit {
    }
    public func allowCreateOnUpdate(): Bool {
        return false
    }
    public func allowUnconditionalUpdate(): Bool {
        return true
    }
    public func objectKinds(obj: RuntimeObject): Result <(Array < GroupVersionKind >, Bool), Exception > {
        return objectTyper.objectKinds(obj)
    }
    public func recognizes(gvk: GroupVersionKind): Bool {
        return objectTyper.recognizes(gvk)
    }
    
    public func generateName(base: String): String {
        return this.nameGenerator.generateName(base)
    }
}
"#
let scoperStr2 = #"
public class CSINodeStorage <: Storage & Creater & Updater & Patcher & GracefulDeleter & CollectionDeleter & Lister & Watcher & Getter {
    public static let prefix: String = "csinodes"
    private let store: Store
    private init(store: Store) {
        this.store = store
    }
    static func newFunc(): RuntimeObject {
        return CSINode()
    }
    static func newListFunc(): RuntimeObject {
        return CSINodeList()
    }
    public static func newCSINodeStorage(scheme!: Scheme, codecs!: CodecFactory, storation!: Storation): Result < CSINodeStorage, Exception > {
        let strategy = Strategy(scheme, SimpleNameGenerator())
        let store = Store.builder().setPrefix(prefix).setNewFunc(newFunc).setNewListFunc(newListFunc).setIsNamespaced(strategy.namespaceScoped()).setStoration(storation).setCodecFactory(codecs).setCreateStrategy(strategy).setUpdateStrategy(strategy).setDeleteStrategy(strategy).setGroupResuorce(resource("csinodes")).setReturnDeleteObject(true).setTableConvertor(newTableConvertor()).build()
        return Ok(CSINodeStorage(store))
    }
    public func new(): RuntimeObject {
        return this.store.new()
    }
    public func destroy(): Unit {
        return
    }
    public func create(requestContext: RequestContext, obj: RuntimeObject, createValidation: ValidateObjectFunc, options: CreateOptions): Result < RuntimeObject, Exception > {
        match(accessor(obj)) {
            case Err(e) => return Err(e)
            case Ok(objectMeta) => objectMeta.setCreationTimestamp(TimeWrapper.now())
            objectMeta.setUid(UUID.randomUUID().toString())
        }
        return this.store.create(requestContext, obj, createValidation, options)
    }
    public func update(requestContext: RequestContext, name: String, objInfo: UpdatedObjectInfo, createValidation: ValidateObjectFunc, updateValidation: ValidateObjectUpdateFunc, forceAllowCreate: Bool, options: UpdateOptions): Result <(RuntimeObject, Bool), Exception > {
        this.store.update(requestContext, name, objInfo, createValidation, updateValidation, forceAllowCreate, options)
    }
    public func get(requestContext: RequestContext, name: String, options: GetOptions): Result < RuntimeObject, Exception > {
        let ret = this.store.get(requestContext, name, options)
        if(ret.isOk()) {
            return ret
        }
        let gr = GroupResource(requestContext.requestInfo.apiGroup, requestContext.requestInfo.resource)
        return Err(interpretGetError(ret.getErr().getOrThrow(), gr, name))
    }
    public func delete(requestContext: RequestContext, name: String, deleValidation: ValidateObjectFunc, deleteOptions: DeleteOptions): Result <(RuntimeObject, Bool), Exception > {
        this.store.delete(requestContext, name, deleValidation, deleteOptions)
    }
    public func deleteCollection(requestContext: RequestContext, deleValidation: ValidateObjectFunc, deleteOptions: DeleteOptions, listOptions: ListOptions): Result < RuntimeObject, Exception > {
        let ret = this.store.deleteCollection(requestContext, deleValidation, deleteOptions, listOptions)
        match(ret) {
            case Ok(v) => return Ok(v)
            case Err(err) => return Err(err)
        }
    }
    public func newList(): RuntimeObject {
        return this.store.newList()
    }
    public func list(requestContext: RequestContext, options: ListOptions): Result < RuntimeObject, Exception > {
        let ret = this.store.list(requestContext, options)
        if(ret.isOk()) {
            return ret
        }
        let gr = GroupResource(requestContext.requestInfo.apiGroup, requestContext.requestInfo.resource)
        return Err(interpretListError(ret.getErr().getOrThrow(), gr))
    }
    public func watch(requestContext: RequestContext, options: ListOptions): Result < WatchInterface, Exception > {
        return this.store.watch(requestContext, options)
    }
}
"#
let scoperInlineStr1 = #"

                    public func namespaceScoped(): Bool {
                        return this.strategy.namespaceScoped()
                    }

"#
let storageStr1 = #"
public class DeploymentScaleStorage <: GroupVersionKindProvider & Scoper {
    private DeploymentScaleStorage(private let store: Store) {
    }
    public func new(): RuntimeObject {
        return Scale()
    }
    public func getGroupVersionKind(containingGV: GroupVersion): GroupVersionKind {
        if(GroupVersion("extensions", "v1beta1") == containingGV) {
            return GroupVersion("extensions", "v1beta1").withKind("Scale")
        }
        else if(GroupVersion("apps", "v1beta1") == containingGV) {
            return GroupVersion("apps", "v1beta1").withKind("Scale")
        }
        else {
            return GroupVersion("autoscaling", "v1").withKind("Scale")
        }
    }
    public static func newDeploymentScaleStorage(store: Store): DeploymentScaleStorage {
        DeploymentScaleStorage(store)
    }
    public func get(requestContext: RequestContext, name: String, options: GetOptions): Result < RuntimeObject, Exception > {
        let obj = match(this.store.get(requestContext, name, options)) {
            case Ok(o) => o
            case Err(e) => return Err(StatusError.newNotFound(resource("deployments/scale"), name))
        }
        let deploy = convertAnyToResource < Deployment >(obj).getOrThrow()
        match(scaleFromDeployment(deploy)) {
            case Ok(scale) => return Ok(scale)
            case Err(err) => return Err(StatusError.newBadRequest("${err}"))
        }
    }
    public func update(requestContext: RequestContext, name: String, objInfo: UpdatedObjectInfo, createValidation: ValidateObjectFunc, updateValidation: ValidateObjectUpdateFunc, forceAllowCreate: Bool, options: UpdateOptions): Result <(RuntimeObject, Bool), Exception > {
        try {
            let result = this.store.update(requestContext, name, ScaleUpdatedObjectInfo(name, objInfo), toScaleCreateValidation(createValidation), toScaleUpdateValidation(updateValidation), forceAllowCreate, options)
            let(obj, _) = match(result) {
                case Err(err) => return Err(err)
                case Ok(value) => value
            }
            let newScaleRet = scaleFromDeployment((obj as Deployment).getOrThrow())
            match(newScaleRet) {
                case Err(err) => return Err(StatusError.newBadRequest("${err}"))
                case Ok(scale) => return Ok((scale, false))
            }
        } catch(e: Exception) {
            return Err(e)
        }
    }
    
    public func namespaceScoped(): Bool {
        return true
    }
}
"#
let patcherStr1 = #"
public class JobStorage <: Scoper & Storage & Creater & Updater {
    public static let prefix: String = "jobs"
    private let store: Store
    private init(store: Store) {
        this.store = store
    }
    static func newFunc(): RuntimeObject {
        return Job()
    }
    static func newListFunc(): RuntimeObject {
        return JobList()
    }
    public static func newJobStorage(store: Store): JobStorage {
        return JobStorage(store)
    }
    public func namespaceScoped(): Bool {
        return this.store.namespaceScoped()
    }
    public func new(): RuntimeObject {
        return this.store.new()
    }
    public func destroy(): Unit {
        return
    }
    public func create(requestContext: RequestContext, obj: RuntimeObject, createValidation: ValidateObjectFunc, options: CreateOptions): Result < RuntimeObject, Exception > {
        match(accessor(obj)) {
            case Err(e) => return Err(e)
            case Ok(objectMeta) => objectMeta.setCreationTimestamp(TimeWrapper.now())
            objectMeta.setUid(UUID.randomUUID().toString())
        }
        return this.store.create(requestContext, obj, createValidation, options)
    }
    
    public func update(
    requestContext: RequestContext,
    name: String,
    objInfo: UpdatedObjectInfo,
    createValidation: ValidateObjectFunc,
    updateValidation: ValidateObjectUpdateFunc,
    forceAllowCreate: Bool,
    options: UpdateOptions
    ): Result <(RuntimeObject, Bool), Exception > {
        this.store.update(
        requestContext,
        name,
        objInfo,
        createValidation,
        updateValidation,
        forceAllowCreate,
        options
        )
    }
}
"#
let deleteStrategyStr1 = #"
public class Strategy <: CreateStrategy & UpdateStrategy {
    let objectTyper: ObjectTyper
    let nameGenerator: NameGenerator
    public init(objectTyper: ObjectTyper, nameGenerator: NameGenerator) {
        this.objectTyper = objectTyper
        this.nameGenerator = nameGenerator
    }
    public func prepareForCreate(ctx: RequestContext, obj: RuntimeObject): Unit {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        controller.status = ReplicationControllerStatus()
        controller.setGeneration(1)
        dropDisabledTemplateFields(controller.spec.template, None)
    }
    public func prepareForUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): Unit {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        newController.status = oldController.status
        dropDisabledTemplateFields(newController.spec.template, oldController.spec.template)
        if(! deepEqual < ReplicationControllerSpec >(newController.spec, oldController.spec)) {
            newController.setGeneration(oldController.getGeneration() + 1)
        }
    }
    public func validate(ctx: RequestContext, obj: RuntimeObject): ArrayList < ExError > {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let options = getValidationOptionsFromPodTemplate(controller.spec.template, None)
        return validateReplicationController(controller, options)
    }
    public func warningsOnCreate(ctx: RequestContext, obj: RuntimeObject): ArrayList < String > {
        let controller = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        return getWarningsForPodTemplate(Path.newPath("spec",["template"]), controller.spec.template, None)
    }
    public func validateUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < ExError > {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        let options = getValidationOptionsFromPodTemplate(newController.spec.template, oldController.spec.template)
        let ret = validateReplicationController(newController, options)
        ret.add(all: validateReplicationControllerUpdate(newController, oldController, options))
        for((key, value) in nonConvertibleFields(oldController.getAnnotations())) {
            let parts = key.split("/")
            if(parts.size != 2) {
                continue
            }
            let errorField = parts[1]
            if(errorField.contains("selector")) {
                if(! deepEqual < HashMap < String, String >>(oldController.spec.selector, newController.spec.selector)) {
                    ret.add(ExError.invalid(Path.newPath("spec").child("selector"), newController.spec.selector, "cannot update non-convertible selector"))
                }
            }
            else {
                ret.add(ExError.create(ExError.ERROR_TYPE_NOT_FOUND, errorField, value, "unknown non-convertible field"))
            }
        }
        ret
    }
    public func warningsOnUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < String > {
        let newController = convertAnyToResource < ReplicationController >(obj).getOrThrow()
        let oldController = convertAnyToResource < ReplicationController >(old).getOrThrow()
        if(newController.getGeneration() != oldController.getGeneration()) {
            return getWarningsForPodTemplate(Path.newPath("spec",["template"]), oldController.spec.template, newController.spec.template)
        }
        return ArrayList < String >()
    }
    public static func getAttrs(obj: RuntimeObject): Result <(LabelSet, FieldSet), Exception > {
        if(let Some(value) <- convertAnyToResource < ReplicationController >(obj)) {
            return Ok((LabelSet(value.metadata.labels), toSelectableFields(value)))
        }
        return Err(Exception("given object is not a replication controller"))
    }
    public static func matcher(label: LabelSelector, field: FieldSelector): SelectionPredicate {
        SelectionPredicate(label: label, field: field, getAttrs: getAttrs)
    }
    public static func toSelectableFields(replicationController: ReplicationController): FieldSet {
        let objectMetaFieldsSet = FieldSet.objectMetaFieldsSet(replicationController.metadata, true)
        objectMetaFieldsSet.add("status.replicas", replicationController.status.replicas.toString())
        return objectMetaFieldsSet
    }
    static func nonConvertibleFields(annotations: HashMap < String, String >): HashMap < String, String > {
        let ret = HashMap < String, String >()
        for((key, value) in annotations) {
            if(! key.startsWith(AnnotationKeyConstants.NON_CONVERTIBLE_ANNOTATION_PREFIX)) {
                continue
            }
            ret[key] = value
        }
        ret
    }
    public func defaultGarbageCollectionPolicy(ctx: RequestContext): String {
        let reqeustInfo = ctx.requestInfo
        let groupVersion = GroupVersion(reqeustInfo.apiGroup, reqeustInfo.apiVersion)
        if(groupVersion == SCHEME_GROUP_VERSION) {
            return ORPHAN_DEPENDENTS
        }
        else {
            return DELETE_DEPENDENTS
        }
    }
    public func namespaceScoped(): Bool {
        return true
    }
    public func canonicalize(obj: RuntimeObject): Unit {
    }
    
    public func allowCreateOnUpdate(): Bool {
        return false
    }
    
    public func allowUnconditionalUpdate(): Bool {
        return true
    }
}
"#
let deleteStrategyInlineStr1 = #"

                    public func objectKinds(obj: RuntimeObject): Result<(Array<GroupVersionKind>, Bool), Exception> {
                        return this.strategy.objectKinds(obj)
                    }

"#
let updateStrategyStr1 = #"
public class PersistentVolumeStrategy <: Scoper & DeleteStrategy & NameGenerator {
    let objectTyper: ObjectTyper
    let nameGenerator: NameGenerator
    public init(objectTyper: ObjectTyper, nameGenerator: NameGenerator) {
        this.objectTyper = objectTyper
        this.nameGenerator = nameGenerator
    }
    public func prepareForCreate(ctx: RequestContext, obj: RuntimeObject): Unit {
        let pv = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        pv.status = PersistentVolumeStatus()
        dropDisabledFields(pv.spec, None)
    }
    public func prepareForUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): Unit {
        let newObj = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        let oldObj = convertAnyToResource < PersistentVolume >(old).getOrThrow()
        newObj.status = oldObj.status
        dropDisabledFields(newObj.spec, oldObj.spec)
    }
    private func dropDisabledFields(newSpec: PersistentVolumeSpec, oldSpec:?PersistentVolumeSpec): Unit {
        if(DEFAULT_FEATURE_GATE.enabled(FeatureConst.CSI_NODE_EXPAND_SECRET)) {
            return
        }
        if(this.hasNodeExpansionSecrets(oldSpec)) {
            return
        }
        if(let Some(csi) <- newSpec.persistentVolumeSource.csi) {
            csi.nodeExpandSecretRef = None
        }
    }
    private func hasNodeExpansionSecrets(oldSpec:?PersistentVolumeSpec): Bool {
        let spec = match(oldSpec) {
            case Some(v) => v
            case None => return false
        }
        let csi = match(spec.persistentVolumeSource.csi) {
            case Some(v) => v
            case None => return false
        }
        match(csi.nodeExpandSecretRef) {
            case Some(v) => return true
            case None => return false
        }
    }
    public func validate(ctx: RequestContext, obj: RuntimeObject): ArrayList < ExError > {
        let pv = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        let opts = validationOptionsForPersistentVolume(pv, None)
        let allErrs = validatePersistentVolume(pv, opts)
        allErrs.add(all: validatePersistentVolume(pv))
        return allErrs
    }
    public func validateUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < ExError > {
        let newObj = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        let oldObj = convertAnyToResource < PersistentVolume >(old).getOrThrow()
        let opts = validationOptionsForPersistentVolume(newObj, oldObj)
        let allErrs = validatePersistentVolume(newObj, opts)
        allErrs.add(all: validatePersistentVolume(newObj))
        allErrs.add(all: validatePersistentVolumeUpdate(newObj, oldObj, opts))
        return allErrs
    }
    public func warningsOnCreate(ctx: RequestContext, obj: RuntimeObject): ArrayList < String > {
        let pv = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        this.getWarningsForPersistentVolume(pv)
    }
    public func warningsOnUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): ArrayList < String > {
        let newPv = convertAnyToResource < PersistentVolume >(obj).getOrThrow()
        this.getWarningsForPersistentVolume(newPv)
    }
    private func getWarningsForPersistentVolume(pv: PersistentVolume): ArrayList < String > {
        let warnings = ArrayList < String >()
        let nodeAffinity = match(pv.spec.nodeAffinity) {
            case Some(v) => v
            case None => return warnings
        }
        let nodeSelectorTerms = match(nodeAffinity.required) {
            case Some(v) => v.nodeSelectorTerms
            case None => return warnings
        }
        let termFldPath = Path.newPath("spec",["nodeAffinity", "required", "nodeSelectorTerms"])
        for(i in 0 .. nodeSelectorTerms.size) {
            let term = nodeSelectorTerms[i]
            let idxPath = termFldPath.index(i)
            warnings.add(all: NodeUtil.getWarningsForNodeSelectorTerm(term, idxPath))
        }
        return warnings
    }
    public static func getAttrs(obj: RuntimeObject): Result <(LabelSet, FieldSet), Exception > {
        if(let Some(value) <- convertAnyToResource < PersistentVolume >(obj)) {
            return Ok((LabelSet(value.metadata.labels), toSelectableFields(value)))
        }
        return Err(Exception("not a persistentvolume"))
    }
    public static func matcher(label: LabelSelector, field: FieldSelector): SelectionPredicate {
        SelectionPredicate(label: label, field: field, getAttrs: getAttrs)
    }
    public static func toSelectableFields(persistentVolume: PersistentVolume): FieldSet {
        let objectMetaFieldsSet = FieldSet.objectMetaFieldsSet(persistentVolume.metadata, false)
        objectMetaFieldsSet.add("name", persistentVolume.metadata.name)
        return objectMetaFieldsSet
    }
    public func namespaceScoped(): Bool {
        return false
    }
    public func objectKinds(obj: RuntimeObject): Result <(Array < GroupVersionKind >, Bool), Exception > {
        return objectTyper.objectKinds(obj)
    }
    public func recognizes(gvk: GroupVersionKind): Bool {
        return objectTyper.recognizes(gvk)
    }
    
    public func generateName(base: String): String {
        return this.nameGenerator.generateName(base)
    }
}
"#
let symmetryAttrStr1 = #"
func spawnCoroutine() {
    var err:?Exception = None
    try {
        launchServer.serve()
    } catch(e: Exception) {
        err = e
    }
    let msg = "Stopped listening on ${address}:${port}"
    try {
        let select = Select()
        
        select.registerPullSelectCase < Any >(stopCh, {
            data:?Any, ok: Bool =>
            LOGGER.info(msg)
            return true
        })
        let tmpErr = err
        select.registerDefaultSelectCase(
        {
            =>
            if(let Some(e) <- tmpErr) {
                
                throw e
            }
            
            return true
        }
        )
        
        select.run()
    } finally {
        
        listenerStoppedCh.close()
    }
}
"#
let equatableStr1 = #"
public class JSONSchemaProps {
    public var id: String = String.empty
    public var schema: String = String.empty
    public var ref: Option < String >= None
    public var description: String = String.empty
    public var `type`: String = String.empty
    public var format: String = String.empty
    public var title: String = String.empty
    public var default: Option < JSON >= None
    public var maximum: Option < Float64 >= None
    public var exclusiveMaximum: Bool = false
    public var minimum: Option < Float64 >= None
    public var exclusiveMinimum: Bool = false
    public var maxLength: Option < Int64 >= None
    public var minLength: Option < Int64 >= None
    public var pattern: String = String.empty
    public var maxItems: Option < Int64 >= None
    public var minItems: Option < Int64 >= None
    public var uniqueItems: Bool = false
    public var multipleOf: Option < Float64 >= None
    public var `enum`: ArrayList < JSON >= ArrayList < JSON >()
    public var maxProperties: Option < Int64 >= None
    public var minProperties: Option < Int64 >= None
    public var required: ArrayList < String >= ArrayList < String >()
    public var items: Option < JSONSchemaPropsOrArray >= None
    public var allOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()
    public var oneOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()
    public var anyOf: ArrayList < JSONSchemaProps >= ArrayList < JSONSchemaProps >()
    public var not: Option < JSONSchemaProps >= None
    public var properties: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()
    public var additionalProperties: Option < JSONSchemaPropsOrBool >= None
    public var patternProperties: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()
    public var dependencies: HashMap < String, JSONSchemaPropsOrStringArray >= HashMap < String, JSONSchemaPropsOrStringArray >(
    )
    public var additionalItems: Option < JSONSchemaPropsOrBool >= None
    public var definitions: HashMap < String, JSONSchemaProps >= HashMap < String, JSONSchemaProps >()
    public var externalDocs: Option < ExternalDocumentation >= None
    public var example: Option < JSON >= None
    public var nullable: Bool = false
    public var xPreserveUnknownFields: Option < Bool >= None
    public var xEmbeddedResource: Bool = false
    public var xIntOrString: Bool = false
    public var xListMapKeys: ArrayList < String >= ArrayList < String >()
    public var xListType: Option < String >= None
    public var xMapType: Option < String >= None
    public var xValidations: ArrayList < ValidationRule >= ArrayList < ValidationRule >()
}
"#
let genericSingleResourceStr1 = #"
public class ConfigMap <: LookupPatchMeta & LookupPatchMetaAccessor {
    static let OBJECT_CALSS_NAME: String = "model.taibai.model.core.v1.types.ConfigMap"
    public var typeMeta: TypeMeta = TypeMeta()
    public var metadata: ObjectMeta = ObjectMeta()
    public var immutable: Option < Bool >= None
    public var data: HashMap < String, String >= HashMap < String, String >()
    var jsonBinaryData: HashMap < String, ByteArrayWrapper >= HashMap < String, ByteArrayWrapper >()
    var protobufBinaryData: HashMap < String, Array < Byte >>= HashMap < String, Array < Byte >>()
    public mut prop binaryData: HashMap < String, ByteArrayWrapper > {
        get() {
            this.jsonBinaryData
        }
        set(val) {
            this.jsonBinaryData = val
            this.protobufBinaryData.clear()
            for((key, value) in val) {
                this.protobufBinaryData[key] = value.data
            }
        }
    }
    public func postDeserialize(dm: DataModel): Unit {
        this.defaultForValue()
    }
    public func defaultForValue(): Unit {
        if(! this.jsonBinaryData.isEmpty() && this.protobufBinaryData.isEmpty()) {
            for((key, value) in this.jsonBinaryData) {
                this.protobufBinaryData[key] = value.data
            }
        }
        if(this.jsonBinaryData.isEmpty() && ! this.protobufBinaryData.isEmpty()) {
            for((key, value) in this.protobufBinaryData) {
                this.jsonBinaryData[key] = ByteArrayWrapper(value)
            }
        }
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        inlineResultLookupPatchMetadataResult = inlineFieldsLookupPatchMetadata(typeMeta, key)
        if(inlineResultLookupPatchMetadataResult.isOk()) {
            return inlineResultLookupPatchMetadataResult
        }
        
        
        if(key == "metadata") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(metadata is LookupPatchMeta) {
                schema =(metadata as LookupPatchMeta).getOrThrow()
            } else if(metadata is LookupPatchMetaAccessor) {
                schema =(metadata as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "immutable") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(immutable is LookupPatchMeta) {
                schema =(immutable as LookupPatchMeta).getOrThrow()
            } else if(immutable is LookupPatchMetaAccessor) {
                schema =(immutable as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "data") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(data is LookupPatchMeta) {
                schema =(data as LookupPatchMeta).getOrThrow()
            } else if(data is LookupPatchMetaAccessor) {
                schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "binaryData") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(jsonBinaryData is LookupPatchMeta) {
                schema =(jsonBinaryData as LookupPatchMeta).getOrThrow()
            } else if(jsonBinaryData is LookupPatchMetaAccessor) {
                schema =(jsonBinaryData as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "protobufBinaryData") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(protobufBinaryData is LookupPatchMeta) {
                schema =(protobufBinaryData as LookupPatchMeta).getOrThrow()
            } else if(protobufBinaryData is LookupPatchMetaAccessor) {
                schema =(protobufBinaryData as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "ConfigMap"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        ConfigMap()
    }
}
"#
let internalGenericListResourceStr1 = #"
public class PolicyList {
    static let OBJECT_CALSS_NAME: String = "model.taibai.model.audit.types.PolicyList"
    public var typeMeta: TypeMeta
    public var metadata: ListMeta
    public var items: ArrayList < Policy >
    
    public init(typeMeta!: TypeMeta = TypeMeta(), metadata!: ListMeta = ListMeta(),
    items!: ArrayList < Policy >= ArrayList(0)) {
        this.typeMeta = typeMeta
        this.metadata = metadata
        this.items = items
    }
}
"#
let patchMetaStr1 = #"
public class DeleteOptions <: Formable {
    static let OBJECT_CALSS_NAME: String = "apicommon.taibai.apicommon.pkg.apis.meta.v1.types.DeleteOptions"
    
    public var typeMeta: TypeMeta = TypeMeta()
    
    public var gracePeriodSeconds: Option < Int64 >= None
    
    public var preconditions: Option < Preconditions >= None
    
    public var orphanDependents: Option < Bool >= None
    
    
    public var propagationPolicy: Option < String >= None
    
    public var dryRun: ArrayList < String >= ArrayList < String >()
    
    public init() { }
    
    public init(preconditions: Option < Preconditions >) {
        this.preconditions = preconditions
    }
    
    public func getResourceVersion(): String {
        if(let Some(pd) <- preconditions) {
            if(let Some(rv) <- pd.resourceVersion) {
                return rv
            }
        }
        return String.empty
    }
    
    public func toForm(): Form {
        let form = Form()
        if(! typeMeta.apiVersion.isEmpty()) {
            form.add("apiVersion", typeMeta.apiVersion)
        }
        if(! typeMeta.kind.isEmpty()) {
            form.add("kind", typeMeta.kind)
        }
        if(let Some(value) <- gracePeriodSeconds) {
            form.add("gracePeriodSeconds", value.toString())
        }
        if(let Some(pd) <- preconditions) {
            if(let Some(value) <- pd.uid) {
                form.add("uid", value)
            }
        }
        if(let Some(pd) <- preconditions) {
            if(let Some(value) <- pd.resourceVersion) {
                form.add("resourceVersion", value)
            }
        }
        if(let Some(value) <- orphanDependents) {
            form.add("orphanDependents", value.toString())
        }
        if(let Some(value) <- propagationPolicy) {
            form.add("propagationPolicy", value)
        }
        for(item in dryRun) {
            form.add("dryRun", item)
        }
        form
    }
    
    public func fromForm(form: Form): Unit {
        if(let Some(value) <- form.get("apiVersion")) {
            typeMeta.apiVersion = value
        }
        if(let Some(value) <- form.get("kind")) {
            typeMeta.kind = value
        }
        if(let Some(value) <- form.get("gracePeriodSeconds")) {
            gracePeriodSeconds = Int64.parse(value)
        }
        match((form.get("uid"), form.get("resourceVersion"))) {
            case(Some(uid), Some(resourceVersion)) => preconditions = Preconditions().setUid(uid).setResourceVersion(
            resourceVersion)
            case(Some(uid), None) => preconditions = Preconditions().setUid(uid)
            case(None, Some(resourceVersion)) => preconditions = Preconditions().setResourceVersion(resourceVersion)
            case(None, None) =>()
        }
        if(let Some(value) <- form.get("orphanDependents")) {
            orphanDependents = Bool.parse(value)
        }
        if(let Some(value) <- form.get("propagationPolicy")) {
            propagationPolicy = value
        }
        dryRun = form.getAll("dryRun")
    }
}
"#
let patchMetaStr2 = #"
public class GroupVersionForDiscovery <: Hashable & Equatable < GroupVersionForDiscovery > {
    public var groupVersion: String = String.empty
    
    public var version: String = String.empty
    
    public init() { }
    
    public init(groupVersion: String, version: String) {
        this.groupVersion = groupVersion
        this.version = version
    }
    
    public operator func ==(rhs: GroupVersionForDiscovery): Bool {
        return this.groupVersion == rhs.groupVersion && this.version == rhs.version
    }
    
    public operator func !=(rhs: GroupVersionForDiscovery): Bool {
        return !(this == rhs)
    }
    
    public func hashCode(): Int64 {
        return(this.groupVersion + this.version).hashCode()
    }
}
"#
let patchMetaStr3 = #"
public class Unstructured <: Serializable < Unstructured > & JsonSerializable & Cloneable < Unstructured > & ObjectKind & IObjectMeta & IUnstructured & TypeInterface {
    public var object: DataModelStruct = DataModelStruct()
    
    static let OBJECT_CALSS_NAME: String = "apicommon.taibai.apicommon.pkg.apis.meta.v1.types.Unstructured"
    
    public func setGroupVersionKind(gvk: GroupVersionKind): Unit {
        let(apiVersion, kind) = gvk.toApiVersionAndKind()
        let fields = object.getFields()
        
        let setAttribute = {
            attrName: String, attrValue: String =>
            let field = Field(attrName, DataModelString(attrValue))
            var isExist = false
            for(i in 0 .. fields.size) {
                if(! isExist && fields[i].getName() == attrName) {
                    fields[i] = field
                    isExist = true
                    continue
                }
            }
            if(! isExist) {
                object.add(field)
            }
        }
        
        setAttribute("apiVersion", apiVersion)
        setAttribute("kind", kind)
    }
    
    public func groupVersionKind(): GroupVersionKind {
        let getAttribute = {
            attrName: String => match(this.object.get(attrName)) {
                case data: DataModelString => data.getValue()
                case _ => String.empty
            }
        }
        
        let apiVersion = getAttribute("apiVersion")
        let kind = getAttribute("kind")
        
        return GroupVersionKind.fromApiVersionAndKind(apiVersion, kind)
    }
    
    public func toDataModel(): DataModel {
        return this.serialize()
    }
    
    public func toJson(): String {
        return this.serialize().toJson().toString()
    }
    
    public func toPrettyJson(): String {
        return this.serialize().toJson().toJsonString()
    }
    
    public func deepClone(): Unstructured {
        let clone = Unstructured()
        clone.object = this.object.clone()
        return clone
    }
    
    public func newEmptyInstance(): IUnstructured {
        return Unstructured()
    }
    
    public func unstructuredContent(): DataModelStruct {
        return object
    }
    
    public func setUnstructuredContent(content: DataModelStruct): Unit {
        this.object = content
    }
    
    public func isList(): Bool {
        match(this.object.get("items")) {
            case dm: DataModelSeq => return true
            case _ => return false
        }
    }
    
    public func toList():(UnstructuredList,?Exception) {
        
        try {
            return(UnstructuredList.deserialize(this.object), None)
        } catch(e: Exception) {
            return(UnstructuredList(), Some(e))
        }
    }
    
    public func eachListItem(fn:(RuntimeObject) -> Option < Exception >): Option < Exception > {
        if(! this.isList()) {
            return Some(Exception("content is not a list"))
        }
        let unstructuredList = this.toList()[0]
        for(item in unstructuredList.items) {
            if(let Some(e) <- fn(item)) {
                return Some(e)
            }
        }
        return None
    }
    
    public func fillFromJson(jsonStr: String): Unit {
        let dm = DataModel.fromJson(JsonValue.fromStr(jsonStr))
        this.object = match(dm) {
            case data: DataModelStruct => data
            case _ => throw DataModelException("this data is not DataModelStruct")
        }
    }
    
    public func serialize(): DataModel {
        return this.object
    }
    
    public static func deserialize(dm: DataModel): Unstructured {
        let dms = match(dm) {
            case data: DataModelStruct => data
            case _ => throw Exception("this data is not DataModelStruct")
        }
        let result = Unstructured()
        result.object = dms
        return result
    }
    
    private func setNestedFiled < T >(value: T, fields: Array < String >):?Exception where T <: Serializable < T > {
        let isEmpty: Bool = match(value) {
            case v: String => v.isEmpty()
            case v: Collection < T > => v.isEmpty()
            case v: Int64 => v == 0
            case v: Option < T > => v.isNone()
            case _ => false
        }
        if(isEmpty) {
            UnstructuredHelper.removeNestedField(this.object, fields)
            return None
        } else {
            UnstructuredHelper.setNestedField(this.object, value.serialize(), fields)
        }
        
    }
    
    public func getNamespace(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "namespace")
    }
    public func setNamespace(namespace: String): Unit {
        this.setNestedFiled(namespace, "metadata", "namespace")
    }
    
    public func getName(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "name")
    }
    
    public func setName(name: String): Unit {
        this.setNestedFiled(name, "metadata", "name")
    }
    
    public func getGenerateName(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "generateName")
    }
    
    public func setGenerateName(generateName: String): Unit {
        this.setNestedFiled(generateName, "metadata", "generateName")
    }
    
    public func getResourceVersion(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "resourceVersion")
    }
    
    public func setResourceVersion(version: String): Unit {
        this.setNestedFiled(version, "metadata", "resourceVersion")
    }
    
    public func getSelfLink(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "selfLink")
    }
    
    public func setSelfLink(selfLink: String): Unit {
        this.setNestedFiled(selfLink, "metadata", "selfLink")
    }
    
    public func getZZZDeprecatedClusterName(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "clusterName")
    }
    
    public func setZZZDeprecatedClusterName(clusterName: String): Unit {
        this.setNestedFiled(clusterName, "metadata", "clusterName")
    }
    
    public func getUid(): String {
        UnstructuredHelper.getNestedString(this.object, "metadata", "uid")
    }
    
    public func setUid(uid: String): Unit {
        this.setNestedFiled(uid, "metadata", "uid")
    }
    
    public func getGeneration(): Int64 {
        match(UnstructuredHelper.nestedInt64(this.object, "metadata", "generation")) {
            case Ok((v, true)) => v
            case Ok((_, false)) => 0
            case Err(_) => 0
        }
    }
    
    public func setGeneration(generation: Int64): Unit {
        this.setNestedFiled(generation, "metadata", "generation")
    }
    
    public func getCreationTimestamp(): TimeWrapper {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return TimeWrapper.now()
        }
        
        return Option < TimeWrapper >.deserialize(metedata.get("creationTimestamp"))??TimeWrapper.now()
    }
    public func setCreationTimestamp(timeStamp: TimeWrapper): Unit {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return
        }
        metedata.add(field < TimeWrapper >("creationTimestamp", timeStamp))
    }
    
    public func getDeletionTimestamp():?TimeWrapper {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return None
        }
        
        return Option < TimeWrapper >.deserialize(metedata.get("deletionTimestamp"))??None
    }
    
    public func setDeletionTimestamp(timeStamp:?TimeWrapper): Unit {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return
        }
        metedata.add(field < Option < TimeWrapper >>("deletionTimestamp", timeStamp))
    }
    
    public func getDeletionGracePeriodSeconds(): Option < Int64 > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return 0
        }
        return Option < Int64 >.deserialize(metedata.get("deletionGracePeriodSeconds"))
    }
    
    public func setDeletionGracePeriodSeconds(deletionGracePeriodSeconds: Option < Int64 >): Unit {
        this.setNestedFiled(deletionGracePeriodSeconds, "metadata", "deletionGracePeriodSeconds")
    }
    
    public func getLabels(): HashMap < String, String > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return HashMap < String, String >()
        }
        
        return Option < HashMap < String, String >>.deserialize(metedata.get("labels"))??HashMap < String, String >()
    }
    
    public func setLabels(labels: HashMap < String, String >): Unit {
        this.setNestedFiled(labels, "metadata", "labels")
    }
    
    public func getAnnotations(): HashMap < String, String > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return HashMap < String, String >()
        }
        
        return Option < HashMap < String, String >>.deserialize(metedata.get("annotations"))??HashMap < String, String >()
    }
    
    public func setAnnotations(annotations: HashMap < String, String >): Unit {
        this.setNestedFiled(annotations, "metadata", "annotations")
    }
    
    public func getFinalizers(): ArrayList < String > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return ArrayList < String >()
        }
        
        return Option < ArrayList < String >>.deserialize(metedata.get("finalizers"))??ArrayList < String >()
    }
    
    public func setFinalizers(finalizers: ArrayList < String >): Unit {
        this.setNestedFiled(finalizers, "metadata", "finalizers")
    }
    
    public func getOwnerReferences(): ArrayList < OwnerReference > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return ArrayList < OwnerReference >()
        }
        
        return Option < ArrayList < OwnerReference >>.deserialize(metedata.get("ownerReferences"))??
        ArrayList < OwnerReference >()
    }
    
    public func setOwnerReferences(ownerReferences: ArrayList < OwnerReference >): Unit {
        this.setNestedFiled(ownerReferences, "metadata", "ownerReferences")
    }
    
    public func getManagedFields(): ArrayList < ManagedFieldsEntry > {
        let metedata = match(this.object.get("metadata")) {
            case data: DataModelStruct => data
            case _ => return ArrayList < ManagedFieldsEntry >()
        }
        
        return Option < ArrayList < ManagedFieldsEntry >>.deserialize(metedata.get("managedFields"))??
        ArrayList < ManagedFieldsEntry >()
    }
    
    public func setManagedFields(managedFields: ArrayList < ManagedFieldsEntry >): Unit {
        this.setNestedFiled(managedFields, "metadata", "managedFields")
    }
    
    public mut prop apiVersion: String {
        get() {
            match(object.get("apiVersion")) {
                case data: DataModelString => data.getValue()
                case _ => String.empty
            }
        }
        set(v) {
            object.add(field < String >("apiVersion", v))
        }
    }
    
    public mut prop kind: String {
        get() {
            match(object.get("kind")) {
                case data: DataModelString => data.getValue()
                case _ => String.empty
            }
        }
        set(v) {
            object.add(field < String >("kind", v))
        }
    }
}
"#
let patchMetaStr4 = #"
public class EphemeralContainerCommon <: Cloneable < EphemeralContainerCommon > {
    public var name: String = String.empty
    public var image: String = String.empty
    public var command: ArrayList < String >= ArrayList < String >()
    public var args: ArrayList < String >= ArrayList < String >()
    public var workingDir: String = String.empty
    public var ports: ArrayList < ContainerPort >= ArrayList < ContainerPort >()
    public var envFrom: ArrayList < EnvFromSource >= ArrayList < EnvFromSource >()
    public var env: ArrayList < EnvVar >= ArrayList < EnvVar >()
    public var resources: ResourceRequirements = ResourceRequirements()
    public var volumeMounts: ArrayList < VolumeMount >= ArrayList < VolumeMount >()
    public var volumeDevices: ArrayList < VolumeDevice >= ArrayList < VolumeDevice >()
    public var livenessProbe:?Probe = None
    public var readinessProbe:?Probe = None
    public var startupProbe:?Probe = None
    public var lifecycle:?Lifecycle = None
    public var terminationMessagePath: String = String.empty
    public var terminationMessagePolicy: String = String.empty
    public var imagePullPolicy: String = String.empty
    public var securityContext:?SecurityContext = None
    public var stdin: Bool = false
    public var stdinOnce: Bool = false
    public var tty: Bool = false
    public func toContainer(): Container {
        return Container.deserialize(this.serialize())
    }
    public func postDeserialize(dm: DataModel): Unit {
        defaultForValue()
    }
    public func defaultForValue(): Unit {
        if(this.imagePullPolicy.isEmpty()) {
            if(judgeImageTagIsLatest(this.image)) {
                this.imagePullPolicy = "Always"
            }
            else {
                this.imagePullPolicy = "IfNotPresent"
            }
        }
        resourceListDefaultForValue(this.resources.limits)
        resourceListDefaultForValue(this.resources.requests)
    }
    
    
    public func deepClone(): EphemeralContainerCommon {
        
        var result = EphemeralContainerCommon()
        
        result.name = this.name
        
        result.image = this.image
        
        result.command = this.command.deepClone()
        
        result.args = this.args.deepClone()
        
        result.workingDir = this.workingDir
        
        result.ports = this.ports.deepClone()
        
        result.envFrom = this.envFrom.deepClone()
        
        result.env = this.env.deepClone()
        
        
        if(this.resources is Cloneable < ResourceRequirements >) {
            var cloneTmp =(this.resources as Cloneable < ResourceRequirements >).getOrThrow()
            result.resources = cloneTmp.deepClone()
        } else {
            result.resources = this.resources
        }
        
        
        result.volumeMounts = this.volumeMounts.deepClone()
        
        result.volumeDevices = this.volumeDevices.deepClone()
        
        result.livenessProbe = this.livenessProbe.deepClone()
        
        result.readinessProbe = this.readinessProbe.deepClone()
        
        result.startupProbe = this.startupProbe.deepClone()
        
        result.lifecycle = this.lifecycle.deepClone()
        
        result.terminationMessagePath = this.terminationMessagePath
        
        result.terminationMessagePolicy = this.terminationMessagePolicy
        
        result.imagePullPolicy = this.imagePullPolicy
        
        result.securityContext = this.securityContext.deepClone()
        
        result.stdin = this.stdin
        
        result.stdinOnce = this.stdinOnce
        
        result.tty = this.tty
        
        return result
    }
}
"#
let serializableStr1 = #"
public class ManagedFieldsEntry <: Equatable < ManagedFieldsEntry > & LookupPatchMeta & LookupPatchMetaAccessor {
    public var manager: String = ""
    public var operation: String = ""
    public var apiVersion: String = ""
    public var time: TimeWrapper = TimeWrapper.zero()
    public var fieldsType: String = ""
    public var subresource: String = ""
    public operator func ==(other: ManagedFieldsEntry): Bool {
        return this.manager == other.manager && this.operation == other.operation && this.apiVersion == other.apiVersion && this.time == other.time && this.fieldsType == other.fieldsType && this.subresource == other.subresource
    }
    public operator func !=(other: ManagedFieldsEntry): Bool {
        return this.manager != other.manager || this.operation != other.operation || this.apiVersion != other.apiVersion || this.time != other.time || this.fieldsType != other.fieldsType || this.subresource != other.subresource
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        
        if(key == "manager") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(manager is LookupPatchMeta) {
                schema =(manager as LookupPatchMeta).getOrThrow()
            } else if(manager is LookupPatchMetaAccessor) {
                schema =(manager as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "operation") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(operation is LookupPatchMeta) {
                schema =(operation as LookupPatchMeta).getOrThrow()
            } else if(operation is LookupPatchMetaAccessor) {
                schema =(operation as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "apiVersion") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(apiVersion is LookupPatchMeta) {
                schema =(apiVersion as LookupPatchMeta).getOrThrow()
            } else if(apiVersion is LookupPatchMetaAccessor) {
                schema =(apiVersion as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "time") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(time is LookupPatchMeta) {
                schema =(time as LookupPatchMeta).getOrThrow()
            } else if(time is LookupPatchMetaAccessor) {
                schema =(time as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "fieldsType") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(fieldsType is LookupPatchMeta) {
                schema =(fieldsType as LookupPatchMeta).getOrThrow()
            } else if(fieldsType is LookupPatchMetaAccessor) {
                schema =(fieldsType as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "subresource") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(subresource is LookupPatchMeta) {
                schema =(subresource as LookupPatchMeta).getOrThrow()
            } else if(subresource is LookupPatchMetaAccessor) {
                schema =(subresource as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "ManagedFieldsEntry"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        ManagedFieldsEntry()
    }
}
"#
let serializableStr2 = #"
public class ListOptions <: Formable & LookupPatchMeta & LookupPatchMetaAccessor {
    static let OBJECT_CALSS_NAME: String = "apicommon.taibai.apicommon.pkg.apis.meta.v1.types.ListOptions"
    public var typeMeta: TypeMeta = TypeMeta()
    public var labelSelector: String = String.empty
    public var fieldSelector: String = String.empty
    public var resourceVersion: String = String.empty
    public var resourceVersionMatch: String = String.empty
    public var timeoutSeconds: Int64 = 0
    public var limit: Int64 = 0
    public var `continue`: String = String.empty
    public var watch: Bool = false
    public var allowWatchBookmarks: Bool = false
    public func toForm(): Form {
        let form = Form()
        if(! typeMeta.apiVersion.isEmpty()) {
            form.add("apiVersion", typeMeta.apiVersion)
        }
        if(! typeMeta.kind.isEmpty()) {
            form.add("kind", typeMeta.kind)
        }
        if(! labelSelector.isEmpty()) {
            form.add("labelSelector", labelSelector)
        }
        if(! fieldSelector.isEmpty()) {
            form.add("fieldSelector", fieldSelector)
        }
        if(! resourceVersion.isEmpty()) {
            form.add("resourceVersion", resourceVersion)
        }
        if(! resourceVersionMatch.isEmpty()) {
            form.add("resourceVersionMatch", resourceVersionMatch)
        }
        if(timeoutSeconds != 0) {
            form.add("timeoutSeconds", timeoutSeconds.toString())
        }
        if(limit != 0) {
            form.add("limit", limit.toString())
        }
        if(! `continue`.isEmpty()) {
            form.add("continue", `continue`)
        }
        if(watch != false) {
            form.add("form", watch.toString())
        }
        if(allowWatchBookmarks != false) {
            form.add("allowWatchBookmarks", allowWatchBookmarks.toString())
        }
        return form
    }
    public func fromForm(form: Form): Unit {
        if(let Some(value) <- form.get("apiVersion")) {
            this.typeMeta.apiVersion = value
        }
        if(let Some(value) <- form.get("kind")) {
            this.typeMeta.kind = value
        }
        if(let Some(value) <- form.get("labelSelector")) {
            this.labelSelector = value
        }
        if(let Some(value) <- form.get("fieldSelector")) {
            this.fieldSelector = value
        }
        if(let Some(value) <- form.get("resourceVersionMatch")) {
            this.resourceVersionMatch = value
        }
        if(let Some(value) <- form.get("timeoutSeconds")) {
            this.timeoutSeconds = Int64.parse(value)
        }
        if(let Some(value) <- form.get("limit")) {
            this.limit = Int64.parse(value)
        }
        if(let Some(value) <- form.get("continue")) {
            this.`continue` = value
        }
        if(let Some(value) <- form.get("watch")) {
            this.watch = Bool.parse(value)
        }
        if(let Some(value) <- form.get("allowWatchBookmarks")) {
            this.allowWatchBookmarks = Bool.parse(value)
        }
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        inlineResultLookupPatchMetadataResult = inlineFieldsLookupPatchMetadata(typeMeta, key)
        if(inlineResultLookupPatchMetadataResult.isOk()) {
            return inlineResultLookupPatchMetadataResult
        }
        
        
        if(key == "labelSelector") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(labelSelector is LookupPatchMeta) {
                schema =(labelSelector as LookupPatchMeta).getOrThrow()
            } else if(labelSelector is LookupPatchMetaAccessor) {
                schema =(labelSelector as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "fieldSelector") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(fieldSelector is LookupPatchMeta) {
                schema =(fieldSelector as LookupPatchMeta).getOrThrow()
            } else if(fieldSelector is LookupPatchMetaAccessor) {
                schema =(fieldSelector as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "resourceVersion") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(resourceVersion is LookupPatchMeta) {
                schema =(resourceVersion as LookupPatchMeta).getOrThrow()
            } else if(resourceVersion is LookupPatchMetaAccessor) {
                schema =(resourceVersion as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "resourceVersionMatch") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(resourceVersionMatch is LookupPatchMeta) {
                schema =(resourceVersionMatch as LookupPatchMeta).getOrThrow()
            } else if(resourceVersionMatch is LookupPatchMetaAccessor) {
                schema =(resourceVersionMatch as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "timeoutSeconds") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(timeoutSeconds is LookupPatchMeta) {
                schema =(timeoutSeconds as LookupPatchMeta).getOrThrow()
            } else if(timeoutSeconds is LookupPatchMetaAccessor) {
                schema =(timeoutSeconds as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "limit") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(limit is LookupPatchMeta) {
                schema =(limit as LookupPatchMeta).getOrThrow()
            } else if(limit is LookupPatchMetaAccessor) {
                schema =(limit as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "continue") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(`continue` is LookupPatchMeta) {
                schema =(`continue` as LookupPatchMeta).getOrThrow()
            } else if(`continue` is LookupPatchMetaAccessor) {
                schema =(`continue` as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "watch") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(watch is LookupPatchMeta) {
                schema =(watch as LookupPatchMeta).getOrThrow()
            } else if(watch is LookupPatchMetaAccessor) {
                schema =(watch as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "allowWatchBookmarks") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(allowWatchBookmarks is LookupPatchMeta) {
                schema =(allowWatchBookmarks as LookupPatchMeta).getOrThrow()
            } else if(allowWatchBookmarks is LookupPatchMetaAccessor) {
                schema =(allowWatchBookmarks as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "ListOptions"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        ListOptions()
    }
}
"#
let serializableStr3 = #"
public class PolicyRule <: Cloneable < PolicyRule > & LookupPatchMeta & LookupPatchMetaAccessor {
    public var level: Level
    public var users: Array < String >
    public var userGroups: Array < String >
    public var verbs: Array < String >
    public var resources: Array < GroupResources >
    public var namespaces: Array < String >
    public var nonResourceURLs: Array < String >
    public var omitStages: Array < Stage >
    public var omitManagedFields:?Bool
    public init(level!: Level = Level.LevelNone, users!: Array < String >=[], userGroups!: Array < String >=[], verbs!: Array < String >=[], resources!: Array < GroupResources >=[], namespaces!: Array < String >=[], nonResourceURLs!: Array < String >=[], omitStages!: Array < Stage >=[], omitManagedFields!:?Bool = None) {
        this.level = level
        this.users = users
        this.userGroups = userGroups
        this.verbs = verbs
        this.resources = resources
        this.namespaces = namespaces
        this.nonResourceURLs = nonResourceURLs
        this.omitStages = omitStages
        this.omitManagedFields = omitManagedFields
    }
    public func toData(dst: InternalPolicyRule): InternalPolicyRule {
        let omitStages = Array < InternalStage >(this.omitStages.size, { _ => InternalStage.StageRequestReceived })
        let index = enumerate(this.omitStages)
        while(let Some((i, item)) <- index.next()) {
            omitStages[i] = item.toData(omitStages[i])
        }
        let resources = Array < InternalGroupResources >(this.resources.size, { _ => InternalGroupResources() })
        let resourcesIndex = enumerate(this.resources)
        while(let Some((i, item)) <- resourcesIndex.next()) {
            resources[i] = item.toData(resources[i])
        }
        dst.level = this.level.toData(dst.level)
        dst.users = this.users
        dst.userGroups = this.userGroups
        dst.verbs = this.verbs
        dst.resources = resources
        dst.namespaces = this.namespaces
        dst.nonResourceURLs = this.nonResourceURLs
        dst.omitStages = omitStages
        dst.omitManagedFields = this.omitManagedFields
        dst
    }
    public static func fromData(src: InternalPolicyRule): PolicyRule {
        let omitStages = Array < Stage >(src.omitStages.size, repeat: Stage.StageRequestReceived)
        let index = enumerate(src.omitStages)
        while(let Some((i, item)) <- index.next()) {
            omitStages[i] = Stage.fromData(item)
        }
        let resources = Array < GroupResources >(src.resources.size, repeat: unsafe {
            zeroValue()
        }
        )
        let resourcesIndex = enumerate(src.resources)
        while(let Some((i, item)) <- resourcesIndex.next()) {
            resources[i] = GroupResources.fromData(item)
        }
        PolicyRule(level: Level.fromData(src.level), users: src.users, userGroups: src.userGroups, verbs: src.verbs, resources: resources, namespaces: src.namespaces, nonResourceURLs: src.nonResourceURLs, omitStages: omitStages, omitManagedFields: src.omitManagedFields)
    }
    public func fromDataI(src: InternalPolicyRule): PolicyRule {
        let omitStages = Array < Stage >(src.omitStages.size, repeat: Stage.StageRequestReceived)
        let index = enumerate(src.omitStages)
        while(let Some((i, item)) <- index.next()) {
            omitStages[i] = Stage.fromData(item)
        }
        let resources = Array < GroupResources >(src.resources.size, repeat: unsafe {
            zeroValue()
        }
        )
        let resourcesIndex = enumerate(src.resources)
        while(let Some((i, item)) <- resourcesIndex.next()) {
            resources[i] = GroupResources.fromData(item)
        }
        this.level = Level.fromData(src.level)
        this.users = src.users
        this.userGroups = src.userGroups
        this.verbs = src.verbs
        this.resources = resources
        this.namespaces = src.namespaces
        this.nonResourceURLs = src.nonResourceURLs
        this.omitStages = omitStages
        this.omitManagedFields = this.omitManagedFields
        this
    }
    public func deepClone(): PolicyRule {
        var result = PolicyRule()
        if(this.level is Cloneable < Level >) {
            var cloneTmp =(this.level as Cloneable < Level >).getOrThrow()
            result.level = cloneTmp.deepClone()
        }
        else {
            result.level = this.level
        }
        result.users = this.users.deepClone()
        result.userGroups = this.userGroups.deepClone()
        result.verbs = this.verbs.deepClone()
        result.resources = this.resources.deepClone()
        result.namespaces = this.namespaces.deepClone()
        result.nonResourceURLs = this.nonResourceURLs.deepClone()
        result.omitStages = this.omitStages.deepClone()
        result.omitManagedFields = this.omitManagedFields.deepClone()
        return result
    }
    
    public func inlineFieldsLookupPatchMetadata(data: Any, key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        var schema: LookupPatchMeta = EmptyLookupPatchMeta()
        if(data is LookupPatchMeta) {
            schema =(data as LookupPatchMeta).getOrThrow()
        } else if(data is LookupPatchMetaAccessor) {
            schema =(data as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
        }
        
        return schema.lookupPatchMetadata(key)
        
    }
    
    
    public func lookupPatchMetadata(key: String): Result <(LookupPatchMeta, PatchMeta), Exception > {
        
        
        var inlineResultLookupPatchMetadataResult: Result <(LookupPatchMeta, PatchMeta), Exception >= Err(Exception("inline fialed"))
        
        
        if(key == "level") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(level is LookupPatchMeta) {
                schema =(level as LookupPatchMeta).getOrThrow()
            } else if(level is LookupPatchMetaAccessor) {
                schema =(level as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "users") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(users is LookupPatchMeta) {
                schema =(users as LookupPatchMeta).getOrThrow()
            } else if(users is LookupPatchMetaAccessor) {
                schema =(users as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "userGroups") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(userGroups is LookupPatchMeta) {
                schema =(userGroups as LookupPatchMeta).getOrThrow()
            } else if(userGroups is LookupPatchMetaAccessor) {
                schema =(userGroups as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "verbs") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(verbs is LookupPatchMeta) {
                schema =(verbs as LookupPatchMeta).getOrThrow()
            } else if(verbs is LookupPatchMetaAccessor) {
                schema =(verbs as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "resources") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(resources is LookupPatchMeta) {
                schema =(resources as LookupPatchMeta).getOrThrow()
            } else if(resources is LookupPatchMetaAccessor) {
                schema =(resources as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "namespaces") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(namespaces is LookupPatchMeta) {
                schema =(namespaces as LookupPatchMeta).getOrThrow()
            } else if(namespaces is LookupPatchMetaAccessor) {
                schema =(namespaces as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "nonResourceURLs") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(nonResourceURLs is LookupPatchMeta) {
                schema =(nonResourceURLs as LookupPatchMeta).getOrThrow()
            } else if(nonResourceURLs is LookupPatchMetaAccessor) {
                schema =(nonResourceURLs as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "omitStages") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(omitStages is LookupPatchMeta) {
                schema =(omitStages as LookupPatchMeta).getOrThrow()
            } else if(omitStages is LookupPatchMetaAccessor) {
                schema =(omitStages as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        
        if(key == "omitManagedFields") {
            
            let patchMeta = PatchMeta([], "")
            var schema: LookupPatchMeta = EmptyLookupPatchMeta()
            if(omitManagedFields is LookupPatchMeta) {
                schema =(omitManagedFields as LookupPatchMeta).getOrThrow()
            } else if(omitManagedFields is LookupPatchMetaAccessor) {
                schema =(omitManagedFields as LookupPatchMetaAccessor).getOrThrow().getLookupPatchMeta()
            }
            
            return Ok((schema, patchMeta))
        }
        
        return Err(Exception("not supported key: ${key}"))
        
    }
    public func getPatchMetaName(): String {
        "PolicyRule"
    }
    
    
    
    
    public func getLookupPatchMeta(): LookupPatchMeta {
        this
    }
    
    public static func getLookupPatchMetaForStatic(): LookupPatchMeta {
        PolicyRule()
    }
}
"#
let updateStrategyInlineStr1 = #"

                public func prepareForUpdate(ctx: RequestContext, obj: RuntimeObject, old: RuntimeObject): Unit {
                    return this.strategy.prepareForUpdate(ctx, obj, old)
                }

"#



let stateStr1 = "var showLargeImage: Bool = false"
let stateStr2 = "var uuid: ?String = Option.None"
let stateStr3 = "var tabs: ArrayList<HomeTabBean> = ArrayList<HomeTabBean>()"
let publishStr1 = "var discuss: ?DisscussDetailBean = Option<DisscussDetailBean>.None"
let isFragementStr1 = "public let feedArticle: ?FeedArticle"
// @Watch[]@State
let watchAttrOuterStr1 = "private var stateVarDecl_fontSize_: ObservedProperty < Int >= ObservedProperty < Int >(\"stateVarDecl_fontSize_\", 13)"
let storagePropAttrStr1 = "var agree: Bool = false"

let gqlOperationStr1 = #"
public class ColumnsArticlesV2Query <: Query<ColumnsArticlesV2Query_Data> {
    // common
    public let OPERATION_ID: String = "" // TODO: may be som hash code generated by Apollo
    public let OPERATION_NAME: String = "ColumnsArticlesV2"
    public let OPERATION_DOCUMENT: String = """
    query ColumnsArticlesV2($filterTagSlugs: [String!], $isFeatured: Boolean!, $pageNum: Int!, $query: String,$sortType:CircleSortTypeEnum!) {
      columnsArticlesV2(filterTagSlugs: $filterTagSlugs, isFeatured: $isFeatured, pageNum: $pageNum, query: $query,sortType:$sortType) {
         totalNum
         pageSize
         nodes {
           __typename
           ...communityArticle
         }
      }
    }

    fragment communityArticle on ColumnArticleNode {
      slug
      uuid
      title
      hitCount
      pinnedGlobally
      pinned
      createdAt
      favoriteCount
      updatedAt
      thumbnail
      identifier
      resourceType
      articleType
      score
      subject {
        title
        slug
      }
      tags {
        name
        slug
        nameTranslated
      }
      author {
        username
        profile {
          userSlug
          realName
          userAvatar
          certificationLevel
        }
      }
      contentAuthor {
        username
        userSlug
        realName
        avatar
      }
      reactionType
      reactionsV2 {
        count
        reactionType
      }
      isMyFavorite
      topic {
        id
        commentCount
      }
      summary
      isEditorsPick
      byLeetcode
      status
      hasVideo
      videosInfo {
        duration
        coverUrl
        status
        videoId
      }
      author {
        profile {
            certificationLevel
        }
      }
    }"""

    // variables
    public ColumnsArticlesV2Query(
        public var filterTagSlugs: ?ArrayList<String>,
        public var isFeatured: Bool,
        public var pageNum: Int64,
        public var query: ?String,
        public var sortType: CircleSortTypeEnum
    ) {}
}
"#
let gqlOperationStr2 = #"
public class AccountLoginMutation <: Mutation<AccountLoginMutation_Data> {
    // common
    public let OPERATION_ID: String = "" // TODO: may be som hash code generated by Apollo
    public let OPERATION_NAME: String = "AccountLogin"
    public let OPERATION_DOCUMENT: String = """
mutation AccountLogin($account:String!,$passWord:String!,$clientId:String!,$clientSecret:String!){
  authSignInWithPassword( data: {username: $account, password: $passWord}, client: {clientId: $clientId, clientSecret: $clientSecret}) {
    token
    otpConfig {
      configUrl
      userToken
    }
    passwordValidationFailedReason
    ok
  }
}"""

    // variables
    public AccountLoginMutation(
        public let account: String,
        public let passWord: String,
        public let clientId: String,
        public let clientSecret: String
    ) {}
}
"#

let gqlSerializeStr1 = #"
public class UserStatusQuery_UserStatus {
    public UserStatusQuery_UserStatus(
        public let accountStatus: ?UserStatusQuery_AccountStatus,
        public let activeSessionId: ?Int64,
        public let avatar: ?String,
        public let checkedInToday: ?Bool,
        public let completedFeatureGuides: ?ArrayList<?FeatureGuideType>,
        public let currentSchool: ?UserStatusQuery_CurrentSchool,
        public let enableOtp: ?Bool,
        public let fullName: ?String,
        public let isEducationNetwork: Bool,
        public let isAdmin: ?Bool,
        public let groups: ?ArrayList<?Group>,
        public let isPhoneVerified: Bool,
        public let isPremium: Bool,
        public let isSignedIn: ?Bool,
        public let isStaff: ?Bool,
        public let isSuperuser: ?Bool,
        public let isTranslator: ?Bool,
        public let isVerified: ?Bool,
        public let isWechatVerified: ?Bool,
        public let optedIn: ?Bool,
        public let permissions: ?ArrayList<?Permission>,
        public let premiumCreatedAt: ?Float64,
        public let premiumExpiredAt: ?Float64,
        public let realName: ?String,
        public let region: ?String,
        public let requestRegion: ?String,
        public let socketToken: String,
        public let usAccount: ?UserStatusQuery_UsAccount,
        public let useTranslation: Bool,
        public let userSlug: ?String,
        public let username: ?String
    ){}
}
"#
let gqlSerializeStr2 = #"
public class PersonalInfoCenterQuery_Data <: OperationData {
    public PersonalInfoCenterQuery_Data(
        public let userProfilePublicProfile: ?PersonalInfoCenterQuery_UserProfilePublicProfile,
        public let userProfileUserPendants: ArrayList<?PersonalInfoCenterQuery_UserProfileUserPendant>,
        public let userProfileUserMedals: ArrayList<?PersonalInfoCenterQuery_UserProfileUserMedal>,
        public let userProfileUserLevelMedal: ?PersonalInfoCenterQuery_UserProfileUserLevelMedal,
        public let userContestRanking: ?PersonalInfoCenterQuery_UserContestRanking,
        public let globalRatingRanking: ?Int64,
        public let userContestScore: ?String,
        public let userProfileUserAcceptSubmitCount: PersonalInfoCenterQuery_UserProfileUserAcceptSubmitCount
    ){}
}
"#
let gqlSerializeStr3 = #"
public enum Permission {
    | common_change_tag
    | contest_see_private
    | contest_private_access_dashboard
    | contest_see_private_contest_group
    | discuss_pin_topic
    | discuss_see_hiden_post
    | discuss_review_post
    | discuss_change_post
    | discuss_delete_post
    | discuss_pin_contest_topic
    | discuss_see_contest_hiden_post
    | discuss_review_contest_post
    | discuss_change_contest_post
    | discuss_delete_contest_post
    | discuss_see_circle
    | library_see_all_problems
    | library_see_all_fields
    | library_change_question
    | authentication_ignore_beta_user_flow
    | authentication_see_user_id
    | authentication_see_user_email
    | authentication_update_school_info
    | authentication_send_global_notification
    | authentication_review_flagged_user
    | authentication_mock_user
    | columns_see_columns
    | columns_add_article
    | columns_change_article
    | columns_delete_article
    | columns_review_article
    | columns_pick_article
    | pipeline_run_sync_problems
    | pipeline_run_award_score
    | pipeline_run_clone_lib_questions
    | pipeline_run_json_to_question
    | pipeline_run_delete_questions
    | pipeline_run_rejudge_submissions
    | pipeline_run_recalculate_scoreboard
    | problemset_see_contest_questions
    | problemset_see_app_code_editor
    | problemset_use_test_judger
    | wiki_review_wikicontrib
    | wiki_view_wikicontrib
    | wiki_delete_wikicontrib
    | wiki_change_wikicontrib
    | wiki_add_wikicontrib
    | wiki_view_wikientry
    | wiki_delete_wikientry
    | wiki_change_wikientry
    | wiki_add_wikientry
    | ugc_library_review_question
    | ugc_library_view_ugcquestionv2
    | ugc_library_delete_ugcquestionv2
    | ugc_library_change_ugcquestionv2
    | ugc_library_add_ugcquestionv2
    | ugc_library_review_organization
    | leetbook_change_leetbook
    | leetbook_change_page
    | leetbook_change_author
    | leetbook_change_leetbook_product
    | leetbook_delete_leetbook
    | leetbook_get_book_for_preview
    | UNKNOWN(String)
}
"#
let gqlSerializeStr4 = #"
public enum NotyVerb {
    | UPVOTE
    | COMMENT
    | REPLY
    | MENTION
    | CONTRIBUTE
    | FOLLOW
    | ANNOUNCE
    | NOTIFY
    | PROMOTE
    | JOBS_INVITE
    | UPDATE
    | CONTEST_SPONSOR
    | JOB_PUBLISH
    | EMEGENCY
    | RECEIVE
    | REWARD
    | UNKNOWN(String)

    public func rawValue(): String {
        match (this) {
            case UPVOTE => "UPVOTE"
            case COMMENT => "COMMENT"
            case REPLY => "REPLY"
            case MENTION => "MENTION"
            case CONTRIBUTE => "CONTRIBUTE"
            case FOLLOW => "FOLLOW"
            case ANNOUNCE => "ANNOUNCE"
            case NOTIFY => "NOTIFY"
            case PROMOTE => "PROMOTE"
            case JOBS_INVITE => "JOBS_INVITE"
            case UPDATE => "UPDATE"
            case CONTEST_SPONSOR => "CONTEST_SPONSOR"
            case JOB_PUBLISH => "JOB_PUBLISH"
            case EMEGENCY => "EMEGENCY"
            case RECEIVE => "RECEIVE"
            case REWARD => "REWARD"
            case UNKNOWN(str) => "UNKNOWN"
        }
    }
}
"#

let builderStr1 = #"
    func header(disscussBean: DisscussDetailBean) {
        Column(16) {
            Flex() {
                Text(disscussBean.title).fontSize(20).fontWeight(FontWeight.Medium).fontColor(CC.label_primary).margin(
                    right: 8)
                if (disscussBean.byLeetcode) {
                    LeetcodeTag()
                }
                Blank().flexGrow(1)
            }

            Row(8) {
                Image(disscussBean.author.userAvatar).size(width: 32, height: 32).borderRadius(16)
                Column(2) {
                    Row(2) {
                        Text(disscussBean.author.realName).fontSize(13).fontColor(CC.label_primary)
                        if (let Some(userPendant) <- viewModel.userPendant.getRealValue()) {
                            Image(userPendant).height(11).width(11)
                        }
                    }
                    Text(
                        "${disscussBean.hitCount.useUnitK()} 阅读 · ${disscussBean.createdAt} · 来自${disscussBean.ipRegion}"
                    ).fontSize(11).fontColor(CC.grey2)
                }.alignItems(HorizontalAlign.Start)

                Blank().layoutWeight(1)
            }

            List(space: 8) {
                ForEach(
                    disscussBean.tags,
                    itemGeneratorFunc: {
                        item: Tag, index: Int => ListItem() {
                            Text(item.displayName()).fontSize(12).fontColor(CC.label_secondary).padding(left: 16,
                                right: 16, top: 4, bottom: 4).backgroundColor(CC.grey6).borderRadius(99)
                        }
                    }
                )
            }.listDirection(Axis.Horizontal).scrollBar(BarState.Off)
        }.alignItems(HorizontalAlign.Start).padding(left: 20, right: 20).onAreaChange {
            _, new: Area => headerHeight = new.height
        }
    }
"#
let builderStr2 = #"
    func TabBuilder(index: Int32, item: HomeTabBean) {
        Row(2) {
            if (item.imgsrc.isEmpty()) {
                Image(item.img).width(24).height(24)
            } else {
                Image(item.imgsrc).width(24).height(24)
            }
            Text(item.simpleTitle).fontColor(
                if (this.currentIndex == index) {
                this.selectedFontColor
            } else {
                this.fontColor
            }).fontSize(15).fontWeight(if (this.currentIndex == index) {
                FontWeight.Bold
            } else {
                FontWeight.Regular
            }).lineHeight(22)
        }.width(84).height(34).borderRadius(13).backgroundColor(
            if (this.currentIndex == index) {
            Color(0x262DB55D)
        } else {
            getResourceColor(LCColor.fill2)
        }).justifyContent(FlexAlign.Center).alignItems(VerticalAlign.Center).margin(left: 12, right: 12)
    }
"#
let builderStr3 = #"
    func tabContent(index: Int) {
        Scroll {
            Column() {
                if (index == 0) {
                    TextArea(text: testCase).layoutWeight(1).onChange({text=>testCase = text})
                } else {
                    if (submission.id == "-1") {
                        Text("请先运行您的代码").align(Alignment.Center)
                    } else {
                        RunResultCard(submission: submission)
                    }
                }
            }.padding(left: 12, right: 12)
        }.scrollBar(BarState.Off)
    }
"#
let builderStr4 = #"
    func settingsMenu() {
        Menu {
            MenuItemGroup(header: "代码编辑器设置", footer: "") {
                MenuItem(startIcon: "", content: "字体设置", endIcon: "", labelInfo: "${fontSize}",
                    builder: {=>bind(fontSizeMenu, this)()})
                MenuItem(startIcon: "", content: "Tab 长度", endIcon: "", labelInfo: "${tabLen}", builder: {=>bind(tabLenMenu, this)()})
            }
        }
    }
"#

let entryStr1 = #"

public class ApolloTestPage <: CustomView {


    private var stateVarDecl_text_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_text_", "please click the above button")


    private mut prop text: String {
        get() {
            return this.stateVarDecl_text_.get()
        }
        set(v) {
            this.stateVarDecl_text_.set(v)
        }
    }


    func tryQuery() {
        spawn { AppLog.info("spawn start")
            let transport = HttpNetworkTransportBuilder("https://cangjie-lang.cn/graphql")

            let apolloClient = ApolloClientBuilder().httpServerUrl("https://cangjie-lang.cn/graphql").build()

            let query = QuestionTagTypeWithTagsQuery()

            let request = apolloClient.query(query)

            request.addHttpHeader("Content-Type", "application/json")
            try {
                let response = request.execute()
                if(let Some(v) <- response.data) {
                    AppLog.info("data is not null")
                    launch { text = v.serialize().toJson().toJsonString() }
                }
                else {
                    AppLog.info("data is null")
                }
                if(let Some(e) <- response.errors) {
                    AppLog.info("errors = ${e}")
                }
                else {
                    AppLog.info("errors is null")
                }
            } catch(e: Exception) {
                e.dump()
            }

            AppLog.info("spawn end") }
    }


    func tryMutation() {
        spawn { AppLog.info("spawn start")
            let transport = HttpNetworkTransportBuilder("https://cangjie-lang.cn/graphql")

            let apolloClient = ApolloClientBuilder().httpServerUrl("https://cangjie-lang.cn/graphql").build()

            let mutation = AccountLoginMutation("18321847217", "a12345678", "6aDJGWCvP3nrhjCkuxKa0EdKWYNcHK57T1mt9Tr4", "CFXzhKhxYuifROGi3kqpehX1PjxI0mQEffddHEqRm0G7N6PRDoIs1KOed4NrqXiOnavbIHRviTJdRco2hzHk7SthMUJmzeL1OrAABKijudI6Ixti1L3JfKOCOZlBEPXU")

            let request = apolloClient.mutation(mutation)

            request.addHttpHeader("Content-Type", "application/json")
            request.addHttpHeader("Device-Info", "ELS-AN00%3B%20HUAWEI%20ELS-AN00%3B%20android-12")
            request.addHttpHeader("uuUserId", "e1f11aa8-588e-367b-a4f1-dff24fd6eb7a")
            request.addHttpHeader("version", "2.13.1")
            request.addHttpHeader("channel-id", "leetcode")
            try {
                let response = request.execute()
                if(let Some(v) <- response.data) {
                    AppLog.info("data is not null")
                    launch { text = v.serialize().toJson().toJsonString() }
                }
                else {
                    AppLog.info("data is null")
                }
                if(let Some(e) <- response.errors) {
                    AppLog.info("errors = ${e}")
                }
                else {
                    AppLog.info("errors is null")
                }
            } catch(e: Exception) {
                AppLog.info("spawn exception: ${e}")
            }

            AppLog.info("spawn end") }
    }



    public func build() {

        this.observeComponentCreation({ elmtId, isInitialRender =>
            Column() { this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Button("QuestionTagTypeWithTagsQuery").onClick { text = "please wait"
                                tryQuery() } })
                        this.observeComponentCreation({ elmtId, isInitialRender => Button("AccountLoginMutation").onClick { text = "please wait"
                                tryMutation() } }) } })
                this.observeComponentCreation({ elmtId, isInitialRender => Scroll { this.observeComponentCreation({ elmtId, isInitialRender => Text(text).borderWidth(1).borderColor(Color.RED).width(100.percent) }) } }) }
        })

        ()

    }


    public init(parent: Option < CustomView >, text!: Option < ObservedProperty < String >>= None, localStorage!: Option < LocalStorage >= None) {
        super(parent, localStorage)


        match(text) {
            case Some(v) => this.stateVarDecl_text_ = ObservedProperty < String >("stateVarDecl_text_", v.get())
            case _ =>()
        }


        this.stateVarDecl_text_.subscribeEx(this)

        SubscriberManager.getInstance().add(this)


        registerSelf()
        parent?.addChildById(id(), this)
    }


    public override func aboutToBeDeleted() {

        this.stateVarDecl_text_.unsubscribeEx(this)

        SubscriberManager.getInstance().delete(this)
        this.aboutToBeDeletedInternal()
    }


    func updateWithValueParams(text!: Option < String >= Option < String >.None): Unit {

        match(text) {
            case Some(v) => this.text = v
            case _ =>()
        }

    }


    public func rerender() {
        this.updateDirtyElements()
    }


    public func purgeVariableDependenciesOnElmtId(rmElmtId: Int64) {

        this.stateVarDecl_text_.purgeDependencyOnElmtId(rmElmtId)

    }


}

"#
let entryStr2 = #"

class SolutionDetailPage <: CustomView {


    private var stateVarDecl_viewModel_: ObservedProperty < SolutionDetailViewModel >= ObservedProperty < SolutionDetailViewModel >("stateVarDecl_viewModel_", SolutionDetailViewModel())


    private mut prop viewModel: SolutionDetailViewModel {
        get() {
            return this.stateVarDecl_viewModel_.get()
        }
        set(v) {
            this.stateVarDecl_viewModel_.set(v)
        }
    }


    private var stateVarDecl_showLargeImage_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showLargeImage_", false)


    private mut prop showLargeImage: Bool {
        get() {
            return this.stateVarDecl_showLargeImage_.get()
        }
        set(v) {
            this.stateVarDecl_showLargeImage_.set(v)
        }
    }


    private var stateVarDecl_largeImageUrl_: ObservedProperty <?String >= ObservedProperty <?String >("stateVarDecl_largeImageUrl_", Option.None)


    private mut prop largeImageUrl:?String {
        get() {
            return this.stateVarDecl_largeImageUrl_.get()
        }
        set(v) {
            this.stateVarDecl_largeImageUrl_.set(v)
        }
    }


    var headerHeight: Float64 = 0.0


    let scroller = Scroller()


    protected override func aboutToAppear(): Unit {
        viewModel.solutionSlug = Router.getParamsObject().get("slug").getOrThrow().asString().getValue()
        viewModel.fetchData()
    }


    func tocIndexCallback(y:?Float64) {
        if(let Some(y) <- y) {
            if(let Some(length) <- px2vp((y + headerHeight + vp2px(20.vp).getOrThrow().value).px)) {
                scroller.scrollTo(xOffset: 0.vp, yOffset: length)
            }
        }
    }


    func imageCallback(url: String) {
        largeImageUrl = url
        showLargeImage = true
    }


    func largeImageView(thisView: CustomView): ViewBuilder {
        func largeImageView__inner__(thisView: CustomView): Unit {
            thisView.observeComponentCreation({ elmtId, isInitialRender => Scroll { thisView.observeComponentCreation({ elmtId, isInitialRender => Column { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(largeImageUrl ?? "").width(100.percent) }) }.width(100.percent) }) }.width(100.percent).height(100.percent).onClick { e => showLargeImage = false
                    largeImageUrl = Option.None } })
        }
        ViewBuilder { largeImageView__inner__(thisView) }
    }



    public func build() {

        this.observeComponentCreation({ elmtId, isInitialRender =>
            Column() { match(NavigationComponent(this, title: ObservedProperty("", ""))) {
                    case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    CustomView.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                    case vb: ViewBuilder => vb.build()
                    case _ => LegalCallCheck.check(NavigationComponent(this, title: ObservedProperty("", "")))
                }
                this.observeComponentCreation({ elmtId, isInitialRender => Scroll(scroller) { this.observeComponentCreation({ elmtId, isInitialRender => Column(20) { this.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(solution) <- viewModel.solution) {
                                            this.ifElseBranchUpdateFunction(0, { => header(this, ObservedProperty("", solution)).build()
                                                this.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(slateValue) <- solution.slateValue) {
                                                            this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Column { match(WebComponent(this, destination: ObservedProperty("", WebDestination.RichEditor(slateValue)))) {
                                                                            case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                            CustomView.create(cv)
                                                                            ViewStackProcessor.StopGetAccessRecording()
                                                                            case vb: ViewBuilder => vb.build()
                                                                            case _ => LegalCallCheck.check(WebComponent(this, destination: ObservedProperty("", WebDestination.RichEditor(slateValue))))
                                                                        } }.padding(left: 20, right: 20) }) })
                                                        }
                                                        else if(let Some(content) <- solution.content) {
                                                            this.ifElseBranchUpdateFunction(1, { => this.observeComponentCreation({ elmtId, isInitialRender => Column { match(MarkdownComponent(this, mdStr: ObservedProperty("", content), markdownConfiguration: ObservedProperty("", markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback)))) {
                                                                            case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                            CustomView.create(cv)
                                                                            ViewStackProcessor.StopGetAccessRecording()
                                                                            case vb: ViewBuilder => vb.build()
                                                                            case _ => LegalCallCheck.check(MarkdownComponent(this, mdStr: ObservedProperty("", content), markdownConfiguration: ObservedProperty("", markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback))))
                                                                        } }.padding(left: 20, right: 20) }) })
                                                        }
                                                        else {
                                                            If.branchId(2)
                                                        }
                                                    } })
                                                this.observeComponentCreation({ elmtId, isInitialRender => Text("© 著作权归作者所有").fontSize(13).fontColor(CC.label_tertiary) })
                                                this.observeComponentCreation({ elmtId, isInitialRender => Blank(min: navigationHeight()) }) })
                                        }
                                        else {
                                            If.branchId(1)
                                        }
                                    } }) } }) }.layoutWeight(1).align(Alignment.Top) }) }.padding(top: statusHetight()).bindContentCover(showLargeImage, bind(largeImageView, this), ContentCoverOptions(modalTransition: ModalTransition.NONE, backgroundColor: getResourceColor(CC.fix_black), onDisappear: { => showLargeImage = false }))
        })

        ()

    }

    func header(thisView: CustomView, solution: ObservedProperty < Solution >): ViewBuilder {
        func header__inner__(thisView: CustomView, solution: Solution): Unit {
            thisView.observeComponentCreation({ elmtId, isInitialRender => Column(16) { thisView.observeComponentCreation({ elmtId, isInitialRender => Flex() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(solution.title).fontSize(20).fontWeight(FontWeight.Medium).fontColor(CC.label_primary).margin(right: 8) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(solution.byLeetcode) {
                                        thisView.ifElseBranchUpdateFunction(0, { => match(LeetcodeTag(thisView)) {
                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                CustomView.create(cv)
                                                ViewStackProcessor.StopGetAccessRecording()
                                                case vb: ViewBuilder => vb.build()
                                                case _ => LegalCallCheck.check(LeetcodeTag(thisView))
                                            } })
                                    }
                                    else {
                                        If.branchId(1)
                                    }
                                } })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Blank().flexGrow(1) }) } })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => Row(8) { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(solution.author.userAvatar).size(width: 32, height: 32).borderRadius(16) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Column(2) { thisView.observeComponentCreation({ elmtId, isInitialRender => Row(2) { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(solution.author.realName).fontSize(13).fontColor(CC.label_primary) })
                                            thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(userPendant) <- viewModel.userPendant.getRealValue()) {
                                                        thisView.ifElseBranchUpdateFunction(0, { => thisView.observeComponentCreation({ elmtId, isInitialRender => Image(userPendant).height(11).width(11) }) })
                                                    }
                                                    else {
                                                        If.branchId(1)
                                                    }
                                                } }) } })
                                    thisView.observeComponentCreation({ elmtId, isInitialRender => Row(4) { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(TimeUtils.timeSinceDate(solution.createdAt)).fontSize(11).fontColor(CC.grey2) })
                                            thisView.observeComponentCreation({ elmtId, isInitialRender => Text("来自" + solution.ipRegion).fontSize(11).fontColor(CC.grey2) }) } }) }.alignItems(HorizontalAlign.Start) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Blank().layoutWeight(1) }) } })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => List(space: 8) { thisView.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: Tag, index: Int => thisView.observeComponentCreation({ elmtId, isInitialRender => ListItem() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(item.displayName()).fontSize(12).fontColor(CC.label_secondary).padding(left: 16, right: 16, top: 4, bottom: 4).backgroundColor(CC.grey6).borderRadius(99) }) } }) }

                                    thisView.forEachUpdateFunction(elmtId, solution.tags, itemGenFunc: forEachItemGenFunction) } }) }.listDirection(Axis.Horizontal).scrollBar(BarState.Off) }) }.alignItems(HorizontalAlign.Start).padding(left: 20, right: 20).onAreaChange { _, new: Area => headerHeight = new.height } })
        }
        ViewBuilder { header__inner__(thisView, solution.get()) }
    }



    public init(parent: Option < CustomView >, viewModel!: Option < ObservedProperty < SolutionDetailViewModel >>= None, showLargeImage!: Option < ObservedProperty < Bool >>= None, largeImageUrl!: Option < ObservedProperty <?String >>= None, headerHeight!: Option < ObservedProperty < Float64 >> = None, localStorage!: Option < LocalStorage >= None) {
        super(parent, localStorage)


        match(viewModel) {
            case Some(v) => this.stateVarDecl_viewModel_ = ObservedProperty < SolutionDetailViewModel >("stateVarDecl_viewModel_", v.get())
            case _ =>()
        }

        match(showLargeImage) {
            case Some(v) => this.stateVarDecl_showLargeImage_ = ObservedProperty < Bool >("stateVarDecl_showLargeImage_", v.get())
            case _ =>()
        }

        match(largeImageUrl) {
            case Some(v) => this.stateVarDecl_largeImageUrl_ = ObservedProperty <?String >("stateVarDecl_largeImageUrl_", v.get())
            case _ =>()
        }

        match(headerHeight) {
            case Some(v) => this.headerHeight = v.get()
            case _ =>()
        }


        this.stateVarDecl_viewModel_.subscribeEx(this)

        this.stateVarDecl_showLargeImage_.subscribeEx(this)

        this.stateVarDecl_largeImageUrl_.subscribeEx(this)

        SubscriberManager.getInstance().add(this)


        registerSelf()
        parent?.addChildById(id(), this)
    }


    public override func aboutToBeDeleted() {

        this.stateVarDecl_viewModel_.unsubscribeEx(this)

        this.stateVarDecl_showLargeImage_.unsubscribeEx(this)

        this.stateVarDecl_largeImageUrl_.unsubscribeEx(this)

        SubscriberManager.getInstance().delete(this)
        this.aboutToBeDeletedInternal()
    }


    func updateWithValueParams(viewModel!: Option < SolutionDetailViewModel >= Option < SolutionDetailViewModel >.None, showLargeImage!: Option < Bool >= Option < Bool >.None, largeImageUrl!: Option <?String >= Option <?String >.None, headerHeight!: Option < Float64 >= Option < Float64 >.None): Unit {

        match(viewModel) {
            case Some(v) => this.viewModel = v
            case _ =>()
        }

        match(showLargeImage) {
            case Some(v) => this.showLargeImage = v
            case _ =>()
        }

        match(largeImageUrl) {
            case Some(v) => this.largeImageUrl = v
            case _ =>()
        }

    }


    public func rerender() {
        this.updateDirtyElements()
    }


    public func purgeVariableDependenciesOnElmtId(rmElmtId: Int64) {

        this.stateVarDecl_viewModel_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_showLargeImage_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_largeImageUrl_.purgeDependencyOnElmtId(rmElmtId)

    }


}

"#
let entryStr3 = #"

public class MainPage <: CustomView {


    private var stateVarDecl_currentTabIndex_: ObservedProperty < Int32 >= ObservedProperty < Int32 >("stateVarDecl_currentTabIndex_", 0)


    private mut prop currentTabIndex: Int32 {
        get() {
            return this.stateVarDecl_currentTabIndex_.get()
        }
        set(v) {
            this.stateVarDecl_currentTabIndex_.set(v)
        }
    }


    private let stateVarDecl_isLogin_: ObservedProperty < Bool >= AppStorage.setAndProp < Bool >("isLogin", false)


    private prop isLogin: Bool {
        get() {
            return this.stateVarDecl_isLogin_.get()
        }
    }


    func onChanged() {
        if(! isLogin) {
            controller.changeIndex(0)
        }
    }


    var controller: TabsController = TabsController()


    protected override func onPageShow(): Unit {
    }



    public func build() {

        this.observeComponentCreation({ elmtId, isInitialRender =>
            Column() { this.observeComponentCreation({ elmtId, isInitialRender => Tabs(BarPosition.End, this.controller, this.currentTabIndex) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: TabItemData, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => TabContent() { this.observeComponentCreation({ elmtId, isInitialRender => If { if(index == 0) {
                                                        this.ifElseBranchUpdateFunction(0, { => match(HomePage(this)) {
                                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                CustomView.create(cv)
                                                                ViewStackProcessor.StopGetAccessRecording()
                                                                case vb: ViewBuilder => vb.build()
                                                                case _ => LegalCallCheck.check(HomePage(this))
                                                            } })
                                                    }
                                                    else if(index == 1) {
                                                        this.ifElseBranchUpdateFunction(1, { => match(QuestionMainPage(this)) {
                                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                CustomView.create(cv)
                                                                ViewStackProcessor.StopGetAccessRecording()
                                                                case vb: ViewBuilder => vb.build()
                                                                case _ => LegalCallCheck.check(QuestionMainPage(this))
                                                            } })
                                                    }
                                                    else if(index == 2) {
                                                        this.ifElseBranchUpdateFunction(2, { => match(NotificationPage(this)) {
                                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                CustomView.create(cv)
                                                                ViewStackProcessor.StopGetAccessRecording()
                                                                case vb: ViewBuilder => vb.build()
                                                                case _ => LegalCallCheck.check(NotificationPage(this))
                                                            } })
                                                    }
                                                    else {
                                                        this.ifElseBranchUpdateFunction(3, { => match(PersonalPage(this)) {
                                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                CustomView.create(cv)
                                                                ViewStackProcessor.StopGetAccessRecording()
                                                                case vb: ViewBuilder => vb.build()
                                                                case _ => LegalCallCheck.check(PersonalPage(this))
                                                            } })
                                                    }
                                                } }) }.tabBar() { bind(buildTabs, this)(item, Int32(index)) } }) }

                                this.forEachUpdateFunction(elmtId, this.getTabData(), itemGenFunc: forEachItemGenFunction) } }) }.scrollable(false).barMode(BarMode.Fixed).animationDuration(0).barWidth(100.percent).barHeight(CJResource(app.float.bar_height, 10002, "")).layoutWeight(1).onChange({ index: Int32 => currentTabIndex = index }) }) }.backgroundColor(CJResource(app.color.paper, 10001, "")).padding(bottom: navigationHeight())
        })

        ()

    }

    func buildTabs(thisView: CustomView, item: ObservedProperty < TabItemData >, index: ObservedProperty < Int32 >): ViewBuilder {
        func buildTabs__inner__(thisView: CustomView, item: TabItemData, index: Int32): Unit {
            thisView.observeComponentCreation({ elmtId, isInitialRender => Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(if(this.currentTabIndex == index) {
                            item.imageActivated
                        }
                        else {
                            item.imageOriginal
                        }
                        ).width(CJResource(app.float.image_star_width, 10002, "")).height(CJResource(app.float.image_star_height, 10002, "")) })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => Text(item.title).offset(x: 0, y: - 4).fontSize(CJResource(app.float.tab_text_size, 10002, "")).fontColor(if(this.currentTabIndex == index) {
                            CJResource(app.color.primary_button, 10001, "")
                        }
                        else {
                            CJResource(app.color.label_secondary, 10001, "")
                        }
                        ) }) }.backgroundColor(CJResource(app.color.paper, 10001, "")).justifyContent(FlexAlign.Center).width(100.percent).height(CJResource(app.float.tab_bar_height, 10002, "")).onClick() { e => if((index == 2 || index == 3) && ! getAccoutService().isLogin()) {
                        Router.push(url: "LoginPage")
                    }
                    else {
                        controller.changeIndex(index)
                    }
                } })
        }
        ViewBuilder { buildTabs__inner__(thisView, item.get(), index.get()) }
    }


    func buildTitle(thisView: CustomView): ViewBuilder {
        func buildTitle__inner__(thisView: CustomView): Unit {
            thisView.observeComponentCreation({ elmtId, isInitialRender => Row() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(CJResource(app.string.page_title, 10003, "")).fontColor(CJResource(app.color.title, 10001, "")).fontSize(CJResource(app.float.title_size, 10002, "")) }) }.width(100.percent).height(CJResource(app.float.title_height, 10002, "")).margin(top: 56, left: 24) })
        }
        ViewBuilder { buildTitle__inner__(thisView) }
    }


    func getTabData(): Array < TabItemData > {
        let tabItems: Array < TabItemData >=[TabItemData(title: CJResource(app.string.tab_today, 10003, ""), imageOriginal: CJResource(app.media.ic_today, 20000, ""), imageActivated: CJResource(app.media.ic_today_selected, 20000, "")), TabItemData(title: CJResource(app.string.tab_questions, 10003, ""), imageOriginal: CJResource(app.media.icon_lib_normal, 20000, ""), imageActivated: CJResource(app.media.icon_lib_selected, 20000, "")), TabItemData(title: CJResource(app.string.tab_notification, 10003, ""), imageOriginal: CJResource(app.media.icon_notification, 20000, ""), imageActivated: CJResource(app.media.ic_notification_selected, 20000, "")), TabItemData(title: CJResource(app.string.tab_profile, 10003, ""), imageOriginal: CJResource(app.media.icon_user, 20000, ""), imageActivated: CJResource(app.media.ic_profile_selected, 20000, ""))]
        return tabItems
    }



    public init(parent: Option < CustomView >, currentTabIndex!: Option < ObservedProperty < Int32 >>= None, controller!: Option < ObservedProperty < TabsController >> = None, localStorage!: Option < LocalStorage >= None) {
        super(parent, localStorage)


        match(currentTabIndex) {
            case Some(v) => this.stateVarDecl_currentTabIndex_ = ObservedProperty < Int32 >("stateVarDecl_currentTabIndex_", v.get())
            case _ =>()
        }

        match(controller) {
            case Some(v) => this.controller = v.get()
            case _ =>()
        }


        this.stateVarDecl_currentTabIndex_.subscribeEx(this)

        this.stateVarDecl_isLogin_.subscribeEx(this)

        SubscriberManager.getInstance().add(this)


        this.declareWatch < Bool >(stateVarDecl_isLogin_, onChanged)

        registerSelf()
        parent?.addChildById(id(), this)
    }


    public override func aboutToBeDeleted() {

        this.stateVarDecl_currentTabIndex_.unsubscribeEx(this)

        this.stateVarDecl_isLogin_.unsubscribeEx(this)

        SubscriberManager.getInstance().delete(this)
        this.aboutToBeDeletedInternal()
    }


    func updateWithValueParams(currentTabIndex!: Option < Int32 >= Option < Int32 >.None, controller!: Option < TabsController >= Option < TabsController >.None): Unit {

        match(currentTabIndex) {
            case Some(v) => this.currentTabIndex = v
            case _ =>()
        }

    }


    public func rerender() {
        this.updateDirtyElements()
    }


    public func purgeVariableDependenciesOnElmtId(rmElmtId: Int64) {

        this.stateVarDecl_currentTabIndex_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_isLogin_.purgeDependencyOnElmtId(rmElmtId)

    }


}

"#
let entryStr4 = #"

public class CodeEditorPage <: CustomView {


    var questionDetail:?QuestionDetail = Option.None


    var codeSnippets: Array < CodeSnippet >=[]


    var language: LANGUAGETYPE = LANGUAGETYPE.C


    private var stateVarDecl_fontSize_: ObservedProperty < Int >= ObservedProperty < Int >("stateVarDecl_fontSize_", 13)


    private mut prop fontSize: Int {
        get() {
            return this.stateVarDecl_fontSize_.get()
        }
        set(v) {
            this.stateVarDecl_fontSize_.set(v)
        }
    }


    private var stateVarDecl_tabLen_: ObservedProperty < Int >= ObservedProperty < Int >("stateVarDecl_tabLen_", 4)


    private mut prop tabLen: Int {
        get() {
            return this.stateVarDecl_tabLen_.get()
        }
        set(v) {
            this.stateVarDecl_tabLen_.set(v)
        }
    }


    var langSlug: String = "cpp"


    private var stateVarDecl_lang_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_lang_", "")


    private mut prop lang: String {
        get() {
            return this.stateVarDecl_lang_.get()
        }
        set(v) {
            this.stateVarDecl_lang_.set(v)
        }
    }


    private var stateVarDecl_editorHeight_: ObservedProperty < Float64 >= ObservedProperty < Float64 >("stateVarDecl_editorHeight_", 300.0)


    private mut prop editorHeight: Float64 {
        get() {
            return this.stateVarDecl_editorHeight_.get()
        }
        set(v) {
            this.stateVarDecl_editorHeight_.set(v)
        }
    }


    private var stateVarDecl_editorWidth_: ObservedProperty < Float64 >= ObservedProperty < Float64 >("stateVarDecl_editorWidth_", 380.0)


    private mut prop editorWidth: Float64 {
        get() {
            return this.stateVarDecl_editorWidth_.get()
        }
        set(v) {
            this.stateVarDecl_editorWidth_.set(v)
        }
    }


    var viewModel: EditorCodeViewModel = EditorCodeViewModel()


    private var stateVarDecl_codePendingBean_: ObservedProperty < CodePendingBean >= ObservedProperty < CodePendingBean >("stateVarDecl_codePendingBean_", CodePendingBean())


    private mut prop codePendingBean: CodePendingBean {
        get() {
            return this.stateVarDecl_codePendingBean_.get()
        }
        set(v) {
            this.stateVarDecl_codePendingBean_.set(v)
        }
    }


    private var stateVarDecl_submission_: ObservedProperty < SubmissionDetail >= ObservedProperty < SubmissionDetail >("stateVarDecl_submission_", SubmissionDetail.noneFake())


    private mut prop submission: SubmissionDetail {
        get() {
            return this.stateVarDecl_submission_.get()
        }
        set(v) {
            this.stateVarDecl_submission_.set(v)
        }
    }


    private var stateVarDecl_testCase_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_testCase_", "")


    private mut prop testCase: String {
        get() {
            return this.stateVarDecl_testCase_.get()
        }
        set(v) {
            this.stateVarDecl_testCase_.set(v)
        }
    }


    private var stateVarDecl_consoleTab_: ObservedProperty < Int32 >= ObservedProperty < Int32 >("stateVarDecl_consoleTab_", 0)


    private mut prop consoleTab: Int32 {
        get() {
            return this.stateVarDecl_consoleTab_.get()
        }
        set(v) {
            this.stateVarDecl_consoleTab_.set(v)
        }
    }


    private var stateVarDecl_isRunning_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isRunning_", true)


    private mut prop isRunning: Bool {
        get() {
            return this.stateVarDecl_isRunning_.get()
        }
        set(v) {
            this.stateVarDecl_isRunning_.set(v)
        }
    }


    private var stateVarDecl_isPremium_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isPremium_", getAccoutService().isPremium())


    private mut prop isPremium: Bool {
        get() {
            return this.stateVarDecl_isPremium_.get()
        }
        set(v) {
            this.stateVarDecl_isPremium_.set(v)
        }
    }


    private var stateVarDecl_showTestCase_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showTestCase_", false)


    private mut prop showTestCase: Bool {
        get() {
            return this.stateVarDecl_showTestCase_.get()
        }
        set(v) {
            this.stateVarDecl_showTestCase_.set(v)
        }
    }


    private var stateVarDecl_showKeyboardBar_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showKeyboardBar_", false)


    private mut prop showKeyboardBar: Bool {
        get() {
            return this.stateVarDecl_showKeyboardBar_.get()
        }
        set(v) {
            this.stateVarDecl_showKeyboardBar_.set(v)
        }
    }


    func fontSizeChange() {
        viewModel.saveFontSize(fontSize)
    }


    func tabLengthChange() {
        viewModel.saveTabLength(tabLen)
    }


    var editorKitController: EditorKitController = EditorKitController(width: 400.0, height: 600.0, theme: if(isDarkMode()) {
        MONOKAI
    }
    else {
        MONOKAI_LIGHT
    }
    , fontSize: 13, tabLen: 4)


    var runningDialog: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(maskColor: Color(0, 0, 0, alpha: 0.8), autoCancel: false, alignment: DialogAlignment.Center, customStyle: true))


    var consoleDialog: CustomDialogController = CustomDialogController(CustomDialogControllerOptions(maskColor: Color(0, 0, 0, alpha: 0.8), autoCancel: false, customStyle: true, closeAnimation: AnimateParam(duration: 0), alignment: DialogAlignment.Bottom))


    protected override func aboutToAppear(): Unit {
        try {
            let questionJson = Router.getParamsObject().get("question").getOrThrow().asString().getValue()
            let questionDetail = QuestionDetail.fromJson(questionJson)
            this.questionDetail = questionDetail
            codeSnippets = questionDetail.codeSnippets
            testCase = questionDetail.sampleTestCase ?? ""
            showTestCase = ! questionDetail.exampleTestCases.isNoneOrEmpty()
            observeKeyboard()
            editorKitController.setTheme(if(isDarkMode()) {
                MONOKAI
            }
            else {
                MONOKAI_LIGHT
            }
            )
            tabLen = viewModel.getTabLength()
            fontSize = viewModel.getFontSize()
            editorKitController.setFontSize(fontSize)
            editorKitController.setTabLen(tabLen)
            let lastLangSlug = viewModel.getLastLangSlug()
            if(! lastLangSlug.isEmpty()) {
                if(let Some(codeSnippet) <- (codeSnippets |> filter { c => c.langSlug == lastLangSlug } |> first)) {
                    return setCodeSnippet(codeSnippet)
                }
            }
            if(let Some(codeSnippet) <- codeSnippets.get(0)) {
                setCodeSnippet(codeSnippet)
            }
        } catch(e: Exception) {
            AppLog.info("~~~ codeEditor onAppear error: ${e.message}")
        }
    }


    protected override func aboutToDisappear(): Unit {
        saveCode()
        let currentWindow = getLastWindow(getStageContext(getGlobalAbilityContext()))
        currentWindow.off("keyboardHeightChange")
    }


    private func setCodeSnippet(codeSnippet: CodeSnippet) {
        language = LANGUAGETYPE.fromString(codeSnippet.langSlug ?? "")
        langSlug = codeSnippet.langSlug ?? ""
        lang = codeSnippet.lang ?? ""
        var code = codeSnippet.code ?? ""
        if(let Some(cache) <- CodeDbService.getLocalCode(questionDetail?.titleSlug ?? "", langSlug)) {
            code = cache
        }
        editorKitController.setLanguageAndText(language, code)
    }


    private func saveCode() {
        let text = editorKitController.getText()
        CodeDbService.saveCode(questionDetail?.titleSlug ?? "", langSlug, text)
    }


    func observeKeyboard() {
        let defaultDisplay = getDefaultDisplaySync()
        let scaledDensity = Float64(defaultDisplay.scaledDensity)
        let currentWindow = getLastWindow(getStageContext(getGlobalAbilityContext()))
        let property = currentWindow.getWindowProperties()
        let avoidArea = currentWindow.getWindowAvoidArea(AvoidAreaType.TYPE_KEYBOARD)
        let windowHeight = property.windowRect.height
        let keyboardHeight = avoidArea.bottomRect.height
        changeEditorKitHeight(windowHeight, keyboardHeight)
        editorWidth = Float64(property.windowRect.width) / scaledDensity
        editorKitController.setWidth(editorWidth)
        let callback = KeyboardHeightChangeCallback(this, windowHeight)
        currentWindow.on("keyboardHeightChange", callback)
    }


    func changeEditorKitHeight(windowHeight: UInt32, keyboardHeight: UInt32) {
        let defaultDisplay = getDefaultDisplaySync()
        let scaledDensity = Float64(defaultDisplay.scaledDensity)
        let rect: DisplayRect = defaultDisplay.getCutoutInfo().boundingRects.get(0).getOrDefault { DisplayRect(0, 0, 0, 0) }
        let statusBarHeight = Float64(rect.height) / scaledDensity
        var contentHeight = Float64(windowHeight - keyboardHeight) / scaledDensity
        let navHeight = 44.0
        showKeyboardBar = keyboardHeight > 0
        let barHeight = 64.0 + if(showKeyboardBar) {
            52.0
        }
        else {
            0.0
        }

        let bottomPadding = 12.0
        let safeAreaBottom = if(showKeyboardBar) {
            0.0
        }
        else {
            navigationHeight()
        }

        editorHeight = contentHeight - navHeight - barHeight - bottomPadding - statusBarHeight - safeAreaBottom
        editorKitController.setHeight(editorHeight)
        AppLog.info("~~~ keyboard: ${keyboardHeight}, windowHeight: ${windowHeight}, editorHeight: ${editorHeight}")
    }



    public func build() {

        this.observeComponentCreation({ elmtId, isInitialRender =>
            Column() { match(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
                    setCodeSnippet(codeSnippet)
                    viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController))) {
                    case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    CustomView.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                    case vb: ViewBuilder => vb.build()
                    case _ => LegalCallCheck.check(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
                        setCodeSnippet(codeSnippet)
                        viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController)))
                }
                match(EditorKit(this, editorKitController: ObservedProperty("", editorKitController))) {
                    case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    CustomView.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                    case vb: ViewBuilder => vb.build()
                    case _ => LegalCallCheck.check(EditorKit(this, editorKitController: ObservedProperty("", editorKitController)))
                }
                match(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true))) {
                    case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    CustomView.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                    case vb: ViewBuilder => vb.build()
                    case _ => LegalCallCheck.check(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true)))
                }
                this.observeComponentCreation({ elmtId, isInitialRender => If { if(showKeyboardBar) {
                            this.ifElseBranchUpdateFunction(0, { => match(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) }))) {
                                    case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                    CustomView.create(cv)
                                    ViewStackProcessor.StopGetAccessRecording()
                                    case vb: ViewBuilder => vb.build()
                                    case _ => LegalCallCheck.check(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) })))
                                } })
                        }
                        else {
                            If.branchId(1)
                        }
                    } }) }.expandSafeArea(types:[SafeAreaType.KEYBOARD]).padding(top: statusHetight())
        })

        ()

    }

    func openConsole() {
        consoleDialog.close()
        consoleDialog.open()
    }


    func submitAction(): Unit {
        consoleDialog.close()
        if(let Some(qd) <- questionDetail) {
            runningDialog.open()
            let text = editorKitController.getText()
            saveCode()
            viewModel.submitCode(qd.titleSlug, qd.questionId, "", text, langSlug, codePendingBean) { b: CodeBean => EmitterUtils.emit(event: EmitterEvent.SubmissionRefresh)
                runningDialog.close()
                if(! b.result.isNone() && ! b.state.isNone()) {
                    let submission = SubmissionDetail(data: b, question: qd, testCases: Option.None, code: text)
                    Router.push(url: "SubmitResultPage", params: JsonObject(HashMap < String, JsonValue >([("submissionId", JsonString(submission.id))])))
                }
            }
        }
    }


    func runAction(): Unit {
        saveCode()
        if(let Some(qd) <- questionDetail) {
            let input = testCase
            runningDialog.open()
            let text = editorKitController.getText()
            viewModel.interpretCode(qd.titleSlug, qd.questionId, input, text, langSlug, codePendingBean) { b: CodeBean => runningDialog.close()
                if(! b.result.isNone() && ! b.state.isNone()) {
                    submission = SubmissionDetail(data: b, question: qd, testCases: input, code: text)
                    consoleTab = 1
                    isRunning = true
                    openConsole()
                }
            }
        }
    }


    func revert() {
        let buttons =[ButtonInfo("还原到模板", getResourceColor(CC.colorPrimary)), ButtonInfo("考虑一下", getResourceColor(CC.label_secondary))]
        PromptAction.showDialog(title: "还原到默认的代码模板？", message: "您将放弃所有更改并初始化代码！\n确定要还原吗？", buttons: buttons, callback: { err, i => if(i == 0) {
                if(let Some(first) <- (codeSnippets |> filter { c => c.lang == lang } |> first)) {
                    editorKitController.setText(first.code ?? "")
                    CodeDbService.delete(questionDetail?.titleSlug ?? "", langSlug)
                }
            }
        })
    }


    func testcaseClick() {
        let buttons =[ButtonInfo("确认", getResourceColor(CC.colorPrimary)), ButtonInfo("取消", getResourceColor(CC.label_secondary))]
        PromptAction.showDialog(title: "是否填入示例", message: "填入后会覆盖测试用例", buttons: buttons, callback: { err, i => if(i == 0) {
                if(let Some(exampleTestCases) <- questionDetail?.exampleTestCases) {
                    testCase = ""
                    testCase = exampleTestCases ?? ""
                }
            }
        })
    }



    public init(parent: Option < CustomView >, questionDetail!: Option < ObservedProperty <?QuestionDetail >> = None, codeSnippets!: Option < ObservedProperty < Array < CodeSnippet > >> = None, language!: Option < ObservedProperty < LANGUAGETYPE >> = None, fontSize!: Option < ObservedProperty < Int >>= None, tabLen!: Option < ObservedProperty < Int >>= None, langSlug!: Option < ObservedProperty < String >> = None, lang!: Option < ObservedProperty < String >>= None, editorHeight!: Option < ObservedProperty < Float64 >>= None, editorWidth!: Option < ObservedProperty < Float64 >>= None, viewModel!: Option < ObservedProperty < EditorCodeViewModel >> = None, codePendingBean!: Option < ObservedProperty < CodePendingBean >>= None, submission!: Option < ObservedProperty < SubmissionDetail >>= None, testCase!: Option < ObservedProperty < String >>= None, consoleTab!: Option < ObservedProperty < Int32 >>= None, isRunning!: Option < ObservedProperty < Bool >>= None, isPremium!: Option < ObservedProperty < Bool >>= None, showTestCase!: Option < ObservedProperty < Bool >>= None, showKeyboardBar!: Option < ObservedProperty < Bool >>= None, editorKitController!: Option < ObservedProperty < EditorKitController >> = None, runningDialog!: Option < ObservedProperty < CustomDialogController >> = None, consoleDialog!: Option < ObservedProperty < CustomDialogController >> = None, localStorage!: Option < LocalStorage >= None) {
        super(parent, localStorage)


        match(questionDetail) {
            case Some(v) => this.questionDetail = v.get()
            case _ =>()
        }

        match(codeSnippets) {
            case Some(v) => this.codeSnippets = v.get()
            case _ =>()
        }

        match(language) {
            case Some(v) => this.language = v.get()
            case _ =>()
        }

        match(fontSize) {
            case Some(v) => this.stateVarDecl_fontSize_ = ObservedProperty < Int >("stateVarDecl_fontSize_", v.get())
            case _ =>()
        }

        match(tabLen) {
            case Some(v) => this.stateVarDecl_tabLen_ = ObservedProperty < Int >("stateVarDecl_tabLen_", v.get())
            case _ =>()
        }

        match(langSlug) {
            case Some(v) => this.langSlug = v.get()
            case _ =>()
        }

        match(lang) {
            case Some(v) => this.stateVarDecl_lang_ = ObservedProperty < String >("stateVarDecl_lang_", v.get())
            case _ =>()
        }

        match(editorHeight) {
            case Some(v) => this.stateVarDecl_editorHeight_ = ObservedProperty < Float64 >("stateVarDecl_editorHeight_", v.get())
            case _ =>()
        }

        match(editorWidth) {
            case Some(v) => this.stateVarDecl_editorWidth_ = ObservedProperty < Float64 >("stateVarDecl_editorWidth_", v.get())
            case _ =>()
        }

        match(viewModel) {
            case Some(v) => this.viewModel = v.get()
            case _ =>()
        }

        match(codePendingBean) {
            case Some(v) => this.stateVarDecl_codePendingBean_ = ObservedProperty < CodePendingBean >("stateVarDecl_codePendingBean_", v.get())
            case _ =>()
        }

        match(submission) {
            case Some(v) => this.stateVarDecl_submission_ = ObservedProperty < SubmissionDetail >("stateVarDecl_submission_", v.get())
            case _ =>()
        }

        match(testCase) {
            case Some(v) => this.stateVarDecl_testCase_ = ObservedProperty < String >("stateVarDecl_testCase_", v.get())
            case _ =>()
        }

        match(consoleTab) {
            case Some(v) => this.stateVarDecl_consoleTab_ = ObservedProperty < Int32 >("stateVarDecl_consoleTab_", v.get())
            case _ =>()
        }

        match(isRunning) {
            case Some(v) => this.stateVarDecl_isRunning_ = ObservedProperty < Bool >("stateVarDecl_isRunning_", v.get())
            case _ =>()
        }

        match(isPremium) {
            case Some(v) => this.stateVarDecl_isPremium_ = ObservedProperty < Bool >("stateVarDecl_isPremium_", v.get())
            case _ =>()
        }

        match(showTestCase) {
            case Some(v) => this.stateVarDecl_showTestCase_ = ObservedProperty < Bool >("stateVarDecl_showTestCase_", v.get())
            case _ =>()
        }

        match(showKeyboardBar) {
            case Some(v) => this.stateVarDecl_showKeyboardBar_ = ObservedProperty < Bool >("stateVarDecl_showKeyboardBar_", v.get())
            case _ =>()
        }

        match(editorKitController) {
            case Some(v) => this.editorKitController = v.get()
            case _ =>()
        }

        match(runningDialog) {
            case Some(v) => this.runningDialog = v.get()
            case _ =>()
        }

        match(consoleDialog) {
            case Some(v) => this.consoleDialog = v.get()
            case _ =>()
        }


        this.stateVarDecl_fontSize_.subscribeEx(this)

        this.stateVarDecl_tabLen_.subscribeEx(this)

        this.stateVarDecl_lang_.subscribeEx(this)

        this.stateVarDecl_editorHeight_.subscribeEx(this)

        this.stateVarDecl_editorWidth_.subscribeEx(this)

        this.stateVarDecl_codePendingBean_.subscribeEx(this)

        this.stateVarDecl_submission_.subscribeEx(this)

        this.stateVarDecl_testCase_.subscribeEx(this)

        this.stateVarDecl_consoleTab_.subscribeEx(this)

        this.stateVarDecl_isRunning_.subscribeEx(this)

        this.stateVarDecl_isPremium_.subscribeEx(this)

        this.stateVarDecl_showTestCase_.subscribeEx(this)

        this.stateVarDecl_showKeyboardBar_.subscribeEx(this)

        SubscriberManager.getInstance().add(this)

        this.runningDialog.bindView(this)
        this.runningDialog.setBuilder({ =>
            let cjDialog = RunningAnimationView(this, isPremium: stateVarDecl_isPremium_, isRunning: stateVarDecl_isRunning_)
            CustomView.create(cjDialog)
            cjDialog.setController(this.runningDialog)
        })

        this.consoleDialog.bindView(this)
        this.consoleDialog.setBuilder({ =>
            let cjDialog = ConsoleDialog(this, submission: stateVarDecl_submission_, testCase: stateVarDecl_testCase_, defaultTabIndex: stateVarDecl_consoleTab_, currentIndex: stateVarDecl_consoleTab_, testcaseClick: ObservedProperty("", testcaseClick), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showTestCase: stateVarDecl_showTestCase_)
            CustomView.create(cjDialog)
            cjDialog.setController(this.consoleDialog)
        })


        this.declareWatch < Int >(stateVarDecl_fontSize_, fontSizeChange)

        this.declareWatch < Int >(stateVarDecl_tabLen_, tabLengthChange)

        registerSelf()
        parent?.addChildById(id(), this)
    }


    public override func aboutToBeDeleted() {

        this.stateVarDecl_fontSize_.unsubscribeEx(this)

        this.stateVarDecl_tabLen_.unsubscribeEx(this)

        this.stateVarDecl_lang_.unsubscribeEx(this)

        this.stateVarDecl_editorHeight_.unsubscribeEx(this)

        this.stateVarDecl_editorWidth_.unsubscribeEx(this)

        this.stateVarDecl_codePendingBean_.unsubscribeEx(this)

        this.stateVarDecl_submission_.unsubscribeEx(this)

        this.stateVarDecl_testCase_.unsubscribeEx(this)

        this.stateVarDecl_consoleTab_.unsubscribeEx(this)

        this.stateVarDecl_isRunning_.unsubscribeEx(this)

        this.stateVarDecl_isPremium_.unsubscribeEx(this)

        this.stateVarDecl_showTestCase_.unsubscribeEx(this)

        this.stateVarDecl_showKeyboardBar_.unsubscribeEx(this)

        SubscriberManager.getInstance().delete(this)
        this.aboutToBeDeletedInternal()
    }


    func updateWithValueParams(questionDetail!: Option <?QuestionDetail >= Option <?QuestionDetail >.None, codeSnippets!: Option < Array < CodeSnippet >>= Option < Array < CodeSnippet >>.None, language!: Option < LANGUAGETYPE >= Option < LANGUAGETYPE >.None, fontSize!: Option < Int >= Option < Int >.None, tabLen!: Option < Int >= Option < Int >.None, langSlug!: Option < String >= Option < String >.None, lang!: Option < String >= Option < String >.None, editorHeight!: Option < Float64 >= Option < Float64 >.None, editorWidth!: Option < Float64 >= Option < Float64 >.None, viewModel!: Option < EditorCodeViewModel >= Option < EditorCodeViewModel >.None, codePendingBean!: Option < CodePendingBean >= Option < CodePendingBean >.None, submission!: Option < SubmissionDetail >= Option < SubmissionDetail >.None, testCase!: Option < String >= Option < String >.None, consoleTab!: Option < Int32 >= Option < Int32 >.None, isRunning!: Option < Bool >= Option < Bool >.None, isPremium!: Option < Bool >= Option < Bool >.None, showTestCase!: Option < Bool >= Option < Bool >.None, showKeyboardBar!: Option < Bool >= Option < Bool >.None, editorKitController!: Option < EditorKitController >= Option < EditorKitController >.None, runningDialog!: Option < CustomDialogController >= Option < CustomDialogController >.None, consoleDialog!: Option < CustomDialogController >= Option < CustomDialogController >.None): Unit {

        match(fontSize) {
            case Some(v) => this.fontSize = v
            case _ =>()
        }

        match(tabLen) {
            case Some(v) => this.tabLen = v
            case _ =>()
        }

        match(lang) {
            case Some(v) => this.lang = v
            case _ =>()
        }

        match(editorHeight) {
            case Some(v) => this.editorHeight = v
            case _ =>()
        }

        match(editorWidth) {
            case Some(v) => this.editorWidth = v
            case _ =>()
        }

        match(codePendingBean) {
            case Some(v) => this.codePendingBean = v
            case _ =>()
        }

        match(submission) {
            case Some(v) => this.submission = v
            case _ =>()
        }

        match(testCase) {
            case Some(v) => this.testCase = v
            case _ =>()
        }

        match(consoleTab) {
            case Some(v) => this.consoleTab = v
            case _ =>()
        }

        match(isRunning) {
            case Some(v) => this.isRunning = v
            case _ =>()
        }

        match(isPremium) {
            case Some(v) => this.isPremium = v
            case _ =>()
        }

        match(showTestCase) {
            case Some(v) => this.showTestCase = v
            case _ =>()
        }

        match(showKeyboardBar) {
            case Some(v) => this.showKeyboardBar = v
            case _ =>()
        }

    }


    public func rerender() {
        this.updateDirtyElements()
    }


    public func purgeVariableDependenciesOnElmtId(rmElmtId: Int64) {

        this.stateVarDecl_fontSize_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_tabLen_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_lang_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_editorHeight_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_editorWidth_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_codePendingBean_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_submission_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_testCase_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_consoleTab_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_isRunning_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_isPremium_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_showTestCase_.purgeDependencyOnElmtId(rmElmtId)

        this.stateVarDecl_showKeyboardBar_.purgeDependencyOnElmtId(rmElmtId)

    }


}

"#

let observedStr1 = #"
public class HomeFeedListViewModel {
    var nextToken:?String = None
    var pageNum = 0
    let homeFeedDataSource = HomeFeedDataSource(ArrayList < FeedItemBean >())

    private var stateVarDecl_isLoading_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isLoading_", false)

    mut prop isLoading: Bool
    {
        get() {
            return this.stateVarDecl_isLoading_.get()
        }

        set(v) {

            this.stateVarDecl_isLoading_.set(v)

        }

    }



    private var stateVarDecl_canLoadMore_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_canLoadMore_", true)

    mut prop canLoadMore: Bool
    {
        get() {
            return this.stateVarDecl_canLoadMore_.get()
        }

        set(v) {

            this.stateVarDecl_canLoadMore_.set(v)

        }

    }



    private var stateVarDecl_isEmpty_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isEmpty_", false)

    mut prop isEmpty: Bool
    {
        get() {
            return this.stateVarDecl_isEmpty_.get()
        }

        set(v) {

            this.stateVarDecl_isEmpty_.set(v)

        }

    }



    func feachHomeData(homeBean: HomeTabBean, isReflash: Bool, callBack!:() -> Unit = { => }) {
        if(isReflash) {
            nextToken = None
            pageNum = 0
        }

        let syncCounter: SyncCounter = SyncCounter(1)
        isLoading = true

        if(homeBean.slug == "today") {
            leetCodeGqlClient.query(
            FeedListQuery(nextToken),
            {
                result =>
                callBack()
                isLoading = false
                ifSome(result.myFeed) {
                    myFeed =>
                    canLoadMore = ! myFeed.nextToken.getOrDefault() { "" }.isEmpty()
                    nextToken = myFeed.nextToken

                    let slugs = myFeed.rows |>
                    map < FeedListQuery_Row, Option < String >> {
                        row: FeedListQuery_Row => row.actor.userSlug
                    } |> collectArrayList

                    let list = myFeed.rows |>
                    map < FeedListQuery_Row, FeedItemBean >() {
                        row: FeedListQuery_Row =>
                        let action = match(row.verb) {
                            case "upvote" => " 点赞了"
                            case "comment" => " 评论了"
                            case "reply" => " 参与了"
                            case "contrib" => " 发布了"
                            case "update" => " 更新了"
                            case _ => ""
                        }
                        var homeFeedQuestionsBean: Option < HomeFeedQuestionsBean >= None
                        if(let Some(info) <- row.questionInfo) {
                            AppLog.error("id${info.frontendId}")
                            homeFeedQuestionsBean = HomeFeedQuestionsBean(
                            info.slug,
                            "${info.frontendId}.${info.title}"
                            )
                        }

                        let slug = row.feedContent.feedArticle?.slug??""
                        let uuid = row.feedContent.feedArticle?.uuid??""
                        var reactionNum: Int64 = 0
                        if(let Some(feedArticle) <- row.feedContent.feedArticle) {
                            reactionNum = feedArticle.reactionCounts |>
                            fold < ReactionCount, Int64 >(0) {
                                count, reactionCount => if(reactionCount.reactionType == "UPVOTE") {
                                    count + reactionCount.count
                                } else {
                                    count
                                }
                            }
                        }
                        let emojiAction = if(reactionNum <= 0) {
                            "回复 ${row.feedContent.feedArticle?.answeredNum??0}  ⋅  浏览 ${(row.feedContent.feedArticle?.hitCount ?? 0).useUnitK()}"
                        } else {
                            "点赞 ${reactionNum}  ⋅  回复 ${row.feedContent.feedArticle?.answeredNum??0}  ⋅  浏览 ${(row.feedContent.feedArticle?.hitCount ?? 0).useUnitK()}"
                        }

                        let describe = "${action} ⋅ ${TimeUtils.timeSinceDate(row.timestamp*1000)}"
                        let image = row.feedContent.feedArticle?.thumbnail??""
                        let taglist = row.tags |> map() { tag => tag.name } |> collectArray
                        FeedItemBean(row.actor.avatar, row.feedContent.feedArticle?.title??"", row.actor.realName,
                        describe, row.feedContent.feedArticle?.summary??"", row.subscribed,
                        row.feedContent.feedArticle?.articleType, false, image, image, taglist,
                        homeFeedQuestionsBean, uuid, emojiAction, slug, false, "")
                    } |> collectArrayList
                    if(isReflash) {
                        isEmpty = list.size == 0
                    }
                    leetCodeGqlClient.query(
                    UsernameConfigsQuery(slugs),
                    {
                        result =>
                        let medalist = result.userProfileUserPendants |>
                        map < Option < UsernameConfigsQuery_UserProfileUserPendant >, String >() {
                            p =>(p?.config.icon??"")??""
                        } |> collectArray

                        for((index, item) in list |> enumerate) {
                            item.medalIcon = medalist[index]
                        }

                        if(isReflash) {
                            homeFeedDataSource.clear()
                            homeFeedDataSource.addDatas(list)
                        } else {
                            homeFeedDataSource.addDatas(list)
                        }
                    },
                    errorCallBack: {
                        => if(isReflash) {
                            homeFeedDataSource.clear()
                            homeFeedDataSource.addDatas(list)
                        } else {
                            homeFeedDataSource.addDatas(list)
                        }
                    }
                    )


                }
            },
            client: leetCodeGqlClient.noty,
            errorCallBack: {
                =>
                isLoading = false
                if(isReflash) {
                    isEmpty = homeFeedDataSource.totalCount() == 0
                }
                callBack()
            }
            )
        } else {
            leetCodeGqlClient.query(
            QaQuestionListQuery(Option.None, false, pageNum, homeBean.slug, Option.None, CircleSortTypeEnum.LATEST),
            {
                result =>
                callBack()
                isLoading = false
                result.qaQuestionList.pageSize * pageNum >= result.qaQuestionList.totalNum
                canLoadMore = homeFeedDataSource.totalCount() + result.qaQuestionList.pageSize < result.
                qaQuestionList.totalNum
                pageNum ++

                let slugs = result.qaQuestionList.nodes |>
                map < QaQuestionListQuery_Node, Option < String >> {
                    row: QaQuestionListQuery_Node => row.qaQuestion.contentAuthor.userSlug
                } |> collectArrayList

                let list = result.qaQuestionList.nodes |>
                map {
                    row: QaQuestionListQuery_Node =>
                    let uuid = row.qaQuestion.uuid

                    var reactionNum: Int64 = 0
                    if(let Some(feedArticle) <- row.qaQuestion.reactionsV2) {
                        reactionNum = feedArticle |>
                        fold < QaQuestion_ReactionsV2, Int64 >(0) {
                            count, reactionCount => if(let UPVOTE <- reactionCount.reactionType) {
                                count + reactionCount.count
                            } else {
                                count
                            }
                        }
                    }
                    let emojiAction = if(reactionNum <= 0) {
                        "回复 ${row.qaQuestion.numAnswers}  ⋅  收藏${(row.qaQuestion.favoriteCount).useUnitK()}"
                    } else {
                        "点赞 ${reactionNum}  ⋅  回复 ${row.qaQuestion.numAnswers}  ⋅  收藏${(row.qaQuestion.favoriteCount).useUnitK()}"
                    }

                    let describe = " ⋅ ${TimeUtils.timeSinceDate(row.qaQuestion.createdAt)}"
                    let videoImage = if(let Some(v) <- row.qaQuestion.videosInfo) {
                        v.get(0)?.coverUrl??""
                    } else {
                        ""
                    }
                    let taglist = row.qaQuestion.tags |>
                    map() {
                        tag: QaQuestion_Tag => if(tag.nameTranslated.isEmpty()) {
                            tag.name
                        } else {
                            tag.nameTranslated
                        }
                    } |> collectArray
                    FeedItemBean(row.qaQuestion.contentAuthor.avatar, row.qaQuestion.title,
                    row.qaQuestion.contentAuthor.realName, describe, row.qaQuestion.summary.replace("\n", ""),
                    false, "Article", row.qaQuestion.hasVideo, row.qaQuestion.thumbnail, videoImage, taglist,
                    Option.None, uuid, emojiAction, "", false, "")
                } |> collectArrayList
                if(isReflash) {
                    isEmpty = list.size == 0
                }

                leetCodeGqlClient.query(
                UsernameConfigsQuery(slugs),
                {
                    result =>
                    let medalist = result.userProfileUserPendants |>
                    map < Option < UsernameConfigsQuery_UserProfileUserPendant >, String >() {
                        p =>(p?.config.icon??"")??""
                    } |> collectArray

                    for((index, item) in list |> enumerate) {
                        item.medalIcon = medalist[index]
                    }

                    if(isReflash) {
                        homeFeedDataSource.clear()
                        homeFeedDataSource.addDatas(list)
                    } else {
                        homeFeedDataSource.addDatas(list)
                    }
                },
                errorCallBack: {
                    => if(isReflash) {
                        homeFeedDataSource.clear()
                        homeFeedDataSource.addDatas(list)
                    } else {
                        homeFeedDataSource.addDatas(list)
                    }
                }
                )
            },
            errorCallBack: {
                =>
                isLoading = false
                if(isReflash) {
                    isEmpty = homeFeedDataSource.totalCount() == 0
                }
                callBack()
            }
            )
        }
    }

    func getHomeFeedDataSource() {
        return homeFeedDataSource
    }

    func feachHomeSubjects(callBack:(s: ArrayList < HomeTabBean >) -> Unit) {
        leetCodeGqlClient.query(
        HomeSubjectsAllQuery(),
        {
            result =>
            let list = result.appSubjectsAll |>
            map < HomeSubjectsAllQuery_AppSubjectsAll, HomeTabBean >() {
                subject => HomeTabBean(subject.title, subject.simpleTitle??"", subject.slug, CJResource(app.media.today, 20000, ""),
                imgsrc: subject.icon??"")
            } |> collectArrayList
            callBack(list)
        },
        errorCallBack: {
            => callBack(
            ArrayList < HomeTabBean >(
            [
            HomeTabBean("today", "今天", "today", CJResource(app.media.today, 20000, "")),
            HomeTabBean("求职面试", "求职", "interview", CJResource(app.media.job, 20000, "")),
            HomeTabBean("职场与内推", "内推", "career", CJResource(app.media.recommend, 20000, "")),
            HomeTabBean("技术交流", "讨论", "other", CJResource(app.media.discuss, 20000, "")),
            HomeTabBean("学习分享", "笔记", "study-sharing", CJResource(app.media.note, 20000, "")),
            HomeTabBean("意见反馈", "反馈", "feedback", CJResource(app.media.feedback, 20000, ""))
            ]
            )
            )
        }
        )
    }
}
"#
let observedStr2 = #"
public class NotificationViewModel {
    var dynamicPageId: Option < String >= None

    private var stateVarDecl_dynamicHasMore_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_dynamicHasMore_", true)

    mut prop dynamicHasMore: Bool
    {
        get() {
            return this.stateVarDecl_dynamicHasMore_.get()
        }

        set(v) {

            this.stateVarDecl_dynamicHasMore_.set(v)

        }

    }


    var messagePageId: Option < String >= None

    private var stateVarDecl_messageHasMore_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_messageHasMore_", true)

    mut prop messageHasMore: Bool
    {
        get() {
            return this.stateVarDecl_messageHasMore_.get()
        }

        set(v) {

            this.stateVarDecl_messageHasMore_.set(v)

        }

    }


    var messageIsLoading: Bool = false
    var dynamicIsLoading: Bool = false

    private var stateVarDecl_messageIsEmpty_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_messageIsEmpty_", true)

    mut prop messageIsEmpty: Bool
    {
        get() {
            return this.stateVarDecl_messageIsEmpty_.get()
        }

        set(v) {

            this.stateVarDecl_messageIsEmpty_.set(v)

        }

    }



    private var stateVarDecl_dynamicIsEmpty_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_dynamicIsEmpty_", true)

    mut prop dynamicIsEmpty: Bool
    {
        get() {
            return this.stateVarDecl_dynamicIsEmpty_.get()
        }

        set(v) {

            this.stateVarDecl_dynamicIsEmpty_.set(v)

        }

    }



    let messageDataSourece = NotificationDataSource(ArrayList < NotificationBean >())

    let dynamicDataSourece = NotificationDataSource(ArrayList < NotificationBean >())

    public func getNoticeDataSource(): NotificationDataSource {
        return messageDataSourece;
    }

    public func feachNotices(isReflsh: Bool, callBack!:() -> Unit = { => }) {
        if(isReflsh) {
            messagePageId = None
            messageHasMore = true
        }
        messageIsLoading = true
        leetCodeGqlClient.query(
        MessageListQuery(NotyInboxType.NOTIFICATION_I, 15, messagePageId),
        {
            r =>
            callBack()
            ifSome(r.notyActivityInfo) {
                result =>
                messageIsLoading = false
                messagePageId = result.nextId
                messageHasMore = result.hasMore
                let list = result.activities |>
                map < MessageListQuery_Activity, NotificationBean >() {
                    message =>
                    let time = TimeUtils.timeSinceDate(message.time)
                    let avatar: CJResource = match(message.verb) {
                        case NotyVerb.MENTION | NotyVerb.REPLY | NotyVerb.COMMENT | NotyVerb.UPVOTE => CJResource(app.media.chat, 20000, "")
                        case NotyVerb.PROMOTE => if(let NotyEntityType.CONTEST <-(message.object?.entityType??
                        NotyEntityType.CONTEST)) {
                            CJResource(app.media.contest, 20000, "")
                        } else {
                            CJResource(app.media.notice, 20000, "")
                        }
                        case NotyVerb.NOTIFY => CJResource(app.media.notice, 20000, "")
                        case _ => CJResource(app.media.notice, 20000, "")
                    }
                    let link = if((message.object?.meta?.link??"").isEmpty()) { message.link } else { message.object?.meta?.link??"" }
                    NotificationBean(
                    convertContent(message.content, message.object?.meta?.name??"",
                    message.subject.meta?.name??"", message.aggregationInfo?.count??1,
                    message.subject.entityType), time, link, avatar: avatar)
                } |> collectArrayList
                if(isReflsh) {
                    messageDataSourece.clear()
                    messageIsEmpty = list.isEmpty()
                }
                messageDataSourece.addDatas(list)
            }
        }
        ) {
            =>
            messageIsLoading = false
            callBack()
        }
    }

    private func convertContent(src: String, objectStr: String, subject: String, count: Int, entityType: NotyEntityType): String {
        let isUser = if(let NotyEntityType.USER <- entityType) {
            true
        } else {
            false
        }
        return src.replace("{{object}}", objectStr).replace(
        "{{subject}}",
        if(count > 1 && isUser) {
            "${subject} 等 ${count} 人"
        } else {
            subject
        }
        ).replace("{{count}}", "${count}")
    }

    public func getDynamicDataSource(): NotificationDataSource {
        return dynamicDataSourece
    }

    public func feachDynamic(isReflsh: Bool, callBack!:() -> Unit = { => }) {
        if(isReflsh) {
            dynamicPageId = None
            dynamicHasMore = true
        }
        dynamicIsLoading = true
        leetCodeGqlClient.query(
        MessageListQuery(NotyInboxType.NOTIFICATION_II, 15, dynamicPageId),
        {
            r =>
            callBack()
            ifSome(r.notyActivityInfo) {
                result =>
                dynamicIsLoading = false
                dynamicPageId = result.nextId
                dynamicHasMore = result.hasMore
                let list = result.activities |>
                map < MessageListQuery_Activity, NotificationBean >() {
                    message =>
                    let time = TimeUtils.timeSinceDate(message.time)
                    let avatar:?CJResource = match(message.verb.rawValue()) {
                        case "COMMENT" => CJResource(app.media.reply, 20000, "")
                        case "FOLLOW" => CJResource(app.media.follow_user, 20000, "")
                        case "UPVOTE" => CJResource(app.media.thumbs_up, 20000, "")
                        case _ => None
                    }
                    let link = if((message.object?.meta?.link??"").isEmpty()) { message.link } else { message.object?.meta?.link??"" }
                    NotificationBean(
                    convertContent(message.content, message.object?.meta?.name??"",
                    message.subject.meta?.name??"", message.aggregationInfo?.count??1,
                    message.subject.entityType), time, link, avatar: avatar)
                } |> collectArrayList

                let avatarIdList = result.activities |>
                map < MessageListQuery_Activity, String >() { item => item.subject.entityId } |> collectArrayList
                leetCodeGqlClient.query(
                AvatarListQuery(avatarIdList),
                {
                    r =>
                    for((index, item) in list |> enumerate) {
                        item.url = if(let NotyEntityType.SITE <- result.activities[index].subject.entityType) {
                            r.notyAvatarInfo?.siteAvatar
                        } else {
                            r.notyAvatarInfo?.userAvatars.get(index)?.avatar
                        }
                    }
                    if(isReflsh) {
                        dynamicDataSourece.clear()
                        dynamicIsEmpty = list.isEmpty()
                    }
                    dynamicDataSourece.addDatas(list)
                },
                errorCallBack: {
                    =>
                    if(isReflsh) {
                        dynamicDataSourece.clear()
                    }
                    dynamicDataSourece.addDatas(list)
                }
                )
            }
        }
        ) {
            =>
            dynamicIsLoading = false
            callBack()
        }
    }
}
"#
let observedStr3 = #"
public class TodayQuetionsBean {

    private var stateVarDecl_questionDec_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_questionDec_", "")

    mut prop questionDec: String
    {
        get() {
            return this.stateVarDecl_questionDec_.get()
        }

        set(v) {

            this.stateVarDecl_questionDec_.set(v)

        }

    }



    private var stateVarDecl_dayDec_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_dayDec_", "")

    mut prop dayDec: String
    {
        get() {
            return this.stateVarDecl_dayDec_.get()
        }

        set(v) {

            this.stateVarDecl_dayDec_.set(v)

        }

    }



    private var stateVarDecl_monthDec_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_monthDec_", "")

    mut prop monthDec: String
    {
        get() {
            return this.stateVarDecl_monthDec_.get()
        }

        set(v) {

            this.stateVarDecl_monthDec_.set(v)

        }

    }


    var questionSlug: String = ""
    var userStatus: String = ""

    public static func getMonth(month: Int): String {
        match(month) {
            case 1 => "JAN"
            case 2 => "FEB"
            case 3 => "MAR"
            case 4 => "APR"
            case 5 => "MAY"
            case 6 => "JUNE"
            case 7 => "JULY"
            case 8 => "AUG"
            case 9 => "SEP"
            case 10 => "OCT"
            case 11 => "NOV"
            case 12 => "DEC"
            case _ => "UNKONW"
        }
    }

    public static func getDay(day: Int): String {
        if(day < 10) {
            "0${day}"
        } else {
            "${day}"
        }

    }
}
"#

let customDialogStr1 = #"
public class ConsoleDialog {
    var controller: Option < CustomDialogController > = Option.None

    private var stateVarDecl_defaultTabIndex_: ObservedProperty < Int32 > = ObservedProperty < Int32 >("stateVarDecl_defaultTabIndex_", 0)

    private mut prop defaultTabIndex: Int32
    {
        get() {
            return this.stateVarDecl_defaultTabIndex_.get()
        }

        set(v) {

            this.stateVarDecl_defaultTabIndex_.set(v)

        }

    }



    private var stateVarDecl_currentIndex_: ObservedProperty < Int32 > = ObservedProperty < Int32 >("stateVarDecl_currentIndex_", 0)

    private mut prop currentIndex: Int32
    {
        get() {
            return this.stateVarDecl_currentIndex_.get()
        }

        set(v) {

            this.stateVarDecl_currentIndex_.set(v)

        }

    }



    private var stateVarDecl_testCase_: ObservedProperty < String >

    private mut prop testCase: String
    {
        get() {
            return this.stateVarDecl_testCase_.get()
        }

        set(v) {

            this.stateVarDecl_testCase_.set(v)

        }

    }



    private var stateVarDecl_submission_: ObservedProperty < SubmissionDetail > = ObservedProperty < SubmissionDetail >("stateVarDecl_submission_", SubmissionDetail.noneFake())

    private mut prop submission: SubmissionDetail
    {
        get() {
            return this.stateVarDecl_submission_.get()
        }

        set(v) {

            this.stateVarDecl_submission_.set(v)

        }

    }


    var testcaseClick: Action
    var submitClick: Action
    var runClick: Action
    var showTestCase: Bool

    func build() {
        Column() {
            Blank().layoutWeight(1).onClick { e => controller?.close() }
            Stack(Alignment.TopEnd) {
                Column {
                    Tabs(defaultTabIndex) {
                        ForEach(
                        ["测试用例", "代码执行结果"],
                        itemGeneratorFunc: {
                            item: String, index: Int => TabContent() {
                                tabContent(index)
                            }.tabBar { => bind(tabBarBuilder, this)(item, Int32(index)) }
                        }
                        )
                    }.animationDuration(0).barMode(BarMode.Scrollable).onChange({
                        index: Int32 => currentIndex = index
                    }).layoutWeight(1)
                    CodeConsoleBar(showTestCase: showTestCase, testcaseClick: testcaseClick, runClick: runClick, submitClick: submitClick)
                    Blank(min: navigationHeight())
                }
                Button() {
                    Image(CJResource(app.media.close, 20000, ""))
                }.backgroundColor(Color.TRANSPARENT).size(width: 24, height: 24).margin(right: 16, top: 16).onClick {
                    => controller?.close()
                }
            }.backgroundColor(CC.paper).layoutWeight(1).borderRadius(topLeft: Length(22), topRight: Length(22))
        }
    }



    func tabBarBuilder(thisView: CustomView, name: ObservedProperty < String >, index: ObservedProperty < Int32 >): ViewBuilder {


        func tabBarBuilder__inner__(thisView: CustomView, name: String, index: Int32): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(name).fontColor(if(currentIndex == index) {
                            CC.fix_black
                        }
                        else {
                            CC.grey2
                        }
                        ).fontSize(16).fontWeight(if(currentIndex == index) {
                            FontWeight.Medium
                        }
                        else {
                            FontWeight.Regular
                        }
                        ).lineHeight(22).margin(top: 10, bottom: 7) })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => Divider().strokeWidth(3).color(CC.base).opacity(if(currentIndex == index) {
                            1
                        }
                        else {
                            0
                        }
                        ).width(28).clip(true).borderRadius(10) }) }.padding(left: 10, right: 10)
            })

        }


        ViewBuilder { tabBarBuilder__inner__(thisView, name.get(), index.get()) }

    }




    func tabContent(thisView: CustomView, index: ObservedProperty < Int >): ViewBuilder {


        func tabContent__inner__(thisView: CustomView, index: Int): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Scroll { thisView.observeComponentCreation({ elmtId, isInitialRender => Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(index == 0) {
                                        thisView.ifElseBranchUpdateFunction(0, { => thisView.observeComponentCreation({ elmtId, isInitialRender => TextArea(text: testCase).layoutWeight(1).onChange({ text => testCase = text }) }) })
                                    }
                                    else {
                                        thisView.ifElseBranchUpdateFunction(1, { => thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(submission.id == "-1") {
                                                        thisView.ifElseBranchUpdateFunction(0, { => thisView.observeComponentCreation({ elmtId, isInitialRender => Text("请先运行您的代码").align(Alignment.Center) }) })
                                                    }
                                                    else {
                                                        thisView.ifElseBranchUpdateFunction(1, { => match(RunResultCard(thisView, submission: stateVarDecl_submission_)) {
                                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                                CustomView.create(cv)
                                                                ViewStackProcessor.StopGetAccessRecording()
                                                                case vb: ViewBuilder => vb.build()
                                                                case _ => LegalCallCheck.check(RunResultCard(thisView, submission: stateVarDecl_submission_))
                                                            } })
                                                    }
                                                } }) })
                                    }
                                } }) }.padding(left: 12, right: 12) }) }.scrollBar(BarState.Off)
            })

        }


        ViewBuilder { tabContent__inner__(thisView, index.get()) }

    }


}
"#

let componentStr1 = #"
public class PhoneLogin {
    var viewModel: LoginViewModel = LoginViewModel("MainPage")

    private var stateVarDecl_canLogin_: ObservedProperty < Bool >

    private mut prop canLogin: Bool
    {
        get() {
            return this.stateVarDecl_canLogin_.get()
        }

        set(v) {

            this.stateVarDecl_canLogin_.set(v)

        }

    }



    private var stateVarDecl_isEnable_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isEnable_", false)

    private mut prop isEnable: Bool
    {
        get() {
            return this.stateVarDecl_isEnable_.get()
        }

        set(v) {

            this.stateVarDecl_isEnable_.set(v)

        }

    }



    private var stateVarDecl_area_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_area_", "+86")

    private mut prop area: String
    {
        get() {
            return this.stateVarDecl_area_.get()
        }

        set(v) {

            this.stateVarDecl_area_.set(v)

        }

    }


    var phone: String = ""


    private var stateVarDecl_list_: ObservedProperty < ArrayList < AreaBean >>= ObservedProperty < ArrayList < AreaBean >>("stateVarDecl_list_", ArrayList())

    private mut prop list: ArrayList < AreaBean >
    {
        get() {
            return this.stateVarDecl_list_.get()
        }

        set(v) {

            this.stateVarDecl_list_.set(v)

        }

    }


    func build() {
        Column() {
            Text("开始力扣").fontSize(30).fontWeight(FontWeight.Bold)
            Text("用力扣，越能 Code").fontSize(20).fontWeight(FontWeight.Bold).fontColor(CC.label_secondary).
            margin(top: 8)
            Row() {
                Text(area).bindMenu(builder: areaMenu)
                Image(CJResource(app.media.arrow_down, 20000, "")).width(13).height(8).margin(left: 15).bindMenu(builder: areaMenu)
                TextInput(placeholder: "手机号码").backgroundColor(0x01FFFFFF).fontSize(16).placeholderFont(
                size: 16).setType(InputType.Number).enterKeyType(EnterKeyType.Done).defaultFocus(true).onChange() {
                    s =>
                    phone = s
                    if(! phone.isEmpty()) {
                        isEnable = true
                    } else {
                        isEnable = false
                    }
                }.maxLength(11)
            }.backgroundColor(CC.fill_tertiary).borderRadius(8).height(44).margin(top: 16).padding(left: 12)

            Text("未注册手机号将自动创建").fontSize(12).fontColor(CC.label_secondary).margin(top: 4, left: 12
            )

            Button("获取验证码").backgroundColor(CC.primary_button).width(100.percent).height(50).margin(top: 8).
            onClick {
                e => if(! canLogin) {
                    PromptAction.showToast(message: "请先勾选协议")
                } else {
                    if(! checkPhoneNum(phone)) {
                        PromptAction.showToast(message: "手机号格式错误，请检查")
                    } else {
                        viewModel.smsMessage(phone, area)
                    }
                }
            }.enabled(isEnable).borderRadius(8).shape(ShapeType.Normal)
        }.width(100.percent).alignItems(HorizontalAlign.Start)
    }

    private func checkPhoneNum(phone: String): Bool {
        if(phone.isEmpty()) {
            return false
        }
        if(area == "+86") {
            return phone.size == 11
        } else {
            return phone.size == 11 || phone.size == 10 || phone.size == 9 || phone.size == 8
        }
    }


    private func areaMenu(thisView: CustomView): ViewBuilder {


        func areaMenu__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Column { thisView.observeComponentCreation({ elmtId, isInitialRender => List() { thisView.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: AreaBean, index: Int64 => thisView.observeComponentCreation({ elmtId, isInitialRender => ListItem() { thisView.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween)) { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(item.countryName) })
                                                        thisView.observeComponentCreation({ elmtId, isInitialRender => Text("+${item.code}") }) }.padding(top: 13, right: 24, bottom: 13, left: 24) }) }.onClick() { e => area = "+${item.code}" } }) }

                                    thisView.forEachUpdateFunction(elmtId, list, itemGenFunc: forEachItemGenFunction) } }) } }) }
            })

        }


        ViewBuilder { areaMenu__inner__(thisView) }

    }


    protected override func aboutToAppear(): Unit {
        viewModel.getAreaList() {
            bean => for(a in bean) {
                list.add(a)
            }
        }
    }
}
"#
let componentStr2 = #"
public class QuestionMainPage {

    private var stateVarDecl_viewModel_: ObservedProperty < QuestionViewModel >= ObservedProperty < QuestionViewModel >("stateVarDecl_viewModel_", QuestionViewModel())

    private mut prop viewModel: QuestionViewModel
    {
        get() {
            return this.stateVarDecl_viewModel_.get()
        }

        set(v) {

            this.stateVarDecl_viewModel_.set(v)

        }

    }



    private var stateVarDecl_todayQuetionsBean_: ObservedProperty < TodayQuetionsBean >= ObservedProperty < TodayQuetionsBean >("stateVarDecl_todayQuetionsBean_", TodayQuetionsBean())

    private mut prop todayQuetionsBean: TodayQuetionsBean
    {
        get() {
            return this.stateVarDecl_todayQuetionsBean_.get()
        }

        set(v) {

            this.stateVarDecl_todayQuetionsBean_.set(v)

        }

    }


    var swiperController: SwiperController = SwiperController()


    private var stateVarDecl_isShowPanel_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isShowPanel_", false)

    private mut prop isShowPanel: Bool
    {
        get() {
            return this.stateVarDecl_isShowPanel_.get()
        }

        set(v) {

            this.stateVarDecl_isShowPanel_.set(v)

        }

    }



    private var stateVarDecl_isDefalt_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isDefalt_", true)

    private mut prop isDefalt: Bool
    {
        get() {
            return this.stateVarDecl_isDefalt_.get()
        }

        set(v) {

            this.stateVarDecl_isDefalt_.set(v)

        }

    }



    private var stateVarDecl_filterRequestData_: ObservedProperty < FilterRequestBean >= ObservedProperty < FilterRequestBean >("stateVarDecl_filterRequestData_", FilterRequestBean())

    private mut prop filterRequestData: FilterRequestBean
    {
        get() {
            return this.stateVarDecl_filterRequestData_.get()
        }

        set(v) {

            this.stateVarDecl_filterRequestData_.set(v)

        }

    }




    private var stateVarDecl_isRefreshing_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isRefreshing_", false)

    private mut prop isRefreshing: Bool
    {
        get() {
            return this.stateVarDecl_isRefreshing_.get()
        }

        set(v) {

            this.stateVarDecl_isRefreshing_.set(v)

        }

    }




    private var stateVarDecl_isShowSheet_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isShowSheet_", false)

    private mut prop isShowSheet: Bool
    {
        get() {
            return this.stateVarDecl_isShowSheet_.get()
        }

        set(v) {

            this.stateVarDecl_isShowSheet_.set(v)

        }

    }



    var scroller: Scroller = Scroller()

    protected override func aboutToAppear(): Unit {
        viewModel.getDailyQuestions(todayQuetionsBean)
        viewModel.getBannes() { }
    }

    func build() {
        Stack() {
            Column() {
                Row() {
                    Text("搜索题目").width(100.percent).height(36).backgroundColor(CC.fill3).clip(true).borderRadius(
                    100).textAlign(TextAlign.Center)
                }.width(100.percent).padding(left: 20, right: 20, top: 15).onClick(
                {
                    e => Router.push(url: "SearchPage")
                })
                Refresh(RefreshParams(refreshing:
                (
                this.isRefreshing,
                {
                    isRefresh: Bool =>
                    this.isRefreshing = isRefresh
                }
                )
                )) {
                    Scroll(scroller) {
                        Column() {
                            if(viewModel.isShowSwiper) {
                                this.swiperBuild()
                            }
                            this.calendarBuild()

                            this.questionBuild()
                        }
                    }.scrollable(ScrollDirection.Vertical)
                    .scrollBar(BarState.Off).height(100.percent)
                }.onRefreshing(
                {
                    =>
                    viewModel.getDailyQuestions(todayQuetionsBean)
                    viewModel.getBannes() {
                        isRefreshing = false
                    }
                }
                )

            }.width(100.percent).backgroundColor(CC.background).padding(top: statusHetight())
        }.height(100.percent).width(100.percent).bindSheet(isShowSheet, fillterSheet,
        options: SheetOptions(showClose: true, enableOutsideInteractive: false, height: SheetSize.FIT_CONTENT,
        title: { => bind(title, this)() }, onDisappear: { => isShowSheet = false }, backgroundColor: getResourceColor(CC.paper)))
    }



    func title(thisView: CustomView): ViewBuilder {


        func title__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Text("筛选题目").fontColor(CC.label_primary).height(100.percent)
            })

        }


        ViewBuilder { title__inner__(thisView) }

    }




    func fillterSheet(thisView: CustomView): ViewBuilder {


        func fillterSheet__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Column() { match(FilterPager(thisView, isShowPanel: stateVarDecl_isShowSheet_, isDefault: stateVarDecl_isDefalt_)) {
                        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                        CustomView.create(cv)
                        ViewStackProcessor.StopGetAccessRecording()
                        case vb: ViewBuilder => vb.build()
                        case _ => LegalCallCheck.check(FilterPager(thisView, isShowPanel: stateVarDecl_isShowSheet_, isDefault: stateVarDecl_isDefalt_))
                    } }.width(100.percent).height(600).backgroundColor(LCColor.paper)
            })

        }


        ViewBuilder { fillterSheet__inner__(thisView) }

    }



    func questionBuild(thisView: CustomView): ViewBuilder {


        func questionBuild__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Stack(Alignment.TopEnd) { match(TabContentComponent(thisView)) {
                        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                        CustomView.create(cv)
                        ViewStackProcessor.StopGetAccessRecording()
                        case vb: ViewBuilder => vb.build()
                        case _ => LegalCallCheck.check(TabContentComponent(thisView))
                    }
                    thisView.observeComponentCreation({ elmtId, isInitialRender => Row() { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.fileter, 20000, "")).width(24).height(24).margin(top: 15, right: 10) }) }.onClick({ e => isShowSheet = true }).padding(left: 15).linearGradient(direction: GradientDirection.Left, colors:[(getResourceColor(LCColor.paper), 0.5),(getResourceColor(LCColor.question_fittler), 1.0)]) }) }.width(100.percent).margin(top: 22)
            })

        }


        ViewBuilder { questionBuild__inner__(thisView) }

    }



    func swiperBuild(thisView: CustomView): ViewBuilder {


        func swiperBuild__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => Swiper(this.swiperController) { thisView.observeComponentCreation({ elmtId, isInitialRender => if(! isInitialRender) {
                                    return FakeComponent()
                                }

                                LazyForEach().create(1, thisView, viewModel.swiperDataSouce, itemGeneratorFunc: { item: BannerBean, index => thisView.observeComponentCreation({ elmtId, isInitialRender => Image(item.image).width(100.percent).width(100.percent).borderRadius(20).objectFit(ImageFit.Fill).onClick() { e => if(item.link.contains("npage://") && item.link.contains("discuss")) {
                                                let arr = item.link.split("/")
                                                let uuid = arr[arr.size - 2]
                                                Router.push(url: "DisscussDetailPage", params: JsonObject(HashMap < String, JsonValue >([("uuid", JsonString(uuid))])))
                                            }
                                        } }) }, keyGeneratorFunc: { item: BannerBean, index => item.image }) }) }.clip(true).borderRadius(20).cachedCount(2).index(1).autoPlay(true).interval(4000).indicator(true).loop(true).duration(200).itemSpace(0).curve(Curve.Linear).onChange({ index => }).width(100.percent).aspectRatio(335.0 / 110.0) }) }.margin(left: 20.vp, right: 20.vp, top: 15.vp)
            })

        }


        ViewBuilder { swiperBuild__inner__(thisView) }

    }




    func calendarBuild(thisView: CustomView): ViewBuilder {


        func calendarBuild__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                If {

                    if(! todayQuetionsBean.questionDec.isEmpty()) {
                        thisView.ifElseBranchUpdateFunction(0, { =>

                            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                                Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(alignItems: ItemAlign.Center)) { thisView.observeComponentCreation({ elmtId, isInitialRender => Column() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text("${todayQuetionsBean.monthDec}").margin(top: 8).fontColor(CC.red).fontSize(13).fontWeight(FontWeight.Bold) })
                                                    thisView.observeComponentCreation({ elmtId, isInitialRender => Text("${todayQuetionsBean.dayDec}").margin(top: 5).fontColor(CC.base).fontSize(24).fontWeight(FontWeight.Bold) }) }.shadow(radius: 5, offsetX: 5, color: getResourceColor(CC.overlay3)).backgroundColor(CC.overlay3).borderRadius(8).width(46).height(60).translate(y: - 12).margin(left: 12) })
                                            thisView.observeComponentCreation({ elmtId, isInitialRender => Column(5) { thisView.observeComponentCreation({ elmtId, isInitialRender => Row() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text("每日一题").fontSize(11).fontColor(CC.label_secondary) }) } })
                                                    thisView.observeComponentCreation({ elmtId, isInitialRender => Text("${todayQuetionsBean.questionDec}").fontSize(13).fontWeight(FontWeight.Bold).fontColor(CC.base).maxLines(1).textOverflow(TextOverflow.Ellipsis) }) }.height(100.percent).justifyContent(FlexAlign.Center).margin(left: 20).alignItems(HorizontalAlign.Start).padding(right: 20) }) }.margin(left: 20, right: 20).width(100.percent).height(62).backgroundColor(CC.fill2).borderRadius(8) }) }.width(100.percent).padding(left: 20, right: 20).margin(top: 25).onClick() { e => Router.push(url: "QuestionDetailPage", params: JsonObject(HashMap < String, JsonValue >([("questionSlug", JsonString(todayQuetionsBean.questionSlug)),("title", JsonString(todayQuetionsBean.questionDec))]))) }
                            })

                        })

                    }
                    else
                    {
                        If.branchId(1)
                    }

                }
            })


        }


        ViewBuilder { calendarBuild__inner__(thisView) }

    }

}
"#
let componentStr3 = #"
class SolutionDetailPage {

    private var stateVarDecl_viewModel_: ObservedProperty < SolutionDetailViewModel >= ObservedProperty < SolutionDetailViewModel >("stateVarDecl_viewModel_", SolutionDetailViewModel())

    private mut prop viewModel: SolutionDetailViewModel
    {
        get() {
            return this.stateVarDecl_viewModel_.get()
        }

        set(v) {

            this.stateVarDecl_viewModel_.set(v)

        }

    }



    private var stateVarDecl_showLargeImage_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showLargeImage_", false)

    private mut prop showLargeImage: Bool
    {
        get() {
            return this.stateVarDecl_showLargeImage_.get()
        }

        set(v) {

            this.stateVarDecl_showLargeImage_.set(v)

        }

    }



    private var stateVarDecl_largeImageUrl_: ObservedProperty <?String >= ObservedProperty <?String >("stateVarDecl_largeImageUrl_", Option.None)

    private mut prop largeImageUrl:?String
    {
        get() {
            return this.stateVarDecl_largeImageUrl_.get()
        }

        set(v) {

            this.stateVarDecl_largeImageUrl_.set(v)

        }

    }


    var headerHeight: Float64 = 0.0
    let scroller = Scroller()
    protected override func aboutToAppear(): Unit {
        viewModel.solutionSlug = Router.getParamsObject().get("slug").getOrThrow().asString().getValue()
        viewModel.fetchData()
    }
    func tocIndexCallback(y:?Float64) {
        if(let Some(y) <- y) {
            if(let Some(length) <- px2vp((y + headerHeight + vp2px(20.vp).getOrThrow().value).px)) {
                scroller.scrollTo(xOffset: 0.vp, yOffset: length)
            }
        }
    }
    func imageCallback(url: String) {
        largeImageUrl = url
        showLargeImage = true
    }


    func largeImageView(thisView: CustomView): ViewBuilder {


        func largeImageView__inner__(thisView: CustomView): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Scroll { thisView.observeComponentCreation({ elmtId, isInitialRender => Column { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(largeImageUrl ?? "").width(100.percent) }) }.width(100.percent) }) }.width(100.percent).height(100.percent).onClick { e => showLargeImage = false
                    largeImageUrl = Option.None }
            })

        }


        ViewBuilder { largeImageView__inner__(thisView) }

    }


    func build() {
        Column() {
            NavigationComponent(title: "")
            Scroll(scroller) {
                Column(20) {
                    if(let Some(solution) <- viewModel.solution) {
                        header(solution)
                        if(let Some(slateValue) <- solution.slateValue) {
                            Column {
                                WebComponent(destination: WebDestination.RichEditor(slateValue))
                            }.padding(left: 20, right: 20)
                        } else if(let Some(content) <- solution.content) {
                            Column {
                                MarkdownComponent(mdStr: content,
                                markdownConfiguration: markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback))
                            }.padding(left: 20, right: 20)

                        }
                        Text("© 著作权归作者所有").fontSize(13).fontColor(CC.label_tertiary)
                        Blank(min: navigationHeight())
                    }
                }
            }.layoutWeight(1).align(Alignment.Top)
        }.padding(top: statusHetight()).bindContentCover(showLargeImage, largeImageView,
        ContentCoverOptions(modalTransition: ModalTransition.NONE, backgroundColor: getResourceColor(CC.fix_black),
        onDisappear: { => showLargeImage = false }))
    }



    func header(thisView: CustomView, solution: ObservedProperty < Solution >): ViewBuilder {


        func header__inner__(thisView: CustomView, solution: Solution): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Column(16) { thisView.observeComponentCreation({ elmtId, isInitialRender => Flex() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(solution.title).fontSize(20).fontWeight(FontWeight.Medium).fontColor(CC.label_primary).margin(right: 8) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(solution.byLeetcode) {
                                        thisView.ifElseBranchUpdateFunction(0, { => match(LeetcodeTag(thisView)) {
                                                case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                CustomView.create(cv)
                                                ViewStackProcessor.StopGetAccessRecording()
                                                case vb: ViewBuilder => vb.build()
                                                case _ => LegalCallCheck.check(LeetcodeTag(thisView))
                                            } })
                                    }
                                    else {
                                        If.branchId(1)
                                    }
                                } })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Blank().flexGrow(1) }) } })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => Row(8) { thisView.observeComponentCreation({ elmtId, isInitialRender => Image(solution.author.userAvatar).size(width: 32, height: 32).borderRadius(16) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Column(2) { thisView.observeComponentCreation({ elmtId, isInitialRender => Row(2) { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(solution.author.realName).fontSize(13).fontColor(CC.label_primary) })
                                            thisView.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(userPendant) <- viewModel.userPendant.getRealValue()) {
                                                        thisView.ifElseBranchUpdateFunction(0, { => thisView.observeComponentCreation({ elmtId, isInitialRender => Image(userPendant).height(11).width(11) }) })
                                                    }
                                                    else {
                                                        If.branchId(1)
                                                    }
                                                } }) } })
                                    thisView.observeComponentCreation({ elmtId, isInitialRender => Row(4) { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(TimeUtils.timeSinceDate(solution.createdAt)).fontSize(11).fontColor(CC.grey2) })
                                            thisView.observeComponentCreation({ elmtId, isInitialRender => Text("来自" + solution.ipRegion).fontSize(11).fontColor(CC.grey2) }) } }) }.alignItems(HorizontalAlign.Start) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Blank().layoutWeight(1) }) } })
                    thisView.observeComponentCreation({ elmtId, isInitialRender => List(space: 8) { thisView.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: Tag, index: Int => thisView.observeComponentCreation({ elmtId, isInitialRender => ListItem() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(item.displayName()).fontSize(12).fontColor(CC.label_secondary).padding(left: 16, right: 16, top: 4, bottom: 4).backgroundColor(CC.grey6).borderRadius(99) }) } }) }

                                    thisView.forEachUpdateFunction(elmtId, solution.tags, itemGenFunc: forEachItemGenFunction) } }) }.listDirection(Axis.Horizontal).scrollBar(BarState.Off) }) }.alignItems(HorizontalAlign.Start).padding(left: 20, right: 20).onAreaChange { _, new: Area => headerHeight = new.height }
            })

        }


        ViewBuilder { header__inner__(thisView, solution.get()) }

    }

}
"#
let componentStr4 = #"
class DynamicPage {

    private var stateVarDecl_notificationViewModel_: ObservedProperty < NotificationViewModel >= ObservedProperty < NotificationViewModel >("stateVarDecl_notificationViewModel_", NotificationViewModel())

    private mut prop notificationViewModel: NotificationViewModel
    {
        get() {
            return this.stateVarDecl_notificationViewModel_.get()
        }

        set(v) {

            this.stateVarDecl_notificationViewModel_.set(v)

        }

    }



    private var stateVarDecl_isDynamicRefreshing_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isDynamicRefreshing_", false)

    private mut prop isDynamicRefreshing: Bool
    {
        get() {
            return this.stateVarDecl_isDynamicRefreshing_.get()
        }

        set(v) {

            this.stateVarDecl_isDynamicRefreshing_.set(v)

        }

    }


    func build() {
        Refresh(RefreshParams(refreshing:
        (
        this.isDynamicRefreshing,
        {
            isRefresh: Bool =>
            this.isDynamicRefreshing = isRefresh
        }
        )
        )) {
            Column() {
                if(notificationViewModel.dynamicIsEmpty) {
                    EmptyPage()
                } else {
                    List() {
                        LazyForEach(
                        notificationViewModel.getDynamicDataSource(),
                        itemGeneratorFunc: {
                            item: NotificationBean, index: Int64 => ListItem() {
                                Flex(FlexParams(alignItems: ItemAlign.Start)) {
                                    Stack(Alignment.BottomEnd) {
                                        Image(item.url??"").width(44).height(44).borderRadius(100).alt(
                                        CJResource(app.media.profile_avatar, 20000, ""))
                                        if(let Some(s) <- item.avatar) {
                                            Image(s).width(16).height(16).borderRadius(100).backgroundColor(
                                            LCColor.background).padding(2)
                                        }
                                    }

                                    Column(8) {
                                        Text(item.title).fontSize(15).fontColor(CC.label_primary).fontWeight(
                                        FontWeight.Bold)

                                        Text(item.time).fontSize(12).fontColor(CC.label_secondary)
                                    }.alignItems(HorizontalAlign.Start).margin(left: 16)
                                }.width(100.percent).padding(left: 27, top: 20, bottom: 14, right: 20).onClick(
                                {
                                    e =>

                                })
                            }
                        }
                        )
                        if(! notificationViewModel.dynamicHasMore) {
                            ListItem() {
                                Column() {
                                    Text("没有更多内容了")
                                }.width(100.percent).padding(top: 20.0, bottom: 20.0)
                            }
                        }
                    }.width(100.percent).height(100.percent).divider(
                    strokeWidth: Length(1),
                    color: CC.grey6,
                    ).onScrollIndex() {
                        start, end => if(notificationViewModel.dynamicHasMore &&
                        ! notificationViewModel.dynamicIsLoading && Int64(end) >=
                        notificationViewModel.dynamicDataSourece.totalCount() - 5) {
                            notificationViewModel.feachDynamic(false)
                        }
                    }
                }
            }
        }.height(100.percent).width(100.percent).onRefreshing(
        {
            => notificationViewModel.feachDynamic(
            true,
            callBack: {
                => isDynamicRefreshing = false
            }
            )
        })
    }

    protected override func aboutToAppear(): Unit {
        notificationViewModel.feachDynamic(true)
    }
}
"#
let componentStr5 = #"
public class FilterPager {

    private var stateVarDecl_isShowPanel_: ObservedProperty < Bool >

    private mut prop isShowPanel: Bool
    {
        get() {
            return this.stateVarDecl_isShowPanel_.get()
        }

        set(v) {

            this.stateVarDecl_isShowPanel_.set(v)

        }

    }



    private var stateVarDecl_sortsSrc_: ObservedProperty < ObservedArrayList < FilterBean >>= ObservedProperty < ObservedArrayList < FilterBean >>("stateVarDecl_sortsSrc_", ObservedArrayList())

    private mut prop sortsSrc: ObservedArrayList < FilterBean >
    {
        get() {
            return this.stateVarDecl_sortsSrc_.get()
        }

        set(v) {

            this.stateVarDecl_sortsSrc_.set(v)

        }

    }



    private var stateVarDecl_sortsStatusSrc_: ObservedProperty < ObservedArrayList < FilterBean >>= ObservedProperty < ObservedArrayList < FilterBean >>("stateVarDecl_sortsStatusSrc_", ObservedArrayList())

    private mut prop sortsStatusSrc: ObservedArrayList < FilterBean >
    {
        get() {
            return this.stateVarDecl_sortsStatusSrc_.get()
        }

        set(v) {

            this.stateVarDecl_sortsStatusSrc_.set(v)

        }

    }



    private var stateVarDecl_sortsType_: ObservedProperty < ObservedArrayList < FilterBean >>= ObservedProperty < ObservedArrayList < FilterBean >>("stateVarDecl_sortsType_", ObservedArrayList())

    private mut prop sortsType: ObservedArrayList < FilterBean >
    {
        get() {
            return this.stateVarDecl_sortsType_.get()
        }

        set(v) {

            this.stateVarDecl_sortsType_.set(v)

        }

    }



    private var stateVarDecl_tags_: ObservedProperty < ObservedArrayList < FilterTagBean >>= ObservedProperty < ObservedArrayList < FilterTagBean >>("stateVarDecl_tags_", ObservedArrayList())

    private mut prop tags: ObservedArrayList < FilterTagBean >
    {
        get() {
            return this.stateVarDecl_tags_.get()
        }

        set(v) {

            this.stateVarDecl_tags_.set(v)

        }

    }




    private var stateVarDecl_filterRequestData_: ObservedProperty < FilterRequestBean >

    private mut prop filterRequestData: FilterRequestBean
    {
        get() {
            return this.stateVarDecl_filterRequestData_.get()
        }

        set(v) {

            this.stateVarDecl_filterRequestData_.set(v)

        }

    }




    private var stateVarDecl_isDefault_: ObservedProperty < Bool >

    private mut prop isDefault: Bool
    {
        get() {
            return this.stateVarDecl_isDefault_.get()
        }

        set(v) {

            this.stateVarDecl_isDefault_.set(v)

        }

    }




    private var stateVarDecl_diffclut_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_diffclut_", "全部")

    private mut prop diffclut: String
    {
        get() {
            return this.stateVarDecl_diffclut_.get()
        }

        set(v) {

            this.stateVarDecl_diffclut_.set(v)

        }

    }



    private var stateVarDecl_outSetValue_: ObservedProperty < Float64 >= ObservedProperty < Float64 >("stateVarDecl_outSetValue_", 0.0)

    private mut prop outSetValue: Float64
    {
        get() {
            return this.stateVarDecl_outSetValue_.get()
        }

        set(v) {

            this.stateVarDecl_outSetValue_.set(v)

        }

    }



    let viewModel: QuestionViewModel = QuestionViewModel()
    var scroller: Scroller = Scroller()
    func build() {


        Column() {
            Row() {
                Text("重置").onClick(
                {
                    e =>
                    diffclut = "全部"
                    outSetValue = 0.0
                    resetData(sortsSrc)
                    sortsSrc[0].isSelected = true
                    sortsSrc[0].order = "ASC"
                    resetData(sortsStatusSrc)
                    sortsStatusSrc[0].isSelected = true
                    resetData(sortsType)
                    sortsType[0].isSelected = true
                    var i = 0
                    while(i < tags.size) {
                        tags[i].isSelected = false
                        i ++
                    }
                }
                )

                Text("完成").onClick(
                {
                    e =>
                    this.isShowPanel = false
                    filterRequestData = createQuestionFilterData()
                }
                )
            }.justifyContent(FlexAlign.SpaceBetween).width(100.percent).height(40)

            Scroll(this.scroller) {
                Column() {
                    Text("题目排序").fontWeight(FontWeight.Bold)
                    Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                        ForEach(
                        this.sortsSrc,
                        itemGeneratorFunc: {
                            item: FilterBean, index: Int64 => SortButton(item, index)
                        }
                        )
                    }.margin(top: 12).width(100.percent)

                    Row() {
                        Text("筛选难度").fontWeight(FontWeight.Bold).margin(top: 9)
                        Text(diffclut).width(66).height(26).fontSize(13).fontWeight(FontWeight.W600).fontColor(
                        if(diffclut == "简单") {
                            LCColor.green
                        } else if(diffclut == "中等") {
                            LCColor.yellow
                        } else if(diffclut == "困难") {
                            LCColor.red
                        } else {
                            LCColor.colorPrimary
                        }).backgroundColor(LCColor.fill3).borderRadius(100).textAlign(TextAlign.Center)
                    }.width(100.percent).alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceBetween)

                    Slider(step: 33.0, value: outSetValue).trackThickness(6).onChange() {
                        a, b =>
                        outSetValue = a
                        match(a) {
                            case 0.0 => diffclut = "全部"
                            case 33.0 => diffclut = "简单"
                            case 66.0 => diffclut = "中等"
                            case 99.0 => diffclut = "困难"
                            case _ => diffclut = "全部"
                        }
                    }

                    Text("筛选状态").fontWeight(FontWeight.Bold).margin(top: 15)
                    Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                        ForEach(
                        this.sortsStatusSrc,
                        itemGeneratorFunc: {
                            item: FilterBean, index: Int64 => Row() {
                                Text(item.name).height(30).backgroundColor(
                                if(item.isSelected) {
                                    Color(0x3F007AFF)
                                } else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).
                                fontSize(13).fontColor(
                                if(item.isSelected) {
                                    Color(0x007AFF)
                                } else {
                                    getResourceColor(LCColor.label_secondary)
                                }).onClick() {
                                    e =>
                                    resetData(sortsStatusSrc)
                                    item.isSelected = ! item.isSelected
                                }
                            }.padding(right: 5)
                        }
                        )
                    }.margin(top: 12).width(100.percent)

                    Text("题目类型").fontWeight(FontWeight.Bold).margin(top: 15)
                    Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                        ForEach(
                        this.sortsType,
                        itemGeneratorFunc: {
                            item: FilterBean, index: Int64 => Row() {
                                Text(item.name).height(30).backgroundColor(
                                if(item.isSelected) {
                                    Color(0x3F007AFF)
                                } else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).
                                fontSize(13).fontColor(
                                if(item.isSelected) {
                                    Color(0x007AFF)
                                } else {
                                    getResourceColor(LCColor.label_secondary)
                                }).onClick() {
                                    e =>
                                    resetData(sortsType)
                                    item.isSelected = ! item.isSelected
                                }
                            }.padding(right: 5)
                        }
                        )
                    }.margin(top: 12).width(100.percent)
                    Text("筛选标签").fontWeight(FontWeight.Bold).margin(top: 15)
                    Flex(FlexParams(wrap: FlexWrap.Wrap)) {
                        ForEach(
                        this.tags,
                        itemGeneratorFunc: {
                            item: FilterTagBean, index: Int64 => Row() {
                                Text(item.name).height(30).backgroundColor(
                                if(item.isSelected) {
                                    Color(0x3F007AFF)
                                } else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).
                                onClick() {
                                    e => item.isSelected = ! item.isSelected
                                }.fontColor(
                                if(item.isSelected) {
                                    Color(0x007AFF)
                                } else {
                                    getResourceColor(LCColor.label_secondary)
                                }).fontSize(13)
                            }.padding(right: 5, bottom: 10)
                        }
                        )
                    }.margin(top: 12).width(100.percent)
                }
                .width(100.percent).alignItems(HorizontalAlign.Start).padding(bottom: 50)
            }.width(100.percent).padding(top: 20).scrollable(ScrollDirection.Vertical).scrollBar(BarState.Off).align(Alignment.Top)


        }.height(100.percent).width(100.percent).padding(left: 24, right: 24).justifyContent(FlexAlign.Start)




    }

    protected override func aboutToAppear(): Unit {
        viewModel.getFilterTag() {
            list => tags = ObservedArrayList(list)
        }
        initSortsSrc()
        initSortsStatus()
        initQuestiontype()
    }

    private func resetData(list: ObservedArrayList < FilterBean >) {
        var i = 0
        while(i < list.size) {
            list[i].isSelected = false
            list[i].order = None
            i ++
        }
    }

    private func initQuestiontype() {
        sortsType = ObservedArrayList(
        [FilterBean.create("题目类型", "全部", isSelected: true), FilterBean.create("题目类型", "会员")]
        )
    }

    private func initSortsStatus() {
        sortsStatusSrc = ObservedArrayList(
        [FilterBean.create("筛选状态", "全部", isSelected: true), FilterBean.create("筛选状态", "未做"),
        FilterBean.create("筛选状态", "已解答"), FilterBean.create("筛选状态", "尝试过")])
    }
    private func initSortsSrc() {
        sortsSrc = ObservedArrayList(
        [FilterBean.create("题目排序", "编号", isSelected: true, order: "ASC"),
        FilterBean.create("题目排序", "题解"), FilterBean.create("题目排序", "通过率")])
    }

    private func createQuestionFilterData(): FilterRequestBean {
        var bean = FilterRequestBean()
        var isDefault = true
        var i: Int = 0
        while(i < sortsSrc.size) {
            if(sortsSrc[i].isSelected) {
                match(sortsSrc[i].name) {
                    case "编号" => bean.orderBy = QuestionOrderByEnum.FRONTEND_ID
                    case "题解" => bean.orderBy = QuestionOrderByEnum.SOLUTION_NUM
                    case "通过率" => bean.orderBy = QuestionOrderByEnum.AC_RATE
                    case _ => bean.orderBy = QuestionOrderByEnum.FRONTEND_ID
                }
                if(sortsSrc[i].order == "ASC") {
                    bean.sortingOrderBy = SortingOrderEnum.ASCENDING
                } else if(sortsSrc[i].order == "DES") {
                    bean.sortingOrderBy = SortingOrderEnum.DESCENDING
                } else {
                    bean.sortingOrderBy = SortingOrderEnum.ASCENDING
                }
            }

            i ++
        }
        i = 0
        while(i < sortsStatusSrc.size) {
            if(sortsStatusSrc[i].isSelected) {
                match(sortsStatusSrc[i].name) {
                    case "未做" => bean.status = UserQuestionStatus.NOT_STARTED
                    case "已解答" => bean.status = UserQuestionStatus.AC
                    case "尝试过" => bean.status = UserQuestionStatus.TRIED
                    case _ => bean.status = None
                }
            }

            i ++
        }
        i = 0
        while(i < sortsType.size) {
            if(sortsType[i].isSelected) {
                match(sortsType[i].name) {
                    case "全部" => bean.premiumOnly = false
                    case "会员" => bean.premiumOnly = true
                    case _ => bean.premiumOnly = false
                }
            }

            i ++
        }
        match(diffclut) {
            case "简单" => bean.difficulty = Difficulty.Easy
            case "中等" => bean.difficulty = Difficulty.Medium
            case "困难" => bean.difficulty = Difficulty.Hard
            case _ => bean.difficulty = None
        }
        i = 0
        let tagList: ArrayList < String >= ArrayList < String >()
        while(i < tags.size) {
            if(tags[i].isSelected) {
                tagList.add(tags[i].slug)
            }

            i ++
        }
        if(! tagList.isEmpty()) {
            bean.tags = tagList
        } else {
            bean.tags = None
        }
        return bean
    }



    private func SortButton(thisView: CustomView, item: ObservedProperty < FilterBean >, index: ObservedProperty < Int >): ViewBuilder {


        func SortButton__inner__(thisView: CustomView, item: FilterBean, index: Int): Unit {

            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                Row() { thisView.observeComponentCreation({ elmtId, isInitialRender => Row() { thisView.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).fontSize(13).fontColor(if(item.isSelected) {
                                    Color(0x007AFF)
                                }
                                else {
                                    getResourceColor(LCColor.label_secondary)
                                }
                                ) })
                            thisView.observeComponentCreation({ elmtId, isInitialRender => Image(if(item.order == "ASC") {
                                    CJResource(app.media.vector_drawable_arrow_up, 20000, "")
                                }
                                else if(item.order == "DES") {
                                    CJResource(app.media.vector_drawable_arrow_down, 20000, "")
                                }
                                else {
                                    CJResource(app.media.up_down, 20000, "")
                                }
                                ).height(if(item.order == "ASC" || item.order == "DES") {
                                    6
                                }
                                else {
                                    12
                                }
                                ).margin(left: 6).width(8) }) }.height(30).backgroundColor(if(item.isSelected) {
                            Color(0x3F007AFF)
                        }
                        else {
                            getResourceColor(CJResource(app.color.fill3, 10001, ""))
                        }
                        ).borderRadius(100).padding(left: 12, right: 12).onClick() { e => if(! sortsSrc[index].isSelected) {
                                resetData(sortsSrc)
                            }

                            if(! item.isSelected) {
                                item.isSelected = ! item.isSelected
                            }

                            if(item.order == "ASC") {
                                item.order = "DES"
                            }
                            else {
                                item.order = "ASC"
                            }
                        } }) }.padding(right: 5, bottom: 15)
            })

        }


        ViewBuilder { SortButton__inner__(thisView, item.get(), index.get()) }

    }

}
"#
let componentStr6 = #"
public class CodeEditorPage {
    var questionDetail:?QuestionDetail = Option.None
    var codeSnippets: Array < CodeSnippet >=[]
    var language: LANGUAGETYPE = LANGUAGETYPE.C

    private var stateVarDecl_fontSize_: ObservedProperty < Int >= ObservedProperty < Int >("stateVarDecl_fontSize_", 13)

    private mut prop fontSize: Int
    {
        get() {
            return this.stateVarDecl_fontSize_.get()
        }

        set(v) {

            this.stateVarDecl_fontSize_.set(v)

        }

    }



    private var stateVarDecl_tabLen_: ObservedProperty < Int >= ObservedProperty < Int >("stateVarDecl_tabLen_", 4)

    private mut prop tabLen: Int
    {
        get() {
            return this.stateVarDecl_tabLen_.get()
        }

        set(v) {

            this.stateVarDecl_tabLen_.set(v)

        }

    }


    var langSlug: String = "cpp"

    private var stateVarDecl_lang_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_lang_", "")

    private mut prop lang: String
    {
        get() {
            return this.stateVarDecl_lang_.get()
        }

        set(v) {

            this.stateVarDecl_lang_.set(v)

        }

    }




    private var stateVarDecl_editorHeight_: ObservedProperty < Float64 >= ObservedProperty < Float64 >("stateVarDecl_editorHeight_", 300.0)

    private mut prop editorHeight: Float64
    {
        get() {
            return this.stateVarDecl_editorHeight_.get()
        }

        set(v) {

            this.stateVarDecl_editorHeight_.set(v)

        }

    }




    private var stateVarDecl_editorWidth_: ObservedProperty < Float64 >= ObservedProperty < Float64 >("stateVarDecl_editorWidth_", 380.0)

    private mut prop editorWidth: Float64
    {
        get() {
            return this.stateVarDecl_editorWidth_.get()
        }

        set(v) {

            this.stateVarDecl_editorWidth_.set(v)

        }

    }


    var viewModel: EditorCodeViewModel = EditorCodeViewModel()


    private var stateVarDecl_codePendingBean_: ObservedProperty < CodePendingBean >= ObservedProperty < CodePendingBean >("stateVarDecl_codePendingBean_", CodePendingBean())

    private mut prop codePendingBean: CodePendingBean
    {
        get() {
            return this.stateVarDecl_codePendingBean_.get()
        }

        set(v) {

            this.stateVarDecl_codePendingBean_.set(v)

        }

    }



    private var stateVarDecl_submission_: ObservedProperty < SubmissionDetail >= ObservedProperty < SubmissionDetail >("stateVarDecl_submission_", SubmissionDetail.noneFake())

    private mut prop submission: SubmissionDetail
    {
        get() {
            return this.stateVarDecl_submission_.get()
        }

        set(v) {

            this.stateVarDecl_submission_.set(v)

        }

    }



    private var stateVarDecl_testCase_: ObservedProperty < String >= ObservedProperty < String >("stateVarDecl_testCase_", "")

    private mut prop testCase: String
    {
        get() {
            return this.stateVarDecl_testCase_.get()
        }

        set(v) {

            this.stateVarDecl_testCase_.set(v)

        }

    }



    private var stateVarDecl_consoleTab_: ObservedProperty < Int32 >= ObservedProperty < Int32 >("stateVarDecl_consoleTab_", 0)

    private mut prop consoleTab: Int32
    {
        get() {
            return this.stateVarDecl_consoleTab_.get()
        }

        set(v) {

            this.stateVarDecl_consoleTab_.set(v)

        }

    }




    private var stateVarDecl_isRunning_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isRunning_", true)

    private mut prop isRunning: Bool
    {
        get() {
            return this.stateVarDecl_isRunning_.get()
        }

        set(v) {

            this.stateVarDecl_isRunning_.set(v)

        }

    }



    private var stateVarDecl_isPremium_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_isPremium_", getAccoutService().isPremium())

    private mut prop isPremium: Bool
    {
        get() {
            return this.stateVarDecl_isPremium_.get()
        }

        set(v) {

            this.stateVarDecl_isPremium_.set(v)

        }

    }



    private var stateVarDecl_showTestCase_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showTestCase_", false)

    private mut prop showTestCase: Bool
    {
        get() {
            return this.stateVarDecl_showTestCase_.get()
        }

        set(v) {

            this.stateVarDecl_showTestCase_.set(v)

        }

    }



    private var stateVarDecl_showKeyboardBar_: ObservedProperty < Bool >= ObservedProperty < Bool >("stateVarDecl_showKeyboardBar_", false)

    private mut prop showKeyboardBar: Bool
    {
        get() {
            return this.stateVarDecl_showKeyboardBar_.get()
        }

        set(v) {

            this.stateVarDecl_showKeyboardBar_.set(v)

        }

    }



    func fontSizeChange() {
        viewModel.saveFontSize(fontSize)
    }
    func tabLengthChange() {
        viewModel.saveTabLength(tabLen)
    }

    var editorKitController: EditorKitController = EditorKitController(width: 400.0, height: 600.0,
    theme: if(isDarkMode()) {
        MONOKAI
    } else {
        MONOKAI_LIGHT
    }, fontSize: 13, tabLen: 4)
    var runningDialog: CustomDialogController = CustomDialogController(
    CustomDialogControllerOptions(builder: RunningAnimationView(isPremium: isPremium, isRunning: isRunning),
    maskColor: Color(0, 0, 0, alpha: 0.8), autoCancel: false, alignment: DialogAlignment.Center, customStyle: true))
    var consoleDialog: CustomDialogController = CustomDialogController(
    CustomDialogControllerOptions(
    builder: ConsoleDialog(
    submission: submission,
    testCase: testCase,
    defaultTabIndex: consoleTab,
    currentIndex: consoleTab,
    testcaseClick: testcaseClick,
    runClick: runAction,
    submitClick: submitAction,
    showTestCase: showTestCase
    ),
    maskColor: Color(0, 0, 0, alpha: 0.8),
    autoCancel: false,
    customStyle: true,
    closeAnimation: AnimateParam(duration: 0),
    alignment: DialogAlignment.Bottom
    )
    )
    protected override func aboutToAppear(): Unit {
        try {
            let questionJson = Router.getParamsObject().get("question").getOrThrow().asString().getValue()
            let questionDetail = QuestionDetail.fromJson(questionJson)
            this.questionDetail = questionDetail
            codeSnippets = questionDetail.codeSnippets
            testCase = questionDetail.sampleTestCase??""
            showTestCase = ! questionDetail.exampleTestCases.isNoneOrEmpty()
            observeKeyboard()
            editorKitController.setTheme(if(isDarkMode()) {
                MONOKAI
            } else {
                MONOKAI_LIGHT
            })
            tabLen = viewModel.getTabLength()
            fontSize = viewModel.getFontSize()
            editorKitController.setFontSize(fontSize)
            editorKitController.setTabLen(tabLen)
            let lastLangSlug = viewModel.getLastLangSlug()
            if(! lastLangSlug.isEmpty()) {
                if(let Some(codeSnippet) <- (codeSnippets |> filter { c => c.langSlug == lastLangSlug } |> first)) {
                    return setCodeSnippet(codeSnippet)
                }
            }
            if(let Some(codeSnippet) <- codeSnippets.get(0)) {
                setCodeSnippet(codeSnippet)
            }
        } catch(e: Exception) {
            AppLog.info("~~~ codeEditor onAppear error: ${e.message}")
        }
    }

    protected override func aboutToDisappear(): Unit {
        saveCode()
        let currentWindow = getLastWindow(getStageContext(getGlobalAbilityContext()))
        currentWindow.off("keyboardHeightChange")
    }
    private func setCodeSnippet(codeSnippet: CodeSnippet) {
        language = LANGUAGETYPE.fromString(codeSnippet.langSlug??"")
        langSlug = codeSnippet.langSlug??""
        lang = codeSnippet.lang??""
        var code = codeSnippet.code??""
        if(let Some(cache) <- CodeDbService.getLocalCode(questionDetail?.titleSlug??"", langSlug)) {
            code = cache
        }
        editorKitController.setLanguageAndText(language, code)
    }

    private func saveCode() {
        let text = editorKitController.getText()
        CodeDbService.saveCode(questionDetail?.titleSlug??"", langSlug, text)
    }

    func observeKeyboard() {
        let defaultDisplay = getDefaultDisplaySync()
        let scaledDensity = Float64(defaultDisplay.scaledDensity)
        let currentWindow = getLastWindow(getStageContext(getGlobalAbilityContext()))
        let property = currentWindow.getWindowProperties()
        let avoidArea = currentWindow.getWindowAvoidArea(AvoidAreaType.TYPE_KEYBOARD)
        let windowHeight = property.windowRect.height
        let keyboardHeight = avoidArea.bottomRect.height
        changeEditorKitHeight(windowHeight, keyboardHeight)
        editorWidth = Float64(property.windowRect.width) / scaledDensity
        editorKitController.setWidth(editorWidth)
        let callback = KeyboardHeightChangeCallback(this, windowHeight)
        currentWindow.on("keyboardHeightChange", callback)
    }

    func changeEditorKitHeight(windowHeight: UInt32, keyboardHeight: UInt32) {
        let defaultDisplay = getDefaultDisplaySync()
        let scaledDensity = Float64(defaultDisplay.scaledDensity)
        let rect: DisplayRect = defaultDisplay.getCutoutInfo().boundingRects.get(0).getOrDefault {
            DisplayRect(0, 0, 0, 0)
        }
        let statusBarHeight = Float64(rect.height) / scaledDensity
        var contentHeight = Float64(windowHeight - keyboardHeight) / scaledDensity
        let navHeight = 44.0
        showKeyboardBar = keyboardHeight > 0
        let barHeight = 64.0 + if(showKeyboardBar) {
            52.0
        } else {
            0.0
        }
        let bottomPadding = 12.0
        let safeAreaBottom = if(showKeyboardBar) {
            0.0
        } else {
            navigationHeight()
        }
        editorHeight = contentHeight - navHeight - barHeight - bottomPadding - statusBarHeight - safeAreaBottom
        editorKitController.setHeight(editorHeight)
        AppLog.info("~~~ keyboard: ${keyboardHeight}, windowHeight: ${windowHeight}, editorHeight: ${editorHeight}")
    }

    func build() {
        Column() {
            CodeEditorNavigation(
            title: lang,
            codeSnippets: codeSnippets,
            selectAction: {
                codeSnippet =>
                saveCode()
                setCodeSnippet(codeSnippet)
                viewModel.saveLastLangSlug(langSlug)
            },
            fontSize: fontSize,
            tabLen: tabLen,
            controller: editorKitController
            )
            EditorKit(editorKitController: editorKitController)
            CodeBar(consoleClick: openConsole, revertClick: revert, runClick: runAction, submitClick: submitAction,
            showConsole: questionDetail?.enableRunCode??true)
            if(showKeyboardBar) {
                KeyboardBar(
                tabLength: tabLen,
                callback: {
                    item, offset => editorKitController.insertTextOnCursor(item, offset: offset)
                }
                )
            }
        }.expandSafeArea(types:[SafeAreaType.KEYBOARD]).padding(top: statusHetight())
    }

    func openConsole() {
        consoleDialog.close()
        consoleDialog.open()
    }

    func submitAction(): Unit {
        consoleDialog.close()
        if(let Some(qd) <- questionDetail) {
            runningDialog.open()
            let text = editorKitController.getText()
            saveCode()
            viewModel.submitCode(qd.titleSlug, qd.questionId, "", text, langSlug, codePendingBean) {
                b: CodeBean =>
                EmitterUtils.emit(event: EmitterEvent.SubmissionRefresh)
                runningDialog.close()
                if(! b.result.isNone() && ! b.state.isNone()) {
                    let submission = SubmissionDetail(data: b, question: qd, testCases: Option.None, code: text)
                    Router.push(
                    url: "SubmitResultPage",
                    params: JsonObject(HashMap < String, JsonValue >([("submissionId", JsonString(submission.id))]))
                    )
                }
            }
        }
    }

    func runAction(): Unit {
        saveCode()
        if(let Some(qd) <- questionDetail) {
            let input = testCase
            runningDialog.open()
            let text = editorKitController.getText()
            viewModel.interpretCode(qd.titleSlug, qd.questionId, input, text, langSlug, codePendingBean) {
                b: CodeBean =>
                runningDialog.close()
                if(! b.result.isNone() && ! b.state.isNone()) {
                    submission = SubmissionDetail(data: b, question: qd, testCases: input, code: text)
                    consoleTab = 1
                    isRunning = true
                    openConsole()
                }
            }
        }
    }

    func revert() {
        let buttons =[ButtonInfo("还原到模板", getResourceColor(CC.colorPrimary)),
        ButtonInfo("考虑一下", getResourceColor(CC.label_secondary))]
        PromptAction.showDialog(title: "还原到默认的代码模板？",
        message: "您将放弃所有更改并初始化代码！\n确定要还原吗？", buttons: buttons,
        callback: {
            err, i => if(i == 0) {
                if(let Some(first) <- (codeSnippets |> filter { c => c.lang == lang } |> first)) {
                    editorKitController.setText(first.code??"")
                    CodeDbService.delete(questionDetail?.titleSlug??"", langSlug)
                }
            }
        })
    }

    func testcaseClick() {
        let buttons =[ButtonInfo("确认", getResourceColor(CC.colorPrimary)),
        ButtonInfo("取消", getResourceColor(CC.label_secondary))]
        PromptAction.showDialog(title: "是否填入示例", message: "填入后会覆盖测试用例", buttons: buttons,
        callback: {
            err, i => if(i == 0) {
                if(let Some(exampleTestCases) <- questionDetail?.exampleTestCases) {

                    testCase = ""
                    testCase = exampleTestCases??""
                }
            }
        })
    }
}
"#

// class QuestionSearchPage
let forEachCreateLambdaStr1 = #"
LazyForEach(viewModel.questionDataSource, itemGeneratorFunc: { item: SearchQuestionItemBean, index: Int64 => ListItem() { Row() { Image(if(item.isVip) {
                CJResource(app.media.vector_ic_lock_fill, 20000, "")
            }
            else {
                CJResource(app.media.ic_search_problem, 20000, "")
            }
            ).width(20).height(20)
            Text(item.title).margin(left: 12).fontSize(15.fp).fontColor(CC.label_primary).fontWeight(FontWeight.Bold).maxLines(1).textOverflow(TextOverflow.Ellipsis) }.width(100.percent).height(50).padding(left: 20, right: 20, bottom: 20) }.onClick({ e => if(item.isVip && ! getAccoutService().isPremium()) {
            PromptAction.showToast(message: "非会员无法访问会员题")
        }
        else {
            Router.push(url: "QuestionDetailPage", params: JsonObject(HashMap < String, JsonValue >([("questionSlug", JsonString(item.slug)),("title", JsonString(item.title))])))
        }
    }) })
"#
// class SubmissionRecordList
let forEachCreateLambdaStr2 = #"
LazyForEach(viewModel.dataSource, itemGeneratorFunc: { record: Record, index: Int => ListItem() { cell(record) } })
"#
// class DynamicPage
let forEachCreateLambdaStr3 = #"
LazyForEach(notificationViewModel.getDynamicDataSource(), itemGeneratorFunc: { item: NotificationBean, index: Int64 => ListItem() { Flex(FlexParams(alignItems: ItemAlign.Start)) { Stack(Alignment.BottomEnd) { Image(item.url ?? "").width(44).height(44).borderRadius(100).alt(CJResource(app.media.profile_avatar, 20000, ""))
                if(let Some(s) <- item.avatar) {
                    Image(s).width(16).height(16).borderRadius(100).backgroundColor(LCColor.background).padding(2)
                }
            }
            Column(8) { Text(item.title).fontSize(15).fontColor(CC.label_primary).fontWeight(FontWeight.Bold)
                Text(item.time).fontSize(12).fontColor(CC.label_secondary) }.alignItems(HorizontalAlign.Start).margin(left: 16) }.width(100.percent).padding(left: 27, top: 20, bottom: 14, right: 20).onClick({ e => }) } })
"#
// class QuestionMainPage @Builder func swiperBuild
let forEachCreateLambdaStr4 = #"
LazyForEach(viewModel.swiperDataSouce, itemGeneratorFunc: { item: BannerBean, index => Image(item.image).width(100.percent).width(100.percent).borderRadius(20).objectFit(ImageFit.Fill).onClick() { e => if(item.link.contains("npage://") && item.link.contains("discuss")) {
            let arr = item.link.split("/")
            let uuid = arr[arr.size - 2]
            Router.push(url: "DisscussDetailPage", params: JsonObject(HashMap < String, JsonValue >([("uuid", JsonString(uuid))])))
        }
    } }, keyGeneratorFunc: { item: BannerBean, index => item.image })

"#
// class CodeEditorNavigation
let forEachCreateLambdaStr5 = #"
ForEach(["12px", "13px", "14px", "15px", "16px", "18px", "20px"], itemGeneratorFunc: { content: String, index: Int => MenuItem(startIcon: "", content: content, endIcon: "", labelInfo: "", builder: Option.None).selected(Int64.parse(content.trimEnd("px")) == fontSize).selectIcon(CJResource(app.media.complete_base, 20000, "")).onClick { e => let fontSize = Int64.parse(content.trimEnd("px"))
        
        this.fontSize = fontSize
        controller.setFontSize(fontSize) } })
"#
// class ConsoleDialog
let forEachCreateLambdaStr6 = #"
ForEach(["测试用例", "代码执行结果"], itemGeneratorFunc: { item: String, index: Int => TabContent() { tabContent(index) }.tabBar { => bind(tabBarBuilder, this)(item, Int32(index)) } })
"#
// class FilterPager
let forEachCreateLambdaStr7 = #"
ForEach(this.sortsType, itemGeneratorFunc: { item: FilterBean, index: Int64 => Row() { Text(item.name).height(30).backgroundColor(if(item.isSelected) {
            Color(0x3F007AFF)
        }
        else {
            getResourceColor(CJResource(app.color.fill3, 10001, ""))
        }
        ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).fontSize(13).fontColor(if(item.isSelected) {
            Color(0x007AFF)
        }
        else {
            getResourceColor(LCColor.label_secondary)
        }
        ).onClick() { e => resetData(sortsType)
            item.isSelected = ! item.isSelected } }.padding(right: 5) })
"#
// class PhoneLogin
let forEachCreateLambdaStr8 = #"
ForEach(list, itemGeneratorFunc: { item: AreaBean, index: Int64 => ListItem() { Flex(FlexParams(justifyContent: FlexAlign.SpaceBetween)) { Text(item.countryName)
            Text("+${item.code}") }.padding(top: 13, right: 24, bottom: 13, left: 24) }.onClick() { e => area = "+${item.code}" } })
"#
// class CodeEditorPage
let generateArgsStr1 = #"
CodeEditorNavigation(title: lang, codeSnippets: codeSnippets, selectAction: { codeSnippet => saveCode()
    setCodeSnippet(codeSnippet)
    viewModel.saveLastLangSlug(langSlug) }, fontSize: fontSize, tabLen: tabLen, controller: editorKitController)
"#
let generateArgsStr2 = #"
CodeBar(consoleClick: openConsole, revertClick: revert, runClick: runAction, submitClick: submitAction, showConsole: questionDetail?.enableRunCode ?? true)
"#
let generateArgsStr3 = #"
KeyboardBar(tabLength: tabLen, callback: { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) })
"#
// class FilterPager
let generateArgsStr4 = "SortButton(a:item, b:index)"
// class QuestionMainPage
let generateArgsStr5 = "this.calendarBuild()"
// class SolutionDetailPage
let generateArgsStr6 = "MarkdownComponent(mdStr: content, markdownConfiguration: markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback))"

let handleRenderStr1 = #"
MenuItem(startIcon: "", content: content, endIcon: "", labelInfo: "", builder: Option.None).selected(Int64.parse(content.trimEnd("px")) == fontSize).selectIcon(CJResource(app.media.complete_base, 20000, "")).onClick { e => let fontSize = Int64.parse(content.trimEnd("px"))
    
    this.fontSize = fontSize
    controller.setFontSize(fontSize) }
"#
let handleRenderStr2 = #"
Menu { thisView.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { content: String, index: Int => thisView.observeComponentCreation({ elmtId, isInitialRender => MenuItem(startIcon: "", content: content, endIcon: "", labelInfo: "", builder: Option.None).selected(Int64.parse(content.trimEnd("px")) == fontSize).selectIcon(CJResource(app.media.complete_base, 20000, "")).onClick { e => let fontSize = Int64.parse(content.trimEnd("px"))
                        
                        this.fontSize = fontSize
                        controller.setFontSize(fontSize) } }) }
            
            thisView.forEachUpdateFunction(elmtId,["12px", "13px", "14px", "15px", "16px", "18px", "20px"], itemGenFunc: forEachItemGenFunction) } }) }
"#
let handleRenderStr3 = #"
MenuItem(startIcon: "", content: "Tab 长度", endIcon: "", labelInfo: "${tabLen}", builder: { => bind(tabLenMenu, this)() })
"#
let handleRenderStr4 = #"
MenuItemGroup(header: "代码编辑器设置", footer: "") { thisView.observeComponentCreation({ elmtId, isInitialRender => MenuItem(startIcon: "", content: "字体设置", endIcon: "", labelInfo: "${fontSize}", builder: { => bind(fontSizeMenu, this)() }) })
    thisView.observeComponentCreation({ elmtId, isInitialRender => MenuItem(startIcon: "", content: "Tab 长度", endIcon: "", labelInfo: "${tabLen}", builder: { => bind(tabLenMenu, this)() }) }) }
"#
let handleRenderStr5 = #"
Row { this.observeComponentCreation({ elmtId, isInitialRender => Image(this.backImage).size(width: 24, height: 24).margin(top: 10, right: 16, bottom: 10, left: 16).fillColor(CC.base).onClick({ e => Router.back() }) })
    this.observeComponentCreation({ elmtId, isInitialRender => Row { this.observeComponentCreation({ elmtId, isInitialRender => Text(this.title).fontSize(16).lineHeight(24).fontColor(CC.label_primary).textAlign(TextAlign.Center) })
            this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.arrow_down, 20000, "")).width(13).height(8).margin(left: 4) }) }.margin(left: 8).bindMenu(codeSnippets |> map { c: CodeSnippet => UIAction(value: c.lang ?? "", action: { => selectAction(c) }) } |> collectArray) })
    this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.fileter, 20000, "")).width(24).height(24).margin(top: 15, right: 10).fillColor(CC.base).margin(top: 10, right: 16, bottom: 10, left: 16).bindMenu(builder: bind(settingsMenu, this)) }) }.height(44).width(100.percent).justifyContent(FlexAlign.SpaceBetween)
"#
let handleRenderStr6 = #"
Column() { match(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
        setCodeSnippet(codeSnippet)
        viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController))) {
        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
        CustomView.create(cv)
        ViewStackProcessor.StopGetAccessRecording()
        case vb: ViewBuilder => vb.build()
        case _ => LegalCallCheck.check(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
            setCodeSnippet(codeSnippet)
            viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController)))
    }
    match(EditorKit(this, editorKitController: ObservedProperty("", editorKitController))) {
        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
        CustomView.create(cv)
        ViewStackProcessor.StopGetAccessRecording()
        case vb: ViewBuilder => vb.build()
        case _ => LegalCallCheck.check(EditorKit(this, editorKitController: ObservedProperty("", editorKitController)))
    }
    match(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true))) {
        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
        CustomView.create(cv)
        ViewStackProcessor.StopGetAccessRecording()
        case vb: ViewBuilder => vb.build()
        case _ => LegalCallCheck.check(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true)))
    }
    this.observeComponentCreation({ elmtId, isInitialRender => If { if(showKeyboardBar) {
                this.ifElseBranchUpdateFunction(0, { => match(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) }))) {
                        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                        CustomView.create(cv)
                        ViewStackProcessor.StopGetAccessRecording()
                        case vb: ViewBuilder => vb.build()
                        case _ => LegalCallCheck.check(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) })))
                    } })
            }
            else {
                If.branchId(1)
            }
        } }) }.expandSafeArea(types:[SafeAreaType.KEYBOARD]).padding(top: statusHetight())
"#
let handleRenderStr7 = #"
Text(name).fontColor(if(currentIndex == index) {
    CC.fix_black
}
else {
    CC.grey2
}
).fontSize(16).fontWeight(if(currentIndex == index) {
    FontWeight.Medium
}
else {
    FontWeight.Regular
}
).lineHeight(22).margin(top: 10, bottom: 7)
"#
let handleRenderStr8 = #"
Column() { this.observeComponentCreation({ elmtId, isInitialRender => If { if(notificationViewModel.dynamicIsEmpty) {
                this.ifElseBranchUpdateFunction(0, { => match(EmptyPage(this)) {
                        case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                        CustomView.create(cv)
                        ViewStackProcessor.StopGetAccessRecording()
                        case vb: ViewBuilder => vb.build()
                        case _ => LegalCallCheck.check(EmptyPage(this))
                    } })
            }
            else {
                this.ifElseBranchUpdateFunction(1, { => this.observeComponentCreation({ elmtId, isInitialRender => List() { this.observeComponentCreation({ elmtId, isInitialRender => if(! isInitialRender) {
                                    return FakeComponent()
                                }
                                
                                LazyForEach().create(1, this, notificationViewModel.getDynamicDataSource(), itemGeneratorFunc: { item: NotificationBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => ListItem() { this.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(alignItems: ItemAlign.Start)) { this.observeComponentCreation({ elmtId, isInitialRender => Stack(Alignment.BottomEnd) { this.observeComponentCreation({ elmtId, isInitialRender => Image(item.url ?? "").width(44).height(44).borderRadius(100).alt(CJResource(app.media.profile_avatar, 20000, "")) })
                                                            this.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(s) <- item.avatar) {
                                                                        this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Image(s).width(16).height(16).borderRadius(100).backgroundColor(LCColor.background).padding(2) }) })
                                                                    }
                                                                    else {
                                                                        If.branchId(1)
                                                                    }
                                                                } }) } })
                                                    this.observeComponentCreation({ elmtId, isInitialRender => Column(8) { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.title).fontSize(15).fontColor(CC.label_primary).fontWeight(FontWeight.Bold) })
                                                            this.observeComponentCreation({ elmtId, isInitialRender => Text(item.time).fontSize(12).fontColor(CC.label_secondary) }) }.alignItems(HorizontalAlign.Start).margin(left: 16) }) }.width(100.percent).padding(left: 27, top: 20, bottom: 14, right: 20).onClick({ e => }) }) } }) }) })
                            this.observeComponentCreation({ elmtId, isInitialRender => If { if(! notificationViewModel.dynamicHasMore) {
                                        this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => ListItem() { this.observeComponentCreation({ elmtId, isInitialRender => Column() { this.observeComponentCreation({ elmtId, isInitialRender => Text("没有更多内容了") }) }.width(100.percent).padding(top: 20.0, bottom: 20.0) }) } }) })
                                    }
                                    else {
                                        If.branchId(1)
                                    }
                                } }) }.width(100.percent).height(100.percent).divider(strokeWidth: Length(1), color: CC.grey6).onScrollIndex() { start, end => if(notificationViewModel.dynamicHasMore && ! notificationViewModel.dynamicIsLoading && Int64(end) >= notificationViewModel.dynamicDataSourece.totalCount() - 5) {
                                notificationViewModel.feachDynamic(false)
                            }
                        } }) })
            }
        } }) }
"#
let handleRenderStr9 = #"
TabContent() { tabContent(this, ObservedProperty("", index)).build() }.tabBar { => bind(tabBarBuilder, this)(item, Int32(index)) }
"#
let handleRenderStr10 = #"
Column() { this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text("重置").onClick({ e => diffclut = "全部"
                    outSetValue = 0.0
                    resetData(sortsSrc)
                    sortsSrc[0].isSelected = true
                    sortsSrc[0].order = "ASC"
                    resetData(sortsStatusSrc)
                    sortsStatusSrc[0].isSelected = true
                    resetData(sortsType)
                    sortsType[0].isSelected = true
                    var i = 0
                    
                    while(i < tags.size) {
                        tags[i].isSelected = false
                        i ++
                    }
                }) })
            this.observeComponentCreation({ elmtId, isInitialRender => Text("完成").onClick({ e => this.isShowPanel = false
                    filterRequestData = createQuestionFilterData() }) }) }.justifyContent(FlexAlign.SpaceBetween).width(100.percent).height(40) })
    this.observeComponentCreation({ elmtId, isInitialRender => Scroll(this.scroller) { this.observeComponentCreation({ elmtId, isInitialRender => Column() { this.observeComponentCreation({ elmtId, isInitialRender => Text("题目排序").fontWeight(FontWeight.Bold) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => SortButton(this, ObservedProperty("", item), ObservedProperty("", index)).build() }
                                    
                                    this.forEachUpdateFunction(elmtId, this.sortsSrc, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text("筛选难度").fontWeight(FontWeight.Bold).margin(top: 9) })
                            this.observeComponentCreation({ elmtId, isInitialRender => Text(diffclut).width(66).height(26).fontSize(13).fontWeight(FontWeight.W600).fontColor(if(diffclut == "简单") {
                                    LCColor.green
                                }
                                else if(diffclut == "中等") {
                                    LCColor.yellow
                                }
                                else if(diffclut == "困难") {
                                    LCColor.red
                                }
                                else {
                                    LCColor.colorPrimary
                                }
                                ).backgroundColor(LCColor.fill3).borderRadius(100).textAlign(TextAlign.Center) }) }.width(100.percent).alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceBetween) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Slider(step: 33.0, value: outSetValue).trackThickness(6).onChange() { a, b => outSetValue = a
                            match(a) {
                                case 0.0 => diffclut = "全部"
                                case 33.0 => diffclut = "简单"
                                case 66.0 => diffclut = "中等"
                                case 99.0 => diffclut = "困难"
                                case _ => diffclut = "全部"
                            } } })
                    this.observeComponentCreation({ elmtId, isInitialRender => Text("筛选状态").fontWeight(FontWeight.Bold).margin(top: 15) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                                        Color(0x3F007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                                    }
                                                    ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).fontSize(13).fontColor(if(item.isSelected) {
                                                        Color(0x007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(LCColor.label_secondary)
                                                    }
                                                    ).onClick() { e => resetData(sortsStatusSrc)
                                                        item.isSelected = ! item.isSelected } }) }.padding(right: 5) }) }
                                    
                                    this.forEachUpdateFunction(elmtId, this.sortsStatusSrc, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Text("题目类型").fontWeight(FontWeight.Bold).margin(top: 15) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                                        Color(0x3F007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                                    }
                                                    ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).fontSize(13).fontColor(if(item.isSelected) {
                                                        Color(0x007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(LCColor.label_secondary)
                                                    }
                                                    ).onClick() { e => resetData(sortsType)
                                                        item.isSelected = ! item.isSelected } }) }.padding(right: 5) }) }
                                    
                                    this.forEachUpdateFunction(elmtId, this.sortsType, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Text("筛选标签").fontWeight(FontWeight.Bold).margin(top: 15) })
                    this.observeComponentCreation({ elmtId, isInitialRender => Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterTagBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                                        Color(0x3F007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                                    }
                                                    ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).onClick() { e => item.isSelected = ! item.isSelected }.fontColor(if(item.isSelected) {
                                                        Color(0x007AFF)
                                                    }
                                                    else {
                                                        getResourceColor(LCColor.label_secondary)
                                                    }
                                                    ).fontSize(13) }) }.padding(right: 5, bottom: 10) }) }
                                    
                                    this.forEachUpdateFunction(elmtId, this.tags, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent) }) }.width(100.percent).alignItems(HorizontalAlign.Start).padding(bottom: 50) }) }.width(100.percent).padding(top: 20).scrollable(ScrollDirection.Vertical).scrollBar(BarState.Off).align(Alignment.Top) }) }.height(100.percent).width(100.percent).padding(left: 24, right: 24).justifyContent(FlexAlign.Start)
"#
let handleRenderStr11 = #"
Text(item.title).margin(left: 12).fontSize(15.fp).fontColor(CC.label_primary).fontWeight(FontWeight.Bold).maxLines(1).textOverflow(TextOverflow.Ellipsis)
"#

let changeTrailingExprStr1 = #"

thisView.observeComponentCreation({ elmtId, isInitialRender =>
    
    ForEach {
        let forEachItemGenFunction = {
            content: Int, index: Int =>
            
            thisView.observeComponentCreation({ elmtId, isInitialRender =>
                MenuItem(startIcon: "", content: "${content}", endIcon: "", labelInfo: "", builder: Option.None).selected(content == tabLen).selectIcon(CJResource(app.media.complete_base, 20000, "")).onClick { e => tabLen = content
                    controller.setTabLen(content) }
            })
            
        }
        thisView.forEachUpdateFunction(elmtId,
        [2, 4, 8], itemGenFunc: forEachItemGenFunction)
    }
    
})

"#
let changeTrailingExprStr2 = #"

this.observeComponentCreation({ elmtId, isInitialRender =>
    Image(this.backImage).size(width: 24, height: 24).margin(top: 10, right: 16, bottom: 10, left: 16).fillColor(CC.base).onClick({ e => Router.back() })
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Row { this.observeComponentCreation({ elmtId, isInitialRender => Text(this.title).fontSize(16).lineHeight(24).fontColor(CC.label_primary).textAlign(TextAlign.Center) })
        this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.arrow_down, 20000, "")).width(13).height(8).margin(left: 4) }) }.margin(left: 8).bindMenu(codeSnippets |> map { c: CodeSnippet => UIAction(value: c.lang ?? "", action: { => selectAction(c) }) } |> collectArray)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Image(CJResource(app.media.fileter, 20000, "")).width(24).height(24).margin(top: 15, right: 10).fillColor(CC.base).margin(top: 10, right: 16, bottom: 10, left: 16).bindMenu(builder: bind(settingsMenu, this))
})

"#
let changeTrailingExprStr3 = #"

match(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
    setCodeSnippet(codeSnippet)
    viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController))) {
    case cv: CustomView =>
    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
    CustomView.create(cv)
    ViewStackProcessor.StopGetAccessRecording()
    case vb: ViewBuilder =>
    vb.build()
    case _ => LegalCallCheck.check(CodeEditorNavigation(this, title: stateVarDecl_lang_, codeSnippets: ObservedProperty("", codeSnippets), selectAction: ObservedProperty("", { codeSnippet => saveCode()
        setCodeSnippet(codeSnippet)
        viewModel.saveLastLangSlug(langSlug) }), fontSize: stateVarDecl_fontSize_, tabLen: stateVarDecl_tabLen_, controller: ObservedProperty("", editorKitController)))
}


match(EditorKit(this, editorKitController: ObservedProperty("", editorKitController))) {
    case cv: CustomView =>
    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
    CustomView.create(cv)
    ViewStackProcessor.StopGetAccessRecording()
    case vb: ViewBuilder =>
    vb.build()
    case _ => LegalCallCheck.check(EditorKit(this, editorKitController: ObservedProperty("", editorKitController)))
}


match(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true))) {
    case cv: CustomView =>
    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
    CustomView.create(cv)
    ViewStackProcessor.StopGetAccessRecording()
    case vb: ViewBuilder =>
    vb.build()
    case _ => LegalCallCheck.check(CodeBar(this, consoleClick: ObservedProperty("", openConsole), revertClick: ObservedProperty("", revert), runClick: ObservedProperty("", runAction), submitClick: ObservedProperty("", submitAction), showConsole: ObservedProperty("", questionDetail?.enableRunCode ?? true)))
}

this.observeComponentCreation({ elmtId, isInitialRender =>
    If {
        
        if(showKeyboardBar) {
            this.ifElseBranchUpdateFunction(0, { =>
                
                
                match(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) }))) {
                    case cv: CustomView =>
                    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    CustomView.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                    case vb: ViewBuilder =>
                    vb.build()
                    case _ => LegalCallCheck.check(KeyboardBar(this, tabLength: stateVarDecl_tabLen_, callback: ObservedProperty("", { item, offset => editorKitController.insertTextOnCursor(item, offset: offset) })))
                }
                
            })
            
        }
        else
        {
            If.branchId(1)
        }
        
    }
})

"#
let changeTrailingExprStr4 = #"

thisView.observeComponentCreation({ elmtId, isInitialRender =>
    If {
        
        if(index == 0) {
            thisView.ifElseBranchUpdateFunction(0, { =>
                
                thisView.observeComponentCreation({ elmtId, isInitialRender =>
                    TextArea(text: testCase).layoutWeight(1).onChange({ text => testCase = text })
                })
                
            })
            
        }
        else
        {
            thisView.ifElseBranchUpdateFunction(1, { =>
                
                thisView.observeComponentCreation({ elmtId, isInitialRender =>
                    If {
                        
                        if(submission.id == "-1") {
                            thisView.ifElseBranchUpdateFunction(0, { =>
                                
                                thisView.observeComponentCreation({ elmtId, isInitialRender =>
                                    Text("请先运行您的代码").align(Alignment.Center)
                                })
                                
                            })
                            
                        }
                        else
                        {
                            thisView.ifElseBranchUpdateFunction(1, { =>
                                
                                
                                match(RunResultCard(thisView, submission: stateVarDecl_submission_)) {
                                    case cv: CustomView =>
                                    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                    CustomView.create(cv)
                                    ViewStackProcessor.StopGetAccessRecording()
                                    case vb: ViewBuilder =>
                                    vb.build()
                                    case _ => LegalCallCheck.check(RunResultCard(thisView, submission: stateVarDecl_submission_))
                                }
                                
                            })
                            
                        }
                        
                    }
                })
                
                
            })
            
        }
        
    }
})


"#
let changeTrailingExprStr5 = #"
this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex() { this.observeComponentCreation({ elmtId, isInitialRender => Stack(Alignment.BottomEnd) { this.observeComponentCreation({ elmtId, isInitialRender => Image(itemInfo.avatar).width(36).height(36).borderRadius(100).alt(CJResource(app.media.profile_avatar, 20000, "")) })
                this.observeComponentCreation({ elmtId, isInitialRender => If { if(itemInfo.isOfficial) {
                            this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.profile_ic_base_vip, 20000, "")).width(12).height(12) }) })
                        }
                        else {
                            If.branchId(1)
                        }
                    } }) }.flexShrink(0) })
        this.observeComponentCreation({ elmtId, isInitialRender => Column(3) { this.observeComponentCreation({ elmtId, isInitialRender => Text(itemInfo.title).fontSize(17).fontWeight(FontWeight.Bold).fontColor(LCColor.label_primary).textOverflow(TextOverflow.Ellipsis).maxLines(1) })
                this.observeComponentCreation({ elmtId, isInitialRender => Row(2) { this.observeComponentCreation({ elmtId, isInitialRender => If { if(itemInfo.isSubscribed) {
                                    this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Text("我的关注·").fontSize(11).fontColor(LCColor.green) }) })
                                }
                                else {
                                    If.branchId(1)
                                }
                            } })
                        this.observeComponentCreation({ elmtId, isInitialRender => Text("${itemInfo.name}").fontSize(11).fontColor(LCColor.label_secondary).textOverflow(TextOverflow.Ellipsis).maxLines(1) })
                        this.observeComponentCreation({ elmtId, isInitialRender => If { if(! itemInfo.medalIcon.isEmpty()) {
                                    this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Image(itemInfo.medalIcon).height(11).width(11) }) })
                                }
                                else {
                                    If.branchId(1)
                                }
                            } })
                        this.observeComponentCreation({ elmtId, isInitialRender => Text("${itemInfo.describe}").fontSize(11).fontColor(LCColor.label_secondary).margin(top: 3) }) } }) }.flexShrink(1).alignItems(HorizontalAlign.Start).margin(left: 8) }) }.width(100.percent)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween)) { this.observeComponentCreation({ elmtId, isInitialRender => Text(itemInfo.content.replace("\n", "")).maxLines(3).textOverflow(TextOverflow.Ellipsis).fontSize(14).fontColor(LCColor.label_secondary).lineHeight(24).margin(right: 5) })
        this.observeComponentCreation({ elmtId, isInitialRender => If { if(! itemInfo.imgCover.isEmpty()) {
                    this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => If { if(itemInfo.articleType == "LEETBOOK") {
                                    this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Image(itemInfo.imgCover).width(76).height(101).flexShrink(0).borderRadius(13) }) })
                                }
                                else {
                                    this.ifElseBranchUpdateFunction(1, { => this.observeComponentCreation({ elmtId, isInitialRender => Image(itemInfo.imgCover).width(110).height(84).flexShrink(0).borderRadius(13) }) })
                                }
                            } }) })
                }
                else {
                    If.branchId(1)
                }
            } }) }.margin(top: 10)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    If {
        
        if(itemInfo.isVideo && ! itemInfo.videoCover.isEmpty()) {
            this.ifElseBranchUpdateFunction(0, { =>
                
                this.observeComponentCreation({ elmtId, isInitialRender =>
                    Stack() { this.observeComponentCreation({ elmtId, isInitialRender => Image(itemInfo.videoCover).width(100.percent).aspectRatio(1.77).alt(CJResource(app.media.placeHolder, 20000, "")) })
                        this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.vector_ic_play_circle_fill, 20000, "")).height(60).width(60) }) }.margin(top: 6)
                })
                
            })
            
        }
        else
        {
            If.branchId(1)
        }
        
    }
})


this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => If { if(itemInfo.articleType == "SOLUTION") {
                    this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Row(6) { this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.vector_ic_console, 20000, "")).width(13).height(13) })
                                this.observeComponentCreation({ elmtId, isInitialRender => Text("题解").fontColor(LCColor.colorPrimary).maxLines(1).fontSize(11) }) }.justifyContent(FlexAlign.Center).backgroundColor(0x265AC8FA).borderRadius(100).padding(top: 4, right: 10, bottom: 4, left: 10).margin(right: 8, bottom: 10) }) })
                }
                else if(itemInfo.articleType == "LEETBOOK") {
                    this.ifElseBranchUpdateFunction(1, { => this.observeComponentCreation({ elmtId, isInitialRender => Row(6) { this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.ic_home_book_open, 20000, "")).width(13).height(13) })
                                this.observeComponentCreation({ elmtId, isInitialRender => Text("LeetBook").fontColor(LCColor.colorPrimary).maxLines(1).fontSize(11) }) }.justifyContent(FlexAlign.Center).backgroundColor(0x265AC8FA).borderRadius(100).padding(top: 4, right: 10, bottom: 4, left: 10).margin(right: 8, bottom: 10) }) })
                }
                else {
                    this.ifElseBranchUpdateFunction(2, { => this.observeComponentCreation({ elmtId, isInitialRender => Row(6) { this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.vecotr_ic_home_reply, 20000, "")).width(13).height(13) })
                                this.observeComponentCreation({ elmtId, isInitialRender => Text("讨论").fontColor(LCColor.green).maxLines(1).fontSize(11) }) }.justifyContent(FlexAlign.Center).backgroundColor(0x2633C758).borderRadius(100).padding(top: 4, right: 10, bottom: 4, left: 10).margin(right: 8, bottom: 10) }) })
                }
            } })
        this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: String, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Text(item).padding(top: 4, right: 10, bottom: 4, left: 10).textAlign(TextAlign.Center).fontColor(LCColor.label_secondary).fontSize(11).backgroundColor(LCColor.fill2).maxLines(1).borderRadius(100).margin(right: 8, bottom: 10) }) }
                
                this.forEachUpdateFunction(elmtId, itemInfo.tagList, itemGenFunc: forEachItemGenFunction) } }) }.width(100.percent).margin(top: 12).height(30).clip(true)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    If {
        
        if(let Some(relationQuestion) <- itemInfo.relationQuestion) {
            this.ifElseBranchUpdateFunction(0, { =>
                
                this.observeComponentCreation({ elmtId, isInitialRender =>
                    Row(8) { this.observeComponentCreation({ elmtId, isInitialRender => Image(CJResource(app.media.vector_drawable_link, 20000, "")).width(16).height(16) })
                        this.observeComponentCreation({ elmtId, isInitialRender => Text(relationQuestion.title).maxLines(1).fontColor(LCColor.label_primary).fontSize(13).fontWeight(FontWeight.Bold) }) }.padding(top: 11, right: 13, bottom: 11, left: 16).backgroundColor(LCColor.grey6).borderRadius(8).margin(top: 10).width(100.percent).onClick() { e => Router.push(url: "QuestionDetailPage", params: JsonObject(HashMap < String, JsonValue >([("questionSlug", JsonString(relationQuestion.slug)),("title", JsonString(relationQuestion.title))]))) }
                })
                
            })
            
        }
        else
        {
            If.branchId(1)
        }
        
    }
})


this.observeComponentCreation({ elmtId, isInitialRender =>
    Text(itemInfo.actionDescirbe).fontColor(LCColor.grey2).fontSize(12).margin(top: 10)
})

"#
let changeTrailingExprStr6 = #"
this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("重置").onClick({ e => diffclut = "全部"
        outSetValue = 0.0
        resetData(sortsSrc)
        sortsSrc[0].isSelected = true
        sortsSrc[0].order = "ASC"
        resetData(sortsStatusSrc)
        sortsStatusSrc[0].isSelected = true
        resetData(sortsType)
        sortsType[0].isSelected = true
        var i = 0
        
        while(i < tags.size) {
            tags[i].isSelected = false
            i ++
        }
    })
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("完成").onClick({ e => this.isShowPanel = false
        filterRequestData = createQuestionFilterData() })
})

"#
let changeTrailingExprStr7 = #"

this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("题目排序").fontWeight(FontWeight.Bold)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => SortButton(this, ObservedProperty("", item), ObservedProperty("", index)).build() }
                
                this.forEachUpdateFunction(elmtId, this.sortsSrc, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text("筛选难度").fontWeight(FontWeight.Bold).margin(top: 9) })
        this.observeComponentCreation({ elmtId, isInitialRender => Text(diffclut).width(66).height(26).fontSize(13).fontWeight(FontWeight.W600).fontColor(if(diffclut == "简单") {
                LCColor.green
            }
            else if(diffclut == "中等") {
                LCColor.yellow
            }
            else if(diffclut == "困难") {
                LCColor.red
            }
            else {
                LCColor.colorPrimary
            }
            ).backgroundColor(LCColor.fill3).borderRadius(100).textAlign(TextAlign.Center) }) }.width(100.percent).alignItems(VerticalAlign.Center).justifyContent(FlexAlign.SpaceBetween)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Slider(step: 33.0, value: outSetValue).trackThickness(6).onChange() { a, b => outSetValue = a
        match(a) {
            case 0.0 => diffclut = "全部"
            case 33.0 => diffclut = "简单"
            case 66.0 => diffclut = "中等"
            case 99.0 => diffclut = "困难"
            case _ => diffclut = "全部"
        } }
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("筛选状态").fontWeight(FontWeight.Bold).margin(top: 15)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                    Color(0x3F007AFF)
                                }
                                else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }
                                ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).fontSize(13).fontColor(if(item.isSelected) {
                                    Color(0x007AFF)
                                }
                                else {
                                    getResourceColor(LCColor.label_secondary)
                                }
                                ).onClick() { e => resetData(sortsStatusSrc)
                                    item.isSelected = ! item.isSelected } }) }.padding(right: 5) }) }
                
                this.forEachUpdateFunction(elmtId, this.sortsStatusSrc, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("题目类型").fontWeight(FontWeight.Bold).margin(top: 15)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                    Color(0x3F007AFF)
                                }
                                else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }
                                ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).fontSize(13).fontColor(if(item.isSelected) {
                                    Color(0x007AFF)
                                }
                                else {
                                    getResourceColor(LCColor.label_secondary)
                                }
                                ).onClick() { e => resetData(sortsType)
                                    item.isSelected = ! item.isSelected } }) }.padding(right: 5) }) }
                
                this.forEachUpdateFunction(elmtId, this.sortsType, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Text("筛选标签").fontWeight(FontWeight.Bold).margin(top: 15)
})

this.observeComponentCreation({ elmtId, isInitialRender =>
    Flex(FlexParams(wrap: FlexWrap.Wrap)) { this.observeComponentCreation({ elmtId, isInitialRender => ForEach { let forEachItemGenFunction = { item: FilterTagBean, index: Int64 => this.observeComponentCreation({ elmtId, isInitialRender => Row() { this.observeComponentCreation({ elmtId, isInitialRender => Text(item.name).height(30).backgroundColor(if(item.isSelected) {
                                    Color(0x3F007AFF)
                                }
                                else {
                                    getResourceColor(CJResource(app.color.fill3, 10001, ""))
                                }
                                ).borderRadius(100).padding(left: 12, right: 12).padding(left: 16, right: 16).onClick() { e => item.isSelected = ! item.isSelected }.fontColor(if(item.isSelected) {
                                    Color(0x007AFF)
                                }
                                else {
                                    getResourceColor(LCColor.label_secondary)
                                }
                                ).fontSize(13) }) }.padding(right: 5, bottom: 10) }) }
                
                this.forEachUpdateFunction(elmtId, this.tags, itemGenFunc: forEachItemGenFunction) } }) }.margin(top: 12).width(100.percent)
})

"#

let changeTrailingExprStr8 = #"

match(NavigationComponent(this, title: ObservedProperty("", ""))) {
    case cv: CustomView =>
    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
    CustomView.create(cv)
    ViewStackProcessor.StopGetAccessRecording()
    case vb: ViewBuilder =>
    vb.build()
    case _ => LegalCallCheck.check(NavigationComponent(this, title: ObservedProperty("", "")))
}

this.observeComponentCreation({ elmtId, isInitialRender =>
    Scroll(scroller) { this.observeComponentCreation({ elmtId, isInitialRender => Column(20) { this.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(solution) <- viewModel.solution) {
                            this.ifElseBranchUpdateFunction(0, { => header(this, ObservedProperty("", solution)).build()
                                this.observeComponentCreation({ elmtId, isInitialRender => If { if(let Some(slateValue) <- solution.slateValue) {
                                            this.ifElseBranchUpdateFunction(0, { => this.observeComponentCreation({ elmtId, isInitialRender => Column { match(WebComponent(this, destination: ObservedProperty("", WebDestination.RichEditor(slateValue)))) {
                                                            case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                            CustomView.create(cv)
                                                            ViewStackProcessor.StopGetAccessRecording()
                                                            case vb: ViewBuilder => vb.build()
                                                            case _ => LegalCallCheck.check(WebComponent(this, destination: ObservedProperty("", WebDestination.RichEditor(slateValue))))
                                                        } }.padding(left: 20, right: 20) }) })
                                        }
                                        else if(let Some(content) <- solution.content) {
                                            this.ifElseBranchUpdateFunction(1, { => this.observeComponentCreation({ elmtId, isInitialRender => Column { match(MarkdownComponent(this, mdStr: ObservedProperty("", content), markdownConfiguration: ObservedProperty("", markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback)))) {
                                                            case cv: CustomView => ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                                                            CustomView.create(cv)
                                                            ViewStackProcessor.StopGetAccessRecording()
                                                            case vb: ViewBuilder => vb.build()
                                                            case _ => LegalCallCheck.check(MarkdownComponent(this, mdStr: ObservedProperty("", content), markdownConfiguration: ObservedProperty("", markdownConfiguration(tocIndexCallback: tocIndexCallback, imageCallback: imageCallback))))
                                                        } }.padding(left: 20, right: 20) }) })
                                        }
                                        else {
                                            If.branchId(2)
                                        }
                                    } })
                                this.observeComponentCreation({ elmtId, isInitialRender => Text("© 著作权归作者所有").fontSize(13).fontColor(CC.label_tertiary) })
                                this.observeComponentCreation({ elmtId, isInitialRender => Blank(min: navigationHeight()) }) })
                        }
                        else {
                            If.branchId(1)
                        }
                    } }) } }) }.layoutWeight(1).align(Alignment.Top)
})

"#
