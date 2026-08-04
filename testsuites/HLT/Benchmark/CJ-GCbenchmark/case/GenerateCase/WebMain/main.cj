/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.time.*
import std.sync.*

public open class java_lang_Object {

}

public open class java_io_Serializable <: Object {

}

public open class java_lang_Comparable <: Object {

}

public open class java_lang_CharSequence <: Object {

}

public open class java_lang_constant_Constable <: Object {

}

public open class java_lang_constant_ConstantDesc <: Object {

}

public open class java_lang_String <: Object {
public var java_lang_String_value : ?Array<Byte> = None
public var java_lang_String_coder : Byte = 0
public var java_lang_String_hash : Int64 = 0
public var java_lang_String_hashIsZero : Bool = false
public static var java_lang_String_serialVersionUID : Int64 = 0
public static var java_lang_String_COMPACT_STRINGS : Bool = false
public static var java_lang_String_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
public static var java_lang_String_REPL : Rune = ' '
public static var java_lang_String_CASE_INSENSITIVE_ORDER : ?Object = None
public static var java_lang_String_LATIN1 : Byte = 0
public static var java_lang_String_UTF16 : Byte = 0
}

public open class java_lang_reflect_AnnotatedElement <: Object {

}

public open class java_lang_reflect_GenericDeclaration <: Object {

}

public open class java_lang_reflect_Type <: Object {

}

public open class java_lang_invoke_TypeDescriptor <: Object {

}

public open class java_lang_invoke_TypeDescriptor_OfField <: Object {

}

public open class java_lang_Class <: Object {
public static var java_lang_Class_ANNOTATION : Int64 = 0
public static var java_lang_Class_ENUM : Int64 = 0
public static var java_lang_Class_SYNTHETIC : Int64 = 0
public var java_lang_Class_cachedConstructor : ?java_lang_reflect_Constructor = None
public var java_lang_Class_name : ?java_lang_String = None
public var java_lang_Class_module : ?java_lang_Module = None
public var java_lang_Class_classLoader : ?java_lang_ClassLoader = None
public var java_lang_Class_classData : ?Object = None
public var java_lang_Class_packageName : ?java_lang_String = None
public var java_lang_Class_componentType : ?java_lang_Class = None
public static var java_lang_Class_allPermDomain : ?java_security_ProtectionDomain = None
public var java_lang_Class_reflectionData : ?java_lang_ref_SoftReference = None
public var java_lang_Class_classRedefinedCount : Int64 = 0
public var java_lang_Class_genericInfo : ?Object = None
public static var java_lang_Class_EMPTY_CLASS_ARRAY : ?Array<?java_lang_Class> = None
public static var java_lang_Class_serialVersionUID : Int64 = 0
public static var java_lang_Class_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
public static var java_lang_Class_reflectionFactory : ?jdk_internal_reflect_ReflectionFactory = None
public var java_lang_Class_enumConstants : ?Array<?Object> = None
public var java_lang_Class_enumConstantDirectory : ?Object = None
public var java_lang_Class_annotationData : ?Object = None
public var java_lang_Class_annotationType : ?Object = None
public var java_lang_Class_classValueMap : ?Object = None
}

public open class java_lang_Cloneable <: Object {

}

public open class java_lang_ClassLoader <: Object {
public var java_lang_ClassLoader_parent : ?java_lang_ClassLoader = None
public var java_lang_ClassLoader_name : ?java_lang_String = None
public var java_lang_ClassLoader_unnamedModule : ?java_lang_Module = None
public var java_lang_ClassLoader_nameAndId : ?java_lang_String = None
public var java_lang_ClassLoader_parallelLockMap : ?java_util_concurrent_ConcurrentHashMap = None
public var java_lang_ClassLoader_package2certs : ?java_util_concurrent_ConcurrentHashMap = None
public static var java_lang_ClassLoader_nocerts : ?Array<?java_security_cert_Certificate> = None
public var java_lang_ClassLoader_classes : ?java_util_ArrayList = None
public var java_lang_ClassLoader_defaultDomain : ?java_security_ProtectionDomain = None
public var java_lang_ClassLoader_packages : ?java_util_concurrent_ConcurrentHashMap = None
public static var java_lang_ClassLoader_scl : ?java_lang_ClassLoader = None
public var java_lang_ClassLoader_libraries : ?jdk_internal_loader_NativeLibraries = None
public var java_lang_ClassLoader_assertionLock : ?Object = None
public var java_lang_ClassLoader_defaultAssertionStatus : Bool = false
public var java_lang_ClassLoader_packageAssertionStatus : ?Object = None
public var java_lang_ClassLoader_classAssertionStatus : ?Object = None
public var java_lang_ClassLoader_classLoaderValueMap : ?java_util_concurrent_ConcurrentHashMap = None
public static var java_lang_ClassLoader__assertionsDisabled : Bool = false
}

public open class java_lang_System <: Object {
public static var java_lang_System_inHadTurn : ?java_io_InputStream = None
public static var java_lang_System_out : ?java_io_PrintStream = None
public static var java_lang_System_err : ?java_io_PrintStream = None
public static var java_lang_System_NEVER : Int64 = 0
public static var java_lang_System_MAYBE : Int64 = 0
public static var java_lang_System_allowSecurityManager : Int64 = 0
public static var java_lang_System_security : ?java_lang_SecurityManager = None
public static var java_lang_System_cons : ?Object = None
public static var java_lang_System_initialErrStream : ?java_io_PrintStream = None
public static var java_lang_System_props : ?java_util_Properties = None
public static var java_lang_System_lineSeparator : ?java_lang_String = None
public static var java_lang_System_bootLayer : ?java_lang_ModuleLayer = None
}

public open class java_lang_Throwable <: Object {
public static var java_lang_Throwable_serialVersionUID : Int64 = 0
public var java_lang_Throwable_backtrace : ?Object = None
public var java_lang_Throwable_detailMessage : ?java_lang_String = None
public static var java_lang_Throwable_UNASSIGNED_STACK : ?Array<?java_lang_StackTraceElement> = None
public var java_lang_Throwable_cause : ?java_lang_Throwable = None
public var java_lang_Throwable_stackTrace : ?Array<?java_lang_StackTraceElement> = None
public var java_lang_Throwable_depth : Int64 = 0
public static var java_lang_Throwable_SUPPRESSED_SENTINEL : ?Object = None
public var java_lang_Throwable_suppressedExceptions : ?Object = None
public static var java_lang_Throwable_NULL_CAUSE_MESSAGE : ?java_lang_String = None
public static var java_lang_Throwable_SELF_SUPPRESSION_MESSAGE : ?java_lang_String = None
public static var java_lang_Throwable_CAUSE_CAPTION : ?java_lang_String = None
public static var java_lang_Throwable_SUPPRESSED_CAPTION : ?java_lang_String = None
public static var java_lang_Throwable_EMPTY_THROWABLE_ARRAY : ?Array<?java_lang_Throwable> = None
public static var java_lang_Throwable__assertionsDisabled : Bool = false
}

public open class java_lang_Error <: java_lang_Throwable {
public static var java_lang_Error_serialVersionUID : Int64 = 0
}

public open class java_lang_ThreadDeath <: java_lang_Error {
public static var java_lang_ThreadDeath_serialVersionUID : Int64 = 0
}

public open class java_lang_Exception <: java_lang_Throwable {
public static var java_lang_Exception_serialVersionUID : Int64 = 0
}

public open class java_lang_RuntimeException <: java_lang_Exception {
public static var java_lang_RuntimeException_serialVersionUID : Int64 = 0
}

public open class java_lang_SecurityManager <: Object {
public var java_lang_SecurityManager_initialized : Bool = false
public static var java_lang_SecurityManager_rootGroup : ?java_lang_ThreadGroup = None
public static var java_lang_SecurityManager_packageAccessValid : Bool = false
public static var java_lang_SecurityManager_packageAccess : ?Array<?java_lang_String> = None
public static var java_lang_SecurityManager_packageAccessLock : ?Object = None
public static var java_lang_SecurityManager_packageDefinitionValid : Bool = false
public static var java_lang_SecurityManager_packageDefinition : ?Array<?java_lang_String> = None
public static var java_lang_SecurityManager_packageDefinitionLock : ?Object = None
public static var java_lang_SecurityManager_nonExportedPkgs : ?Object = None
}

public open class java_security_ProtectionDomain <: Object {
public static var java_security_ProtectionDomain_filePermCompatInPD : Bool = false
public var java_security_ProtectionDomain_codesource : ?java_security_CodeSource = None
public var java_security_ProtectionDomain_classloader : ?java_lang_ClassLoader = None
public var java_security_ProtectionDomain_principals : ?Array<?Object> = None
public var java_security_ProtectionDomain_permissions : ?java_security_PermissionCollection = None
public var java_security_ProtectionDomain_hasAllPerm : Bool = false
public var java_security_ProtectionDomain_staticPermissions : Bool = false
public var java_security_ProtectionDomain_key : ?java_security_ProtectionDomain_Key = None
}

public open class java_security_AccessControlContext <: Object {
public var java_security_AccessControlContext_context : ?Array<?java_security_ProtectionDomain> = None
public var java_security_AccessControlContext_isPrivileged : Bool = false
public var java_security_AccessControlContext_isAuthorized : Bool = false
public var java_security_AccessControlContext_privilegedContext : ?java_security_AccessControlContext = None
public var java_security_AccessControlContext_combiner : ?Object = None
public var java_security_AccessControlContext_permissions : ?Array<?java_security_Permission> = None
public var java_security_AccessControlContext_parent : ?java_security_AccessControlContext = None
public var java_security_AccessControlContext_isWrapped : Bool = false
public var java_security_AccessControlContext_isLimited : Bool = false
public var java_security_AccessControlContext_limitedContext : ?Array<?java_security_ProtectionDomain> = None
public static var java_security_AccessControlContext_debugInit : Bool = false
public static var java_security_AccessControlContext_debug : ?sun_security_util_Debug = None
}

public open class java_security_AccessController <: Object {
public static var java_security_AccessController__assertionsDisabled : Bool = false
}

public open class java_security_SecureClassLoader <: java_lang_ClassLoader {
public var java_security_SecureClassLoader_pdcache : ?Object = None
}

public open class java_lang_ReflectiveOperationException <: java_lang_Exception {
public static var java_lang_ReflectiveOperationException_serialVersionUID : Int64 = 0
}

public open class java_lang_ClassNotFoundException <: java_lang_ReflectiveOperationException {
public static var java_lang_ClassNotFoundException_serialVersionUID : Int64 = 0
public static var java_lang_ClassNotFoundException_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
}

public open class java_lang_Record <: Object {

}

public open class java_lang_LinkageError <: java_lang_Error {
public static var java_lang_LinkageError_serialVersionUID : Int64 = 0
}

public open class java_lang_NoClassDefFoundError <: java_lang_LinkageError {
public static var java_lang_NoClassDefFoundError_serialVersionUID : Int64 = 0
}

public open class java_lang_ClassCastException <: java_lang_RuntimeException {
public static var java_lang_ClassCastException_serialVersionUID : Int64 = 0
}

public open class java_lang_ArrayStoreException <: java_lang_RuntimeException {
public static var java_lang_ArrayStoreException_serialVersionUID : Int64 = 0
}

public open class java_lang_VirtualMachineError <: java_lang_Error {
public static var java_lang_VirtualMachineError_serialVersionUID : Int64 = 0
}

public open class java_lang_InternalError <: java_lang_VirtualMachineError {
public static var java_lang_InternalError_serialVersionUID : Int64 = 0
}

public open class java_lang_OutOfMemoryError <: java_lang_VirtualMachineError {
public static var java_lang_OutOfMemoryError_serialVersionUID : Int64 = 0
}

public open class java_lang_StackOverflowError <: java_lang_VirtualMachineError {
public static var java_lang_StackOverflowError_serialVersionUID : Int64 = 0
}

public open class java_lang_IllegalMonitorStateException <: java_lang_RuntimeException {
public static var java_lang_IllegalMonitorStateException_serialVersionUID : Int64 = 0
}

public open class java_lang_ref_Reference <: Object {
public var java_lang_ref_Reference_referent : ?Object = None
public var java_lang_ref_Reference_queue : ?java_lang_ref_ReferenceQueue = None
public var java_lang_ref_Reference_next : ?java_lang_ref_Reference = None
public var java_lang_ref_Reference_discovered : ?java_lang_ref_Reference = None
public static var java_lang_ref_Reference_processPendingLock : ?Object = None
public static var java_lang_ref_Reference_processPendingActive : Bool = false
public static var java_lang_ref_Reference__assertionsDisabled : Bool = false
}

public open class java_lang_ref_SoftReference <: java_lang_ref_Reference {
public static var java_lang_ref_SoftReference_clock : Int64 = 0
public var java_lang_ref_SoftReference_timestamp : Int64 = 0
}

public open class java_lang_ref_WeakReference <: java_lang_ref_Reference {

}

public open class java_lang_ref_FinalReference <: java_lang_ref_Reference {

}

public open class java_lang_ref_PhantomReference <: java_lang_ref_Reference {

}

public open class java_lang_ref_Finalizer <: java_lang_ref_FinalReference {
public static var java_lang_ref_Finalizer_queue : ?java_lang_ref_ReferenceQueue = None
public static var java_lang_ref_Finalizer_unfinalized : ?java_lang_ref_Finalizer = None
public static var java_lang_ref_Finalizer_lock : ?Object = None
public var java_lang_ref_Finalizer_next : ?java_lang_ref_Finalizer = None
public var java_lang_ref_Finalizer_prev : ?java_lang_ref_Finalizer = None
public static var java_lang_ref_Finalizer__assertionsDisabled : Bool = false
}

public open class java_lang_Runnable <: Object {

}

public open class java_lang_Thread <: Object {
public var java_lang_Thread_name : ?java_lang_String = None
public var java_lang_Thread_priority : Int64 = 0
public var java_lang_Thread_daemon : Bool = false
public var java_lang_Thread_interrupted : Bool = false
public var java_lang_Thread_stillborn : Bool = false
public var java_lang_Thread_eetop : Int64 = 0
public var java_lang_Thread_target : ?Object = None
public var java_lang_Thread_group : ?java_lang_ThreadGroup = None
public var java_lang_Thread_contextClassLoader : ?java_lang_ClassLoader = None
public var java_lang_Thread_inheritedAccessControlContext : ?java_security_AccessControlContext = None
public static var java_lang_Thread_threadInitNumber : Int64 = 0
public var java_lang_Thread_threadLocals : ?java_lang_ThreadLocal_ThreadLocalMap = None
public var java_lang_Thread_inheritableThreadLocals : ?java_lang_ThreadLocal_ThreadLocalMap = None
public var java_lang_Thread_stackSize : Int64 = 0
public var java_lang_Thread_tid : Int64 = 0
public static var java_lang_Thread_threadSeqNumber : Int64 = 0
public var java_lang_Thread_threadStatus : Int64 = 0
public var java_lang_Thread_parkBlocker : ?Object = None
public var java_lang_Thread_blocker : ?Object = None
public var java_lang_Thread_blockerLock : ?Object = None
public static var java_lang_Thread_MIN_PRIORITY : Int64 = 0
public static var java_lang_Thread_NORM_PRIORITY : Int64 = 0
public static var java_lang_Thread_MAX_PRIORITY : Int64 = 0
public static var java_lang_Thread_EMPTY_STACK_TRACE : ?Array<?java_lang_StackTraceElement> = None
public var java_lang_Thread_uncaughtExceptionHandler : ?Object = None
public static var java_lang_Thread_defaultUncaughtExceptionHandler : ?Object = None
public var java_lang_Thread_threadLocalRandomSeed : Int64 = 0
public var java_lang_Thread_threadLocalRandomProbe : Int64 = 0
public var java_lang_Thread_threadLocalRandomSecondarySeed : Int64 = 0
}

public open class java_lang_Thread_UncaughtExceptionHandler <: Object {

}

public open class java_lang_ThreadGroup <: Object {
public var java_lang_ThreadGroup_parent : ?java_lang_ThreadGroup = None
public var java_lang_ThreadGroup_name : ?java_lang_String = None
public var java_lang_ThreadGroup_maxPriority : Int64 = 0
public var java_lang_ThreadGroup_destroyed : Bool = false
public var java_lang_ThreadGroup_daemon : Bool = false
public var java_lang_ThreadGroup_nUnstartedThreads : Int64 = 0
public var java_lang_ThreadGroup_nthreads : Int64 = 0
public var java_lang_ThreadGroup_threads : ?Array<?java_lang_Thread> = None
public var java_lang_ThreadGroup_ngroups : Int64 = 0
public var java_lang_ThreadGroup_groups : ?Array<?java_lang_ThreadGroup> = None
}

public open class java_util_Map <: Object {

}

public open class java_util_Dictionary <: Object {

}

public open class java_util_Hashtable <: java_util_Dictionary {
public var java_util_Hashtable_table : ?Array<?java_util_Hashtable_Entry> = None
public var java_util_Hashtable_count : Int64 = 0
public var java_util_Hashtable_threshold : Int64 = 0
public var java_util_Hashtable_loadFactor : Float32 = 0.0
public var java_util_Hashtable_modCount : Int64 = 0
public static var java_util_Hashtable_serialVersionUID : Int64 = 0
public static var java_util_Hashtable_MAX_ARRAY_SIZE : Int64 = 0
public var java_util_Hashtable_keySet : ?Object = None
public var java_util_Hashtable_entrySet : ?Object = None
public var java_util_Hashtable_values : ?Object = None
public static var java_util_Hashtable_KEYS : Int64 = 0
public static var java_util_Hashtable_VALUES : Int64 = 0
public static var java_util_Hashtable_ENTRIES : Int64 = 0
}

public open class java_util_Properties <: java_util_Hashtable {
public static var java_util_Properties_serialVersionUID : Int64 = 0
public static var java_util_Properties_UNSAFE : ?jdk_internal_misc_Unsafe = None
public var java_util_Properties_defaults : ?java_util_Properties = None
public var java_util_Properties_map : ?java_util_concurrent_ConcurrentHashMap = None
}

public open class java_lang_Module <: Object {
public var java_lang_Module_layer : ?java_lang_ModuleLayer = None
public var java_lang_Module_name : ?java_lang_String = None
public var java_lang_Module_loader : ?java_lang_ClassLoader = None
public var java_lang_Module_descriptor : ?java_lang_module_ModuleDescriptor = None
public var java_lang_Module_enableNativeAccess : Bool = false
public static var java_lang_Module_ALL_UNNAMED_MODULE : ?java_lang_Module = None
public static var java_lang_Module_ALL_UNNAMED_MODULE_SET : ?Object = None
public static var java_lang_Module_EVERYONE_MODULE : ?java_lang_Module = None
public static var java_lang_Module_EVERYONE_SET : ?Object = None
public var java_lang_Module_reads : ?Object = None
public var java_lang_Module_openPackages : ?Object = None
public var java_lang_Module_exportedPackages : ?Object = None
public var java_lang_Module_moduleInfoClass : ?java_lang_Class = None
public static var java_lang_Module__assertionsDisabled : Bool = false
}

public open class java_lang_reflect_AccessibleObject <: Object {
public var java_lang_reflect_AccessibleObject_overrideHadTurn : Bool = false
public static var java_lang_reflect_AccessibleObject_reflectionFactory : ?jdk_internal_reflect_ReflectionFactory = None
public var java_lang_reflect_AccessibleObject_accessCheckCache : ?Object = None
public static var java_lang_reflect_AccessibleObject_printStackWhenAccessFails : Bool = false
public static var java_lang_reflect_AccessibleObject_printStackPropertiesSet : Bool = false
}

public open class java_lang_reflect_Member <: Object {
public static var java_lang_reflect_Member_PUBLIC : Int64 = 0
public static var java_lang_reflect_Member_DECLARED : Int64 = 0
}

public open class java_lang_reflect_Field <: java_lang_reflect_AccessibleObject {
public var java_lang_reflect_Field_clazz : ?java_lang_Class = None
public var java_lang_reflect_Field_slot : Int64 = 0
public var java_lang_reflect_Field_name : ?java_lang_String = None
public var java_lang_reflect_Field_typeHadTurn : ?java_lang_Class = None
public var java_lang_reflect_Field_modifiers : Int64 = 0
public var java_lang_reflect_Field_trustedFinal : Bool = false
public var java_lang_reflect_Field_signature : ?java_lang_String = None
public var java_lang_reflect_Field_genericInfo : ?Object = None
public var java_lang_reflect_Field_annotations : ?Array<Byte> = None
public var java_lang_reflect_Field_fieldAccessor : ?Object = None
public var java_lang_reflect_Field_overrideFieldAccessor : ?Object = None
public var java_lang_reflect_Field_root : ?java_lang_reflect_Field = None
public var java_lang_reflect_Field_declaredAnnotations : ?Object = None
public static var java_lang_reflect_Field_PUBLIC : Int64 = 0
public static var java_lang_reflect_Field_DECLARED : Int64 = 0
}

public open class java_lang_reflect_Parameter <: Object {
public var java_lang_reflect_Parameter_name : ?java_lang_String = None
public var java_lang_reflect_Parameter_modifiers : Int64 = 0
public var java_lang_reflect_Parameter_executable : ?java_lang_reflect_Executable = None
public var java_lang_reflect_Parameter_index : Int64 = 0
public var java_lang_reflect_Parameter_parameterTypeCache : ?Object = None
public var java_lang_reflect_Parameter_parameterClassCache : ?java_lang_Class = None
public var java_lang_reflect_Parameter_declaredAnnotations : ?Object = None
}

public open class java_lang_reflect_Executable <: java_lang_reflect_AccessibleObject {
public var java_lang_reflect_Executable_hasRealParameterData : Bool = false
public var java_lang_reflect_Executable_parameters : ?Array<?java_lang_reflect_Parameter> = None
public var java_lang_reflect_Executable_declaredAnnotations : ?Object = None
public static var java_lang_reflect_Executable_PUBLIC : Int64 = 0
public static var java_lang_reflect_Executable_DECLARED : Int64 = 0
}

public open class java_lang_reflect_Method <: java_lang_reflect_Executable {
public var java_lang_reflect_Method_clazz : ?java_lang_Class = None
public var java_lang_reflect_Method_slot : Int64 = 0
public var java_lang_reflect_Method_name : ?java_lang_String = None
public var java_lang_reflect_Method_returnType : ?java_lang_Class = None
public var java_lang_reflect_Method_parameterTypes : ?Array<?java_lang_Class> = None
public var java_lang_reflect_Method_exceptionTypes : ?Array<?java_lang_Class> = None
public var java_lang_reflect_Method_modifiers : Int64 = 0
public var java_lang_reflect_Method_signature : ?java_lang_String = None
public var java_lang_reflect_Method_genericInfo : ?Object = None
public var java_lang_reflect_Method_annotations : ?Array<Byte> = None
public var java_lang_reflect_Method_parameterAnnotations : ?Array<Byte> = None
public var java_lang_reflect_Method_annotationDefault : ?Array<Byte> = None
public var java_lang_reflect_Method_methodAccessor : ?Object = None
public var java_lang_reflect_Method_root : ?java_lang_reflect_Method = None
}

public open class java_lang_reflect_Constructor <: java_lang_reflect_Executable {
public var java_lang_reflect_Constructor_clazz : ?java_lang_Class = None
public var java_lang_reflect_Constructor_slot : Int64 = 0
public var java_lang_reflect_Constructor_parameterTypes : ?Array<?java_lang_Class> = None
public var java_lang_reflect_Constructor_exceptionTypes : ?Array<?java_lang_Class> = None
public var java_lang_reflect_Constructor_modifiers : Int64 = 0
public var java_lang_reflect_Constructor_signature : ?java_lang_String = None
public var java_lang_reflect_Constructor_genericInfo : ?Object = None
public var java_lang_reflect_Constructor_annotations : ?Array<Byte> = None
public var java_lang_reflect_Constructor_parameterAnnotations : ?Array<Byte> = None
public var java_lang_reflect_Constructor_constructorAccessor : ?Object = None
public var java_lang_reflect_Constructor_root : ?java_lang_reflect_Constructor = None
}

public open class jdk_internal_reflect_MagicAccessorImpl <: Object {

}

public open class jdk_internal_reflect_MethodAccessor <: Object {

}

public open class jdk_internal_reflect_MethodAccessorImpl <: jdk_internal_reflect_MagicAccessorImpl {

}

public open class jdk_internal_reflect_ConstructorAccessor <: Object {

}

public open class jdk_internal_reflect_ConstructorAccessorImpl <: jdk_internal_reflect_MagicAccessorImpl {

}

public open class jdk_internal_reflect_DelegatingClassLoader <: java_lang_ClassLoader {

}

public open class jdk_internal_reflect_ConstantPool <: Object {
public var jdk_internal_reflect_ConstantPool_constantPoolOop : ?Object = None
}

public open class jdk_internal_reflect_FieldAccessor <: Object {

}

public open class jdk_internal_reflect_FieldAccessorImpl <: jdk_internal_reflect_MagicAccessorImpl {

}

public open class jdk_internal_reflect_UnsafeFieldAccessorImpl <: jdk_internal_reflect_FieldAccessorImpl {
public static var jdk_internal_reflect_UnsafeFieldAccessorImpl_unsafeHadTurn : ?jdk_internal_misc_Unsafe = None
public var jdk_internal_reflect_UnsafeFieldAccessorImpl_field : ?java_lang_reflect_Field = None
public var jdk_internal_reflect_UnsafeFieldAccessorImpl_fieldOffset : Int64 = 0
public var jdk_internal_reflect_UnsafeFieldAccessorImpl_isFinal : Bool = false
}

public open class jdk_internal_reflect_UnsafeStaticFieldAccessorImpl <: jdk_internal_reflect_UnsafeFieldAccessorImpl {
public var jdk_internal_reflect_UnsafeStaticFieldAccessorImpl_base : ?Object = None
}

public open class java_lang_annotation_Annotation <: Object {

}

public open class jdk_internal_reflect_CallerSensitive <: Object {

}

public open class jdk_internal_reflect_NativeConstructorAccessorImpl <: jdk_internal_reflect_ConstructorAccessorImpl {
public static var jdk_internal_reflect_NativeConstructorAccessorImpl_U : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_reflect_NativeConstructorAccessorImpl_GENERATED_OFFSET : Int64 = 0
public var jdk_internal_reflect_NativeConstructorAccessorImpl_c : ?java_lang_reflect_Constructor = None
public var jdk_internal_reflect_NativeConstructorAccessorImpl_parent : ?jdk_internal_reflect_DelegatingConstructorAccessorImpl = None
public var jdk_internal_reflect_NativeConstructorAccessorImpl_numInvocations : Int64 = 0
public var jdk_internal_reflect_NativeConstructorAccessorImpl_generated : Int64 = 0
}

public open class java_lang_invoke_MethodHandle <: Object {
public var java_lang_invoke_MethodHandle_typeHadTurn : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_MethodHandle_form : ?java_lang_invoke_LambdaForm = None
public var java_lang_invoke_MethodHandle_asTypeCache : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_MethodHandle_customizationCount : Byte = 0
public var java_lang_invoke_MethodHandle_updateInProgress : Bool = false
public static var java_lang_invoke_MethodHandle_FORM_OFFSET : Int64 = 0
public static var java_lang_invoke_MethodHandle_UPDATE_OFFSET : Int64 = 0
public static var java_lang_invoke_MethodHandle__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_DirectMethodHandle <: java_lang_invoke_MethodHandle {
public var java_lang_invoke_DirectMethodHandle_member : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_DirectMethodHandle_crackable : Bool = false
public static var java_lang_invoke_DirectMethodHandle_IMPL_NAMES : ?java_lang_invoke_MemberName_Factory = None
public static var java_lang_invoke_DirectMethodHandle_AF_GETFIELD : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_PUTFIELD : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_GETSTATIC : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_PUTSTATIC : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_GETSTATIC_INIT : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_PUTSTATIC_INIT : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_AF_LIMIT : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_FT_LAST_WRAPPER : Int64 = 0
public static var java_lang_invoke_DirectMethodHandle_FT_UNCHECKED_REF : Int64 = 0
public static var java_lang_invoke_DirectMethodHandle_FT_CHECKED_REF : Int64 = 0
public static var java_lang_invoke_DirectMethodHandle_FT_LIMIT : Int64 = 0
public static var java_lang_invoke_DirectMethodHandle_ACCESSOR_FORMS : ?Array<?java_lang_invoke_LambdaForm> = None
public static var java_lang_invoke_DirectMethodHandle_ALL_WRAPPERS : ?Array<?sun_invoke_util_Wrapper> = None
public static var java_lang_invoke_DirectMethodHandle_NF_internalMemberName : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_internalMemberNameEnsureInit : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_ensureInitialized : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_fieldOffset : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_checkBase : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_staticBase : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_staticOffset : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_checkCast : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_allocateInstance : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_constructorMethod : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_UNSAFE : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_checkReceiver : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NF_LIMIT : Byte = 0
public static var java_lang_invoke_DirectMethodHandle_NFS : ?Array<?java_lang_invoke_LambdaForm_NamedFunction> = None
public static var java_lang_invoke_DirectMethodHandle_OBJ_OBJ_TYPE : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_DirectMethodHandle_LONG_OBJ_TYPE : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_DirectMethodHandle__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_VarHandle <: Object {
public var java_lang_invoke_VarHandle_vform : ?Object = None
public var java_lang_invoke_VarHandle_exact : Bool = false
public var java_lang_invoke_VarHandle_typesAndInvokers : ?Object = None
public static var java_lang_invoke_VarHandle_AIOOBE_SUPPLIER : ?Object = None
public static var java_lang_invoke_VarHandle_VFORM_OFFSET : Int64 = 0
public static var java_lang_invoke_VarHandle__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MemberName <: Object {
public var java_lang_invoke_MemberName_clazz : ?java_lang_Class = None
public var java_lang_invoke_MemberName_name : ?java_lang_String = None
public var java_lang_invoke_MemberName_typeHadTurn : ?Object = None
public var java_lang_invoke_MemberName_flags : Int64 = 0
public var java_lang_invoke_MemberName_method : ?java_lang_invoke_ResolvedMethodName = None
public var java_lang_invoke_MemberName_resolution : ?Object = None
public static var java_lang_invoke_MemberName_MH_INVOKE_MODS : Int64 = 0
public static var java_lang_invoke_MemberName_BRIDGE : Int64 = 0
public static var java_lang_invoke_MemberName_VARARGS : Int64 = 0
public static var java_lang_invoke_MemberName_SYNTHETIC : Int64 = 0
public static var java_lang_invoke_MemberName_ANNOTATION : Int64 = 0
public static var java_lang_invoke_MemberName_ENUM : Int64 = 0
public static var java_lang_invoke_MemberName_CONSTRUCTOR_NAME : ?java_lang_String = None
public static var java_lang_invoke_MemberName_RECOGNIZED_MODIFIERS : Int64 = 0
public static var java_lang_invoke_MemberName_IS_METHOD : Int64 = 0
public static var java_lang_invoke_MemberName_IS_CONSTRUCTOR : Int64 = 0
public static var java_lang_invoke_MemberName_IS_FIELD : Int64 = 0
public static var java_lang_invoke_MemberName_IS_TYPE : Int64 = 0
public static var java_lang_invoke_MemberName_CALLER_SENSITIVE : Int64 = 0
public static var java_lang_invoke_MemberName_TRUSTED_FINAL : Int64 = 0
public static var java_lang_invoke_MemberName_ALL_ACCESS : Int64 = 0
public static var java_lang_invoke_MemberName_ALL_KINDS : Int64 = 0
public static var java_lang_invoke_MemberName_IS_INVOCABLE : Int64 = 0
public static var java_lang_invoke_MemberName_IS_FIELD_OR_METHOD : Int64 = 0
public static var java_lang_invoke_MemberName_SEARCH_ALL_SUPERS : Int64 = 0
public static var java_lang_invoke_MemberName__assertionsDisabled : Bool = false
public static var java_lang_invoke_MemberName_PUBLIC : Int64 = 0
public static var java_lang_invoke_MemberName_DECLARED : Int64 = 0
}

public open class java_lang_invoke_ResolvedMethodName <: Object {

}

public open class java_lang_invoke_MethodHandleNatives <: Object {
public static var java_lang_invoke_MethodHandleNatives_JLA : ?Object = None
public static var java_lang_invoke_MethodHandleNatives__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm <: Object {
public var java_lang_invoke_LambdaForm_arity : Int64 = 0
public var java_lang_invoke_LambdaForm_result : Int64 = 0
public var java_lang_invoke_LambdaForm_forceInline : Bool = false
public var java_lang_invoke_LambdaForm_customized : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_LambdaForm_names : ?Array<?java_lang_invoke_LambdaForm_Name> = None
public var java_lang_invoke_LambdaForm_kind : ?java_lang_invoke_LambdaForm_Kind = None
public var java_lang_invoke_LambdaForm_vmentry : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_LambdaForm_isCompiled : Bool = false
public var java_lang_invoke_LambdaForm_transformCache : ?Object = None
public static var java_lang_invoke_LambdaForm_VOID_RESULT : Int64 = 0
public static var java_lang_invoke_LambdaForm_LAST_RESULT : Int64 = 0
public static var java_lang_invoke_LambdaForm_LF_FAILED : ?jdk_internal_perf_PerfCounter = None
public static var java_lang_invoke_LambdaForm_COMPILE_THRESHOLD : Int64 = 0
public var java_lang_invoke_LambdaForm_invocationCounter : Int64 = 0
public static var java_lang_invoke_LambdaForm_INTERNED_ARGUMENT_LIMIT : Int64 = 0
public static var java_lang_invoke_LambdaForm_INTERNED_ARGUMENTS : ?Array<?Array<?java_lang_invoke_LambdaForm_Name>> = None
public static var java_lang_invoke_LambdaForm_IMPL_NAMES : ?java_lang_invoke_MemberName_Factory = None
public static var java_lang_invoke_LambdaForm_LF_identity : ?Array<?java_lang_invoke_LambdaForm> = None
public static var java_lang_invoke_LambdaForm_LF_zero : ?Array<?java_lang_invoke_LambdaForm> = None
public static var java_lang_invoke_LambdaForm_NF_identity : ?Array<?java_lang_invoke_LambdaForm_NamedFunction> = None
public static var java_lang_invoke_LambdaForm_NF_zero : ?Array<?java_lang_invoke_LambdaForm_NamedFunction> = None
public static var java_lang_invoke_LambdaForm_createFormsLock : ?Object = None
public static var java_lang_invoke_LambdaForm_DEBUG_NAME_COUNTERS : ?java_util_HashMap = None
public static var java_lang_invoke_LambdaForm_DEBUG_NAMES : ?java_util_HashMap = None
public static var java_lang_invoke_LambdaForm_TRACE_INTERPRETER : Bool = false
public static var java_lang_invoke_LambdaForm__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_TypeDescriptor_OfMethod <: Object {

}

public open class java_lang_invoke_MethodType <: Object {
public static var java_lang_invoke_MethodType_serialVersionUID : Int64 = 0
public var java_lang_invoke_MethodType_rtype : ?java_lang_Class = None
public var java_lang_invoke_MethodType_ptypes : ?Array<?java_lang_Class> = None
public var java_lang_invoke_MethodType_form : ?java_lang_invoke_MethodTypeForm = None
public var java_lang_invoke_MethodType_wrapAlt : ?Object = None
public var java_lang_invoke_MethodType_invokers : ?java_lang_invoke_Invokers = None
public var java_lang_invoke_MethodType_methodDescriptor : ?java_lang_String = None
public static var java_lang_invoke_MethodType_MAX_JVM_ARITY : Int64 = 0
public static var java_lang_invoke_MethodType_MAX_MH_ARITY : Int64 = 0
public static var java_lang_invoke_MethodType_MAX_MH_INVOKER_ARITY : Int64 = 0
public static var java_lang_invoke_MethodType_internTable : ?java_lang_invoke_MethodType_ConcurrentWeakInternSet = None
public static var java_lang_invoke_MethodType_NO_PTYPES : ?Array<?java_lang_Class> = None
public static var java_lang_invoke_MethodType_objectOnlyTypes : ?Array<?java_lang_invoke_MethodType> = None
public static var java_lang_invoke_MethodType_METHOD_HANDLE_ARRAY : ?Array<?java_lang_Class> = None
public static var java_lang_invoke_MethodType_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
public static var java_lang_invoke_MethodType__assertionsDisabled : Bool = false
}

public open class java_lang_BootstrapMethodError <: java_lang_LinkageError {
public static var java_lang_BootstrapMethodError_serialVersionUID : Int64 = 0
}

public open class java_lang_invoke_CallSite <: Object {
public var java_lang_invoke_CallSite_target : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_CallSite_context : ?java_lang_invoke_MethodHandleNatives_CallSiteContext = None
public static var java_lang_invoke_CallSite_GET_TARGET : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_CallSite_THROW_UCS : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_CallSite_TARGET_OFFSET : Int64 = 0
public static var java_lang_invoke_CallSite__assertionsDisabled : Bool = false
}

public open class jdk_internal_invoke_NativeEntryPoint <: Object {
public var jdk_internal_invoke_NativeEntryPoint_shadowSpace : Int64 = 0
public var jdk_internal_invoke_NativeEntryPoint_argMoves : ?Array<Int64> = None
public var jdk_internal_invoke_NativeEntryPoint_returnMoves : ?Array<Int64> = None
public var jdk_internal_invoke_NativeEntryPoint_needTransition : Bool = false
public var jdk_internal_invoke_NativeEntryPoint_methodType : ?java_lang_invoke_MethodType = None
public var jdk_internal_invoke_NativeEntryPoint_name : ?java_lang_String = None
}

public open class java_lang_invoke_MethodHandleNatives_CallSiteContext <: Object {

}

public open class java_lang_invoke_ConstantCallSite <: java_lang_invoke_CallSite {
public static var java_lang_invoke_ConstantCallSite_UNSAFE : ?jdk_internal_misc_Unsafe = None
public var java_lang_invoke_ConstantCallSite_isFrozen : Bool = false
}

public open class java_lang_invoke_MutableCallSite <: java_lang_invoke_CallSite {
public static var java_lang_invoke_MutableCallSite_STORE_BARRIER : ?java_util_concurrent_atomic_AtomicInteger = None
}

public open class java_lang_invoke_VolatileCallSite <: java_lang_invoke_CallSite {

}

public open class java_lang_AssertionStatusDirectives <: Object {
public var java_lang_AssertionStatusDirectives_classes : ?Array<?java_lang_String> = None
public var java_lang_AssertionStatusDirectives_classEnabled : ?Array<Bool> = None
public var java_lang_AssertionStatusDirectives_packages : ?Array<?java_lang_String> = None
public var java_lang_AssertionStatusDirectives_packageEnabled : ?Array<Bool> = None
public var java_lang_AssertionStatusDirectives_deflt : Bool = false
}

public open class java_lang_Appendable <: Object {

}

public open class java_lang_AbstractStringBuilder <: Object {
public var java_lang_AbstractStringBuilder_value : ?Array<Byte> = None
public var java_lang_AbstractStringBuilder_coder : Byte = 0
public var java_lang_AbstractStringBuilder_count : Int64 = 0
public static var java_lang_AbstractStringBuilder_EMPTYVALUE : ?Array<Byte> = None
public static var java_lang_AbstractStringBuilder_MAX_ARRAY_SIZE : Int64 = 0
}

public open class java_lang_StringBuffer <: java_lang_AbstractStringBuilder {
public var java_lang_StringBuffer_toStringCache : ?java_lang_String = None
public static var java_lang_StringBuffer_serialVersionUID : Int64 = 0
public static var java_lang_StringBuffer_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
}

public open class java_lang_StringBuilder <: java_lang_AbstractStringBuilder {
public static var java_lang_StringBuilder_serialVersionUID : Int64 = 0
}

public open class jdk_internal_misc_UnsafeConstants <: Object {
public static var jdk_internal_misc_UnsafeConstants_ADDRESS_SIZE0 : Int64 = 0
public static var jdk_internal_misc_UnsafeConstants_PAGE_SIZE : Int64 = 0
public static var jdk_internal_misc_UnsafeConstants_BIG_ENDIAN : Bool = false
public static var jdk_internal_misc_UnsafeConstants_UNALIGNED_ACCESS : Bool = false
public static var jdk_internal_misc_UnsafeConstants_DATA_CACHE_LINE_FLUSH_SIZE : Int64 = 0
}

public open class jdk_internal_misc_Unsafe <: Object {
public static var jdk_internal_misc_Unsafe_theUnsafe : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_misc_Unsafe_INVALID_FIELD_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_BOOLEAN_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_BYTE_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_SHORT_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_CHAR_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_INT_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_LONG_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_FLOAT_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_DOUBLE_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_OBJECT_BASE_OFFSET : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_BOOLEAN_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_BYTE_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_SHORT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_CHAR_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_INT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_LONG_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_FLOAT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_DOUBLE_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ARRAY_OBJECT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_misc_Unsafe_ADDRESS_SIZE : Int64 = 0
}

public open class jdk_internal_module_Modules <: Object {
public static var jdk_internal_module_Modules_JLA : ?Object = None
public static var jdk_internal_module_Modules_JLMA : ?Object = None
public static var jdk_internal_module_Modules_topLayer : ?java_lang_ModuleLayer = None
public static var jdk_internal_module_Modules__assertionsDisabled : Bool = false
}

public open class java_lang_AutoCloseable <: Object {

}

public open class java_io_Closeable <: Object {

}

public open class java_io_InputStream <: Object {
public static var java_io_InputStream_MAX_SKIP_BUFFER_SIZE : Int64 = 0
public static var java_io_InputStream_DEFAULT_BUFFER_SIZE : Int64 = 0
public static var java_io_InputStream_MAX_BUFFER_SIZE : Int64 = 0
}

public open class java_io_ByteArrayInputStream <: java_io_InputStream {
public var java_io_ByteArrayInputStream_buf : ?Array<Byte> = None
public var java_io_ByteArrayInputStream_pos : Int64 = 0
public var java_io_ByteArrayInputStream_mark : Int64 = 0
public var java_io_ByteArrayInputStream_count : Int64 = 0
}

public open class java_net_URL <: Object {
public static var java_net_URL_BUILTIN_HANDLERS_PREFIX : ?java_lang_String = None
public static var java_net_URL_serialVersionUID : Int64 = 0
public static var java_net_URL_protocolPathProp : ?java_lang_String = None
public var java_net_URL_protocol : ?java_lang_String = None
public var java_net_URL_host : ?java_lang_String = None
public var java_net_URL_port : Int64 = 0
public var java_net_URL_file : ?java_lang_String = None
public var java_net_URL_query : ?java_lang_String = None
public var java_net_URL_authority : ?java_lang_String = None
public var java_net_URL_path : ?java_lang_String = None
public var java_net_URL_userInfo : ?java_lang_String = None
public var java_net_URL_ref : ?java_lang_String = None
public var java_net_URL_hostAddress : ?Object = None
public var java_net_URL_handler : ?java_net_URLStreamHandler = None
public var java_net_URL_hashCode : Int64 = 0
public var java_net_URL_tempState : ?Object = None
public static var java_net_URL_factory : ?Object = None
public static var java_net_URL_defaultFactory : ?Object = None
public static var java_net_URL_gate : ?java_lang_ThreadLocal = None
public static var java_net_URL_handlers : ?java_util_Hashtable = None
public static var java_net_URL_streamHandlerLock : ?Object = None
public static var java_net_URL_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
}

public open class java_util_jar_Manifest <: Object {
public var java_util_jar_Manifest_attr : ?Object = None
public var java_util_jar_Manifest_entries : ?Object = None
public var java_util_jar_Manifest_jv : ?Object = None
}

public open class jdk_internal_loader_BuiltinClassLoader <: java_security_SecureClassLoader {
public var jdk_internal_loader_BuiltinClassLoader_parent : ?jdk_internal_loader_BuiltinClassLoader = None
public var jdk_internal_loader_BuiltinClassLoader_ucp : ?jdk_internal_loader_URLClassPath = None
public static var jdk_internal_loader_BuiltinClassLoader_packageToModule : ?Object = None
public var jdk_internal_loader_BuiltinClassLoader_nameToModule : ?Object = None
public var jdk_internal_loader_BuiltinClassLoader_moduleToReader : ?Object = None
public var jdk_internal_loader_BuiltinClassLoader_resourceCache : ?java_lang_ref_SoftReference = None
public static var jdk_internal_loader_BuiltinClassLoader__assertionsDisabled : Bool = false
}

public open class jdk_internal_loader_ClassLoaders <: Object {
public static var jdk_internal_loader_ClassLoaders_JLA : ?Object = None
public static var jdk_internal_loader_ClassLoaders_BOOT_LOADER : ?jdk_internal_loader_ClassLoaders_BootClassLoader = None
public static var jdk_internal_loader_ClassLoaders_PLATFORM_LOADER : ?jdk_internal_loader_ClassLoaders_PlatformClassLoader = None
public static var jdk_internal_loader_ClassLoaders_APP_LOADER : ?jdk_internal_loader_ClassLoaders_AppClassLoader = None
}

public open class jdk_internal_loader_ClassLoaders_AppClassLoader <: jdk_internal_loader_BuiltinClassLoader {

}

public open class jdk_internal_loader_ClassLoaders_PlatformClassLoader <: jdk_internal_loader_BuiltinClassLoader {

}

public open class java_security_CodeSource <: Object {
public static var java_security_CodeSource_serialVersionUID : Int64 = 0
public var java_security_CodeSource_location : ?java_net_URL = None
public var java_security_CodeSource_signers : ?Array<?Object> = None
public var java_security_CodeSource_certs : ?Array<?java_security_cert_Certificate> = None
public var java_security_CodeSource_sp : ?Object = None
public var java_security_CodeSource_factory : ?Object = None
public var java_security_CodeSource_locationNoFragString : ?java_lang_String = None
}

public open class java_util_concurrent_ConcurrentMap <: Object {

}

public open class java_util_AbstractMap <: Object {
public var java_util_AbstractMap_keySet : ?Object = None
public var java_util_AbstractMap_values : ?Object = None
}

public open class java_util_concurrent_ConcurrentHashMap <: java_util_AbstractMap {
public static var java_util_concurrent_ConcurrentHashMap_serialVersionUID : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MAXIMUM_CAPACITY : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_DEFAULT_CAPACITY : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MAX_ARRAY_SIZE : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_DEFAULT_CONCURRENCY_LEVEL : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_LOAD_FACTOR : Float32 = 0.0
public static var java_util_concurrent_ConcurrentHashMap_TREEIFY_THRESHOLD : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_UNTREEIFY_THRESHOLD : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MIN_TREEIFY_CAPACITY : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MIN_TRANSFER_STRIDE : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_RESIZE_STAMP_BITS : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MAX_RESIZERS : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_RESIZE_STAMP_SHIFT : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_MOVED : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_TREEBIN : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_RESERVED : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_HASH_BITS : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_NCPU : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
public var java_util_concurrent_ConcurrentHashMap_table : ?Array<?java_util_concurrent_ConcurrentHashMap_Node> = None
public var java_util_concurrent_ConcurrentHashMap_nextTable : ?Array<?java_util_concurrent_ConcurrentHashMap_Node> = None
public var java_util_concurrent_ConcurrentHashMap_baseCount : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_sizeCtl : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_transferIndex : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_cellsBusy : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_counterCells : ?Array<?java_util_concurrent_ConcurrentHashMap_CounterCell> = None
public var java_util_concurrent_ConcurrentHashMap_keySet : ?Object = None
public var java_util_concurrent_ConcurrentHashMap_values : ?java_util_concurrent_ConcurrentHashMap_ValuesView = None
public var java_util_concurrent_ConcurrentHashMap_entrySet : ?Object = None
public static var java_util_concurrent_ConcurrentHashMap_U : ?jdk_internal_misc_Unsafe = None
public static var java_util_concurrent_ConcurrentHashMap_SIZECTL : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_TRANSFERINDEX : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_BASECOUNT : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_CELLSBUSY : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_CELLVALUE : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_ABASE : Int64 = 0
public static var java_util_concurrent_ConcurrentHashMap_ASHIFT : Int64 = 0
}

public open class java_lang_Iterable <: Object {

}

public open class java_util_Collection <: Object {

}

public open class java_util_List <: Object {

}

public open class java_util_RandomAccess <: Object {

}

public open class java_util_AbstractCollection <: Object {

}

public open class java_util_AbstractList <: java_util_AbstractCollection {
public var java_util_AbstractList_modCount : Int64 = 0
}

public open class java_util_ArrayList <: java_util_AbstractList {
public static var java_util_ArrayList_serialVersionUID : Int64 = 0
public static var java_util_ArrayList_DEFAULT_CAPACITY : Int64 = 0
public static var java_util_ArrayList_EMPTY_ELEMENTDATA : ?Array<?Object> = None
public static var java_util_ArrayList_DEFAULTCAPACITY_EMPTY_ELEMENTDATA : ?Array<?Object> = None
public var java_util_ArrayList_elementData : ?Array<?Object> = None
public var java_util_ArrayList_size : Int64 = 0
}

public open class java_lang_StackTraceElement <: Object {
public var java_lang_StackTraceElement_declaringClassObject : ?java_lang_Class = None
public var java_lang_StackTraceElement_classLoaderName : ?java_lang_String = None
public var java_lang_StackTraceElement_moduleName : ?java_lang_String = None
public var java_lang_StackTraceElement_moduleVersion : ?java_lang_String = None
public var java_lang_StackTraceElement_declaringClass : ?java_lang_String = None
public var java_lang_StackTraceElement_methodName : ?java_lang_String = None
public var java_lang_StackTraceElement_fileName : ?java_lang_String = None
public var java_lang_StackTraceElement_lineNumber : Int64 = 0
public var java_lang_StackTraceElement_format : Byte = 0
public static var java_lang_StackTraceElement_BUILTIN_CLASS_LOADER : Byte = 0
public static var java_lang_StackTraceElement_JDK_NON_UPGRADEABLE_MODULE : Byte = 0
public static var java_lang_StackTraceElement_serialVersionUID : Int64 = 0
}

public open class java_nio_Buffer <: Object {
public static var java_nio_Buffer_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var java_nio_Buffer_SCOPED_MEMORY_ACCESS : ?jdk_internal_misc_ScopedMemoryAccess = None
public static var java_nio_Buffer_SPLITERATOR_CHARACTERISTICS : Int64 = 0
public var java_nio_Buffer_mark : Int64 = 0
public var java_nio_Buffer_position : Int64 = 0
public var java_nio_Buffer_limit : Int64 = 0
public var java_nio_Buffer_capacity : Int64 = 0
public var java_nio_Buffer_address : Int64 = 0
public var java_nio_Buffer_segment : ?Object = None
public static var java_nio_Buffer__assertionsDisabled : Bool = false
}

public open class java_lang_StackWalker <: Object {
public static var java_lang_StackWalker_DEFAULT_EMPTY_OPTION : ?java_util_EnumSet = None
public static var java_lang_StackWalker_DEFAULT_WALKER : ?java_lang_StackWalker = None
public var java_lang_StackWalker_options : ?Object = None
public var java_lang_StackWalker_extendedOption : ?Object = None
public var java_lang_StackWalker_estimateDepth : Int64 = 0
public var java_lang_StackWalker_retainClassRef : Bool = false
}

public open class java_lang_StackStreamFactory_AbstractStackWalker <: Object {
public var java_lang_StackStreamFactory_AbstractStackWalker_walker : ?java_lang_StackWalker = None
public var java_lang_StackStreamFactory_AbstractStackWalker_thread : ?java_lang_Thread = None
public var java_lang_StackStreamFactory_AbstractStackWalker_maxDepth : Int64 = 0
public var java_lang_StackStreamFactory_AbstractStackWalker_mode : Int64 = 0
public var java_lang_StackStreamFactory_AbstractStackWalker_depth : Int64 = 0
public var java_lang_StackStreamFactory_AbstractStackWalker_frameBuffer : ?Object = None
public var java_lang_StackStreamFactory_AbstractStackWalker_anchor : Int64 = 0
}

public open class java_lang_StackWalker_StackFrame <: Object {

}

public open class java_lang_StackFrameInfo <: Object {
public static var java_lang_StackFrameInfo_JLIA : ?Object = None
public var java_lang_StackFrameInfo_retainClassRef : Bool = false
public var java_lang_StackFrameInfo_memberName : ?Object = None
public var java_lang_StackFrameInfo_bci : Int64 = 0
public var java_lang_StackFrameInfo_ste : ?java_lang_StackTraceElement = None
}

public open class java_lang_LiveStackFrame <: Object {

}

public open class java_lang_LiveStackFrameInfo <: java_lang_StackFrameInfo {
public static var java_lang_LiveStackFrameInfo_EMPTY_ARRAY : ?Array<?Object> = None
public static var java_lang_LiveStackFrameInfo_MODE_INTERPRETED : Int64 = 0
public static var java_lang_LiveStackFrameInfo_MODE_COMPILED : Int64 = 0
public var java_lang_LiveStackFrameInfo_monitors : ?Array<?Object> = None
public var java_lang_LiveStackFrameInfo_locals : ?Array<?Object> = None
public var java_lang_LiveStackFrameInfo_operands : ?Array<?Object> = None
public var java_lang_LiveStackFrameInfo_mode : Int64 = 0
}

public open class java_util_concurrent_locks_AbstractOwnableSynchronizer <: Object {
public static var java_util_concurrent_locks_AbstractOwnableSynchronizer_serialVersionUID : Int64 = 0
public var java_util_concurrent_locks_AbstractOwnableSynchronizer_exclusiveOwnerThread : ?java_lang_Thread = None
}

public open class java_lang_Boolean <: Object {
public static var java_lang_Boolean_TRUE : ?java_lang_Boolean = None
public static var java_lang_Boolean_FALSE : ?java_lang_Boolean = None
public static var java_lang_Boolean_TYPE : ?java_lang_Class = None
public var java_lang_Boolean_value : Bool = false
public static var java_lang_Boolean_serialVersionUID : Int64 = 0
}

public open class java_lang_Character <: Object {
public static var java_lang_Character_MIN_RADIX : Int64 = 0
public static var java_lang_Character_MAX_RADIX : Int64 = 0
public static var java_lang_Character_MIN_VALUE : Rune = ' '
public static var java_lang_Character_MAX_VALUE : Rune = ' '
public static var java_lang_Character_TYPE : ?java_lang_Class = None
public static var java_lang_Character_UNASSIGNED : Byte = 0
public static var java_lang_Character_UPPERCASE_LETTER : Byte = 0
public static var java_lang_Character_LOWERCASE_LETTER : Byte = 0
public static var java_lang_Character_TITLECASE_LETTER : Byte = 0
public static var java_lang_Character_MODIFIER_LETTER : Byte = 0
public static var java_lang_Character_OTHER_LETTER : Byte = 0
public static var java_lang_Character_NON_SPACING_MARK : Byte = 0
public static var java_lang_Character_ENCLOSING_MARK : Byte = 0
public static var java_lang_Character_COMBINING_SPACING_MARK : Byte = 0
public static var java_lang_Character_DECIMAL_DIGIT_NUMBER : Byte = 0
public static var java_lang_Character_LETTER_NUMBER : Byte = 0
public static var java_lang_Character_OTHER_NUMBER : Byte = 0
public static var java_lang_Character_SPACE_SEPARATOR : Byte = 0
public static var java_lang_Character_LINE_SEPARATOR : Byte = 0
public static var java_lang_Character_PARAGRAPH_SEPARATOR : Byte = 0
public static var java_lang_Character_CONTROL : Byte = 0
public static var java_lang_Character_FORMAT : Byte = 0
public static var java_lang_Character_PRIVATE_USE : Byte = 0
public static var java_lang_Character_SURROGATE : Byte = 0
public static var java_lang_Character_DASH_PUNCTUATION : Byte = 0
public static var java_lang_Character_START_PUNCTUATION : Byte = 0
public static var java_lang_Character_END_PUNCTUATION : Byte = 0
public static var java_lang_Character_CONNECTOR_PUNCTUATION : Byte = 0
public static var java_lang_Character_OTHER_PUNCTUATION : Byte = 0
public static var java_lang_Character_MATH_SYMBOL : Byte = 0
public static var java_lang_Character_CURRENCY_SYMBOL : Byte = 0
public static var java_lang_Character_MODIFIER_SYMBOL : Byte = 0
public static var java_lang_Character_OTHER_SYMBOL : Byte = 0
public static var java_lang_Character_INITIAL_QUOTE_PUNCTUATION : Byte = 0
public static var java_lang_Character_FINAL_QUOTE_PUNCTUATION : Byte = 0
public static var java_lang_Character_ERROR : Int64 = 0
public static var java_lang_Character_DIRECTIONALITY_UNDEFINED : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_LEFT_TO_RIGHT : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_RIGHT_TO_LEFT : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_RIGHT_TO_LEFT_ARABIC : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_EUROPEAN_NUMBER : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_EUROPEAN_NUMBER_SEPARATOR : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_EUROPEAN_NUMBER_TERMINATOR : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_ARABIC_NUMBER : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_COMMON_NUMBER_SEPARATOR : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_NONSPACING_MARK : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_BOUNDARY_NEUTRAL : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_PARAGRAPH_SEPARATOR : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_SEGMENT_SEPARATOR : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_WHITESPACE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_OTHER_NEUTRALS : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_LEFT_TO_RIGHT_EMBEDDING : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_LEFT_TO_RIGHT_OVERRIDE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_RIGHT_TO_LEFT_EMBEDDING : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_RIGHT_TO_LEFT_OVERRIDE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_POP_DIRECTIONAL_FORMAT : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_LEFT_TO_RIGHT_ISOLATE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_RIGHT_TO_LEFT_ISOLATE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_FIRST_STRONG_ISOLATE : Byte = 0
public static var java_lang_Character_DIRECTIONALITY_POP_DIRECTIONAL_ISOLATE : Byte = 0
public static var java_lang_Character_MIN_HIGH_SURROGATE : Rune = ' '
public static var java_lang_Character_MAX_HIGH_SURROGATE : Rune = ' '
public static var java_lang_Character_MIN_LOW_SURROGATE : Rune = ' '
public static var java_lang_Character_MAX_LOW_SURROGATE : Rune = ' '
public static var java_lang_Character_MIN_SURROGATE : Rune = ' '
public static var java_lang_Character_MAX_SURROGATE : Rune = ' '
public static var java_lang_Character_MIN_SUPPLEMENTARY_CODE_POINT : Int64 = 0
public static var java_lang_Character_MIN_CODE_POINT : Int64 = 0
public static var java_lang_Character_MAX_CODE_POINT : Int64 = 0
public var java_lang_Character_value : Rune = ' '
public static var java_lang_Character_serialVersionUID : Int64 = 0
public static var java_lang_Character_SIZE : Int64 = 0
public static var java_lang_Character_BYTES : Int64 = 0
public static var java_lang_Character__assertionsDisabled : Bool = false
}

public open class java_lang_Number <: Object {
public static var java_lang_Number_serialVersionUID : Int64 = 0
}

public open class java_lang_Float <: java_lang_Number {
public static var java_lang_Float_POSITIVE_INFINITY : Float32 = 0.0
public static var java_lang_Float_NEGATIVE_INFINITY : Float32 = 0.0
public static var java_lang_Float_NaN : Float32 = 0.0
public static var java_lang_Float_MAX_VALUE : Float32 = 0.0
public static var java_lang_Float_MIN_NORMAL : Float32 = 0.0
public static var java_lang_Float_MIN_VALUE : Float32 = 0.0
public static var java_lang_Float_MAX_EXPONENT : Int64 = 0
public static var java_lang_Float_MIN_EXPONENT : Int64 = 0
public static var java_lang_Float_SIZE : Int64 = 0
public static var java_lang_Float_BYTES : Int64 = 0
public static var java_lang_Float_TYPE : ?java_lang_Class = None
public var java_lang_Float_value : Float32 = 0.0
public static var java_lang_Float_serialVersionUID : Int64 = 0
}

public open class java_lang_Double <: java_lang_Number {
public static var java_lang_Double_POSITIVE_INFINITY : Float64 = 0.0
public static var java_lang_Double_NEGATIVE_INFINITY : Float64 = 0.0
public static var java_lang_Double_NaN : Float64 = 0.0
public static var java_lang_Double_MAX_VALUE : Float64 = 0.0
public static var java_lang_Double_MIN_NORMAL : Float64 = 0.0
public static var java_lang_Double_MIN_VALUE : Float64 = 0.0
public static var java_lang_Double_MAX_EXPONENT : Int64 = 0
public static var java_lang_Double_MIN_EXPONENT : Int64 = 0
public static var java_lang_Double_SIZE : Int64 = 0
public static var java_lang_Double_BYTES : Int64 = 0
public static var java_lang_Double_TYPE : ?java_lang_Class = None
public var java_lang_Double_value : Float64 = 0.0
public static var java_lang_Double_serialVersionUID : Int64 = 0
}

public open class java_lang_Byte <: java_lang_Number {
public static var java_lang_Byte_MIN_VALUE : Byte = 0
public static var java_lang_Byte_MAX_VALUE : Byte = 0
public static var java_lang_Byte_TYPE : ?java_lang_Class = None
public var java_lang_Byte_value : Byte = 0
public static var java_lang_Byte_SIZE : Int64 = 0
public static var java_lang_Byte_BYTES : Int64 = 0
public static var java_lang_Byte_serialVersionUID : Int64 = 0
}

public open class java_lang_Short <: java_lang_Number {
public static var java_lang_Short_MIN_VALUE : Int8 = 0
public static var java_lang_Short_MAX_VALUE : Int8 = 0
public static var java_lang_Short_TYPE : ?java_lang_Class = None
public var java_lang_Short_value : Int8 = 0
public static var java_lang_Short_SIZE : Int64 = 0
public static var java_lang_Short_BYTES : Int64 = 0
public static var java_lang_Short_serialVersionUID : Int64 = 0
}

public open class java_lang_Integer <: java_lang_Number {
public static var java_lang_Integer_MIN_VALUE : Int64 = 0
public static var java_lang_Integer_MAX_VALUE : Int64 = 0
public static var java_lang_Integer_TYPE : ?java_lang_Class = None
public static var java_lang_Integer_digits : ?Array<Rune> = None
public static var java_lang_Integer_DigitTens : ?Array<Byte> = None
public static var java_lang_Integer_DigitOnes : ?Array<Byte> = None
public static var java_lang_Integer_sizeTable : ?Array<Int64> = None
public var java_lang_Integer_value : Int64 = 0
public static var java_lang_Integer_SIZE : Int64 = 0
public static var java_lang_Integer_BYTES : Int64 = 0
public static var java_lang_Integer_serialVersionUID : Int64 = 0
}

public open class java_lang_Long <: java_lang_Number {
public static var java_lang_Long_MIN_VALUE : Int64 = 0
public static var java_lang_Long_MAX_VALUE : Int64 = 0
public static var java_lang_Long_TYPE : ?java_lang_Class = None
public var java_lang_Long_value : Int64 = 0
public static var java_lang_Long_SIZE : Int64 = 0
public static var java_lang_Long_BYTES : Int64 = 0
public static var java_lang_Long_serialVersionUID : Int64 = 0
}

public open class java_util_Iterator <: Object {

}

public open class java_lang_reflect_RecordComponent <: Object {
public var java_lang_reflect_RecordComponent_clazz : ?java_lang_Class = None
public var java_lang_reflect_RecordComponent_name : ?java_lang_String = None
public var java_lang_reflect_RecordComponent_typeHadTurn : ?java_lang_Class = None
public var java_lang_reflect_RecordComponent_accessor : ?java_lang_reflect_Method = None
public var java_lang_reflect_RecordComponent_signature : ?java_lang_String = None
public var java_lang_reflect_RecordComponent_genericInfo : ?Object = None
public var java_lang_reflect_RecordComponent_annotations : ?Array<Byte> = None
public var java_lang_reflect_RecordComponent_typeAnnotations : ?Array<Byte> = None
public var java_lang_reflect_RecordComponent_root : ?java_lang_reflect_RecordComponent = None
public var java_lang_reflect_RecordComponent_declaredAnnotations : ?Object = None
}

public open class jdk_internal_vm_vector_VectorSupport <: Object {
public static var jdk_internal_vm_vector_VectorSupport_U : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ABS : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_NEG : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_SQRT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ADD : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_SUB : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MUL : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_DIV : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MIN : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MAX : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_AND : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_OR : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_XOR : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_FMA : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_LSHIFT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_RSHIFT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_URSHIFT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_CAST : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_REINTERPRET : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MASK_TRUECOUNT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MASK_FIRSTTRUE : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_MASK_LASTTRUE : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_TAN : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_TANH : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_SIN : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_SINH : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_COS : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_COSH : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ASIN : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ACOS : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ATAN : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_ATAN2 : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_CBRT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_LOG : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_LOG10 : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_LOG1P : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_POW : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_EXP : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_EXPM1 : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_VECTOR_OP_HYPOT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_eq : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_ne : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_le : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_ge : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_lt : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_gt : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_overflow : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_no_overflow : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_unsigned_compare : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_ule : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_uge : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_ult : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_BT_ugt : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_FLOAT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_DOUBLE : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_BYTE : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_SHORT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_INT : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport_T_LONG : Int64 = 0
public static var jdk_internal_vm_vector_VectorSupport__assertionsDisabled : Bool = false
}

public open class jdk_internal_vm_vector_VectorSupport_VectorPayload <: Object {
public var jdk_internal_vm_vector_VectorSupport_VectorPayload_payload : ?Object = None
}

public open class jdk_internal_vm_vector_VectorSupport_Vector <: jdk_internal_vm_vector_VectorSupport_VectorPayload {

}

public open class jdk_internal_vm_vector_VectorSupport_VectorMask <: jdk_internal_vm_vector_VectorSupport_VectorPayload {

}

public open class jdk_internal_vm_vector_VectorSupport_VectorShuffle <: jdk_internal_vm_vector_VectorSupport_VectorPayload {

}

public open class java_lang_NullPointerException <: java_lang_RuntimeException {
public static var java_lang_NullPointerException_serialVersionUID : Int64 = 0
public var java_lang_NullPointerException_extendedMessageState : Int64 = 0
public var java_lang_NullPointerException_extendedMessage : ?java_lang_String = None
}

public open class java_lang_ArithmeticException <: java_lang_RuntimeException {
public static var java_lang_ArithmeticException_serialVersionUID : Int64 = 0
}

public open class java_io_ObjectStreamField <: Object {
public var java_io_ObjectStreamField_name : ?java_lang_String = None
public var java_io_ObjectStreamField_signature : ?java_lang_String = None
public var java_io_ObjectStreamField_typeHadTurn : ?java_lang_Class = None
public var java_io_ObjectStreamField_typeSignature : ?java_lang_String = None
public var java_io_ObjectStreamField_unshared : Bool = false
public var java_io_ObjectStreamField_field : ?java_lang_reflect_Field = None
public var java_io_ObjectStreamField_offset : Int64 = 0
}

public open class java_util_Comparator <: Object {

}

public open class java_lang_String_CaseInsensitiveComparator <: Object {
public static var java_lang_String_CaseInsensitiveComparator_serialVersionUID : Int64 = 0
}

public open class java_lang_Module_ArchivedData <: Object {
public static var java_lang_Module_ArchivedData_archivedData : ?java_lang_Module_ArchivedData = None
public var java_lang_Module_ArchivedData_allUnnamedModule : ?java_lang_Module = None
public var java_lang_Module_ArchivedData_allUnnamedModules : ?Object = None
public var java_lang_Module_ArchivedData_everyoneModule : ?java_lang_Module = None
public var java_lang_Module_ArchivedData_everyoneSet : ?Object = None
}

public open class jdk_internal_misc_CDS <: Object {
public static var jdk_internal_misc_CDS_isDumpingClassList : Bool = false
public static var jdk_internal_misc_CDS_isDumpingArchive : Bool = false
public static var jdk_internal_misc_CDS_isSharingEnabled : Bool = false
public static var jdk_internal_misc_CDS_DIRECT_HOLDER_CLASS_NAME : ?java_lang_String = None
public static var jdk_internal_misc_CDS_DELEGATING_HOLDER_CLASS_NAME : ?java_lang_String = None
public static var jdk_internal_misc_CDS_BASIC_FORMS_HOLDER_CLASS_NAME : ?java_lang_String = None
public static var jdk_internal_misc_CDS_INVOKERS_HOLDER_CLASS_NAME : ?java_lang_String = None
public static var jdk_internal_misc_CDS_excludeFlags : ?Array<?java_lang_String> = None
}

public open class java_util_Set <: Object {

}

public open class java_util_ImmutableCollections_AbstractImmutableCollection <: java_util_AbstractCollection {

}

public open class java_util_ImmutableCollections_AbstractImmutableSet <: java_util_ImmutableCollections_AbstractImmutableCollection {

}

public open class java_util_ImmutableCollections_Set12 <: java_util_ImmutableCollections_AbstractImmutableSet {
public var java_util_ImmutableCollections_Set12_e0 : ?Object = None
public var java_util_ImmutableCollections_Set12_e1 : ?Object = None
}

public open class java_util_Objects <: Object {

}

public open class java_util_ImmutableCollections <: Object {
public static var java_util_ImmutableCollections_SALT32L : Int64 = 0
public static var java_util_ImmutableCollections_REVERSE : Bool = false
public static var java_util_ImmutableCollections_archivedObjects : ?Array<?Object> = None
public static var java_util_ImmutableCollections_EMPTY : ?Object = None
public static var java_util_ImmutableCollections_EMPTY_LIST : ?java_util_ImmutableCollections_ListN = None
public static var java_util_ImmutableCollections_EMPTY_LIST_NULLS : ?java_util_ImmutableCollections_ListN = None
public static var java_util_ImmutableCollections_EMPTY_SET : ?java_util_ImmutableCollections_SetN = None
public static var java_util_ImmutableCollections_EMPTY_MAP : ?java_util_ImmutableCollections_MapN = None
public static var java_util_ImmutableCollections_EXPAND_FACTOR : Int64 = 0
public static var java_util_ImmutableCollections__assertionsDisabled : Bool = false
}

public open class java_util_ImmutableCollections_AbstractImmutableList <: java_util_ImmutableCollections_AbstractImmutableCollection {

}

public open class java_util_ImmutableCollections_ListN <: java_util_ImmutableCollections_AbstractImmutableList {
public var java_util_ImmutableCollections_ListN_elements : ?Array<?Object> = None
public var java_util_ImmutableCollections_ListN_allowNulls : Bool = false
}

public open class java_util_ImmutableCollections_SetN <: java_util_ImmutableCollections_AbstractImmutableSet {
public var java_util_ImmutableCollections_SetN_elements : ?Array<?Object> = None
public var java_util_ImmutableCollections_SetN_size : Int64 = 0
}

public open class java_util_ImmutableCollections_AbstractImmutableMap <: java_util_AbstractMap {

}

public open class java_util_ImmutableCollections_MapN <: java_util_ImmutableCollections_AbstractImmutableMap {
public var java_util_ImmutableCollections_MapN_table : ?Array<?Object> = None
public var java_util_ImmutableCollections_MapN_size : Int64 = 0
}

public open class jdk_internal_access_JavaLangReflectAccess <: Object {

}

public open class java_lang_reflect_ReflectAccess <: Object {

}

public open class jdk_internal_access_SharedSecrets <: Object {
public static var jdk_internal_access_SharedSecrets_lookup : ?java_lang_invoke_MethodHandles_Lookup = None
public static var jdk_internal_access_SharedSecrets_javaAWTAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaAWTFontAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaBeansAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaLangAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaLangInvokeAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaLangModuleAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaLangRefAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaLangReflectAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaIOAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaIOFileDescriptorAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaIOFilePermissionAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaIORandomAccessFileAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaObjectInputStreamReadString : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaObjectInputStreamAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaObjectInputFilterAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaNetInetAddressAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaNetHttpCookieAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaNetUriAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaNetURLAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaNioAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaUtilCollectionAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaUtilJarAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaUtilZipFileAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaUtilResourceBundleAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaSecurityAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaSecuritySignatureAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaSecuritySpecAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaxCryptoSealedObjectAccess : ?Object = None
public static var jdk_internal_access_SharedSecrets_javaxCryptoSpecAccess : ?Object = None
}

public open class java_lang_invoke_MethodHandles <: Object {
public static var java_lang_invoke_MethodHandles_IMPL_NAMES : ?java_lang_invoke_MemberName_Factory = None
public static var java_lang_invoke_MethodHandles_ACCESS_PERMISSION : ?java_security_Permission = None
public static var java_lang_invoke_MethodHandles_IDENTITY_MHS : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_MethodHandles_ZERO_MHS : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_MethodHandles__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MemberName_Factory <: Object {
public static var java_lang_invoke_MemberName_Factory_INSTANCE : ?java_lang_invoke_MemberName_Factory = None
public static var java_lang_invoke_MemberName_Factory_ALLOWED_FLAGS : Int64 = 0
public static var java_lang_invoke_MemberName_Factory__assertionsDisabled : Bool = false
}

public open class java_security_Guard <: Object {

}

public open class java_security_Permission <: Object {
public static var java_security_Permission_serialVersionUID : Int64 = 0
public var java_security_Permission_name : ?java_lang_String = None
}

public open class java_security_BasicPermission <: java_security_Permission {
public static var java_security_BasicPermission_serialVersionUID : Int64 = 0
public var java_security_BasicPermission_wildcard : Bool = false
public var java_security_BasicPermission_path : ?java_lang_String = None
public var java_security_BasicPermission_exitVM : Bool = false
}

public open class java_lang_reflect_ReflectPermission <: java_security_BasicPermission {
public static var java_lang_reflect_ReflectPermission_serialVersionUID : Int64 = 0
}

public open class java_lang_StringLatin1 <: Object {
public static var java_lang_StringLatin1__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MethodHandles_Lookup <: Object {
public var java_lang_invoke_MethodHandles_Lookup_lookupClass : ?java_lang_Class = None
public var java_lang_invoke_MethodHandles_Lookup_prevLookupClass : ?java_lang_Class = None
public var java_lang_invoke_MethodHandles_Lookup_allowedModes : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_PUBLIC : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_PRIVATE : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_PROTECTED : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_PACKAGE : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_MODULE : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_UNCONDITIONAL : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_ORIGINAL : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_ALL_MODES : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_FULL_POWER_MODES : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_TRUSTED : Int64 = 0
public var java_lang_invoke_MethodHandles_Lookup_cachedProtectionDomain : ?java_security_ProtectionDomain = None
public static var java_lang_invoke_MethodHandles_Lookup_IMPL_LOOKUP : ?java_lang_invoke_MethodHandles_Lookup = None
public static var java_lang_invoke_MethodHandles_Lookup_PUBLIC_LOOKUP : ?java_lang_invoke_MethodHandles_Lookup = None
public static var java_lang_invoke_MethodHandles_Lookup_LOOKASIDE_TABLE : ?java_util_concurrent_ConcurrentHashMap = None
public static var java_lang_invoke_MethodHandles_Lookup__assertionsDisabled : Bool = false
}

public open class jdk_internal_reflect_Reflection <: Object {
public static var jdk_internal_reflect_Reflection_fieldFilterMap : ?Object = None
public static var jdk_internal_reflect_Reflection_methodFilterMap : ?Object = None
public static var jdk_internal_reflect_Reflection_WILDCARD : ?java_lang_String = None
public static var jdk_internal_reflect_Reflection_ALL_MEMBERS : ?Object = None
}

public open class java_lang_Math <: Object {
public static var java_lang_Math_E : Float64 = 0.0
public static var java_lang_Math_PI : Float64 = 0.0
public static var java_lang_Math_DEGREES_TO_RADIANS : Float64 = 0.0
public static var java_lang_Math_RADIANS_TO_DEGREES : Float64 = 0.0
public static var java_lang_Math_negativeZeroFloatBits : Int64 = 0
public static var java_lang_Math_negativeZeroDoubleBits : Int64 = 0
public static var java_lang_Math_twoToTheDoubleScaleUp : Float64 = 0.0
public static var java_lang_Math_twoToTheDoubleScaleDown : Float64 = 0.0
public static var java_lang_Math__assertionsDisabled : Bool = false
}

public open class java_util_HashMap <: java_util_AbstractMap {
public static var java_util_HashMap_serialVersionUID : Int64 = 0
public static var java_util_HashMap_DEFAULT_INITIAL_CAPACITY : Int64 = 0
public static var java_util_HashMap_MAXIMUM_CAPACITY : Int64 = 0
public static var java_util_HashMap_DEFAULT_LOAD_FACTOR : Float32 = 0.0
public static var java_util_HashMap_TREEIFY_THRESHOLD : Int64 = 0
public static var java_util_HashMap_UNTREEIFY_THRESHOLD : Int64 = 0
public static var java_util_HashMap_MIN_TREEIFY_CAPACITY : Int64 = 0
public var java_util_HashMap_table : ?Array<?java_util_HashMap_Node> = None
public var java_util_HashMap_entrySet : ?Object = None
public var java_util_HashMap_size : Int64 = 0
public var java_util_HashMap_modCount : Int64 = 0
public var java_util_HashMap_threshold : Int64 = 0
public var java_util_HashMap_loadFactor : Float32 = 0.0
}

public open class java_util_AbstractSet <: java_util_AbstractCollection {

}

public open class java_util_ImmutableCollections_MapN_1 <: java_util_AbstractSet {
public var java_util_ImmutableCollections_MapN_1_this_0 : ?java_util_ImmutableCollections_MapN = None
}

public open class java_util_ImmutableCollections_MapN_MapNIterator <: Object {
public var java_util_ImmutableCollections_MapN_MapNIterator_remaining : Int64 = 0
public var java_util_ImmutableCollections_MapN_MapNIterator_idx : Int64 = 0
public var java_util_ImmutableCollections_MapN_MapNIterator_this_0 : ?java_util_ImmutableCollections_MapN = None
}

public open class java_util_Map_Entry <: Object {

}

public open class java_util_KeyValueHolder <: Object {
public var java_util_KeyValueHolder_key : ?Object = None
public var java_util_KeyValueHolder_value : ?Object = None
}

public open class java_util_HashMap_Node <: Object {
public var java_util_HashMap_Node_hash : Int64 = 0
public var java_util_HashMap_Node_key : ?Object = None
public var java_util_HashMap_Node_value : ?Object = None
public var java_util_HashMap_Node_next : ?java_util_HashMap_Node = None
}

public open class java_util_LinkedHashMap_Entry <: java_util_HashMap_Node {
public var java_util_LinkedHashMap_Entry_before : ?java_util_LinkedHashMap_Entry = None
public var java_util_LinkedHashMap_Entry_after : ?java_util_LinkedHashMap_Entry = None
}

public open class java_util_HashMap_TreeNode <: java_util_LinkedHashMap_Entry {
public var java_util_HashMap_TreeNode_parent : ?java_util_HashMap_TreeNode = None
public var java_util_HashMap_TreeNode_left : ?java_util_HashMap_TreeNode = None
public var java_util_HashMap_TreeNode_right : ?java_util_HashMap_TreeNode = None
public var java_util_HashMap_TreeNode_prev : ?java_util_HashMap_TreeNode = None
public var java_util_HashMap_TreeNode_red : Bool = false
public static var java_util_HashMap_TreeNode__assertionsDisabled : Bool = false
}

public open class java_lang_Runtime <: Object {
public static var java_lang_Runtime_currentRuntime : ?java_lang_Runtime = None
public static var java_lang_Runtime_version : ?java_lang_Runtime_Version = None
}

public open class java_util_concurrent_locks_Lock <: Object {

}

public open class java_util_concurrent_locks_ReentrantLock <: Object {
public static var java_util_concurrent_locks_ReentrantLock_serialVersionUID : Int64 = 0
public var java_util_concurrent_locks_ReentrantLock_sync : ?Object = None
}

public open class java_util_concurrent_ConcurrentHashMap_Segment <: java_util_concurrent_locks_ReentrantLock {
public static var java_util_concurrent_ConcurrentHashMap_Segment_serialVersionUID : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_Segment_loadFactor : Float32 = 0.0
}

public open class java_util_concurrent_ConcurrentHashMap_CounterCell <: Object {
public var java_util_concurrent_ConcurrentHashMap_CounterCell_value : Int64 = 0
}

public open class java_util_concurrent_ConcurrentHashMap_Node <: Object {
public var java_util_concurrent_ConcurrentHashMap_Node_hash : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_Node_key : ?Object = None
public var java_util_concurrent_ConcurrentHashMap_Node_val : ?Object = None
public var java_util_concurrent_ConcurrentHashMap_Node_next : ?java_util_concurrent_ConcurrentHashMap_Node = None
}

public open class java_util_concurrent_locks_LockSupport <: Object {
public static var java_util_concurrent_locks_LockSupport_U : ?jdk_internal_misc_Unsafe = None
public static var java_util_concurrent_locks_LockSupport_PARKBLOCKER : Int64 = 0
public static var java_util_concurrent_locks_LockSupport_TID : Int64 = 0
}

public open class java_util_concurrent_ConcurrentHashMap_ReservationNode <: java_util_concurrent_ConcurrentHashMap_Node {

}

public open class java_security_PrivilegedAction <: Object {

}

public open class jdk_internal_reflect_ReflectionFactory_GetReflectionFactoryAction <: Object {

}

public open class jdk_internal_reflect_ReflectionFactory <: Object {
public static var jdk_internal_reflect_ReflectionFactory_initted : Bool = false
public static var jdk_internal_reflect_ReflectionFactory_soleInstance : ?jdk_internal_reflect_ReflectionFactory = None
public static var jdk_internal_reflect_ReflectionFactory_hasStaticInitializerMethod : ?java_lang_reflect_Method = None
public static var jdk_internal_reflect_ReflectionFactory_noInflation : Bool = false
public static var jdk_internal_reflect_ReflectionFactory_inflationThreshold : Int64 = 0
public static var jdk_internal_reflect_ReflectionFactory_disableSerialConstructorChecks : Bool = false
public var jdk_internal_reflect_ReflectionFactory_langReflectAccess : ?Object = None
public static var jdk_internal_reflect_ReflectionFactory__assertionsDisabled : Bool = false
}

public open class java_lang_ref_Reference_ReferenceHandler <: java_lang_Thread {

}

public open class jdk_internal_ref_Cleaner <: java_lang_ref_PhantomReference {
public static var jdk_internal_ref_Cleaner_dummyQueue : ?java_lang_ref_ReferenceQueue = None
public static var jdk_internal_ref_Cleaner_first : ?jdk_internal_ref_Cleaner = None
public var jdk_internal_ref_Cleaner_next : ?jdk_internal_ref_Cleaner = None
public var jdk_internal_ref_Cleaner_prev : ?jdk_internal_ref_Cleaner = None
public var jdk_internal_ref_Cleaner_thunk : ?Object = None
}

public open class java_lang_ref_ReferenceQueue <: Object {
public static var java_lang_ref_ReferenceQueue_NULL : ?java_lang_ref_ReferenceQueue = None
public static var java_lang_ref_ReferenceQueue_ENQUEUED : ?java_lang_ref_ReferenceQueue = None
public var java_lang_ref_ReferenceQueue_lock : ?java_lang_ref_ReferenceQueue_Lock = None
public var java_lang_ref_ReferenceQueue_head : ?java_lang_ref_Reference = None
public var java_lang_ref_ReferenceQueue_queueLength : Int64 = 0
public static var java_lang_ref_ReferenceQueue__assertionsDisabled : Bool = false
}

public open class java_lang_ref_ReferenceQueue_Null <: java_lang_ref_ReferenceQueue {

}

public open class java_lang_ref_ReferenceQueue_Lock <: Object {

}

public open class jdk_internal_access_JavaLangRefAccess <: Object {

}

public open class java_lang_ref_Reference_1 <: Object {

}

public open class java_lang_ref_Finalizer_FinalizerThread <: java_lang_Thread {
public var java_lang_ref_Finalizer_FinalizerThread_running : Bool = false
}

public open class jdk_internal_access_JavaLangAccess <: Object {

}

public open class jdk_internal_misc_VM <: Object {
public static var jdk_internal_misc_VM_JAVA_LANG_SYSTEM_INITED : Int64 = 0
public static var jdk_internal_misc_VM_MODULE_SYSTEM_INITED : Int64 = 0
public static var jdk_internal_misc_VM_SYSTEM_LOADER_INITIALIZING : Int64 = 0
public static var jdk_internal_misc_VM_SYSTEM_BOOTED : Int64 = 0
public static var jdk_internal_misc_VM_SYSTEM_SHUTDOWN : Int64 = 0
public static var jdk_internal_misc_VM_initLevel : Int64 = 0
public static var jdk_internal_misc_VM_lock : ?Object = None
public static var jdk_internal_misc_VM_directMemory : Int64 = 0
public static var jdk_internal_misc_VM_pageAlignDirectMemory : Bool = false
public static var jdk_internal_misc_VM_classFileMajorVersion : Int64 = 0
public static var jdk_internal_misc_VM_classFileMinorVersion : Int64 = 0
public static var jdk_internal_misc_VM_PREVIEW_MINOR_VERSION : Int64 = 0
public static var jdk_internal_misc_VM_savedProps : ?Object = None
public static var jdk_internal_misc_VM_finalRefCount : Int64 = 0
public static var jdk_internal_misc_VM_peakFinalRefCount : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_ALIVE : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_TERMINATED : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_RUNNABLE : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_BLOCKED_ON_MONITOR_ENTER : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_WAITING_INDEFINITELY : Int64 = 0
public static var jdk_internal_misc_VM_JVMTI_THREAD_STATE_WAITING_WITH_TIMEOUT : Int64 = 0
}

public open class java_lang_System_2 <: Object {

}

public open class jdk_internal_util_SystemProps <: Object {
public static var jdk_internal_util_SystemProps__assertionsDisabled : Bool = false
}

public open class jdk_internal_util_SystemProps_Raw <: Object {
public static var jdk_internal_util_SystemProps_Raw__display_country_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__display_language_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__display_script_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__display_variant_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__file_encoding_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__file_separator_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__format_country_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__format_language_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__format_script_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__format_variant_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__ftp_nonProxyHosts_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__ftp_proxyHost_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__ftp_proxyPort_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__http_nonProxyHosts_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__http_proxyHost_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__http_proxyPort_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__https_proxyHost_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__https_proxyPort_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__java_io_tmpdir_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__line_separator_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__os_arch_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__os_name_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__os_version_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__path_separator_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__socksNonProxyHosts_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__socksProxyHost_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__socksProxyPort_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_arch_abi_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_arch_data_model_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_cpu_endian_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_cpu_isalist_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_io_unicode_encoding_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_jnu_encoding_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_os_patch_level_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_stderr_encoding_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__sun_stdout_encoding_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__user_dir_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__user_home_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw__user_name_NDX : Int64 = 0
public static var jdk_internal_util_SystemProps_Raw_FIXED_LENGTH : Int64 = 0
public var jdk_internal_util_SystemProps_Raw_platformProps : ?Array<?java_lang_String> = None
}

public open class java_lang_StringConcatHelper <: Object {
public static var java_lang_StringConcatHelper_LATIN1 : Int64 = 0
public static var java_lang_StringConcatHelper_UTF16 : Int64 = 0
public static var java_lang_StringConcatHelper_UNSAFE : ?jdk_internal_misc_Unsafe = None
}

public open class java_lang_VersionProps <: Object {
public static var java_lang_VersionProps_launcher_name : ?java_lang_String = None
public static var java_lang_VersionProps_java_version : ?java_lang_String = None
public static var java_lang_VersionProps_java_version_date : ?java_lang_String = None
public static var java_lang_VersionProps_java_runtime_name : ?java_lang_String = None
public static var java_lang_VersionProps_java_runtime_version : ?java_lang_String = None
public static var java_lang_VersionProps_VERSION_NUMBER : ?java_lang_String = None
public static var java_lang_VersionProps_VERSION_SPECIFICATION : ?java_lang_String = None
public static var java_lang_VersionProps_VERSION_BUILD : ?java_lang_String = None
public static var java_lang_VersionProps_VERSION_PRE : ?java_lang_String = None
public static var java_lang_VersionProps_VERSION_OPT : ?java_lang_String = None
public static var java_lang_VersionProps_isLTS : Bool = false
public static var java_lang_VersionProps_CLASSFILE_MAJOR_MINOR : ?java_lang_String = None
public static var java_lang_VersionProps_VENDOR : ?java_lang_String = None
public static var java_lang_VersionProps_VENDOR_URL : ?java_lang_String = None
public static var java_lang_VersionProps_VENDOR_VERSION : ?java_lang_String = None
public static var java_lang_VersionProps_VENDOR_URL_BUG : ?java_lang_String = None
public static var java_lang_VersionProps_VENDOR_URL_VM_BUG : ?java_lang_String = None
}

public open class java_util_Arrays <: Object {
public static var java_util_Arrays_MIN_ARRAY_SORT_GRAN : Int64 = 0
public static var java_util_Arrays_INSERTIONSORT_THRESHOLD : Int64 = 0
public static var java_util_Arrays__assertionsDisabled : Bool = false
}

public open class java_lang_CharacterData <: Object {

}

public open class java_lang_CharacterDataLatin1 <: java_lang_CharacterData {
public static var java_lang_CharacterDataLatin1_DIGITS : ?Array<Byte> = None
public static var java_lang_CharacterDataLatin1_sharpsMap : ?Array<Rune> = None
public static var java_lang_CharacterDataLatin1_instance : ?java_lang_CharacterDataLatin1 = None
public static var java_lang_CharacterDataLatin1_A : ?Array<Int64> = None
public static var java_lang_CharacterDataLatin1_B : ?Array<Byte> = None
}

public open class java_lang_Integer_IntegerCache <: Object {
public static var java_lang_Integer_IntegerCache_low : Int64 = 0
public static var java_lang_Integer_IntegerCache_high : Int64 = 0
public static var java_lang_Integer_IntegerCache_cache : ?Array<?java_lang_Integer> = None
public static var java_lang_Integer_IntegerCache_archivedCache : ?Array<?java_lang_Integer> = None
public static var java_lang_Integer_IntegerCache__assertionsDisabled : Bool = false
}

public open class java_util_HashMap_EntrySet <: java_util_AbstractSet {
public var java_util_HashMap_EntrySet_this_0 : ?java_util_HashMap = None
}

public open class java_util_HashMap_HashIterator <: Object {
public var java_util_HashMap_HashIterator_next : ?java_util_HashMap_Node = None
public var java_util_HashMap_HashIterator_current : ?java_util_HashMap_Node = None
public var java_util_HashMap_HashIterator_expectedModCount : Int64 = 0
public var java_util_HashMap_HashIterator_index : Int64 = 0
public var java_util_HashMap_HashIterator_this_0 : ?java_util_HashMap = None
}

public open class java_util_HashMap_EntryIterator <: java_util_HashMap_HashIterator {
public var java_util_HashMap_EntryIterator_this_0 : ?java_util_HashMap = None
}

public open class jdk_internal_util_StaticProperty <: Object {
public static var jdk_internal_util_StaticProperty_JAVA_HOME : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_USER_HOME : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_USER_DIR : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_USER_NAME : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_JAVA_LIBRARY_PATH : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_SUN_BOOT_LIBRARY_PATH : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_JDK_SERIAL_FILTER : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_JDK_SERIAL_FILTER_FACTORY : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_JAVA_IO_TMPDIR : ?java_lang_String = None
public static var jdk_internal_util_StaticProperty_NATIVE_ENCODING : ?java_lang_String = None
}

public open class java_io_FileInputStream <: java_io_InputStream {
public static var java_io_FileInputStream_DEFAULT_BUFFER_SIZE : Int64 = 0
public var java_io_FileInputStream_fd : ?java_io_FileDescriptor = None
public var java_io_FileInputStream_path : ?java_lang_String = None
public var java_io_FileInputStream_channel : ?java_nio_channels_FileChannel = None
public var java_io_FileInputStream_closeLock : ?Object = None
public var java_io_FileInputStream_closed : Bool = false
}

public open class java_io_FileDescriptor <: Object {
public var java_io_FileDescriptor_fd : Int64 = 0
public var java_io_FileDescriptor_handle : Int64 = 0
public var java_io_FileDescriptor_parent : ?Object = None
public var java_io_FileDescriptor_otherParents : ?Object = None
public var java_io_FileDescriptor_closed : Bool = false
public var java_io_FileDescriptor_append : Bool = false
public var java_io_FileDescriptor_cleanup : ?jdk_internal_ref_PhantomCleanable = None
public static var java_io_FileDescriptor_inHadTurn : ?java_io_FileDescriptor = None
public static var java_io_FileDescriptor_out : ?java_io_FileDescriptor = None
public static var java_io_FileDescriptor_err : ?java_io_FileDescriptor = None
}

public open class jdk_internal_access_JavaIOFileDescriptorAccess <: Object {

}

public open class java_io_FileDescriptor_1 <: Object {

}

public open class java_io_Flushable <: Object {

}

public open class java_io_OutputStream <: Object {

}

public open class java_io_FileOutputStream <: java_io_OutputStream {
public static var java_io_FileOutputStream_fdAccess : ?Object = None
public var java_io_FileOutputStream_fd : ?java_io_FileDescriptor = None
public var java_io_FileOutputStream_channel : ?java_nio_channels_FileChannel = None
public var java_io_FileOutputStream_path : ?java_lang_String = None
public var java_io_FileOutputStream_closeLock : ?Object = None
public var java_io_FileOutputStream_closed : Bool = false
}

public open class java_io_FilterInputStream <: java_io_InputStream {
public var java_io_FilterInputStream_inHadTurn : ?java_io_InputStream = None
}

public open class java_io_BufferedInputStream <: java_io_FilterInputStream {
public static var java_io_BufferedInputStream_DEFAULT_BUFFER_SIZE : Int64 = 0
public static var java_io_BufferedInputStream_U : ?jdk_internal_misc_Unsafe = None
public static var java_io_BufferedInputStream_BUF_OFFSET : Int64 = 0
public var java_io_BufferedInputStream_buf : ?Array<Byte> = None
public var java_io_BufferedInputStream_count : Int64 = 0
public var java_io_BufferedInputStream_pos : Int64 = 0
public var java_io_BufferedInputStream_markpos : Int64 = 0
public var java_io_BufferedInputStream_marklimit : Int64 = 0
}

public open class java_io_FilterOutputStream <: java_io_OutputStream {
public var java_io_FilterOutputStream_out : ?java_io_OutputStream = None
public var java_io_FilterOutputStream_closed : Bool = false
public var java_io_FilterOutputStream_closeLock : ?Object = None
}

public open class java_io_PrintStream <: java_io_FilterOutputStream {
public var java_io_PrintStream_autoFlush : Bool = false
public var java_io_PrintStream_trouble : Bool = false
public var java_io_PrintStream_formatter : ?Object = None
public var java_io_PrintStream_textOut : ?java_io_BufferedWriter = None
public var java_io_PrintStream_charOut : ?java_io_OutputStreamWriter = None
public var java_io_PrintStream_closing : Bool = false
}

public open class java_io_BufferedOutputStream <: java_io_FilterOutputStream {
public var java_io_BufferedOutputStream_buf : ?Array<Byte> = None
public var java_io_BufferedOutputStream_count : Int64 = 0
}

public open class java_nio_charset_Charset <: Object {
public static var java_nio_charset_Charset_standardProvider : ?java_nio_charset_spi_CharsetProvider = None
public static var java_nio_charset_Charset_zeroAliases : ?Array<?java_lang_String> = None
public static var java_nio_charset_Charset_cache1 : ?Array<?Object> = None
public static var java_nio_charset_Charset_cache2 : ?Array<?Object> = None
public static var java_nio_charset_Charset_gate : ?java_lang_ThreadLocal = None
public static var java_nio_charset_Charset_defaultCharset : ?java_nio_charset_Charset = None
public var java_nio_charset_Charset_name : ?java_lang_String = None
public var java_nio_charset_Charset_aliases : ?Array<?java_lang_String> = None
public var java_nio_charset_Charset_aliasSet : ?Object = None
}

public open class java_nio_charset_spi_CharsetProvider <: Object {

}

public open class sun_nio_cs_StandardCharsets <: java_nio_charset_spi_CharsetProvider {
public static var sun_nio_cs_StandardCharsets_aliases_SJIS : ?Array<?java_lang_String> = None
public static var sun_nio_cs_StandardCharsets_aliases_MS932 : ?Array<?java_lang_String> = None
public var sun_nio_cs_StandardCharsets_classMap : ?Object = None
public var sun_nio_cs_StandardCharsets_aliasMap : ?Object = None
public var sun_nio_cs_StandardCharsets_cache : ?Object = None
public static var sun_nio_cs_StandardCharsets_packagePrefix : ?java_lang_String = None
}

public open class java_lang_ThreadLocal <: Object {
public var java_lang_ThreadLocal_threadLocalHashCode : Int64 = 0
public static var java_lang_ThreadLocal_nextHashCode : ?java_util_concurrent_atomic_AtomicInteger = None
public static var java_lang_ThreadLocal_HASH_INCREMENT : Int64 = 0
}

public open class java_util_concurrent_atomic_AtomicInteger <: java_lang_Number {
public static var java_util_concurrent_atomic_AtomicInteger_serialVersionUID : Int64 = 0
public static var java_util_concurrent_atomic_AtomicInteger_U : ?jdk_internal_misc_Unsafe = None
public static var java_util_concurrent_atomic_AtomicInteger_VALUE : Int64 = 0
public var java_util_concurrent_atomic_AtomicInteger_value : Int64 = 0
}

public open class sun_nio_cs_HistoricallyNamedCharset <: Object {

}

public open class sun_nio_cs_Unicode <: java_nio_charset_Charset {

}

public open class sun_nio_cs_UTF_8 <: sun_nio_cs_Unicode {
public static var sun_nio_cs_UTF_8_INSTANCE : ?sun_nio_cs_UTF_8 = None
}

public open class java_io_Writer <: Object {
public var java_io_Writer_writeBuffer : ?Array<Rune> = None
public static var java_io_Writer_WRITE_BUFFER_SIZE : Int64 = 0
public var java_io_Writer_lock : ?Object = None
}

public open class java_io_OutputStreamWriter <: java_io_Writer {
public var java_io_OutputStreamWriter_se : ?sun_nio_cs_StreamEncoder = None
}

public open class sun_nio_cs_StreamEncoder <: java_io_Writer {
public static var sun_nio_cs_StreamEncoder_DEFAULT_BYTE_BUFFER_SIZE : Int64 = 0
public var sun_nio_cs_StreamEncoder_closed : Bool = false
public var sun_nio_cs_StreamEncoder_cs : ?java_nio_charset_Charset = None
public var sun_nio_cs_StreamEncoder_encoder : ?java_nio_charset_CharsetEncoder = None
public var sun_nio_cs_StreamEncoder_bb : ?java_nio_ByteBuffer = None
public var sun_nio_cs_StreamEncoder_out : ?java_io_OutputStream = None
public var sun_nio_cs_StreamEncoder_ch : ?Object = None
public var sun_nio_cs_StreamEncoder_haveLeftoverChar : Bool = false
public var sun_nio_cs_StreamEncoder_leftoverChar : Rune = ' '
public var sun_nio_cs_StreamEncoder_lcb : ?Object = None
public static var sun_nio_cs_StreamEncoder__assertionsDisabled : Bool = false
}

public open class java_nio_charset_CharsetEncoder <: Object {
public var java_nio_charset_CharsetEncoder_charset : ?java_nio_charset_Charset = None
public var java_nio_charset_CharsetEncoder_averageBytesPerChar : Float32 = 0.0
public var java_nio_charset_CharsetEncoder_maxBytesPerChar : Float32 = 0.0
public var java_nio_charset_CharsetEncoder_replacement : ?Array<Byte> = None
public var java_nio_charset_CharsetEncoder_malformedInputAction : ?java_nio_charset_CodingErrorAction = None
public var java_nio_charset_CharsetEncoder_unmappableCharacterAction : ?java_nio_charset_CodingErrorAction = None
public static var java_nio_charset_CharsetEncoder_ST_RESET : Int64 = 0
public static var java_nio_charset_CharsetEncoder_ST_CODING : Int64 = 0
public static var java_nio_charset_CharsetEncoder_ST_END : Int64 = 0
public static var java_nio_charset_CharsetEncoder_ST_FLUSHED : Int64 = 0
public var java_nio_charset_CharsetEncoder_state : Int64 = 0
public static var java_nio_charset_CharsetEncoder_stateNames : ?Array<?java_lang_String> = None
public var java_nio_charset_CharsetEncoder_cachedDecoder : ?java_lang_ref_WeakReference = None
public static var java_nio_charset_CharsetEncoder__assertionsDisabled : Bool = false
}

public open class sun_nio_cs_UTF_8_Encoder <: java_nio_charset_CharsetEncoder {
public var sun_nio_cs_UTF_8_Encoder_sgp : ?Object = None
}

public open class java_nio_charset_CodingErrorAction <: Object {
public var java_nio_charset_CodingErrorAction_name : ?java_lang_String = None
public static var java_nio_charset_CodingErrorAction_IGNORE : ?java_nio_charset_CodingErrorAction = None
public static var java_nio_charset_CodingErrorAction_REPLACE : ?java_nio_charset_CodingErrorAction = None
public static var java_nio_charset_CodingErrorAction_REPORT : ?java_nio_charset_CodingErrorAction = None
}

public open class java_nio_ByteBuffer <: java_nio_Buffer {
public static var java_nio_ByteBuffer_ARRAY_BASE_OFFSET : Int64 = 0
public var java_nio_ByteBuffer_hb : ?Array<Byte> = None
public var java_nio_ByteBuffer_offset : Int64 = 0
public var java_nio_ByteBuffer_isReadOnly : Bool = false
public var java_nio_ByteBuffer_bigEndian : Bool = false
public var java_nio_ByteBuffer_nativeByteOrder : Bool = false
public static var java_nio_ByteBuffer__assertionsDisabled : Bool = false
}

public open class jdk_internal_misc_ScopedMemoryAccess <: Object {
public static var jdk_internal_misc_ScopedMemoryAccess_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_misc_ScopedMemoryAccess_theScopedMemoryAccess : ?jdk_internal_misc_ScopedMemoryAccess = None
}

public open class jdk_internal_access_JavaNioAccess <: Object {

}

public open class java_nio_Buffer_1 <: Object {

}

public open class java_nio_HeapByteBuffer <: java_nio_ByteBuffer {
public static var java_nio_HeapByteBuffer_ARRAY_BASE_OFFSET : Int64 = 0
public static var java_nio_HeapByteBuffer_ARRAY_INDEX_SCALE : Int64 = 0
public static var java_nio_HeapByteBuffer__assertionsDisabled : Bool = false
}

public open class java_nio_ByteOrder <: Object {
public var java_nio_ByteOrder_name : ?java_lang_String = None
public static var java_nio_ByteOrder_BIG_ENDIAN : ?java_nio_ByteOrder = None
public static var java_nio_ByteOrder_LITTLE_ENDIAN : ?java_nio_ByteOrder = None
public static var java_nio_ByteOrder_NATIVE_ORDER : ?java_nio_ByteOrder = None
}

public open class java_io_BufferedWriter <: java_io_Writer {
public var java_io_BufferedWriter_out : ?java_io_Writer = None
public var java_io_BufferedWriter_cb : ?Array<Rune> = None
public var java_io_BufferedWriter_nChars : Int64 = 0
public var java_io_BufferedWriter_nextChar : Int64 = 0
public static var java_io_BufferedWriter_defaultCharBufferSize : Int64 = 0
}

public open class java_lang_Terminator <: Object {
public static var java_lang_Terminator_handler : ?Object = None
}

public open class jdk_internal_misc_Signal_Handler <: Object {
public static var jdk_internal_misc_Signal_Handler_SIG_DFL : ?Object = None
public static var jdk_internal_misc_Signal_Handler_SIG_IGN : ?Object = None
}

public open class java_lang_Terminator_1 <: Object {
public static var java_lang_Terminator_1_SIG_DFL : ?Object = None
public static var java_lang_Terminator_1_SIG_IGN : ?Object = None
}

public open class jdk_internal_misc_Signal <: Object {
public static var jdk_internal_misc_Signal_handlers : ?java_util_Hashtable = None
public static var jdk_internal_misc_Signal_signals : ?java_util_Hashtable = None
public var jdk_internal_misc_Signal_number : Int64 = 0
public var jdk_internal_misc_Signal_name : ?java_lang_String = None
}

public open class java_util_Hashtable_Entry <: Object {
public var java_util_Hashtable_Entry_hash : Int64 = 0
public var java_util_Hashtable_Entry_key : ?Object = None
public var java_util_Hashtable_Entry_value : ?Object = None
public var java_util_Hashtable_Entry_next : ?java_util_Hashtable_Entry = None
}

public open class jdk_internal_misc_Signal_NativeHandler <: Object {
public var jdk_internal_misc_Signal_NativeHandler_handler : Int64 = 0
public static var jdk_internal_misc_Signal_NativeHandler_SIG_DFL : ?Object = None
public static var jdk_internal_misc_Signal_NativeHandler_SIG_IGN : ?Object = None
}

public open class jdk_internal_misc_OSEnvironment <: Object {

}

public open class java_util_Collections <: Object {
public static var java_util_Collections_BINARYSEARCH_THRESHOLD : Int64 = 0
public static var java_util_Collections_REVERSE_THRESHOLD : Int64 = 0
public static var java_util_Collections_SHUFFLE_THRESHOLD : Int64 = 0
public static var java_util_Collections_FILL_THRESHOLD : Int64 = 0
public static var java_util_Collections_ROTATE_THRESHOLD : Int64 = 0
public static var java_util_Collections_COPY_THRESHOLD : Int64 = 0
public static var java_util_Collections_REPLACEALL_THRESHOLD : Int64 = 0
public static var java_util_Collections_INDEXOFSUBLIST_THRESHOLD : Int64 = 0
public static var java_util_Collections_r : ?Object = None
public static var java_util_Collections_EMPTY_SET : ?Object = None
public static var java_util_Collections_EMPTY_LIST : ?Object = None
public static var java_util_Collections_EMPTY_MAP : ?Object = None
}

public open class java_util_Collections_EmptySet <: java_util_AbstractSet {
public static var java_util_Collections_EmptySet_serialVersionUID : Int64 = 0
}

public open class java_util_Collections_EmptyList <: java_util_AbstractList {
public static var java_util_Collections_EmptyList_serialVersionUID : Int64 = 0
}

public open class java_util_Collections_EmptyMap <: java_util_AbstractMap {
public static var java_util_Collections_EmptyMap_serialVersionUID : Int64 = 0
}

public open class java_lang_IllegalArgumentException <: java_lang_RuntimeException {
public static var java_lang_IllegalArgumentException_serialVersionUID : Int64 = 0
}

public open class java_lang_invoke_MethodHandleStatics <: Object {
public static var java_lang_invoke_MethodHandleStatics_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var java_lang_invoke_MethodHandleStatics_DEBUG_METHOD_HANDLE_NAMES : Bool = false
public static var java_lang_invoke_MethodHandleStatics_DUMP_CLASS_FILES : Bool = false
public static var java_lang_invoke_MethodHandleStatics_TRACE_INTERPRETER : Bool = false
public static var java_lang_invoke_MethodHandleStatics_TRACE_METHOD_LINKAGE : Bool = false
public static var java_lang_invoke_MethodHandleStatics_TRACE_RESOLVE : Bool = false
public static var java_lang_invoke_MethodHandleStatics_COMPILE_THRESHOLD : Int64 = 0
public static var java_lang_invoke_MethodHandleStatics_LOG_LF_COMPILATION_FAILURE : Bool = false
public static var java_lang_invoke_MethodHandleStatics_DONT_INLINE_THRESHOLD : Int64 = 0
public static var java_lang_invoke_MethodHandleStatics_PROFILE_LEVEL : Int64 = 0
public static var java_lang_invoke_MethodHandleStatics_PROFILE_GWT : Bool = false
public static var java_lang_invoke_MethodHandleStatics_CUSTOMIZE_THRESHOLD : Int64 = 0
public static var java_lang_invoke_MethodHandleStatics_VAR_HANDLE_GUARDS : Bool = false
public static var java_lang_invoke_MethodHandleStatics_MAX_ARITY : Int64 = 0
public static var java_lang_invoke_MethodHandleStatics_VAR_HANDLE_IDENTITY_ADAPT : Bool = false
}

public open class sun_security_action_GetPropertyAction <: Object {
public var sun_security_action_GetPropertyAction_theProp : ?java_lang_String = None
public var sun_security_action_GetPropertyAction_defaultVal : ?java_lang_String = None
}

public open class jdk_internal_module_ModuleBootstrap <: Object {
public static var jdk_internal_module_ModuleBootstrap_JAVA_BASE : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ALL_DEFAULT : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ALL_UNNAMED : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ALL_SYSTEM : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ALL_MODULE_PATH : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_JLA : ?Object = None
public static var jdk_internal_module_ModuleBootstrap_JLMA : ?Object = None
public static var jdk_internal_module_ModuleBootstrap_patcher : ?jdk_internal_module_ModulePatcher = None
public static var jdk_internal_module_ModuleBootstrap_unlimitedFinder : ?Object = None
public static var jdk_internal_module_ModuleBootstrap_limitedFinder : ?Object = None
public static var jdk_internal_module_ModuleBootstrap_ADD_MODULES : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ADD_EXPORTS : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ADD_OPENS : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ADD_READS : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_PATCH_MODULE : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap_ENABLE_NATIVE_ACCESS : ?java_lang_String = None
public static var jdk_internal_module_ModuleBootstrap__assertionsDisabled : Bool = false
}

public open class java_lang_module_ModuleDescriptor <: Object {
public var java_lang_module_ModuleDescriptor_name : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_version : ?Object = None
public var java_lang_module_ModuleDescriptor_rawVersionString : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_modifiers : ?Object = None
public var java_lang_module_ModuleDescriptor_openHadTurn : Bool = false
public var java_lang_module_ModuleDescriptor_automatic : Bool = false
public var java_lang_module_ModuleDescriptor_requires : ?Object = None
public var java_lang_module_ModuleDescriptor_exports : ?Object = None
public var java_lang_module_ModuleDescriptor_opens : ?Object = None
public var java_lang_module_ModuleDescriptor_uses : ?Object = None
public var java_lang_module_ModuleDescriptor_provides : ?Object = None
public var java_lang_module_ModuleDescriptor_packages : ?Object = None
public var java_lang_module_ModuleDescriptor_mainClass : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_hash : Int64 = 0
public static var java_lang_module_ModuleDescriptor__assertionsDisabled : Bool = false
}

public open class sun_invoke_util_VerifyAccess <: Object {
public static var sun_invoke_util_VerifyAccess_UNCONDITIONAL_ALLOWED : Int64 = 0
public static var sun_invoke_util_VerifyAccess_ORIGINAL_ALLOWED : Int64 = 0
public static var sun_invoke_util_VerifyAccess_MODULE_ALLOWED : Int64 = 0
public static var sun_invoke_util_VerifyAccess_PACKAGE_ONLY : Int64 = 0
public static var sun_invoke_util_VerifyAccess_PACKAGE_ALLOWED : Int64 = 0
public static var sun_invoke_util_VerifyAccess_PROTECTED_OR_PACKAGE_ALLOWED : Int64 = 0
public static var sun_invoke_util_VerifyAccess_ALL_ACCESS_MODES : Int64 = 0
public static var sun_invoke_util_VerifyAccess__assertionsDisabled : Bool = false
}

public open class java_lang_reflect_Modifier <: Object {
public static var java_lang_reflect_Modifier_PUBLIC : Int64 = 0
public static var java_lang_reflect_Modifier_PRIVATE : Int64 = 0
public static var java_lang_reflect_Modifier_PROTECTED : Int64 = 0
public static var java_lang_reflect_Modifier_STATIC : Int64 = 0
public static var java_lang_reflect_Modifier_FINAL : Int64 = 0
public static var java_lang_reflect_Modifier_SYNCHRONIZED : Int64 = 0
public static var java_lang_reflect_Modifier_VOLATILE : Int64 = 0
public static var java_lang_reflect_Modifier_TRANSIENT : Int64 = 0
public static var java_lang_reflect_Modifier_NATIVE : Int64 = 0
public static var java_lang_reflect_Modifier_INTERFACE : Int64 = 0
public static var java_lang_reflect_Modifier_ABSTRACT : Int64 = 0
public static var java_lang_reflect_Modifier_STRICT : Int64 = 0
public static var java_lang_reflect_Modifier_BRIDGE : Int64 = 0
public static var java_lang_reflect_Modifier_VARARGS : Int64 = 0
public static var java_lang_reflect_Modifier_SYNTHETIC : Int64 = 0
public static var java_lang_reflect_Modifier_ANNOTATION : Int64 = 0
public static var java_lang_reflect_Modifier_ENUM : Int64 = 0
public static var java_lang_reflect_Modifier_MANDATED : Int64 = 0
public static var java_lang_reflect_Modifier_CLASS_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_INTERFACE_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_CONSTRUCTOR_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_METHOD_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_FIELD_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_PARAMETER_MODIFIERS : Int64 = 0
public static var java_lang_reflect_Modifier_ACCESS_MODIFIERS : Int64 = 0
}

public open class jdk_internal_access_JavaLangModuleAccess <: Object {

}

public open class java_lang_module_ModuleDescriptor_1 <: Object {

}

public open class java_io_File <: Object {
public static var java_io_File_fs : ?java_io_FileSystem = None
public var java_io_File_path : ?java_lang_String = None
public var java_io_File_status : ?java_io_File_PathStatus = None
public var java_io_File_prefixLength : Int64 = 0
public static var java_io_File_separatorChar : Rune = ' '
public static var java_io_File_separator : ?java_lang_String = None
public static var java_io_File_pathSeparatorChar : Rune = ' '
public static var java_io_File_pathSeparator : ?java_lang_String = None
public static var java_io_File_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var java_io_File_PATH_OFFSET : Int64 = 0
public static var java_io_File_PREFIX_LENGTH_OFFSET : Int64 = 0
public static var java_io_File_serialVersionUID : Int64 = 0
public var java_io_File_filePath : ?Object = None
public static var java_io_File__assertionsDisabled : Bool = false
}

public open class java_io_DefaultFileSystem <: Object {

}

public open class java_io_FileSystem <: Object {
public static var java_io_FileSystem_BA_EXISTS : Int64 = 0
public static var java_io_FileSystem_BA_REGULAR : Int64 = 0
public static var java_io_FileSystem_BA_DIRECTORY : Int64 = 0
public static var java_io_FileSystem_BA_HIDDEN : Int64 = 0
public static var java_io_FileSystem_ACCESS_READ : Int64 = 0
public static var java_io_FileSystem_ACCESS_WRITE : Int64 = 0
public static var java_io_FileSystem_ACCESS_EXECUTE : Int64 = 0
public static var java_io_FileSystem_SPACE_TOTAL : Int64 = 0
public static var java_io_FileSystem_SPACE_FREE : Int64 = 0
public static var java_io_FileSystem_SPACE_USABLE : Int64 = 0
public static var java_io_FileSystem_useCanonCaches : Bool = false
public static var java_io_FileSystem_useCanonPrefixCache : Bool = false
}

public open class java_io_UnixFileSystem <: java_io_FileSystem {
public var java_io_UnixFileSystem_slash : Rune = ' '
public var java_io_UnixFileSystem_colon : Rune = ' '
public var java_io_UnixFileSystem_javaHome : ?java_lang_String = None
public var java_io_UnixFileSystem_userDir : ?java_lang_String = None
public var java_io_UnixFileSystem_cache : ?Object = None
public var java_io_UnixFileSystem_javaHomePrefixCache : ?Object = None
}

public open class jdk_internal_util_ArraysSupport <: Object {
public static var jdk_internal_util_ArraysSupport_U : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_util_ArraysSupport_BIG_ENDIAN : Bool = false
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_BOOLEAN_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_BYTE_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_CHAR_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_SHORT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_INT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_LONG_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_FLOAT_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_ARRAY_DOUBLE_INDEX_SCALE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_LOG2_BYTE_BIT_SIZE : Int64 = 0
public static var jdk_internal_util_ArraysSupport_SOFT_MAX_ARRAY_LENGTH : Int64 = 0
}

public open class jdk_internal_module_ModulePatcher <: Object {
public static var jdk_internal_module_ModulePatcher_JLMA : ?Object = None
public var jdk_internal_module_ModulePatcher_map : ?Object = None
}

public open class jdk_internal_module_ModuleBootstrap_Counters <: Object {
public static var jdk_internal_module_ModuleBootstrap_Counters_PUBLISH_COUNTERS : Bool = false
public static var jdk_internal_module_ModuleBootstrap_Counters_PRINT_COUNTERS : Bool = false
public static var jdk_internal_module_ModuleBootstrap_Counters_counters : ?Object = None
public static var jdk_internal_module_ModuleBootstrap_Counters_startTime : Int64 = 0
public static var jdk_internal_module_ModuleBootstrap_Counters_previousTime : Int64 = 0
}

public open class jdk_internal_module_ArchivedBootLayer <: Object {
public static var jdk_internal_module_ArchivedBootLayer_archivedBootLayer : ?jdk_internal_module_ArchivedBootLayer = None
public var jdk_internal_module_ArchivedBootLayer_bootLayer : ?java_lang_ModuleLayer = None
}

public open class jdk_internal_module_ArchivedModuleGraph <: Object {
public static var jdk_internal_module_ArchivedModuleGraph_archivedModuleGraph : ?jdk_internal_module_ArchivedModuleGraph = None
public var jdk_internal_module_ArchivedModuleGraph_hasSplitPackages : Bool = false
public var jdk_internal_module_ArchivedModuleGraph_hasIncubatorModules : Bool = false
public var jdk_internal_module_ArchivedModuleGraph_finder : ?Object = None
public var jdk_internal_module_ArchivedModuleGraph_configuration : ?java_lang_module_Configuration = None
public var jdk_internal_module_ArchivedModuleGraph_classLoaderFunction : ?Object = None
}

public open class jdk_internal_module_SystemModuleFinders <: Object {
public static var jdk_internal_module_SystemModuleFinders_JNUA : ?Object = None
public static var jdk_internal_module_SystemModuleFinders_USE_FAST_PATH : Bool = false
public static var jdk_internal_module_SystemModuleFinders_cachedSystemModuleFinder : ?Object = None
}

public open class java_net_URI <: Object {
public static var java_net_URI_serialVersionUID : Int64 = 0
public var java_net_URI_scheme : ?java_lang_String = None
public var java_net_URI_fragment : ?java_lang_String = None
public var java_net_URI_authority : ?java_lang_String = None
public var java_net_URI_userInfo : ?java_lang_String = None
public var java_net_URI_host : ?java_lang_String = None
public var java_net_URI_port : Int64 = 0
public var java_net_URI_path : ?java_lang_String = None
public var java_net_URI_query : ?java_lang_String = None
public var java_net_URI_schemeSpecificPart : ?java_lang_String = None
public var java_net_URI_hash : Int64 = 0
public var java_net_URI_decodedUserInfo : ?java_lang_String = None
public var java_net_URI_decodedAuthority : ?java_lang_String = None
public var java_net_URI_decodedPath : ?java_lang_String = None
public var java_net_URI_decodedQuery : ?java_lang_String = None
public var java_net_URI_decodedFragment : ?java_lang_String = None
public var java_net_URI_decodedSchemeSpecificPart : ?java_lang_String = None
public var java_net_URI_string : ?java_lang_String = None
public static var java_net_URI_L_DIGIT : Int64 = 0
public static var java_net_URI_H_DIGIT : Int64 = 0
public static var java_net_URI_L_UPALPHA : Int64 = 0
public static var java_net_URI_H_UPALPHA : Int64 = 0
public static var java_net_URI_L_LOWALPHA : Int64 = 0
public static var java_net_URI_H_LOWALPHA : Int64 = 0
public static var java_net_URI_L_ALPHA : Int64 = 0
public static var java_net_URI_H_ALPHA : Int64 = 0
public static var java_net_URI_L_ALPHANUM : Int64 = 0
public static var java_net_URI_H_ALPHANUM : Int64 = 0
public static var java_net_URI_L_HEX : Int64 = 0
public static var java_net_URI_H_HEX : Int64 = 0
public static var java_net_URI_L_MARK : Int64 = 0
public static var java_net_URI_H_MARK : Int64 = 0
public static var java_net_URI_L_UNRESERVED : Int64 = 0
public static var java_net_URI_H_UNRESERVED : Int64 = 0
public static var java_net_URI_L_RESERVED : Int64 = 0
public static var java_net_URI_H_RESERVED : Int64 = 0
public static var java_net_URI_L_ESCAPED : Int64 = 0
public static var java_net_URI_H_ESCAPED : Int64 = 0
public static var java_net_URI_L_URIC : Int64 = 0
public static var java_net_URI_H_URIC : Int64 = 0
public static var java_net_URI_L_PCHAR : Int64 = 0
public static var java_net_URI_H_PCHAR : Int64 = 0
public static var java_net_URI_L_PATH : Int64 = 0
public static var java_net_URI_H_PATH : Int64 = 0
public static var java_net_URI_L_DASH : Int64 = 0
public static var java_net_URI_H_DASH : Int64 = 0
public static var java_net_URI_L_DOT : Int64 = 0
public static var java_net_URI_H_DOT : Int64 = 0
public static var java_net_URI_L_USERINFO : Int64 = 0
public static var java_net_URI_H_USERINFO : Int64 = 0
public static var java_net_URI_L_REG_NAME : Int64 = 0
public static var java_net_URI_H_REG_NAME : Int64 = 0
public static var java_net_URI_L_SERVER : Int64 = 0
public static var java_net_URI_H_SERVER : Int64 = 0
public static var java_net_URI_L_SERVER_PERCENT : Int64 = 0
public static var java_net_URI_H_SERVER_PERCENT : Int64 = 0
public static var java_net_URI_L_SCHEME : Int64 = 0
public static var java_net_URI_H_SCHEME : Int64 = 0
public static var java_net_URI_L_SCOPE_ID : Int64 = 0
public static var java_net_URI_H_SCOPE_ID : Int64 = 0
public static var java_net_URI_hexDigits : ?Array<Rune> = None
public static var java_net_URI__assertionsDisabled : Bool = false
}

public open class jdk_internal_access_JavaNetUriAccess <: Object {

}

public open class java_net_URI_1 <: Object {

}

public open class jdk_internal_module_SystemModulesMap <: Object {

}

public open class jdk_internal_module_SystemModules <: Object {

}

public open class jdk_internal_module_ExplodedSystemModules <: Object {

}

public open class java_nio_file_Watchable <: Object {

}

public open class java_nio_file_Path <: Object {

}

public open class java_nio_file_FileSystems <: Object {

}

public open class sun_nio_fs_DefaultFileSystemProvider <: Object {
public static var sun_nio_fs_DefaultFileSystemProvider_INSTANCE : ?sun_nio_fs_LinuxFileSystemProvider = None
}

public open class java_nio_file_spi_FileSystemProvider <: Object {
public static var java_nio_file_spi_FileSystemProvider_lock : ?Object = None
public static var java_nio_file_spi_FileSystemProvider_installedProviders : ?Object = None
public static var java_nio_file_spi_FileSystemProvider_loadingProviders : Bool = false
public static var java_nio_file_spi_FileSystemProvider_DEFAULT_OPEN_OPTIONS : ?Object = None
}

public open class sun_nio_fs_AbstractFileSystemProvider <: java_nio_file_spi_FileSystemProvider {

}

public open class sun_nio_fs_UnixFileSystemProvider <: sun_nio_fs_AbstractFileSystemProvider {
public static var sun_nio_fs_UnixFileSystemProvider_USER_DIR : ?java_lang_String = None
public static var sun_nio_fs_UnixFileSystemProvider_EMPTY_PATH : ?Array<Byte> = None
public var sun_nio_fs_UnixFileSystemProvider_theFileSystem : ?sun_nio_fs_UnixFileSystem = None
}

public open class sun_nio_fs_LinuxFileSystemProvider <: sun_nio_fs_UnixFileSystemProvider {

}

public open class java_nio_file_OpenOption <: Object {

}

public open class java_lang_Enum <: Object {
public var java_lang_Enum_name : ?java_lang_String = None
public var java_lang_Enum_ordinal : Int64 = 0
}

public open class java_nio_file_StandardOpenOption <: java_lang_Enum {
public static var java_nio_file_StandardOpenOption_READ : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_WRITE : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_APPEND : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_TRUNCATE_EXISTING : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_CREATE : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_CREATE_NEW : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_DELETE_ON_CLOSE : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_SPARSE : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_SYNC : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption_DSYNC : ?java_nio_file_StandardOpenOption = None
public static var java_nio_file_StandardOpenOption__VALUES : ?Array<?java_nio_file_StandardOpenOption> = None
}

public open class java_nio_file_FileSystem <: Object {

}

public open class sun_nio_fs_UnixFileSystem <: java_nio_file_FileSystem {
public var sun_nio_fs_UnixFileSystem_provider : ?sun_nio_fs_UnixFileSystemProvider = None
public var sun_nio_fs_UnixFileSystem_defaultDirectory : ?Array<Byte> = None
public var sun_nio_fs_UnixFileSystem_needToResolveAgainstDefaultDirectory : Bool = false
public var sun_nio_fs_UnixFileSystem_rootDirectory : ?sun_nio_fs_UnixPath = None
public static var sun_nio_fs_UnixFileSystem_GLOB_SYNTAX : ?java_lang_String = None
public static var sun_nio_fs_UnixFileSystem_REGEX_SYNTAX : ?java_lang_String = None
}

public open class sun_nio_fs_LinuxFileSystem <: sun_nio_fs_UnixFileSystem {

}

public open class sun_nio_fs_UnixPath <: Object {
public static var sun_nio_fs_UnixPath_JLA : ?Object = None
public var sun_nio_fs_UnixPath_fs : ?sun_nio_fs_UnixFileSystem = None
public var sun_nio_fs_UnixPath_path : ?Array<Byte> = None
public var sun_nio_fs_UnixPath_stringValue : ?java_lang_String = None
public var sun_nio_fs_UnixPath_hash : Int64 = 0
public var sun_nio_fs_UnixPath_offsets : ?Array<Int64> = None
public static var sun_nio_fs_UnixPath__assertionsDisabled : Bool = false
}

public open class sun_nio_fs_Util <: Object {
public static var sun_nio_fs_Util_jnuEncoding : ?java_nio_charset_Charset = None
}

public open class java_lang_StringCoding <: Object {

}

public open class sun_nio_fs_UnixNativeDispatcher <: Object {
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_OPENAT : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_FUTIMES : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_FUTIMENS : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_LUTIMES : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_XATTR : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_SUPPORTS_BIRTHTIME : Int64 = 0
public static var sun_nio_fs_UnixNativeDispatcher_capabilities : Int64 = 0
}

public open class jdk_internal_loader_BootLoader <: Object {
public static var jdk_internal_loader_BootLoader_JLA : ?Object = None
public static var jdk_internal_loader_BootLoader_UNNAMED_MODULE : ?java_lang_Module = None
public static var jdk_internal_loader_BootLoader_JAVA_HOME : ?java_lang_String = None
public static var jdk_internal_loader_BootLoader_CLASS_LOADER_VALUE_MAP : ?java_util_concurrent_ConcurrentHashMap = None
public static var jdk_internal_loader_BootLoader_NATIVE_LIBS : ?jdk_internal_loader_NativeLibraries = None
}

public open class jdk_internal_loader_NativeLibraries <: Object {
public var jdk_internal_loader_NativeLibraries_libraries : ?Object = None
public var jdk_internal_loader_NativeLibraries_loader : ?java_lang_ClassLoader = None
public var jdk_internal_loader_NativeLibraries_caller : ?java_lang_Class = None
public var jdk_internal_loader_NativeLibraries_searchJavaLibraryPath : Bool = false
public var jdk_internal_loader_NativeLibraries_isJNI : Bool = false
public static var jdk_internal_loader_NativeLibraries_loadedLibraryNames : ?Object = None
public static var jdk_internal_loader_NativeLibraries_nativeLibraryContext : ?Object = None
public static var jdk_internal_loader_NativeLibraries__assertionsDisabled : Bool = false
}

public open class java_util_HashSet <: java_util_AbstractSet {
public static var java_util_HashSet_serialVersionUID : Int64 = 0
public var java_util_HashSet_map : ?java_util_HashMap = None
public static var java_util_HashSet_PRESENT : ?Object = None
}

public open class java_util_Queue <: Object {

}

public open class java_util_Deque <: Object {

}

public open class java_util_ArrayDeque <: java_util_AbstractCollection {
public var java_util_ArrayDeque_elements : ?Array<?Object> = None
public var java_util_ArrayDeque_head : Int64 = 0
public var java_util_ArrayDeque_tail : Int64 = 0
public static var java_util_ArrayDeque_MAX_ARRAY_SIZE : Int64 = 0
public static var java_util_ArrayDeque_serialVersionUID : Int64 = 0
}

public open class jdk_internal_loader_NativeLibraries_LibraryPaths <: Object {
public static var jdk_internal_loader_NativeLibraries_LibraryPaths_SYS_PATHS : ?Array<?java_lang_String> = None
public static var jdk_internal_loader_NativeLibraries_LibraryPaths_USER_PATHS : ?Array<?java_lang_String> = None
}

public open class jdk_internal_loader_ClassLoaderHelper <: Object {

}

public open class jdk_internal_loader_NativeLibraries_1 <: Object {
public var jdk_internal_loader_NativeLibraries_1_val_file : ?java_io_File = None
public var jdk_internal_loader_NativeLibraries_1_this_0 : ?jdk_internal_loader_NativeLibraries = None
}

public open class java_io_File_PathStatus <: java_lang_Enum {
public static var java_io_File_PathStatus_INVALID : ?java_io_File_PathStatus = None
public static var java_io_File_PathStatus_CHECKED : ?java_io_File_PathStatus = None
public static var java_io_File_PathStatus__VALUES : ?Array<?java_io_File_PathStatus> = None
}

public open class java_util_ArrayDeque_DeqIterator <: Object {
public var java_util_ArrayDeque_DeqIterator_cursor : Int64 = 0
public var java_util_ArrayDeque_DeqIterator_remaining : Int64 = 0
public var java_util_ArrayDeque_DeqIterator_lastRet : Int64 = 0
public var java_util_ArrayDeque_DeqIterator_this_0 : ?java_util_ArrayDeque = None
}

public open class jdk_internal_loader_NativeLibrary <: Object {

}

public open class jdk_internal_loader_NativeLibraries_NativeLibraryImpl <: Object {
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_fromClass : ?java_lang_Class = None
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_name : ?java_lang_String = None
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_isBuiltin : Bool = false
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_isJNI : Bool = false
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_handle : Int64 = 0
public var jdk_internal_loader_NativeLibraries_NativeLibraryImpl_jniVersion : Int64 = 0
public static var jdk_internal_loader_NativeLibraries_NativeLibraryImpl__assertionsDisabled : Bool = false
}

public open class java_security_cert_Certificate <: Object {
public static var java_security_cert_Certificate_serialVersionUID : Int64 = 0
public var java_security_cert_Certificate_typeHadTurn : ?java_lang_String = None
public var java_security_cert_Certificate_hash : Int64 = 0
}

public open class java_util_concurrent_ConcurrentHashMap_CollectionView <: Object {
public static var java_util_concurrent_ConcurrentHashMap_CollectionView_serialVersionUID : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_CollectionView_map : ?java_util_concurrent_ConcurrentHashMap = None
public static var java_util_concurrent_ConcurrentHashMap_CollectionView_OOME_MSG : ?java_lang_String = None
}

public open class java_util_concurrent_ConcurrentHashMap_ValuesView <: java_util_concurrent_ConcurrentHashMap_CollectionView {
public static var java_util_concurrent_ConcurrentHashMap_ValuesView_serialVersionUID : Int64 = 0
}

public open class java_util_Enumeration <: Object {

}

public open class java_util_concurrent_ConcurrentHashMap_Traverser <: Object {
public var java_util_concurrent_ConcurrentHashMap_Traverser_tab : ?Array<?java_util_concurrent_ConcurrentHashMap_Node> = None
public var java_util_concurrent_ConcurrentHashMap_Traverser_next : ?java_util_concurrent_ConcurrentHashMap_Node = None
public var java_util_concurrent_ConcurrentHashMap_Traverser_stack : ?Object = None
public var java_util_concurrent_ConcurrentHashMap_Traverser_spare : ?Object = None
public var java_util_concurrent_ConcurrentHashMap_Traverser_index : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_Traverser_baseIndex : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_Traverser_baseLimit : Int64 = 0
public var java_util_concurrent_ConcurrentHashMap_Traverser_baseSize : Int64 = 0
}

public open class java_util_concurrent_ConcurrentHashMap_BaseIterator <: java_util_concurrent_ConcurrentHashMap_Traverser {
public var java_util_concurrent_ConcurrentHashMap_BaseIterator_map : ?java_util_concurrent_ConcurrentHashMap = None
public var java_util_concurrent_ConcurrentHashMap_BaseIterator_lastReturned : ?java_util_concurrent_ConcurrentHashMap_Node = None
}

public open class java_util_concurrent_ConcurrentHashMap_ValueIterator <: java_util_concurrent_ConcurrentHashMap_BaseIterator {

}

public open class java_nio_file_attribute_BasicFileAttributes <: Object {

}

public open class java_nio_file_attribute_PosixFileAttributes <: Object {

}

public open class sun_nio_fs_UnixFileAttributes <: Object {
public var sun_nio_fs_UnixFileAttributes_st_mode : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_ino : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_dev : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_rdev : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_nlink : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_uid : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_gid : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_size : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_atime_sec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_atime_nsec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_mtime_sec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_mtime_nsec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_ctime_sec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_ctime_nsec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_st_birthtime_sec : Int64 = 0
public var sun_nio_fs_UnixFileAttributes_owner : ?Object = None
public var sun_nio_fs_UnixFileAttributes_group : ?Object = None
public var sun_nio_fs_UnixFileAttributes_key : ?sun_nio_fs_UnixFileKey = None
}

public open class sun_nio_fs_UnixFileStoreAttributes <: Object {
public var sun_nio_fs_UnixFileStoreAttributes_f_frsize : Int64 = 0
public var sun_nio_fs_UnixFileStoreAttributes_f_blocks : Int64 = 0
public var sun_nio_fs_UnixFileStoreAttributes_f_bfree : Int64 = 0
public var sun_nio_fs_UnixFileStoreAttributes_f_bavail : Int64 = 0
}

public open class sun_nio_fs_UnixMountEntry <: Object {
public var sun_nio_fs_UnixMountEntry_name : ?Array<Byte> = None
public var sun_nio_fs_UnixMountEntry_dir : ?Array<Byte> = None
public var sun_nio_fs_UnixMountEntry_fstype : ?Array<Byte> = None
public var sun_nio_fs_UnixMountEntry_opts : ?Array<Byte> = None
public var sun_nio_fs_UnixMountEntry_dev : Int64 = 0
public var sun_nio_fs_UnixMountEntry_fstypeAsString : ?java_lang_String = None
public var sun_nio_fs_UnixMountEntry_optionsAsString : ?java_lang_String = None
}

public open class java_nio_file_CopyOption <: Object {

}

public open class java_nio_file_LinkOption <: java_lang_Enum {
public static var java_nio_file_LinkOption_NOFOLLOW_LINKS : ?java_nio_file_LinkOption = None
public static var java_nio_file_LinkOption__VALUES : ?Array<?java_nio_file_LinkOption> = None
}

public open class java_nio_file_Files <: Object {
public static var java_nio_file_Files_BUFFER_SIZE : Int64 = 0
public static var java_nio_file_Files_DEFAULT_CREATE_OPTIONS : ?Object = None
public static var java_nio_file_Files_JLA : ?Object = None
public static var java_nio_file_Files__assertionsDisabled : Bool = false
}

public open class sun_nio_fs_NativeBuffers <: Object {
public static var sun_nio_fs_NativeBuffers_unsafeHadTurn : ?jdk_internal_misc_Unsafe = None
public static var sun_nio_fs_NativeBuffers_TEMP_BUF_POOL_SIZE : Int64 = 0
public static var sun_nio_fs_NativeBuffers_threadLocal : ?java_lang_ThreadLocal = None
public static var sun_nio_fs_NativeBuffers__assertionsDisabled : Bool = false
}

public open class jdk_internal_misc_TerminatingThreadLocal <: java_lang_ThreadLocal {
public static var jdk_internal_misc_TerminatingThreadLocal_REGISTRY : ?java_lang_ThreadLocal = None
}

public open class sun_nio_fs_NativeBuffers_1 <: jdk_internal_misc_TerminatingThreadLocal {

}

public open class jdk_internal_misc_TerminatingThreadLocal_1 <: java_lang_ThreadLocal {

}

public open class java_lang_ThreadLocal_ThreadLocalMap <: Object {
public static var java_lang_ThreadLocal_ThreadLocalMap_INITIAL_CAPACITY : Int64 = 0
public var java_lang_ThreadLocal_ThreadLocalMap_table : ?Array<?java_lang_ThreadLocal_ThreadLocalMap_Entry> = None
public var java_lang_ThreadLocal_ThreadLocalMap_size : Int64 = 0
public var java_lang_ThreadLocal_ThreadLocalMap_threshold : Int64 = 0
}

public open class java_lang_ThreadLocal_ThreadLocalMap_Entry <: java_lang_ref_WeakReference {
public var java_lang_ThreadLocal_ThreadLocalMap_Entry_value : ?Object = None
}

public open class java_util_IdentityHashMap <: java_util_AbstractMap {
public static var java_util_IdentityHashMap_DEFAULT_CAPACITY : Int64 = 0
public static var java_util_IdentityHashMap_MINIMUM_CAPACITY : Int64 = 0
public static var java_util_IdentityHashMap_MAXIMUM_CAPACITY : Int64 = 0
public var java_util_IdentityHashMap_table : ?Array<?Object> = None
public var java_util_IdentityHashMap_size : Int64 = 0
public var java_util_IdentityHashMap_modCount : Int64 = 0
public static var java_util_IdentityHashMap_NULL_KEY : ?Object = None
public var java_util_IdentityHashMap_entrySet : ?Object = None
public static var java_util_IdentityHashMap_serialVersionUID : Int64 = 0
}

public open class java_util_Collections_SetFromMap <: java_util_AbstractSet {
public var java_util_Collections_SetFromMap_m : ?Object = None
public var java_util_Collections_SetFromMap_s : ?Object = None
public static var java_util_Collections_SetFromMap_serialVersionUID : Int64 = 0
}

public open class java_util_IdentityHashMap_KeySet <: java_util_AbstractSet {
public var java_util_IdentityHashMap_KeySet_this_0 : ?java_util_IdentityHashMap = None
}

public open class sun_nio_fs_NativeBuffer <: Object {
public static var sun_nio_fs_NativeBuffer_unsafeHadTurn : ?jdk_internal_misc_Unsafe = None
public var sun_nio_fs_NativeBuffer_address : Int64 = 0
public var sun_nio_fs_NativeBuffer_size : Int64 = 0
public var sun_nio_fs_NativeBuffer_cleanable : ?Object = None
public var sun_nio_fs_NativeBuffer_owner : ?Object = None
}

public open class jdk_internal_ref_CleanerFactory <: Object {
public static var jdk_internal_ref_CleanerFactory_commonCleaner : ?java_lang_ref_Cleaner = None
}

public open class java_util_concurrent_ThreadFactory <: Object {

}

public open class jdk_internal_ref_CleanerFactory_1 <: Object {

}

public open class java_lang_ref_Cleaner <: Object {
public var java_lang_ref_Cleaner_impl : ?jdk_internal_ref_CleanerImpl = None
}

public open class java_util_function_Function <: Object {

}

public open class java_lang_ref_Cleaner_1 <: Object {

}

public open class jdk_internal_ref_CleanerImpl <: Object {
public static var jdk_internal_ref_CleanerImpl_cleanerImplAccess : ?Object = None
public var jdk_internal_ref_CleanerImpl_phantomCleanableList : ?jdk_internal_ref_PhantomCleanable = None
public var jdk_internal_ref_CleanerImpl_queue : ?java_lang_ref_ReferenceQueue = None
}

public open class java_lang_ref_Cleaner_Cleanable <: Object {

}

public open class jdk_internal_ref_PhantomCleanable <: java_lang_ref_PhantomReference {
public var jdk_internal_ref_PhantomCleanable_prev : ?jdk_internal_ref_PhantomCleanable = None
public var jdk_internal_ref_PhantomCleanable_next : ?jdk_internal_ref_PhantomCleanable = None
public var jdk_internal_ref_PhantomCleanable_list : ?jdk_internal_ref_PhantomCleanable = None
}

public open class jdk_internal_ref_CleanerImpl_PhantomCleanableRef <: jdk_internal_ref_PhantomCleanable {
public var jdk_internal_ref_CleanerImpl_PhantomCleanableRef_action : ?Object = None
}

public open class jdk_internal_ref_CleanerImpl_CleanerCleanable <: jdk_internal_ref_PhantomCleanable {

}

public open class jdk_internal_misc_InnocuousThread <: java_lang_Thread {
public static var jdk_internal_misc_InnocuousThread_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_misc_InnocuousThread_THREAD_LOCALS : Int64 = 0
public static var jdk_internal_misc_InnocuousThread_INHERITABLE_THREAD_LOCALS : Int64 = 0
public static var jdk_internal_misc_InnocuousThread_INNOCUOUSTHREADGROUP : ?java_lang_ThreadGroup = None
public static var jdk_internal_misc_InnocuousThread_ACC : ?java_security_AccessControlContext = None
public static var jdk_internal_misc_InnocuousThread_INHERITEDACCESSCONTROLCONTEXT : Int64 = 0
public static var jdk_internal_misc_InnocuousThread_CONTEXTCLASSLOADER : Int64 = 0
public static var jdk_internal_misc_InnocuousThread_threadNumber : ?java_util_concurrent_atomic_AtomicInteger = None
public var jdk_internal_misc_InnocuousThread_hasRun : Bool = false
}

public open class jdk_internal_access_JavaSecurityAccess <: Object {

}

public open class java_security_ProtectionDomain_JavaSecurityAccessImpl <: Object {

}

public open class java_security_ProtectionDomain_Key <: Object {

}

public open class java_security_Principal <: Object {

}

public open class sun_nio_fs_NativeBuffer_Deallocator <: Object {
public var sun_nio_fs_NativeBuffer_Deallocator_address : Int64 = 0
}

public open class java_lang_module_ModuleFinder <: Object {

}

public open class jdk_internal_module_ModulePath <: Object {
public static var jdk_internal_module_ModulePath_MODULE_INFO : ?java_lang_String = None
public var jdk_internal_module_ModulePath_releaseVersion : ?java_lang_Runtime_Version = None
public var jdk_internal_module_ModulePath_isLinkPhase : Bool = false
public var jdk_internal_module_ModulePath_patcher : ?jdk_internal_module_ModulePatcher = None
public var jdk_internal_module_ModulePath_entries : ?Array<?Object> = None
public var jdk_internal_module_ModulePath_next : Int64 = 0
public var jdk_internal_module_ModulePath_cachedModules : ?Object = None
public static var jdk_internal_module_ModulePath_SERVICES_PREFIX : ?java_lang_String = None
public static var jdk_internal_module_ModulePath_AUTOMATIC_MODULE_NAME : ?java_util_jar_Attributes_Name = None
public static var jdk_internal_module_ModulePath_scanTime : ?jdk_internal_perf_PerfCounter = None
public static var jdk_internal_module_ModulePath_moduleCount : ?jdk_internal_perf_PerfCounter = None
public static var jdk_internal_module_ModulePath__assertionsDisabled : Bool = false
}

public open class java_util_jar_Attributes_Name <: Object {
public var java_util_jar_Attributes_Name_name : ?java_lang_String = None
public var java_util_jar_Attributes_Name_hashCode : Int64 = 0
public static var java_util_jar_Attributes_Name_KNOWN_NAMES : ?Object = None
public static var java_util_jar_Attributes_Name_MANIFEST_VERSION : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_SIGNATURE_VERSION : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_CONTENT_TYPE : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_CLASS_PATH : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_MAIN_CLASS : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_SEALED : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_EXTENSION_LIST : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_EXTENSION_NAME : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_EXTENSION_INSTALLATION : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_IMPLEMENTATION_TITLE : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_IMPLEMENTATION_VERSION : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_IMPLEMENTATION_VENDOR : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_IMPLEMENTATION_VENDOR_ID : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_IMPLEMENTATION_URL : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_SPECIFICATION_TITLE : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_SPECIFICATION_VERSION : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_SPECIFICATION_VENDOR : ?java_util_jar_Attributes_Name = None
public static var java_util_jar_Attributes_Name_MULTI_RELEASE : ?java_util_jar_Attributes_Name = None
}

public open class java_lang_reflect_Array <: Object {

}

public open class jdk_internal_perf_PerfCounter <: Object {
public static var jdk_internal_perf_PerfCounter_perf : ?jdk_internal_perf_Perf = None
public static var jdk_internal_perf_PerfCounter_V_Constant : Int64 = 0
public static var jdk_internal_perf_PerfCounter_V_Monotonic : Int64 = 0
public static var jdk_internal_perf_PerfCounter_V_Variable : Int64 = 0
public static var jdk_internal_perf_PerfCounter_U_None : Int64 = 0
public var jdk_internal_perf_PerfCounter_name : ?java_lang_String = None
public var jdk_internal_perf_PerfCounter_lb : ?java_nio_LongBuffer = None
}

public open class jdk_internal_perf_Perf_GetPerfAction <: Object {

}

public open class jdk_internal_perf_Perf <: Object {
public static var jdk_internal_perf_Perf_instance : ?jdk_internal_perf_Perf = None
public static var jdk_internal_perf_Perf_PERF_MODE_RO : Int64 = 0
public static var jdk_internal_perf_Perf_PERF_MODE_RW : Int64 = 0
}

public open class sun_nio_ch_DirectBuffer <: Object {

}

public open class java_nio_MappedByteBuffer <: java_nio_ByteBuffer {
public var java_nio_MappedByteBuffer_fd : ?java_io_FileDescriptor = None
public var java_nio_MappedByteBuffer_isSync : Bool = false
public static var java_nio_MappedByteBuffer_SCOPED_MEMORY_ACCESS : ?jdk_internal_misc_ScopedMemoryAccess = None
}

public open class java_nio_DirectByteBuffer <: java_nio_MappedByteBuffer {
public static var java_nio_DirectByteBuffer_ARRAY_BASE_OFFSET : Int64 = 0
public static var java_nio_DirectByteBuffer_UNALIGNED : Bool = false
public var java_nio_DirectByteBuffer_att : ?Object = None
public var java_nio_DirectByteBuffer_cleaner : ?jdk_internal_ref_Cleaner = None
public static var java_nio_DirectByteBuffer__assertionsDisabled : Bool = false
}

public open class java_nio_Bits <: Object {
public static var java_nio_Bits_UNSAFE : ?jdk_internal_misc_Unsafe = None
public static var java_nio_Bits_PAGE_SIZE : Int64 = 0
public static var java_nio_Bits_UNALIGNED : Bool = false
public static var java_nio_Bits_MAX_MEMORY : Int64 = 0
public static var java_nio_Bits_RESERVED_MEMORY : ?java_util_concurrent_atomic_AtomicLong = None
public static var java_nio_Bits_TOTAL_CAPACITY : ?java_util_concurrent_atomic_AtomicLong = None
public static var java_nio_Bits_COUNT : ?java_util_concurrent_atomic_AtomicLong = None
public static var java_nio_Bits_MEMORY_LIMIT_SET : Bool = false
public static var java_nio_Bits_MAX_SLEEPS : Int64 = 0
public static var java_nio_Bits_BUFFER_POOL : ?Object = None
public static var java_nio_Bits_JNI_COPY_TO_ARRAY_THRESHOLD : Int64 = 0
public static var java_nio_Bits_JNI_COPY_FROM_ARRAY_THRESHOLD : Int64 = 0
public static var java_nio_Bits__assertionsDisabled : Bool = false
}

public open class java_util_concurrent_atomic_AtomicLong <: java_lang_Number {
public static var java_util_concurrent_atomic_AtomicLong_serialVersionUID : Int64 = 0
public static var java_util_concurrent_atomic_AtomicLong_VM_SUPPORTS_LONG_CAS : Bool = false
public static var java_util_concurrent_atomic_AtomicLong_U : ?jdk_internal_misc_Unsafe = None
public static var java_util_concurrent_atomic_AtomicLong_VALUE : Int64 = 0
public var java_util_concurrent_atomic_AtomicLong_value : Int64 = 0
}

public open class jdk_internal_misc_VM_BufferPool <: Object {

}

public open class java_nio_Bits_1 <: Object {

}

public open class java_nio_LongBuffer <: java_nio_Buffer {
public static var java_nio_LongBuffer_ARRAY_BASE_OFFSET : Int64 = 0
public var java_nio_LongBuffer_hb : ?Array<Int64> = None
public var java_nio_LongBuffer_offset : Int64 = 0
public var java_nio_LongBuffer_isReadOnly : Bool = false
public static var java_nio_LongBuffer__assertionsDisabled : Bool = false
}

public open class java_nio_DirectLongBufferU <: java_nio_LongBuffer {
public static var java_nio_DirectLongBufferU_ARRAY_BASE_OFFSET : Int64 = 0
public static var java_nio_DirectLongBufferU_UNALIGNED : Bool = false
public var java_nio_DirectLongBufferU_att : ?Object = None
public static var java_nio_DirectLongBufferU__assertionsDisabled : Bool = false
}

public open class java_util_zip_ZipConstants <: Object {
public static var java_util_zip_ZipConstants_LOCSIG : Int64 = 0
public static var java_util_zip_ZipConstants_EXTSIG : Int64 = 0
public static var java_util_zip_ZipConstants_CENSIG : Int64 = 0
public static var java_util_zip_ZipConstants_ENDSIG : Int64 = 0
public static var java_util_zip_ZipConstants_LOCHDR : Int64 = 0
public static var java_util_zip_ZipConstants_EXTHDR : Int64 = 0
public static var java_util_zip_ZipConstants_CENHDR : Int64 = 0
public static var java_util_zip_ZipConstants_ENDHDR : Int64 = 0
public static var java_util_zip_ZipConstants_LOCVER : Int64 = 0
public static var java_util_zip_ZipConstants_LOCFLG : Int64 = 0
public static var java_util_zip_ZipConstants_LOCHOW : Int64 = 0
public static var java_util_zip_ZipConstants_LOCTIM : Int64 = 0
public static var java_util_zip_ZipConstants_LOCCRC : Int64 = 0
public static var java_util_zip_ZipConstants_LOCSIZ : Int64 = 0
public static var java_util_zip_ZipConstants_LOCLEN : Int64 = 0
public static var java_util_zip_ZipConstants_LOCNAM : Int64 = 0
public static var java_util_zip_ZipConstants_LOCEXT : Int64 = 0
public static var java_util_zip_ZipConstants_EXTCRC : Int64 = 0
public static var java_util_zip_ZipConstants_EXTSIZ : Int64 = 0
public static var java_util_zip_ZipConstants_EXTLEN : Int64 = 0
public static var java_util_zip_ZipConstants_CENVEM : Int64 = 0
public static var java_util_zip_ZipConstants_CENVER : Int64 = 0
public static var java_util_zip_ZipConstants_CENFLG : Int64 = 0
public static var java_util_zip_ZipConstants_CENHOW : Int64 = 0
public static var java_util_zip_ZipConstants_CENTIM : Int64 = 0
public static var java_util_zip_ZipConstants_CENCRC : Int64 = 0
public static var java_util_zip_ZipConstants_CENSIZ : Int64 = 0
public static var java_util_zip_ZipConstants_CENLEN : Int64 = 0
public static var java_util_zip_ZipConstants_CENNAM : Int64 = 0
public static var java_util_zip_ZipConstants_CENEXT : Int64 = 0
public static var java_util_zip_ZipConstants_CENCOM : Int64 = 0
public static var java_util_zip_ZipConstants_CENDSK : Int64 = 0
public static var java_util_zip_ZipConstants_CENATT : Int64 = 0
public static var java_util_zip_ZipConstants_CENATX : Int64 = 0
public static var java_util_zip_ZipConstants_CENOFF : Int64 = 0
public static var java_util_zip_ZipConstants_ENDSUB : Int64 = 0
public static var java_util_zip_ZipConstants_ENDTOT : Int64 = 0
public static var java_util_zip_ZipConstants_ENDSIZ : Int64 = 0
public static var java_util_zip_ZipConstants_ENDOFF : Int64 = 0
public static var java_util_zip_ZipConstants_ENDCOM : Int64 = 0
}

public open class java_util_zip_ZipFile <: Object {
public var java_util_zip_ZipFile_name : ?java_lang_String = None
public var java_util_zip_ZipFile_closeRequested : Bool = false
public var java_util_zip_ZipFile_res : ?Object = None
public static var java_util_zip_ZipFile_STORED : Int64 = 0
public static var java_util_zip_ZipFile_DEFLATED : Int64 = 0
public static var java_util_zip_ZipFile_OPEN_READ : Int64 = 0
public static var java_util_zip_ZipFile_OPEN_DELETE : Int64 = 0
public var java_util_zip_ZipFile_lastEntryName : ?java_lang_String = None
public var java_util_zip_ZipFile_lastEntryPos : Int64 = 0
public static var java_util_zip_ZipFile_isWindows : Bool = false
public static var java_util_zip_ZipFile_LOCSIG : Int64 = 0
public static var java_util_zip_ZipFile_EXTSIG : Int64 = 0
public static var java_util_zip_ZipFile_CENSIG : Int64 = 0
public static var java_util_zip_ZipFile_ENDSIG : Int64 = 0
public static var java_util_zip_ZipFile_LOCHDR : Int64 = 0
public static var java_util_zip_ZipFile_EXTHDR : Int64 = 0
public static var java_util_zip_ZipFile_CENHDR : Int64 = 0
public static var java_util_zip_ZipFile_ENDHDR : Int64 = 0
public static var java_util_zip_ZipFile_LOCVER : Int64 = 0
public static var java_util_zip_ZipFile_LOCFLG : Int64 = 0
public static var java_util_zip_ZipFile_LOCHOW : Int64 = 0
public static var java_util_zip_ZipFile_LOCTIM : Int64 = 0
public static var java_util_zip_ZipFile_LOCCRC : Int64 = 0
public static var java_util_zip_ZipFile_LOCSIZ : Int64 = 0
public static var java_util_zip_ZipFile_LOCLEN : Int64 = 0
public static var java_util_zip_ZipFile_LOCNAM : Int64 = 0
public static var java_util_zip_ZipFile_LOCEXT : Int64 = 0
public static var java_util_zip_ZipFile_EXTCRC : Int64 = 0
public static var java_util_zip_ZipFile_EXTSIZ : Int64 = 0
public static var java_util_zip_ZipFile_EXTLEN : Int64 = 0
public static var java_util_zip_ZipFile_CENVEM : Int64 = 0
public static var java_util_zip_ZipFile_CENVER : Int64 = 0
public static var java_util_zip_ZipFile_CENFLG : Int64 = 0
public static var java_util_zip_ZipFile_CENHOW : Int64 = 0
public static var java_util_zip_ZipFile_CENTIM : Int64 = 0
public static var java_util_zip_ZipFile_CENCRC : Int64 = 0
public static var java_util_zip_ZipFile_CENSIZ : Int64 = 0
public static var java_util_zip_ZipFile_CENLEN : Int64 = 0
public static var java_util_zip_ZipFile_CENNAM : Int64 = 0
public static var java_util_zip_ZipFile_CENEXT : Int64 = 0
public static var java_util_zip_ZipFile_CENCOM : Int64 = 0
public static var java_util_zip_ZipFile_CENDSK : Int64 = 0
public static var java_util_zip_ZipFile_CENATT : Int64 = 0
public static var java_util_zip_ZipFile_CENATX : Int64 = 0
public static var java_util_zip_ZipFile_CENOFF : Int64 = 0
public static var java_util_zip_ZipFile_ENDSUB : Int64 = 0
public static var java_util_zip_ZipFile_ENDTOT : Int64 = 0
public static var java_util_zip_ZipFile_ENDSIZ : Int64 = 0
public static var java_util_zip_ZipFile_ENDOFF : Int64 = 0
public static var java_util_zip_ZipFile_ENDCOM : Int64 = 0
}

public open class java_util_jar_JarFile <: java_util_zip_ZipFile {
public static var java_util_jar_JarFile_BASE_VERSION : ?java_lang_Runtime_Version = None
public static var java_util_jar_JarFile_BASE_VERSION_FEATURE : Int64 = 0
public static var java_util_jar_JarFile_RUNTIME_VERSION : ?java_lang_Runtime_Version = None
public static var java_util_jar_JarFile_MULTI_RELEASE_ENABLED : Bool = false
public static var java_util_jar_JarFile_MULTI_RELEASE_FORCED : Bool = false
public static var java_util_jar_JarFile_isInitializing : ?java_lang_ThreadLocal = None
public static var java_util_jar_JarFile_MAX_ARRAY_SIZE : Int64 = 0
public var java_util_jar_JarFile_manRef : ?java_lang_ref_SoftReference = None
public var java_util_jar_JarFile_manEntry : ?Object = None
public var java_util_jar_JarFile_jv : ?Object = None
public var java_util_jar_JarFile_jvInitialized : Bool = false
public var java_util_jar_JarFile_verify : Bool = false
public var java_util_jar_JarFile_version : ?java_lang_Runtime_Version = None
public var java_util_jar_JarFile_versionFeature : Int64 = 0
public var java_util_jar_JarFile_isMultiRelease : Bool = false
public var java_util_jar_JarFile_hasClassPathAttribute : Bool = false
public var java_util_jar_JarFile_hasCheckedSpecialAttributes : Bool = false
public static var java_util_jar_JarFile_JUZFA : ?Object = None
public static var java_util_jar_JarFile_META_INF : ?java_lang_String = None
public static var java_util_jar_JarFile_META_INF_VERSIONS : ?java_lang_String = None
public static var java_util_jar_JarFile_MANIFEST_NAME : ?java_lang_String = None
public static var java_util_jar_JarFile_CLASSPATH_CHARS : ?Array<Byte> = None
public static var java_util_jar_JarFile_CLASSPATH_LASTOCC : ?Array<Byte> = None
public static var java_util_jar_JarFile_CLASSPATH_OPTOSFT : ?Array<Byte> = None
public static var java_util_jar_JarFile_MULTIRELEASE_CHARS : ?Array<Byte> = None
public static var java_util_jar_JarFile_MULTIRELEASE_LASTOCC : ?Array<Byte> = None
public static var java_util_jar_JarFile_MULTIRELEASE_OPTOSFT : ?Array<Byte> = None
}

public open class jdk_internal_access_JavaUtilZipFileAccess <: Object {

}

public open class java_util_zip_ZipFile_1 <: Object {

}

public open class jdk_internal_access_JavaUtilJarAccess <: Object {

}

public open class java_util_jar_JavaUtilJarAccessImpl <: Object {

}

public open class java_lang_Runtime_Version <: Object {
public var java_lang_Runtime_Version_version : ?Object = None
public var java_lang_Runtime_Version_pre : ?java_util_Optional = None
public var java_lang_Runtime_Version_build : ?java_util_Optional = None
public var java_lang_Runtime_Version_optional : ?java_util_Optional = None
}

public open class java_util_ImmutableCollections_List12 <: java_util_ImmutableCollections_AbstractImmutableList {
public var java_util_ImmutableCollections_List12_e0 : ?Object = None
public var java_util_ImmutableCollections_List12_e1 : ?Object = None
}

public open class java_util_Optional <: Object {
public static var java_util_Optional_EMPTY : ?java_util_Optional = None
public var java_util_Optional_value : ?Object = None
}

public open class jdk_internal_module_SystemModuleFinders_1 <: Object {
public var jdk_internal_module_SystemModuleFinders_1_val_f : ?Object = None
}

public open class java_lang_invoke_LambdaMetafactory <: Object {
public static var java_lang_invoke_LambdaMetafactory_FLAG_SERIALIZABLE : Int64 = 0
public static var java_lang_invoke_LambdaMetafactory_FLAG_MARKERS : Int64 = 0
public static var java_lang_invoke_LambdaMetafactory_FLAG_BRIDGES : Int64 = 0
public static var java_lang_invoke_LambdaMetafactory_EMPTY_CLASS_ARRAY : ?Array<?java_lang_Class> = None
public static var java_lang_invoke_LambdaMetafactory_EMPTY_MT_ARRAY : ?Array<?java_lang_invoke_MethodType> = None
}

public open class java_lang_invoke_MethodType_ConcurrentWeakInternSet <: Object {
public var java_lang_invoke_MethodType_ConcurrentWeakInternSet_map : ?Object = None
public var java_lang_invoke_MethodType_ConcurrentWeakInternSet_stale : ?java_lang_ref_ReferenceQueue = None
}

public open class java_lang_Void <: Object {
public static var java_lang_Void_TYPE : ?java_lang_Class = None
}

public open class java_lang_invoke_MethodTypeForm <: Object {
public var java_lang_invoke_MethodTypeForm_parameterSlotCount : Int8 = 0
public var java_lang_invoke_MethodTypeForm_primitiveCount : Int8 = 0
public var java_lang_invoke_MethodTypeForm_erasedType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_MethodTypeForm_basicType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_MethodTypeForm_methodHandles : ?Array<?java_lang_ref_SoftReference> = None
public static var java_lang_invoke_MethodTypeForm_MH_BASIC_INV : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_MH_NF_INV : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_MH_UNINIT_CS : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_MH_LIMIT : Int64 = 0
public var java_lang_invoke_MethodTypeForm_lambdaForms : ?Array<?java_lang_ref_SoftReference> = None
public static var java_lang_invoke_MethodTypeForm_LF_INVVIRTUAL : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVSTATIC : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVSPECIAL : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_NEWINVSPECIAL : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVINTERFACE : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVSTATIC_INIT : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INTERPRET : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_REBIND : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_DELEGATE : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_DELEGATE_BLOCK_INLINING : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_EX_LINKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_EX_INVOKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_GEN_LINKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_GEN_INVOKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_CS_LINKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_MH_LINKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_GWC : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_GWT : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_TF : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_LOOP : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVSPECIAL_IFC : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_INVNATIVE : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_VH_EX_INVOKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_VH_GEN_INVOKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_VH_GEN_LINKER : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_COLLECTOR : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_LF_LIMIT : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_ERASE : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_WRAP : Int64 = 0
public static var java_lang_invoke_MethodTypeForm_UNWRAP : Int64 = 0
public static var java_lang_invoke_MethodTypeForm__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MethodType_ConcurrentWeakInternSet_WeakEntry <: java_lang_ref_WeakReference {
public var java_lang_invoke_MethodType_ConcurrentWeakInternSet_WeakEntry_hashcode : Int64 = 0
}

public open class sun_invoke_util_Wrapper <: java_lang_Enum {
public static var sun_invoke_util_Wrapper_BOOLEAN : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_BYTE : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_SHORT : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_CHAR : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_INT : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_LONG : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_FLOAT : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_DOUBLE : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_OBJECT : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_VOID : ?sun_invoke_util_Wrapper = None
public static var sun_invoke_util_Wrapper_COUNT : Int64 = 0
public var sun_invoke_util_Wrapper_wrapperType : ?java_lang_Class = None
public var sun_invoke_util_Wrapper_primitiveType : ?java_lang_Class = None
public var sun_invoke_util_Wrapper_basicTypeChar : Rune = ' '
public var sun_invoke_util_Wrapper_basicTypeString : ?java_lang_String = None
public var sun_invoke_util_Wrapper_emptyArray : ?Object = None
public var sun_invoke_util_Wrapper_format : Int64 = 0
public var sun_invoke_util_Wrapper_wrapperSimpleName : ?java_lang_String = None
public var sun_invoke_util_Wrapper_primitiveSimpleName : ?java_lang_String = None
public static var sun_invoke_util_Wrapper_DOUBLE_ZERO : ?Object = None
public static var sun_invoke_util_Wrapper_FLOAT_ZERO : ?Object = None
public static var sun_invoke_util_Wrapper_FROM_PRIM : ?Array<?sun_invoke_util_Wrapper> = None
public static var sun_invoke_util_Wrapper_FROM_WRAP : ?Array<?sun_invoke_util_Wrapper> = None
public static var sun_invoke_util_Wrapper_FROM_CHAR : ?Array<?sun_invoke_util_Wrapper> = None
public static var sun_invoke_util_Wrapper__VALUES : ?Array<?sun_invoke_util_Wrapper> = None
public static var sun_invoke_util_Wrapper__assertionsDisabled : Bool = false
}

public open class sun_invoke_util_Wrapper_Format <: Object {
public static var sun_invoke_util_Wrapper_Format_SLOT_SHIFT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_SIZE_SHIFT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_KIND_SHIFT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_SIGNED : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_UNSIGNED : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_FLOATING : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_SLOT_MASK : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_SIZE_MASK : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_INT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_SHORT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_BOOLEAN : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_CHAR : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_FLOAT : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_VOID : Int64 = 0
public static var sun_invoke_util_Wrapper_Format_NUM_MASK : Int64 = 0
public static var sun_invoke_util_Wrapper_Format__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_NamedFunction <: Object {
public var java_lang_invoke_LambdaForm_NamedFunction_member : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_LambdaForm_NamedFunction_resolvedHandle : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_LambdaForm_NamedFunction_invoker : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_LambdaForm_NamedFunction_INVOKER_METHOD_TYPE : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_LambdaForm_NamedFunction__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_DirectMethodHandle_Holder <: Object {
public var java_lang_invoke_DirectMethodHandle_Holder_this_0 : ?java_lang_invoke_DirectMethodHandle = None
}

public open class sun_invoke_util_ValueConversions <: Object {
public static var sun_invoke_util_ValueConversions_THIS_CLASS : ?java_lang_Class = None
public static var sun_invoke_util_ValueConversions_IMPL_LOOKUP : ?java_lang_invoke_MethodHandles_Lookup = None
public static var sun_invoke_util_ValueConversions_UNBOX_CONVERSIONS : ?Array<?Object> = None
public static var sun_invoke_util_ValueConversions_ZERO_INT : ?java_lang_Integer = None
public static var sun_invoke_util_ValueConversions_ONE_INT : ?java_lang_Integer = None
public static var sun_invoke_util_ValueConversions_BOX_CONVERSIONS : ?Array<?Object> = None
public static var sun_invoke_util_ValueConversions_CONSTANT_FUNCTIONS : ?Array<?Object> = None
public static var sun_invoke_util_ValueConversions_CONVERT_PRIMITIVE_FUNCTIONS : ?Array<?Object> = None
public static var sun_invoke_util_ValueConversions__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MethodHandleImpl <: Object {
public static var java_lang_invoke_MethodHandleImpl_FAKE_METHOD_HANDLE_INVOKE : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_MethodHandleImpl_ARRAYS : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_MethodHandleImpl_MAX_JVM_ARITY : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_NF_checkSpreadArgument : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_guardWithCatch : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_throwException : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_tryFinally : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_loop : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_profileBoolean : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_tableSwitch : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NF_LIMIT : Byte = 0
public static var java_lang_invoke_MethodHandleImpl_NFS : ?Array<?java_lang_invoke_LambdaForm_NamedFunction> = None
public static var java_lang_invoke_MethodHandleImpl_MH_cast : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_selectAlternative : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_countedLoopPred : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_countedLoopStep : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_initIterator : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_iteratePred : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_iterateNext : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_Array_newInstance : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_MH_LIMIT : Int64 = 0
public static var java_lang_invoke_MethodHandleImpl_HANDLES : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_MethodHandleImpl__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_Invokers <: Object {
public var java_lang_invoke_Invokers_targetType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_Invokers_invokers : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_Invokers_INV_EXACT : Int64 = 0
public static var java_lang_invoke_Invokers_INV_GENERIC : Int64 = 0
public static var java_lang_invoke_Invokers_INV_BASIC : Int64 = 0
public static var java_lang_invoke_Invokers_VH_INV_EXACT : Int64 = 0
public static var java_lang_invoke_Invokers_VH_INV_GENERIC : Int64 = 0
public static var java_lang_invoke_Invokers_INV_LIMIT : Int64 = 0
public static var java_lang_invoke_Invokers_MH_LINKER_ARG_APPENDED : Int64 = 0
public static var java_lang_invoke_Invokers_NF_checkExactType : Byte = 0
public static var java_lang_invoke_Invokers_NF_checkGenericType : Byte = 0
public static var java_lang_invoke_Invokers_NF_getCallSiteTarget : Byte = 0
public static var java_lang_invoke_Invokers_NF_checkCustomized : Byte = 0
public static var java_lang_invoke_Invokers_NF_checkVarHandleGenericType : Byte = 0
public static var java_lang_invoke_Invokers_NF_checkVarHandleExactType : Byte = 0
public static var java_lang_invoke_Invokers_NF_directVarHandleTarget : Byte = 0
public static var java_lang_invoke_Invokers_NF_LIMIT : Byte = 0
public static var java_lang_invoke_Invokers_NFS : ?Array<?java_lang_invoke_LambdaForm_NamedFunction> = None
public static var java_lang_invoke_Invokers__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_Kind <: java_lang_Enum {
public static var java_lang_invoke_LambdaForm_Kind_GENERIC : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_ZERO : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_IDENTITY : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_BOUND_REINVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_REINVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DELEGATE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_EXACT_LINKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_EXACT_INVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GENERIC_LINKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GENERIC_INVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_LINK_TO_TARGET_METHOD : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_LINK_TO_CALL_SITE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_VIRTUAL : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_SPECIAL : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_SPECIAL_IFC : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_STATIC : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_NEW_INVOKE_SPECIAL : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_INTERFACE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_DIRECT_INVOKE_STATIC_INIT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_REFERENCE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_REFERENCE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_REFERENCE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_REFERENCE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_INT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_INT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_INT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_INT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_BOOLEAN : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_BOOLEAN : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_BOOLEAN_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_BOOLEAN_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_BYTE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_BYTE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_BYTE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_BYTE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_CHAR : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_CHAR : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_CHAR_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_CHAR_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_SHORT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_SHORT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_SHORT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_SHORT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_LONG : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_LONG : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_LONG_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_LONG_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_FLOAT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_FLOAT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_FLOAT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_FLOAT_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_DOUBLE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_DOUBLE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GET_DOUBLE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_PUT_DOUBLE_VOLATILE : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_TRY_FINALLY : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_TABLE_SWITCH : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_COLLECT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_COLLECTOR : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_CONVERT : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_SPREAD : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_LOOP : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_FIELD : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GUARD : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_GUARD_WITH_CATCH : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_VARHANDLE_EXACT_INVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_VARHANDLE_INVOKER : ?java_lang_invoke_LambdaForm_Kind = None
public static var java_lang_invoke_LambdaForm_Kind_VARHANDLE_LINKER : ?java_lang_invoke_LambdaForm_Kind = None
public var java_lang_invoke_LambdaForm_Kind_defaultLambdaName : ?java_lang_String = None
public var java_lang_invoke_LambdaForm_Kind_methodName : ?java_lang_String = None
public static var java_lang_invoke_LambdaForm_Kind__VALUES : ?Array<?java_lang_invoke_LambdaForm_Kind> = None
}

public open class java_lang_NoSuchMethodException <: java_lang_ReflectiveOperationException {
public static var java_lang_NoSuchMethodException_serialVersionUID : Int64 = 0
}

public open class java_lang_invoke_LambdaForm_BasicType <: java_lang_Enum {
public static var java_lang_invoke_LambdaForm_BasicType_L_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_I_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_J_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_F_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_D_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_V_TYPE : ?java_lang_invoke_LambdaForm_BasicType = None
public static var java_lang_invoke_LambdaForm_BasicType_ALL_TYPES : ?Array<?java_lang_invoke_LambdaForm_BasicType> = None
public static var java_lang_invoke_LambdaForm_BasicType_ARG_TYPES : ?Array<?java_lang_invoke_LambdaForm_BasicType> = None
public static var java_lang_invoke_LambdaForm_BasicType_ARG_TYPE_LIMIT : Int64 = 0
public static var java_lang_invoke_LambdaForm_BasicType_TYPE_LIMIT : Int64 = 0
public static var java_lang_invoke_LambdaForm_BasicType_L_TYPE_NUM : Byte = 0
public static var java_lang_invoke_LambdaForm_BasicType_I_TYPE_NUM : Byte = 0
public static var java_lang_invoke_LambdaForm_BasicType_J_TYPE_NUM : Byte = 0
public static var java_lang_invoke_LambdaForm_BasicType_F_TYPE_NUM : Byte = 0
public static var java_lang_invoke_LambdaForm_BasicType_D_TYPE_NUM : Byte = 0
public static var java_lang_invoke_LambdaForm_BasicType_V_TYPE_NUM : Byte = 0
public var java_lang_invoke_LambdaForm_BasicType_btChar : Rune = ' '
public var java_lang_invoke_LambdaForm_BasicType_btClass : ?java_lang_Class = None
public var java_lang_invoke_LambdaForm_BasicType_btWrapper : ?sun_invoke_util_Wrapper = None
public static var java_lang_invoke_LambdaForm_BasicType__VALUES : ?Array<?java_lang_invoke_LambdaForm_BasicType> = None
public static var java_lang_invoke_LambdaForm_BasicType__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_Name <: Object {
public var java_lang_invoke_LambdaForm_Name_typeHadTurn : ?java_lang_invoke_LambdaForm_BasicType = None
public var java_lang_invoke_LambdaForm_Name_index : Int8 = 0
public var java_lang_invoke_LambdaForm_Name_function : ?java_lang_invoke_LambdaForm_NamedFunction = None
public var java_lang_invoke_LambdaForm_Name_constraint : ?Object = None
public var java_lang_invoke_LambdaForm_Name_arguments : ?Array<?Object> = None
public static var java_lang_invoke_LambdaForm_Name__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_Holder <: Object {
public var java_lang_invoke_LambdaForm_Holder_this_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_InvokerBytecodeGenerator <: Object {
public static var java_lang_invoke_InvokerBytecodeGenerator_MH : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_MHI : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LF : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LFN : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_CLS : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_OBJ : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_OBJARY : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LOOP_CLAUSES : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_MHARY2 : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_MH_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LF_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LFN_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LL_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LLV_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_CLASS_PREFIX : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_SOURCE_PREFIX : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_INVOKER_SUPER_NAME : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_name : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_className : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_lambdaForm : ?java_lang_invoke_LambdaForm = None
public var java_lang_invoke_InvokerBytecodeGenerator_invokerName : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_invokerType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_InvokerBytecodeGenerator_localsMap : ?Array<Int64> = None
public var java_lang_invoke_InvokerBytecodeGenerator_localClasses : ?Array<?java_lang_Class> = None
public var java_lang_invoke_InvokerBytecodeGenerator_cw : ?jdk_internal_org_objectweb_asm_ClassWriter = None
public var java_lang_invoke_InvokerBytecodeGenerator_mv : ?jdk_internal_org_objectweb_asm_MethodVisitor = None
public var java_lang_invoke_InvokerBytecodeGenerator_classData : ?Object = None
public var java_lang_invoke_InvokerBytecodeGenerator_lastClass : ?java_lang_Class = None
public var java_lang_invoke_InvokerBytecodeGenerator_lastInternalName : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_MEMBERNAME_FACTORY : ?java_lang_invoke_MemberName_Factory = None
public static var java_lang_invoke_InvokerBytecodeGenerator_HOST_CLASS : ?java_lang_Class = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LOOKUP : ?java_lang_invoke_MethodHandles_Lookup = None
public static var java_lang_invoke_InvokerBytecodeGenerator_DUMP_CLASS_FILES_COUNTERS : ?java_util_HashMap = None
public static var java_lang_invoke_InvokerBytecodeGenerator_DUMP_CLASS_FILES_DIR : ?java_io_File = None
public static var java_lang_invoke_InvokerBytecodeGenerator_DONTINLINE_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_FORCEINLINE_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_HIDDEN_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_INJECTEDPROFILE_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_LF_COMPILED_SIG : ?java_lang_String = None
public static var java_lang_invoke_InvokerBytecodeGenerator_STATICALLY_INVOCABLE_PACKAGES : ?Array<?java_lang_Class> = None
public static var java_lang_invoke_InvokerBytecodeGenerator__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_InvokerBytecodeGenerator_2 <: Object {
public static var java_lang_invoke_InvokerBytecodeGenerator_2__SwitchMap_java_lang_invoke_LambdaForm_BasicType : ?Array<Int64> = None
public static var java_lang_invoke_InvokerBytecodeGenerator_2__SwitchMap_sun_invoke_util_Wrapper : ?Array<Int64> = None
public static var java_lang_invoke_InvokerBytecodeGenerator_2__SwitchMap_java_lang_invoke_LambdaForm_Kind : ?Array<Int64> = None
public static var java_lang_invoke_InvokerBytecodeGenerator_2__SwitchMap_java_lang_invoke_MethodHandleImpl_Intrinsic : ?Array<Int64> = None
}

public open class java_lang_invoke_MethodHandleImpl_Intrinsic <: java_lang_Enum {
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_SELECT_ALTERNATIVE : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_GUARD_WITH_CATCH : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_TRY_FINALLY : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_TABLE_SWITCH : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_LOOP : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_ARRAY_LOAD : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_ARRAY_STORE : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_ARRAY_LENGTH : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_IDENTITY : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_ZERO : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic_NONE : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public static var java_lang_invoke_MethodHandleImpl_Intrinsic__VALUES : ?Array<?java_lang_invoke_MethodHandleImpl_Intrinsic> = None
}

public open class jdk_internal_org_objectweb_asm_ClassVisitor <: Object {
public var jdk_internal_org_objectweb_asm_ClassVisitor_api : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassVisitor_cv : ?jdk_internal_org_objectweb_asm_ClassVisitor = None
}

public open class jdk_internal_org_objectweb_asm_ClassWriter <: jdk_internal_org_objectweb_asm_ClassVisitor {
public static var jdk_internal_org_objectweb_asm_ClassWriter_COMPUTE_MAXS : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassWriter_COMPUTE_FRAMES : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_version : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_symbolTable : ?jdk_internal_org_objectweb_asm_SymbolTable = None
public var jdk_internal_org_objectweb_asm_ClassWriter_accessFlags : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_thisClass : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_superClass : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_interfaceCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_interfaces : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_ClassWriter_firstField : ?jdk_internal_org_objectweb_asm_FieldWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastField : ?jdk_internal_org_objectweb_asm_FieldWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_firstMethod : ?jdk_internal_org_objectweb_asm_MethodWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastMethod : ?jdk_internal_org_objectweb_asm_MethodWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_numberOfInnerClasses : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_innerClasses : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_ClassWriter_enclosingClassIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_enclosingMethodIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_signatureIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_sourceFileIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_debugExtension : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastRuntimeVisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastRuntimeInvisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastRuntimeVisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastRuntimeInvisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_ClassWriter_moduleWriter : ?Object = None
public var jdk_internal_org_objectweb_asm_ClassWriter_nestHostClassIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_numberOfNestMemberClasses : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_nestMemberClasses : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_ClassWriter_numberOfPermittedSubclassClasses : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassWriter_permittedSubclassClasses : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_ClassWriter_firstRecordComponent : ?Object = None
public var jdk_internal_org_objectweb_asm_ClassWriter_lastRecordComponent : ?Object = None
public var jdk_internal_org_objectweb_asm_ClassWriter_firstAttribute : ?jdk_internal_org_objectweb_asm_Attribute = None
public var jdk_internal_org_objectweb_asm_ClassWriter_compute : Int64 = 0
}

public open class jdk_internal_org_objectweb_asm_SymbolTable <: Object {
public var jdk_internal_org_objectweb_asm_SymbolTable_classWriter : ?jdk_internal_org_objectweb_asm_ClassWriter = None
public var jdk_internal_org_objectweb_asm_SymbolTable_sourceClassReader : ?jdk_internal_org_objectweb_asm_ClassReader = None
public var jdk_internal_org_objectweb_asm_SymbolTable_majorVersion : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_className : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_SymbolTable_entryCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_entries : ?Array<?jdk_internal_org_objectweb_asm_SymbolTable_Entry> = None
public var jdk_internal_org_objectweb_asm_SymbolTable_constantPoolCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_constantPool : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_SymbolTable_bootstrapMethodCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_bootstrapMethods : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_SymbolTable_typeCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_typeTable : ?Array<?jdk_internal_org_objectweb_asm_SymbolTable_Entry> = None
}

public open class jdk_internal_org_objectweb_asm_Symbol <: Object {
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_CLASS_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_FIELDREF_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_METHODREF_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_INTERFACE_METHODREF_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_STRING_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_INTEGER_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_FLOAT_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_LONG_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_DOUBLE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_NAME_AND_TYPE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_UTF8_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_METHOD_HANDLE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_METHOD_TYPE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_DYNAMIC_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_INVOKE_DYNAMIC_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_MODULE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_CONSTANT_PACKAGE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_BOOTSTRAP_METHOD_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_TYPE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_UNINITIALIZED_TYPE_TAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Symbol_MERGED_TYPE_TAG : Int64 = 0
public var jdk_internal_org_objectweb_asm_Symbol_index : Int64 = 0
public var jdk_internal_org_objectweb_asm_Symbol_tag : Int64 = 0
public var jdk_internal_org_objectweb_asm_Symbol_owner : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Symbol_name : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Symbol_value : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Symbol_data : Int64 = 0
public var jdk_internal_org_objectweb_asm_Symbol_info : Int64 = 0
}

public open class jdk_internal_org_objectweb_asm_SymbolTable_Entry <: jdk_internal_org_objectweb_asm_Symbol {
public var jdk_internal_org_objectweb_asm_SymbolTable_Entry_hashCode : Int64 = 0
public var jdk_internal_org_objectweb_asm_SymbolTable_Entry_next : ?jdk_internal_org_objectweb_asm_SymbolTable_Entry = None
}

public open class jdk_internal_org_objectweb_asm_ByteVector <: Object {
public var jdk_internal_org_objectweb_asm_ByteVector_data : ?Array<Byte> = None
public var jdk_internal_org_objectweb_asm_ByteVector_length : Int64 = 0
}

public open class sun_invoke_util_BytecodeDescriptor <: Object {

}

public open class jdk_internal_org_objectweb_asm_MethodVisitor <: Object {
public static var jdk_internal_org_objectweb_asm_MethodVisitor_REQUIRES_ASM5 : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_MethodVisitor_api : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodVisitor_mv : ?jdk_internal_org_objectweb_asm_MethodVisitor = None
}

public open class jdk_internal_org_objectweb_asm_MethodWriter <: jdk_internal_org_objectweb_asm_MethodVisitor {
public static var jdk_internal_org_objectweb_asm_MethodWriter_COMPUTE_NOTHING : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_COMPUTE_MAX_STACK_AND_LOCAL : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_COMPUTE_MAX_STACK_AND_LOCAL_FROM_FRAMES : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_COMPUTE_INSERTED_FRAMES : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_COMPUTE_ALL_FRAMES : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_NA : Int64 = 0
public static var jdk_internal_org_objectweb_asm_MethodWriter_STACK_SIZE_DELTA : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_symbolTable : ?jdk_internal_org_objectweb_asm_SymbolTable = None
public var jdk_internal_org_objectweb_asm_MethodWriter_accessFlags : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_nameIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_name : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_MethodWriter_descriptorIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_descriptor : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_MethodWriter_maxStack : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_maxLocals : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_code : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_firstHandler : ?jdk_internal_org_objectweb_asm_Handler = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastHandler : ?jdk_internal_org_objectweb_asm_Handler = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lineNumberTableLength : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_lineNumberTable : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_localVariableTableLength : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_localVariableTable : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_localVariableTypeTableLength : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_localVariableTypeTable : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_stackMapTableNumberOfEntries : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_stackMapTableEntries : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastCodeRuntimeVisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastCodeRuntimeInvisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_firstCodeAttribute : ?jdk_internal_org_objectweb_asm_Attribute = None
public var jdk_internal_org_objectweb_asm_MethodWriter_numberOfExceptions : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_exceptionIndexTable : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_signatureIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeVisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeInvisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_visibleAnnotableParameterCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeVisibleParameterAnnotations : ?Array<?jdk_internal_org_objectweb_asm_AnnotationWriter> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_invisibleAnnotableParameterCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeInvisibleParameterAnnotations : ?Array<?jdk_internal_org_objectweb_asm_AnnotationWriter> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeVisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastRuntimeInvisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_MethodWriter_defaultValue : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_parametersCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_parameters : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_MethodWriter_firstAttribute : ?jdk_internal_org_objectweb_asm_Attribute = None
public var jdk_internal_org_objectweb_asm_MethodWriter_compute : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_firstBasicBlock : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_MethodWriter_lastBasicBlock : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_MethodWriter_currentBasicBlock : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_MethodWriter_relativeStackSize : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_maxRelativeStackSize : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_currentLocals : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_previousFrameOffset : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_previousFrame : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_currentFrame : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_MethodWriter_hasSubroutines : Bool = false
public var jdk_internal_org_objectweb_asm_MethodWriter_hasAsmInstructions : Bool = false
public var jdk_internal_org_objectweb_asm_MethodWriter_lastBytecodeOffset : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_sourceOffset : Int64 = 0
public var jdk_internal_org_objectweb_asm_MethodWriter_sourceLength : Int64 = 0
}

public open class jdk_internal_org_objectweb_asm_Type <: Object {
public static var jdk_internal_org_objectweb_asm_Type_VOID : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_BOOLEAN : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_CHAR : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_BYTE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_SHORT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_INT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_FLOAT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_LONG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_DOUBLE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_ARRAY : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_OBJECT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_METHOD : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_INTERNAL : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Type_PRIMITIVE_DESCRIPTORS : ?java_lang_String = None
public static var jdk_internal_org_objectweb_asm_Type_VOID_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_BOOLEAN_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_CHAR_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_BYTE_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_SHORT_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_INT_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_FLOAT_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_LONG_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public static var jdk_internal_org_objectweb_asm_Type_DOUBLE_TYPE : ?jdk_internal_org_objectweb_asm_Type = None
public var jdk_internal_org_objectweb_asm_Type_sort : Int64 = 0
public var jdk_internal_org_objectweb_asm_Type_valueBuffer : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Type_valueBegin : Int64 = 0
public var jdk_internal_org_objectweb_asm_Type_valueEnd : Int64 = 0
}

public open class jdk_internal_org_objectweb_asm_Label <: Object {
public static var jdk_internal_org_objectweb_asm_Label_FLAG_DEBUG_ONLY : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_JUMP_TARGET : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_RESOLVED : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_REACHABLE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_SUBROUTINE_CALLER : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_SUBROUTINE_START : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FLAG_SUBROUTINE_END : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_LINE_NUMBERS_CAPACITY_INCREMENT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FORWARD_REFERENCES_CAPACITY_INCREMENT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FORWARD_REFERENCE_TYPE_MASK : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FORWARD_REFERENCE_TYPE_SHORT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FORWARD_REFERENCE_TYPE_WIDE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_FORWARD_REFERENCE_HANDLE_MASK : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Label_EMPTY_LIST : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Label_info : ?Object = None
public var jdk_internal_org_objectweb_asm_Label_flags : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_lineNumber : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_otherLineNumbers : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Label_bytecodeOffset : Int64 = 0
public var jdk_internal_org_objectweb_asm_Label_forwardReferences : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Label_inputStackSize : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_outputStackSize : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_outputStackMax : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_subroutineId : Int8 = 0
public var jdk_internal_org_objectweb_asm_Label_frame : ?jdk_internal_org_objectweb_asm_Frame = None
public var jdk_internal_org_objectweb_asm_Label_nextBasicBlock : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Label_outgoingEdges : ?Object = None
public var jdk_internal_org_objectweb_asm_Label_nextListElement : ?jdk_internal_org_objectweb_asm_Label = None
}

public open class jdk_internal_org_objectweb_asm_Frame <: Object {
public static var jdk_internal_org_objectweb_asm_Frame_SAME_FRAME : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_SAME_LOCALS_1_STACK_ITEM_FRAME : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_RESERVED : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_SAME_LOCALS_1_STACK_ITEM_FRAME_EXTENDED : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_CHOP_FRAME : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_SAME_FRAME_EXTENDED : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_APPEND_FRAME : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_FULL_FRAME : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_TOP : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_INTEGER : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_FLOAT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_DOUBLE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_LONG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_NULL : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_UNINITIALIZED_THIS : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_OBJECT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_UNINITIALIZED : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_ASM_BOOLEAN : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_ASM_BYTE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_ASM_CHAR : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ITEM_ASM_SHORT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_DIM_SIZE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_KIND_SIZE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_FLAGS_SIZE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_VALUE_SIZE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_DIM_SHIFT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_KIND_SHIFT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_FLAGS_SHIFT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_DIM_MASK : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_KIND_MASK : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_VALUE_MASK : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ARRAY_OF : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_ELEMENT_OF : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_CONSTANT_KIND : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_REFERENCE_KIND : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_UNINITIALIZED_KIND : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_LOCAL_KIND : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_STACK_KIND : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_TOP_IF_LONG_OR_DOUBLE_FLAG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_TOP : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_BOOLEAN : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_BYTE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_CHAR : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_SHORT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_INTEGER : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_FLOAT : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_LONG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_DOUBLE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_NULL : Int64 = 0
public static var jdk_internal_org_objectweb_asm_Frame_UNINITIALIZED_THIS : Int64 = 0
public var jdk_internal_org_objectweb_asm_Frame_owner : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Frame_inputLocals : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Frame_inputStack : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Frame_outputLocals : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Frame_outputStack : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_Frame_outputStackStart : Int8 = 0
public var jdk_internal_org_objectweb_asm_Frame_outputStackTop : Int8 = 0
public var jdk_internal_org_objectweb_asm_Frame_initializationCount : Int64 = 0
public var jdk_internal_org_objectweb_asm_Frame_initializations : ?Array<Int64> = None
}

public open class jdk_internal_org_objectweb_asm_AnnotationVisitor <: Object {
public var jdk_internal_org_objectweb_asm_AnnotationVisitor_api : Int64 = 0
public var jdk_internal_org_objectweb_asm_AnnotationVisitor_av : ?jdk_internal_org_objectweb_asm_AnnotationVisitor = None
}

public open class jdk_internal_org_objectweb_asm_AnnotationWriter <: jdk_internal_org_objectweb_asm_AnnotationVisitor {
public var jdk_internal_org_objectweb_asm_AnnotationWriter_symbolTable : ?jdk_internal_org_objectweb_asm_SymbolTable = None
public var jdk_internal_org_objectweb_asm_AnnotationWriter_useNamedValues : Bool = false
public var jdk_internal_org_objectweb_asm_AnnotationWriter_annotation : ?jdk_internal_org_objectweb_asm_ByteVector = None
public var jdk_internal_org_objectweb_asm_AnnotationWriter_numElementValuePairsOffset : Int64 = 0
public var jdk_internal_org_objectweb_asm_AnnotationWriter_numElementValuePairs : Int64 = 0
public var jdk_internal_org_objectweb_asm_AnnotationWriter_previousAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_AnnotationWriter_nextAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
}

public open class java_lang_invoke_InvokerBytecodeGenerator_ClassData <: Object {
public var java_lang_invoke_InvokerBytecodeGenerator_ClassData_name : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_ClassData_desc : ?java_lang_String = None
public var java_lang_invoke_InvokerBytecodeGenerator_ClassData_value : ?Object = None
}

public open class sun_invoke_util_VerifyType <: Object {
public static var sun_invoke_util_VerifyType__assertionsDisabled : Bool = false
}

public open class sun_invoke_empty_Empty <: Object {

}

public open class java_util_ArrayList_Itr <: Object {
public var java_util_ArrayList_Itr_cursor : Int64 = 0
public var java_util_ArrayList_Itr_lastRet : Int64 = 0
public var java_util_ArrayList_Itr_expectedModCount : Int64 = 0
public var java_util_ArrayList_Itr_this_0 : ?java_util_ArrayList = None
}

public open class jdk_internal_org_objectweb_asm_FieldVisitor <: Object {
public var jdk_internal_org_objectweb_asm_FieldVisitor_api : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldVisitor_fv : ?jdk_internal_org_objectweb_asm_FieldVisitor = None
}

public open class jdk_internal_org_objectweb_asm_FieldWriter <: jdk_internal_org_objectweb_asm_FieldVisitor {
public var jdk_internal_org_objectweb_asm_FieldWriter_symbolTable : ?jdk_internal_org_objectweb_asm_SymbolTable = None
public var jdk_internal_org_objectweb_asm_FieldWriter_accessFlags : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldWriter_nameIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldWriter_descriptorIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldWriter_signatureIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldWriter_constantValueIndex : Int64 = 0
public var jdk_internal_org_objectweb_asm_FieldWriter_lastRuntimeVisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_FieldWriter_lastRuntimeInvisibleAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_FieldWriter_lastRuntimeVisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_FieldWriter_lastRuntimeInvisibleTypeAnnotation : ?jdk_internal_org_objectweb_asm_AnnotationWriter = None
public var jdk_internal_org_objectweb_asm_FieldWriter_firstAttribute : ?jdk_internal_org_objectweb_asm_Attribute = None
}

public open class jdk_internal_org_objectweb_asm_Attribute <: Object {
public var jdk_internal_org_objectweb_asm_Attribute_typeHadTurn : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Attribute_content : ?Array<Byte> = None
public var jdk_internal_org_objectweb_asm_Attribute_nextAttribute : ?jdk_internal_org_objectweb_asm_Attribute = None
}

public open class jdk_internal_org_objectweb_asm_Handler <: Object {
public var jdk_internal_org_objectweb_asm_Handler_startPc : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Handler_endPc : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Handler_handlerPc : ?jdk_internal_org_objectweb_asm_Label = None
public var jdk_internal_org_objectweb_asm_Handler_catchType : Int64 = 0
public var jdk_internal_org_objectweb_asm_Handler_catchTypeDescriptor : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Handler_nextHandler : ?jdk_internal_org_objectweb_asm_Handler = None
}

public open class java_lang_invoke_MethodHandles_Lookup_ClassFile <: Object {
public var java_lang_invoke_MethodHandles_Lookup_ClassFile_name : ?java_lang_String = None
public var java_lang_invoke_MethodHandles_Lookup_ClassFile_accessFlags : Int64 = 0
public var java_lang_invoke_MethodHandles_Lookup_ClassFile_bytes : ?Array<Byte> = None
}

public open class java_lang_invoke_MethodHandles_Lookup_ClassOption <: java_lang_Enum {
public static var java_lang_invoke_MethodHandles_Lookup_ClassOption_NESTMATE : ?java_lang_invoke_MethodHandles_Lookup_ClassOption = None
public static var java_lang_invoke_MethodHandles_Lookup_ClassOption_STRONG : ?java_lang_invoke_MethodHandles_Lookup_ClassOption = None
public var java_lang_invoke_MethodHandles_Lookup_ClassOption_flag : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_ClassOption__VALUES : ?Array<?java_lang_invoke_MethodHandles_Lookup_ClassOption> = None
}

public open class java_util_ImmutableCollections_SetN_SetNIterator <: Object {
public var java_util_ImmutableCollections_SetN_SetNIterator_remaining : Int64 = 0
public var java_util_ImmutableCollections_SetN_SetNIterator_idx : Int64 = 0
public var java_util_ImmutableCollections_SetN_SetNIterator_this_0 : ?java_util_ImmutableCollections_SetN = None
}

public open class java_lang_invoke_MethodHandles_Lookup_ClassDefiner <: Object {
public var java_lang_invoke_MethodHandles_Lookup_ClassDefiner_lookup : ?java_lang_invoke_MethodHandles_Lookup = None
public var java_lang_invoke_MethodHandles_Lookup_ClassDefiner_name : ?java_lang_String = None
public var java_lang_invoke_MethodHandles_Lookup_ClassDefiner_bytes : ?Array<Byte> = None
public var java_lang_invoke_MethodHandles_Lookup_ClassDefiner_classFlags : Int64 = 0
public static var java_lang_invoke_MethodHandles_Lookup_ClassDefiner__assertionsDisabled : Bool = false
}

public open class jdk_internal_util_Preconditions <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800000400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800000400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_IncompatibleClassChangeError <: java_lang_LinkageError {
public static var java_lang_IncompatibleClassChangeError_serialVersionUID : Int64 = 0
}

public open class java_lang_NoSuchMethodError <: java_lang_IncompatibleClassChangeError {
public static var java_lang_NoSuchMethodError_serialVersionUID : Int64 = 0
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800000800 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800000800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_BootstrapMethodInvoker <: Object {
public static var java_lang_invoke_BootstrapMethodInvoker_LMF_INDY_MT : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_BootstrapMethodInvoker_LMF_ALT_MT : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_BootstrapMethodInvoker_LMF_CONDY_MT : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_BootstrapMethodInvoker_SCF_MT : ?java_lang_invoke_MethodType = None
public static var java_lang_invoke_BootstrapMethodInvoker__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_VarHandle_AccessMode <: java_lang_Enum {
public static var java_lang_invoke_VarHandle_AccessMode_GET : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_SET : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_VOLATILE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_SET_VOLATILE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_SET_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_OPAQUE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_SET_OPAQUE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_COMPARE_AND_SET : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_COMPARE_AND_EXCHANGE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_COMPARE_AND_EXCHANGE_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_COMPARE_AND_EXCHANGE_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_WEAK_COMPARE_AND_SET_PLAIN : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_WEAK_COMPARE_AND_SET : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_WEAK_COMPARE_AND_SET_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_WEAK_COMPARE_AND_SET_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_SET : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_SET_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_SET_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_ADD : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_ADD_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_ADD_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_OR : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_OR_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_OR_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_AND : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_AND_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_AND_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_XOR : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_XOR_RELEASE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_GET_AND_BITWISE_XOR_ACQUIRE : ?java_lang_invoke_VarHandle_AccessMode = None
public static var java_lang_invoke_VarHandle_AccessMode_COUNT : Int64 = 0
public var java_lang_invoke_VarHandle_AccessMode_methodName : ?java_lang_String = None
public var java_lang_invoke_VarHandle_AccessMode_at : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessMode__VALUES : ?Array<?java_lang_invoke_VarHandle_AccessMode> = None
public static var java_lang_invoke_VarHandle_AccessMode__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_VarHandle_AccessType <: java_lang_Enum {
public static var java_lang_invoke_VarHandle_AccessType_GET : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessType_SET : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessType_COMPARE_AND_SET : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessType_COMPARE_AND_EXCHANGE : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessType_GET_AND_UPDATE : ?java_lang_invoke_VarHandle_AccessType = None
public static var java_lang_invoke_VarHandle_AccessType_COUNT : Int64 = 0
public var java_lang_invoke_VarHandle_AccessType_returnType : ?java_lang_Class = None
public var java_lang_invoke_VarHandle_AccessType_isMonomorphicInReturnType : Bool = false
public static var java_lang_invoke_VarHandle_AccessType__VALUES : ?Array<?java_lang_invoke_VarHandle_AccessType> = None
public static var java_lang_invoke_VarHandle_AccessType__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_Invokers_Holder <: Object {
public var java_lang_invoke_Invokers_Holder_this_0 : ?java_lang_invoke_Invokers = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800000c00 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800000c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800001000 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800001000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_access_JavaLangInvokeAccess <: Object {

}

public open class java_lang_invoke_MethodHandleImpl_1 <: Object {

}

public open class java_lang_invoke_AbstractValidatingLambdaMetafactory <: Object {
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_caller : ?java_lang_invoke_MethodHandles_Lookup = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_targetClass : ?java_lang_Class = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_factoryType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_interfaceClass : ?java_lang_Class = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_interfaceMethodName : ?java_lang_String = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_interfaceMethodType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implementation : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implMethodType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implInfo : ?Object = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implKind : Int64 = 0
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implIsInstanceMethod : Bool = false
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_implClass : ?java_lang_Class = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_dynamicMethodType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_isSerializable : Bool = false
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_altInterfaces : ?Array<?java_lang_Class> = None
public var java_lang_invoke_AbstractValidatingLambdaMetafactory_altMethods : ?Array<?java_lang_invoke_MethodType> = None
}

public open class java_lang_invoke_InnerClassLambdaMetafactory <: java_lang_invoke_AbstractValidatingLambdaMetafactory {
public static var java_lang_invoke_InnerClassLambdaMetafactory_CLASSFILE_VERSION : Int64 = 0
public static var java_lang_invoke_InnerClassLambdaMetafactory_METHOD_DESCRIPTOR_VOID : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_JAVA_LANG_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_CTOR : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_LAMBDA_INSTANCE_FIELD : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_SERIALIZED_LAMBDA : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_NOT_SERIALIZABLE_EXCEPTION : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_METHOD_WRITE_REPLACE : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_METHOD_WRITE_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_METHOD_READ_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_METHOD_WRITE_REPLACE : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_METHOD_READ_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_NAME_METHOD_WRITE_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_CLASS : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_STRING : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_CTOR_SERIALIZED_LAMBDA : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_DESCR_CTOR_NOT_SERIALIZABLE_EXCEPTION : ?java_lang_String = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_SER_HOSTILE_EXCEPTIONS : ?Array<?java_lang_String> = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_EMPTY_STRING_ARRAY : ?Array<?java_lang_String> = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_counter : ?java_util_concurrent_atomic_AtomicInteger = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_dumper : ?Object = None
public static var java_lang_invoke_InnerClassLambdaMetafactory_disableEagerInitialization : Bool = false
public static var java_lang_invoke_InnerClassLambdaMetafactory_implMethodCondy : ?jdk_internal_org_objectweb_asm_ConstantDynamic = None
public var java_lang_invoke_InnerClassLambdaMetafactory_implMethodClassName : ?java_lang_String = None
public var java_lang_invoke_InnerClassLambdaMetafactory_implMethodName : ?java_lang_String = None
public var java_lang_invoke_InnerClassLambdaMetafactory_implMethodDesc : ?java_lang_String = None
public var java_lang_invoke_InnerClassLambdaMetafactory_constructorType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_InnerClassLambdaMetafactory_cw : ?jdk_internal_org_objectweb_asm_ClassWriter = None
public var java_lang_invoke_InnerClassLambdaMetafactory_argNames : ?Array<?java_lang_String> = None
public var java_lang_invoke_InnerClassLambdaMetafactory_argDescs : ?Array<?java_lang_String> = None
public var java_lang_invoke_InnerClassLambdaMetafactory_lambdaClassName : ?java_lang_String = None
public var java_lang_invoke_InnerClassLambdaMetafactory_useImplMethodHandle : Bool = false
public static var java_lang_invoke_InnerClassLambdaMetafactory__assertionsDisabled : Bool = false
}

public open class sun_security_action_GetBooleanAction <: Object {
public var sun_security_action_GetBooleanAction_theProp : ?java_lang_String = None
}

public open class jdk_internal_org_objectweb_asm_Handle <: Object {
public var jdk_internal_org_objectweb_asm_Handle_tag : Int64 = 0
public var jdk_internal_org_objectweb_asm_Handle_owner : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Handle_name : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Handle_descriptor : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_Handle_isInterface : Bool = false
}

public open class jdk_internal_org_objectweb_asm_ConstantDynamic <: Object {
public var jdk_internal_org_objectweb_asm_ConstantDynamic_name : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_ConstantDynamic_descriptor : ?java_lang_String = None
public var jdk_internal_org_objectweb_asm_ConstantDynamic_bootstrapMethod : ?jdk_internal_org_objectweb_asm_Handle = None
public var jdk_internal_org_objectweb_asm_ConstantDynamic_bootstrapMethodArguments : ?Array<?Object> = None
}

public open class java_lang_invoke_MethodHandleInfo <: Object {
public static var java_lang_invoke_MethodHandleInfo_REF_getField : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_getStatic : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_putField : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_putStatic : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_invokeVirtual : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_invokeStatic : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_invokeSpecial : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_newInvokeSpecial : Int64 = 0
public static var java_lang_invoke_MethodHandleInfo_REF_invokeInterface : Int64 = 0
}

public open class java_lang_invoke_InfoFromMemberName <: Object {
public var java_lang_invoke_InfoFromMemberName_member : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_InfoFromMemberName_referenceKind : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName__assertionsDisabled : Bool = false
public static var java_lang_invoke_InfoFromMemberName_REF_getField : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_getStatic : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_putField : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_putStatic : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_invokeVirtual : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_invokeStatic : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_invokeSpecial : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_newInvokeSpecial : Int64 = 0
public static var java_lang_invoke_InfoFromMemberName_REF_invokeInterface : Int64 = 0
}

public open class java_lang_invoke_LambdaProxyClassArchive <: Object {

}

public open class java_lang_invoke_TypeConvertingMethodAdapter <: jdk_internal_org_objectweb_asm_MethodVisitor {
public static var java_lang_invoke_TypeConvertingMethodAdapter_NUM_WRAPPERS : Int64 = 0
public static var java_lang_invoke_TypeConvertingMethodAdapter_NAME_OBJECT : ?java_lang_String = None
public static var java_lang_invoke_TypeConvertingMethodAdapter_WRAPPER_PREFIX : ?java_lang_String = None
public static var java_lang_invoke_TypeConvertingMethodAdapter_NAME_BOX_METHOD : ?java_lang_String = None
public static var java_lang_invoke_TypeConvertingMethodAdapter_wideningOpcodes : ?Array<?Array<Int64>> = None
public static var java_lang_invoke_TypeConvertingMethodAdapter_FROM_WRAPPER_NAME : ?Array<?sun_invoke_util_Wrapper> = None
public static var java_lang_invoke_TypeConvertingMethodAdapter_FROM_TYPE_SORT : ?Array<?sun_invoke_util_Wrapper> = None
public static var java_lang_invoke_TypeConvertingMethodAdapter__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_InnerClassLambdaMetafactory_ForwardingMethodGenerator <: java_lang_invoke_TypeConvertingMethodAdapter {
public var java_lang_invoke_InnerClassLambdaMetafactory_ForwardingMethodGenerator_this_0 : ?java_lang_invoke_InnerClassLambdaMetafactory = None
}

public open class jdk_internal_org_objectweb_asm_ClassReader <: Object {
public static var jdk_internal_org_objectweb_asm_ClassReader_SKIP_CODE : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassReader_SKIP_DEBUG : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassReader_SKIP_FRAMES : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassReader_EXPAND_FRAMES : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassReader_EXPAND_ASM_INSNS : Int64 = 0
public static var jdk_internal_org_objectweb_asm_ClassReader_INPUT_STREAM_DATA_CHUNK_SIZE : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassReader_b : ?Array<Byte> = None
public var jdk_internal_org_objectweb_asm_ClassReader_classFileBuffer : ?Array<Byte> = None
public var jdk_internal_org_objectweb_asm_ClassReader_cpInfoOffsets : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_ClassReader_constantUtf8Values : ?Array<?java_lang_String> = None
public var jdk_internal_org_objectweb_asm_ClassReader_constantDynamicValues : ?Array<?jdk_internal_org_objectweb_asm_ConstantDynamic> = None
public var jdk_internal_org_objectweb_asm_ClassReader_bootstrapMethodOffsets : ?Array<Int64> = None
public var jdk_internal_org_objectweb_asm_ClassReader_maxStringLength : Int64 = 0
public var jdk_internal_org_objectweb_asm_ClassReader_header : Int64 = 0
}

public open class java_lang_StringUTF16 <: Object {
public static var java_lang_StringUTF16_HI_BYTE_SHIFT : Int64 = 0
public static var java_lang_StringUTF16_LO_BYTE_SHIFT : Int64 = 0
public static var java_lang_StringUTF16_MAX_LENGTH : Int64 = 0
public static var java_lang_StringUTF16__assertionsDisabled : Bool = false
}

public open class java_util_ImmutableCollections_Set12_1 <: Object {
public var java_util_ImmutableCollections_Set12_1_idx : Int64 = 0
public var java_util_ImmutableCollections_Set12_1_this_0 : ?java_util_ImmutableCollections_Set12 = None
}

public open class jdk_internal_module_SystemModuleFinders_1__Lambda_1_0x0000000800030be0 <: Object {
public var jdk_internal_module_SystemModuleFinders_1__Lambda_1_0x0000000800030be0_arg_1 : ?Object = None
public var jdk_internal_module_SystemModuleFinders_1__Lambda_1_0x0000000800030be0_arg_2 : ?java_lang_String = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800001400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800001400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_DirectMethodHandle_Constructor <: java_lang_invoke_DirectMethodHandle {
public var java_lang_invoke_DirectMethodHandle_Constructor_initMethod : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_DirectMethodHandle_Constructor_instanceClass : ?java_lang_Class = None
public static var java_lang_invoke_DirectMethodHandle_Constructor__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800001800 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800001800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800001c00 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800001c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_nio_file_attribute_DosFileAttributes <: Object {

}

public open class java_nio_file_attribute_AttributeView <: Object {

}

public open class java_nio_file_attribute_FileAttributeView <: Object {

}

public open class java_nio_file_attribute_BasicFileAttributeView <: Object {

}

public open class java_nio_file_attribute_DosFileAttributeView <: Object {

}

public open class java_nio_file_attribute_UserDefinedFileAttributeView <: Object {

}

public open class sun_nio_fs_UnixFileAttributeViews <: Object {

}

public open class sun_nio_fs_DynamicFileAttributeView <: Object {

}

public open class sun_nio_fs_AbstractBasicFileAttributeView <: Object {
public static var sun_nio_fs_AbstractBasicFileAttributeView_SIZE_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_CREATION_TIME_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_LAST_ACCESS_TIME_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_LAST_MODIFIED_TIME_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_FILE_KEY_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_IS_DIRECTORY_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_IS_REGULAR_FILE_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_IS_SYMBOLIC_LINK_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_IS_OTHER_NAME : ?java_lang_String = None
public static var sun_nio_fs_AbstractBasicFileAttributeView_basicAttributeNames : ?Object = None
}

public open class sun_nio_fs_UnixFileAttributeViews_Basic <: sun_nio_fs_AbstractBasicFileAttributeView {
public var sun_nio_fs_UnixFileAttributeViews_Basic_file : ?sun_nio_fs_UnixPath = None
public var sun_nio_fs_UnixFileAttributeViews_Basic_followLinks : Bool = false
}

public open class sun_nio_fs_UnixFileAttributes_UnixAsBasicFileAttributes <: Object {
public var sun_nio_fs_UnixFileAttributes_UnixAsBasicFileAttributes_attrs : ?sun_nio_fs_UnixFileAttributes = None
}

public open class java_nio_file_DirectoryStream_Filter <: Object {

}

public open class java_nio_file_Files_AcceptAllFilter <: Object {
public static var java_nio_file_Files_AcceptAllFilter_FILTER : ?java_nio_file_Files_AcceptAllFilter = None
}

public open class java_nio_file_DirectoryStream <: Object {

}

public open class java_nio_file_SecureDirectoryStream <: Object {

}

public open class sun_nio_fs_UnixSecureDirectoryStream <: Object {
public var sun_nio_fs_UnixSecureDirectoryStream_ds : ?sun_nio_fs_UnixDirectoryStream = None
public var sun_nio_fs_UnixSecureDirectoryStream_dfd : Int64 = 0
}

public open class sun_nio_fs_UnixDirectoryStream <: Object {
public var sun_nio_fs_UnixDirectoryStream_dir : ?sun_nio_fs_UnixPath = None
public var sun_nio_fs_UnixDirectoryStream_dp : Int64 = 0
public var sun_nio_fs_UnixDirectoryStream_filter : ?Object = None
public var sun_nio_fs_UnixDirectoryStream_streamLock : ?java_util_concurrent_locks_ReentrantReadWriteLock = None
public var sun_nio_fs_UnixDirectoryStream_isClosed : Bool = false
public var sun_nio_fs_UnixDirectoryStream_iterator : ?Object = None
}

public open class java_util_concurrent_locks_ReadWriteLock <: Object {

}

public open class java_util_concurrent_locks_ReentrantReadWriteLock <: Object {
public static var java_util_concurrent_locks_ReentrantReadWriteLock_serialVersionUID : Int64 = 0
public var java_util_concurrent_locks_ReentrantReadWriteLock_readerLock : ?java_util_concurrent_locks_ReentrantReadWriteLock_ReadLock = None
public var java_util_concurrent_locks_ReentrantReadWriteLock_writerLock : ?java_util_concurrent_locks_ReentrantReadWriteLock_WriteLock = None
public var java_util_concurrent_locks_ReentrantReadWriteLock_sync : ?java_util_concurrent_locks_ReentrantReadWriteLock_Sync = None
}

public open class java_util_concurrent_locks_AbstractQueuedSynchronizer <: java_util_concurrent_locks_AbstractOwnableSynchronizer {
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_serialVersionUID : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_WAITING : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_CANCELLED : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_COND : Int64 = 0
public var java_util_concurrent_locks_AbstractQueuedSynchronizer_head : ?Object = None
public var java_util_concurrent_locks_AbstractQueuedSynchronizer_tail : ?Object = None
public var java_util_concurrent_locks_AbstractQueuedSynchronizer_state : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_U : ?jdk_internal_misc_Unsafe = None
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_STATE : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_HEAD : Int64 = 0
public static var java_util_concurrent_locks_AbstractQueuedSynchronizer_TAIL : Int64 = 0
}

public open class java_util_concurrent_locks_ReentrantReadWriteLock_Sync <: java_util_concurrent_locks_AbstractQueuedSynchronizer {
public static var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_serialVersionUID : Int64 = 0
public static var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_SHARED_SHIFT : Int64 = 0
public static var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_SHARED_UNIT : Int64 = 0
public static var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_MAX_COUNT : Int64 = 0
public static var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_EXCLUSIVE_MASK : Int64 = 0
public var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_readHolds : ?java_util_concurrent_locks_ReentrantReadWriteLock_Sync_ThreadLocalHoldCounter = None
public var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_cachedHoldCounter : ?Object = None
public var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_firstReader : ?java_lang_Thread = None
public var java_util_concurrent_locks_ReentrantReadWriteLock_Sync_firstReaderHoldCount : Int64 = 0
}

public open class java_util_concurrent_locks_ReentrantReadWriteLock_FairSync <: java_util_concurrent_locks_ReentrantReadWriteLock_Sync {
public static var java_util_concurrent_locks_ReentrantReadWriteLock_FairSync_serialVersionUID : Int64 = 0
}

public open class java_util_concurrent_locks_ReentrantReadWriteLock_Sync_ThreadLocalHoldCounter <: java_lang_ThreadLocal {

}

public open class java_util_concurrent_locks_ReentrantReadWriteLock_ReadLock <: Object {
public static var java_util_concurrent_locks_ReentrantReadWriteLock_ReadLock_serialVersionUID : Int64 = 0
public var java_util_concurrent_locks_ReentrantReadWriteLock_ReadLock_sync : ?java_util_concurrent_locks_ReentrantReadWriteLock_Sync = None
}

public open class java_util_concurrent_locks_ReentrantReadWriteLock_WriteLock <: Object {
public static var java_util_concurrent_locks_ReentrantReadWriteLock_WriteLock_serialVersionUID : Int64 = 0
public var java_util_concurrent_locks_ReentrantReadWriteLock_WriteLock_sync : ?java_util_concurrent_locks_ReentrantReadWriteLock_Sync = None
}

public open class sun_nio_fs_UnixDirectoryStream_UnixDirectoryIterator <: Object {
public var sun_nio_fs_UnixDirectoryStream_UnixDirectoryIterator_atEof : Bool = false
public var sun_nio_fs_UnixDirectoryStream_UnixDirectoryIterator_nextEntry : ?Object = None
public static var sun_nio_fs_UnixDirectoryStream_UnixDirectoryIterator__assertionsDisabled : Bool = false
public var sun_nio_fs_UnixDirectoryStream_UnixDirectoryIterator_this_0 : ?sun_nio_fs_UnixDirectoryStream = None
}

public open class java_nio_file_attribute_FileAttribute <: Object {

}

public open class sun_nio_fs_UnixFileModeAttribute <: Object {
public static var sun_nio_fs_UnixFileModeAttribute_ALL_PERMISSIONS : Int64 = 0
public static var sun_nio_fs_UnixFileModeAttribute_ALL_READWRITE : Int64 = 0
public static var sun_nio_fs_UnixFileModeAttribute_TEMPFILE_PERMISSIONS : Int64 = 0
}

public open class sun_nio_fs_UnixChannelFactory <: Object {
public static var sun_nio_fs_UnixChannelFactory_fdAccess : ?Object = None
}

public open class sun_nio_fs_UnixChannelFactory_Flags <: Object {
public var sun_nio_fs_UnixChannelFactory_Flags_read : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_write : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_append : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_truncateExisting : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_noFollowLinks : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_create : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_createNew : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_deleteOnClose : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_sync : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_dsync : Bool = false
public var sun_nio_fs_UnixChannelFactory_Flags_direct : Bool = false
}

public open class java_util_Collections_EmptyIterator <: Object {
public static var java_util_Collections_EmptyIterator_EMPTY_ITERATOR : ?java_util_Collections_EmptyIterator = None
}

public open class java_nio_channels_Channel <: Object {

}

public open class java_nio_channels_ReadableByteChannel <: Object {

}

public open class java_nio_channels_WritableByteChannel <: Object {

}

public open class java_nio_channels_ByteChannel <: Object {

}

public open class java_nio_channels_SeekableByteChannel <: Object {

}

public open class java_nio_channels_GatheringByteChannel <: Object {

}

public open class java_nio_channels_ScatteringByteChannel <: Object {

}

public open class java_nio_channels_InterruptibleChannel <: Object {

}

public open class java_nio_channels_spi_AbstractInterruptibleChannel <: Object {
public var java_nio_channels_spi_AbstractInterruptibleChannel_closeLock : ?Object = None
public var java_nio_channels_spi_AbstractInterruptibleChannel_closed : Bool = false
public var java_nio_channels_spi_AbstractInterruptibleChannel_interruptor : ?Object = None
public var java_nio_channels_spi_AbstractInterruptibleChannel_interrupted : ?java_lang_Thread = None
}

public open class java_nio_channels_FileChannel <: java_nio_channels_spi_AbstractInterruptibleChannel {
public static var java_nio_channels_FileChannel_NO_ATTRIBUTES : ?Array<?Object> = None
}

public open class sun_nio_ch_FileChannelImpl <: java_nio_channels_FileChannel {
public static var sun_nio_ch_FileChannelImpl_allocationGranularity : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_fdAccess : ?Object = None
public var sun_nio_ch_FileChannelImpl_nd : ?sun_nio_ch_FileDispatcher = None
public var sun_nio_ch_FileChannelImpl_fd : ?java_io_FileDescriptor = None
public var sun_nio_ch_FileChannelImpl_writable : Bool = false
public var sun_nio_ch_FileChannelImpl_readable : Bool = false
public var sun_nio_ch_FileChannelImpl_parent : ?Object = None
public var sun_nio_ch_FileChannelImpl_path : ?java_lang_String = None
public var sun_nio_ch_FileChannelImpl_threads : ?sun_nio_ch_NativeThreadSet = None
public var sun_nio_ch_FileChannelImpl_positionLock : ?Object = None
public var sun_nio_ch_FileChannelImpl_uninterruptible : Bool = false
public var sun_nio_ch_FileChannelImpl_direct : Bool = false
public var sun_nio_ch_FileChannelImpl_alignment : Int64 = 0
public var sun_nio_ch_FileChannelImpl_closer : ?Object = None
public static var sun_nio_ch_FileChannelImpl_transferSupported : Bool = false
public static var sun_nio_ch_FileChannelImpl_pipeSupported : Bool = false
public static var sun_nio_ch_FileChannelImpl_fileSupported : Bool = false
public static var sun_nio_ch_FileChannelImpl_MAPPED_TRANSFER_SIZE : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_TRANSFER_SIZE : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_MAP_INVALID : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_MAP_RO : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_MAP_RW : Int64 = 0
public static var sun_nio_ch_FileChannelImpl_MAP_PV : Int64 = 0
public var sun_nio_ch_FileChannelImpl_fileLockTable : ?Object = None
public static var sun_nio_ch_FileChannelImpl__assertionsDisabled : Bool = false
}

public open class sun_nio_ch_IOUtil <: Object {
public static var sun_nio_ch_IOUtil_IOV_MAX : Int64 = 0
public static var sun_nio_ch_IOUtil_NIO_ACCESS : ?Object = None
public static var sun_nio_ch_IOUtil__assertionsDisabled : Bool = false
}

public open class sun_nio_ch_NativeThreadSet <: Object {
public var sun_nio_ch_NativeThreadSet_elts : ?Array<Int64> = None
public var sun_nio_ch_NativeThreadSet_used : Int64 = 0
public var sun_nio_ch_NativeThreadSet_waitingToEmpty : Bool = false
public static var sun_nio_ch_NativeThreadSet__assertionsDisabled : Bool = false
}

public open class sun_nio_ch_NativeDispatcher <: Object {

}

public open class sun_nio_ch_FileDispatcher <: sun_nio_ch_NativeDispatcher {
public static var sun_nio_ch_FileDispatcher_NO_LOCK : Int64 = 0
public static var sun_nio_ch_FileDispatcher_LOCKED : Int64 = 0
public static var sun_nio_ch_FileDispatcher_RET_EX_LOCK : Int64 = 0
public static var sun_nio_ch_FileDispatcher_INTERRUPTED : Int64 = 0
}

public open class sun_nio_ch_FileDispatcherImpl <: sun_nio_ch_FileDispatcher {
public static var sun_nio_ch_FileDispatcherImpl_fdAccess : ?Object = None
}

public open class sun_nio_ch_FileChannelImpl_Closer <: Object {
public var sun_nio_ch_FileChannelImpl_Closer_fd : ?java_io_FileDescriptor = None
}

public open class java_nio_channels_Channels <: Object {

}

public open class sun_nio_ch_ChannelInputStream <: java_io_InputStream {
public var sun_nio_ch_ChannelInputStream_ch : ?Object = None
public var sun_nio_ch_ChannelInputStream_bb : ?java_nio_ByteBuffer = None
public var sun_nio_ch_ChannelInputStream_bs : ?Array<Byte> = None
public var sun_nio_ch_ChannelInputStream_b1 : ?Array<Byte> = None
}

public open class java_util_function_Supplier <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800002000 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800002000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_module_ModulePath__Lambda_2_0x0000000800038968 <: Object {
public var jdk_internal_module_ModulePath__Lambda_2_0x0000000800038968_arg_1 : ?jdk_internal_module_ModulePath = None
public var jdk_internal_module_ModulePath__Lambda_2_0x0000000800038968_arg_2 : ?Object = None
}

public open class jdk_internal_module_ModuleInfo <: Object {
public static var jdk_internal_module_ModuleInfo_JLMA : ?Object = None
public var jdk_internal_module_ModuleInfo_packageFinder : ?Object = None
public var jdk_internal_module_ModuleInfo_parseHashes : Bool = false
public static var jdk_internal_module_ModuleInfo_predefinedNotAllowed : ?Object = None
public static var jdk_internal_module_ModuleInfo__assertionsDisabled : Bool = false
}

public open class java_io_DataInput <: Object {

}

public open class java_io_DataInputStream <: java_io_FilterInputStream {
public var java_io_DataInputStream_bytearr : ?Array<Byte> = None
public var java_io_DataInputStream_chararr : ?Array<Rune> = None
public var java_io_DataInputStream_readBuffer : ?Array<Byte> = None
public var java_io_DataInputStream_lineBuffer : ?Array<Rune> = None
}

public open class jdk_internal_module_ModuleInfo_CountingDataInput <: Object {
public var jdk_internal_module_ModuleInfo_CountingDataInput_delegate : ?Object = None
public var jdk_internal_module_ModuleInfo_CountingDataInput_count : Int64 = 0
}

public open class java_nio_channels_SelectableChannel <: java_nio_channels_spi_AbstractInterruptibleChannel {

}

public open class sun_nio_ch_NativeThread <: Object {

}

public open class sun_nio_ch_Util <: Object {
public static var sun_nio_ch_Util_TEMP_BUF_POOL_SIZE : Int64 = 0
public static var sun_nio_ch_Util_MAX_CACHED_BUFFER_SIZE : Int64 = 0
public static var sun_nio_ch_Util_bufferCache : ?java_lang_ThreadLocal = None
public static var sun_nio_ch_Util_unsafeHadTurn : ?jdk_internal_misc_Unsafe = None
public static var sun_nio_ch_Util_pageSize : Int64 = 0
public static var sun_nio_ch_Util_directByteBufferConstructor : ?java_lang_reflect_Constructor = None
public static var sun_nio_ch_Util_directByteBufferRConstructor : ?java_lang_reflect_Constructor = None
public static var sun_nio_ch_Util__assertionsDisabled : Bool = false
}

public open class sun_nio_ch_Util_1 <: jdk_internal_misc_TerminatingThreadLocal {

}

public open class sun_nio_ch_Util_BufferCache <: Object {
public var sun_nio_ch_Util_BufferCache_buffers : ?Array<?java_nio_ByteBuffer> = None
public var sun_nio_ch_Util_BufferCache_count : Int64 = 0
public var sun_nio_ch_Util_BufferCache_start : Int64 = 0
public static var sun_nio_ch_Util_BufferCache__assertionsDisabled : Bool = false
}

public open class java_nio_DirectByteBuffer_Deallocator <: Object {
public var java_nio_DirectByteBuffer_Deallocator_address : Int64 = 0
public var java_nio_DirectByteBuffer_Deallocator_size : Int64 = 0
public var java_nio_DirectByteBuffer_Deallocator_capacity : Int64 = 0
public static var java_nio_DirectByteBuffer_Deallocator__assertionsDisabled : Bool = false
}

public open class sun_nio_ch_IOStatus <: Object {
public static var sun_nio_ch_IOStatus_EOF : Int64 = 0
public static var sun_nio_ch_IOStatus_UNAVAILABLE : Int64 = 0
public static var sun_nio_ch_IOStatus_INTERRUPTED : Int64 = 0
public static var sun_nio_ch_IOStatus_UNSUPPORTED : Int64 = 0
public static var sun_nio_ch_IOStatus_THROWN : Int64 = 0
public static var sun_nio_ch_IOStatus_UNSUPPORTED_CASE : Int64 = 0
}

public open class jdk_internal_module_ModuleInfo_ConstantPool <: Object {
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Utf8 : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Integer : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Float : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Long : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Double : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Class : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_String : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Fieldref : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Methodref : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_InterfaceMethodref : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_NameAndType : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_MethodHandle : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_MethodType : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_InvokeDynamic : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Module : Int64 = 0
public static var jdk_internal_module_ModuleInfo_ConstantPool_CONSTANT_Package : Int64 = 0
public var jdk_internal_module_ModuleInfo_ConstantPool_pool : ?Array<?jdk_internal_module_ModuleInfo_ConstantPool_Entry> = None
}

public open class jdk_internal_module_ModuleInfo_ConstantPool_Entry <: Object {
public var jdk_internal_module_ModuleInfo_ConstantPool_Entry_tag : Int64 = 0
}

public open class jdk_internal_module_ModuleInfo_ConstantPool_ValueEntry <: jdk_internal_module_ModuleInfo_ConstantPool_Entry {
public var jdk_internal_module_ModuleInfo_ConstantPool_ValueEntry_value : ?Object = None
}

public open class jdk_internal_module_ModuleInfo_ConstantPool_IndexEntry <: jdk_internal_module_ModuleInfo_ConstantPool_Entry {
public var jdk_internal_module_ModuleInfo_ConstantPool_IndexEntry_index : Int64 = 0
}

public open class java_lang_module_ModuleDescriptor_Builder <: Object {
public var java_lang_module_ModuleDescriptor_Builder_name : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Builder_strict : Bool = false
public var java_lang_module_ModuleDescriptor_Builder_modifiers : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_openHadTurn : Bool = false
public var java_lang_module_ModuleDescriptor_Builder_automatic : Bool = false
public var java_lang_module_ModuleDescriptor_Builder_packages : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_requires : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_exports : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_opens : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_uses : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_provides : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_version : ?Object = None
public var java_lang_module_ModuleDescriptor_Builder_rawVersionString : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Builder_mainClass : ?java_lang_String = None
public static var java_lang_module_ModuleDescriptor_Builder__assertionsDisabled : Bool = false
}

public open class java_lang_module_ModuleDescriptor_Modifier <: java_lang_Enum {
public static var java_lang_module_ModuleDescriptor_Modifier_OPEN : ?java_lang_module_ModuleDescriptor_Modifier = None
public static var java_lang_module_ModuleDescriptor_Modifier_AUTOMATIC : ?java_lang_module_ModuleDescriptor_Modifier = None
public static var java_lang_module_ModuleDescriptor_Modifier_SYNTHETIC : ?java_lang_module_ModuleDescriptor_Modifier = None
public static var java_lang_module_ModuleDescriptor_Modifier_MANDATED : ?java_lang_module_ModuleDescriptor_Modifier = None
public static var java_lang_module_ModuleDescriptor_Modifier__VALUES : ?Array<?java_lang_module_ModuleDescriptor_Modifier> = None
}

public open class java_lang_module_ModuleDescriptor_Requires_Modifier <: java_lang_Enum {
public static var java_lang_module_ModuleDescriptor_Requires_Modifier_TRANSITIVE : ?java_lang_module_ModuleDescriptor_Requires_Modifier = None
public static var java_lang_module_ModuleDescriptor_Requires_Modifier_STATIC : ?java_lang_module_ModuleDescriptor_Requires_Modifier = None
public static var java_lang_module_ModuleDescriptor_Requires_Modifier_SYNTHETIC : ?java_lang_module_ModuleDescriptor_Requires_Modifier = None
public static var java_lang_module_ModuleDescriptor_Requires_Modifier_MANDATED : ?java_lang_module_ModuleDescriptor_Requires_Modifier = None
public static var java_lang_module_ModuleDescriptor_Requires_Modifier__VALUES : ?Array<?java_lang_module_ModuleDescriptor_Requires_Modifier> = None
}

public open class java_lang_module_ModuleDescriptor_Requires <: Object {
public var java_lang_module_ModuleDescriptor_Requires_mods : ?Object = None
public var java_lang_module_ModuleDescriptor_Requires_name : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Requires_compiledVersion : ?Object = None
public var java_lang_module_ModuleDescriptor_Requires_rawCompiledVersion : ?java_lang_String = None
public static var java_lang_module_ModuleDescriptor_Requires__assertionsDisabled : Bool = false
}

public open class java_util_HashMap_KeySet <: java_util_AbstractSet {
public var java_util_HashMap_KeySet_this_0 : ?java_util_HashMap = None
}

public open class java_util_HashMap_KeyIterator <: java_util_HashMap_HashIterator {
public var java_util_HashMap_KeyIterator_this_0 : ?java_util_HashMap = None
}

public open class java_lang_module_ModuleDescriptor_Exports <: Object {
public var java_lang_module_ModuleDescriptor_Exports_mods : ?Object = None
public var java_lang_module_ModuleDescriptor_Exports_source : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Exports_targets : ?Object = None
}

public open class jdk_internal_module_Checks <: Object {
public static var jdk_internal_module_Checks_RESERVED : ?Object = None
}

public open class java_lang_module_ModuleDescriptor_Provides <: Object {
public var java_lang_module_ModuleDescriptor_Provides_service : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Provides_providers : ?Object = None
}

public open class java_util_function_Consumer <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800002400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800002400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_module_ModuleDescriptor_Builder__Lambda_3_0x000000080003cf48 <: Object {
public var java_lang_module_ModuleDescriptor_Builder__Lambda_3_0x000000080003cf48_arg_1 : ?java_lang_module_ModuleDescriptor_Builder = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800002800 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800002800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800002c00 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800002c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_util_ListIterator <: Object {

}

public open class java_util_ImmutableCollections_ListItr <: Object {
public var java_util_ImmutableCollections_ListItr_list : ?Object = None
public var java_util_ImmutableCollections_ListItr_size : Int64 = 0
public var java_util_ImmutableCollections_ListItr_isListIterator : Bool = false
public var java_util_ImmutableCollections_ListItr_cursor : Int64 = 0
}

public open class java_util_Collections_UnmodifiableCollection <: Object {
public static var java_util_Collections_UnmodifiableCollection_serialVersionUID : Int64 = 0
public var java_util_Collections_UnmodifiableCollection_c : ?Object = None
}

public open class java_util_Collections_UnmodifiableSet <: java_util_Collections_UnmodifiableCollection {
public static var java_util_Collections_UnmodifiableSet_serialVersionUID : Int64 = 0
}

public open class java_util_Collections_UnmodifiableCollection_1 <: Object {
public var java_util_Collections_UnmodifiableCollection_1_i : ?Object = None
public var java_util_Collections_UnmodifiableCollection_1_this_0 : ?java_util_Collections_UnmodifiableCollection = None
}

public open class java_util_HashMap_Values <: java_util_AbstractCollection {
public var java_util_HashMap_Values_this_0 : ?java_util_HashMap = None
}

public open class java_util_HashMap_ValueIterator <: java_util_HashMap_HashIterator {
public var java_util_HashMap_ValueIterator_this_0 : ?java_util_HashMap = None
}

public open class jdk_internal_module_ModuleInfo_Attributes <: Object {
public var jdk_internal_module_ModuleInfo_Attributes_descriptor : ?java_lang_module_ModuleDescriptor = None
public var jdk_internal_module_ModuleInfo_Attributes_target : ?Object = None
public var jdk_internal_module_ModuleInfo_Attributes_recordedHashes : ?Object = None
public var jdk_internal_module_ModuleInfo_Attributes_moduleResolution : ?jdk_internal_module_ModuleResolution = None
}

public open class jdk_internal_module_ModuleReferences <: Object {

}

public open class java_lang_module_ModuleReader <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800003000 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800003000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_module_ModuleReferences__Lambda_4_0x000000080003ebf0 <: Object {
public var jdk_internal_module_ModuleReferences__Lambda_4_0x000000080003ebf0_arg_1 : ?Object = None
}

public open class sun_nio_fs_UnixUriUtils <: Object {
public static var sun_nio_fs_UnixUriUtils_L_DIGIT : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_DIGIT : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_UPALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_UPALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_LOWALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_LOWALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_ALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_ALPHA : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_ALPHANUM : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_ALPHANUM : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_MARK : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_MARK : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_UNRESERVED : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_UNRESERVED : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_PCHAR : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_PCHAR : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_L_PATH : Int64 = 0
public static var sun_nio_fs_UnixUriUtils_H_PATH : Int64 = 0
public static var sun_nio_fs_UnixUriUtils__assertionsDisabled : Bool = false
}

public open class java_util_HexFormat <: Object {
public static var java_util_HexFormat_jla : ?Object = None
public static var java_util_HexFormat_UPPERCASE_DIGITS : ?Array<Byte> = None
public static var java_util_HexFormat_LOWERCASE_DIGITS : ?Array<Byte> = None
public static var java_util_HexFormat_DIGITS : ?Array<Byte> = None
public static var java_util_HexFormat_HEX_FORMAT : ?java_util_HexFormat = None
public static var java_util_HexFormat_EMPTY_BYTES : ?Array<Byte> = None
public var java_util_HexFormat_delimiter : ?java_lang_String = None
public var java_util_HexFormat_prefix : ?java_lang_String = None
public var java_util_HexFormat_suffix : ?java_lang_String = None
public var java_util_HexFormat_digits : ?Array<Byte> = None
public static var java_util_HexFormat__assertionsDisabled : Bool = false
}

public open class java_net_URI_Parser <: Object {
public var java_net_URI_Parser_input : ?java_lang_String = None
public var java_net_URI_Parser_requireServerAuthority : Bool = false
public var java_net_URI_Parser_ipv6byteCount : Int64 = 0
public var java_net_URI_Parser_this_0 : ?java_net_URI = None
}

public open class java_lang_module_ModuleReference <: Object {
public var java_lang_module_ModuleReference_descriptor : ?java_lang_module_ModuleDescriptor = None
public var java_lang_module_ModuleReference_location : ?java_net_URI = None
}

public open class jdk_internal_module_ModuleReferenceImpl <: java_lang_module_ModuleReference {
public var jdk_internal_module_ModuleReferenceImpl_location : ?java_net_URI = None
public var jdk_internal_module_ModuleReferenceImpl_readerSupplier : ?Object = None
public var jdk_internal_module_ModuleReferenceImpl_patcher : ?jdk_internal_module_ModulePatcher = None
public var jdk_internal_module_ModuleReferenceImpl_target : ?Object = None
public var jdk_internal_module_ModuleReferenceImpl_recordedHashes : ?Object = None
public var jdk_internal_module_ModuleReferenceImpl_hasher : ?Object = None
public var jdk_internal_module_ModuleReferenceImpl_moduleResolution : ?jdk_internal_module_ModuleResolution = None
public var jdk_internal_module_ModuleReferenceImpl_cachedHash : ?Array<Byte> = None
public var jdk_internal_module_ModuleReferenceImpl_hash : Int64 = 0
}

public open class java_lang_module_ModuleDescriptor_Opens <: Object {
public var java_lang_module_ModuleDescriptor_Opens_mods : ?Object = None
public var java_lang_module_ModuleDescriptor_Opens_source : ?java_lang_String = None
public var java_lang_module_ModuleDescriptor_Opens_targets : ?Object = None
}

public open class java_util_function_BiPredicate <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800003400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800003400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_module_ModulePath__Lambda_5_0x000000080003fcd8 <: Object {
public var jdk_internal_module_ModulePath__Lambda_5_0x000000080003fcd8_arg_1 : ?jdk_internal_module_ModulePath = None
}

public open class java_nio_file_FileVisitOption <: java_lang_Enum {
public static var java_nio_file_FileVisitOption_FOLLOW_LINKS : ?java_nio_file_FileVisitOption = None
public static var java_nio_file_FileVisitOption__VALUES : ?Array<?java_nio_file_FileVisitOption> = None
}

public open class java_nio_file_FileTreeIterator <: Object {
public var java_nio_file_FileTreeIterator_walker : ?java_nio_file_FileTreeWalker = None
public var java_nio_file_FileTreeIterator_next : ?java_nio_file_FileTreeWalker_Event = None
public static var java_nio_file_FileTreeIterator__assertionsDisabled : Bool = false
}

public open class java_nio_file_FileTreeWalker <: Object {
public var java_nio_file_FileTreeWalker_followLinks : Bool = false
public var java_nio_file_FileTreeWalker_linkOptions : ?Array<?java_nio_file_LinkOption> = None
public var java_nio_file_FileTreeWalker_maxDepth : Int64 = 0
public var java_nio_file_FileTreeWalker_stack : ?java_util_ArrayDeque = None
public var java_nio_file_FileTreeWalker_closed : Bool = false
public static var java_nio_file_FileTreeWalker__assertionsDisabled : Bool = false
}

public open class java_util_Arrays_ArrayList <: java_util_AbstractList {
public static var java_util_Arrays_ArrayList_serialVersionUID : Int64 = 0
public var java_util_Arrays_ArrayList_a : ?Array<?Object> = None
}

public open class java_util_Arrays_ArrayItr <: Object {
public var java_util_Arrays_ArrayItr_cursor : Int64 = 0
public var java_util_Arrays_ArrayItr_a : ?Array<?Object> = None
}

public open class java_nio_file_FileTreeWalker_DirectoryNode <: Object {
public var java_nio_file_FileTreeWalker_DirectoryNode_dir : ?Object = None
public var java_nio_file_FileTreeWalker_DirectoryNode_key : ?Object = None
public var java_nio_file_FileTreeWalker_DirectoryNode_stream : ?Object = None
public var java_nio_file_FileTreeWalker_DirectoryNode_iterator : ?Object = None
public var java_nio_file_FileTreeWalker_DirectoryNode_skipped : Bool = false
}

public open class sun_nio_fs_UnixFileKey <: Object {
public var sun_nio_fs_UnixFileKey_st_dev : Int64 = 0
public var sun_nio_fs_UnixFileKey_st_ino : Int64 = 0
}

public open class java_nio_file_FileTreeWalker_Event <: Object {
public var java_nio_file_FileTreeWalker_Event_typeHadTurn : ?java_nio_file_FileTreeWalker_EventType = None
public var java_nio_file_FileTreeWalker_Event_file : ?Object = None
public var java_nio_file_FileTreeWalker_Event_attrs : ?Object = None
public var java_nio_file_FileTreeWalker_Event_ioe : ?Object = None
}

public open class java_nio_file_FileTreeWalker_EventType <: java_lang_Enum {
public static var java_nio_file_FileTreeWalker_EventType_START_DIRECTORY : ?java_nio_file_FileTreeWalker_EventType = None
public static var java_nio_file_FileTreeWalker_EventType_END_DIRECTORY : ?java_nio_file_FileTreeWalker_EventType = None
public static var java_nio_file_FileTreeWalker_EventType_ENTRY : ?java_nio_file_FileTreeWalker_EventType = None
public static var java_nio_file_FileTreeWalker_EventType__VALUES : ?Array<?java_nio_file_FileTreeWalker_EventType> = None
}

public open class java_util_Spliterators <: Object {
public static var java_util_Spliterators_EMPTY_SPLITERATOR : ?Object = None
public static var java_util_Spliterators_EMPTY_INT_SPLITERATOR : ?Object = None
public static var java_util_Spliterators_EMPTY_LONG_SPLITERATOR : ?Object = None
public static var java_util_Spliterators_EMPTY_DOUBLE_SPLITERATOR : ?Object = None
}

public open class java_util_Spliterator <: Object {
public static var java_util_Spliterator_ORDERED : Int64 = 0
public static var java_util_Spliterator_DISTINCT : Int64 = 0
public static var java_util_Spliterator_SORTED : Int64 = 0
public static var java_util_Spliterator_SIZED : Int64 = 0
public static var java_util_Spliterator_NONNULL : Int64 = 0
public static var java_util_Spliterator_IMMUTABLE : Int64 = 0
public static var java_util_Spliterator_CONCURRENT : Int64 = 0
public static var java_util_Spliterator_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterators_EmptySpliterator <: Object {

}

public open class java_util_Spliterators_EmptySpliterator_OfRef <: java_util_Spliterators_EmptySpliterator {
public static var java_util_Spliterators_EmptySpliterator_OfRef_ORDERED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_DISTINCT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_SORTED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_SIZED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_NONNULL : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_IMMUTABLE : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_CONCURRENT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfRef_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterator_OfPrimitive <: Object {
public static var java_util_Spliterator_OfPrimitive_ORDERED : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_DISTINCT : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_SORTED : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_SIZED : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_NONNULL : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_IMMUTABLE : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_CONCURRENT : Int64 = 0
public static var java_util_Spliterator_OfPrimitive_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterator_OfInt <: Object {
public static var java_util_Spliterator_OfInt_ORDERED : Int64 = 0
public static var java_util_Spliterator_OfInt_DISTINCT : Int64 = 0
public static var java_util_Spliterator_OfInt_SORTED : Int64 = 0
public static var java_util_Spliterator_OfInt_SIZED : Int64 = 0
public static var java_util_Spliterator_OfInt_NONNULL : Int64 = 0
public static var java_util_Spliterator_OfInt_IMMUTABLE : Int64 = 0
public static var java_util_Spliterator_OfInt_CONCURRENT : Int64 = 0
public static var java_util_Spliterator_OfInt_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterators_EmptySpliterator_OfInt <: java_util_Spliterators_EmptySpliterator {
public static var java_util_Spliterators_EmptySpliterator_OfInt_ORDERED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_DISTINCT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_SORTED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_SIZED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_NONNULL : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_IMMUTABLE : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_CONCURRENT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfInt_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterator_OfLong <: Object {
public static var java_util_Spliterator_OfLong_ORDERED : Int64 = 0
public static var java_util_Spliterator_OfLong_DISTINCT : Int64 = 0
public static var java_util_Spliterator_OfLong_SORTED : Int64 = 0
public static var java_util_Spliterator_OfLong_SIZED : Int64 = 0
public static var java_util_Spliterator_OfLong_NONNULL : Int64 = 0
public static var java_util_Spliterator_OfLong_IMMUTABLE : Int64 = 0
public static var java_util_Spliterator_OfLong_CONCURRENT : Int64 = 0
public static var java_util_Spliterator_OfLong_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterators_EmptySpliterator_OfLong <: java_util_Spliterators_EmptySpliterator {
public static var java_util_Spliterators_EmptySpliterator_OfLong_ORDERED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_DISTINCT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_SORTED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_SIZED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_NONNULL : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_IMMUTABLE : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_CONCURRENT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfLong_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterator_OfDouble <: Object {
public static var java_util_Spliterator_OfDouble_ORDERED : Int64 = 0
public static var java_util_Spliterator_OfDouble_DISTINCT : Int64 = 0
public static var java_util_Spliterator_OfDouble_SORTED : Int64 = 0
public static var java_util_Spliterator_OfDouble_SIZED : Int64 = 0
public static var java_util_Spliterator_OfDouble_NONNULL : Int64 = 0
public static var java_util_Spliterator_OfDouble_IMMUTABLE : Int64 = 0
public static var java_util_Spliterator_OfDouble_CONCURRENT : Int64 = 0
public static var java_util_Spliterator_OfDouble_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterators_EmptySpliterator_OfDouble <: java_util_Spliterators_EmptySpliterator {
public static var java_util_Spliterators_EmptySpliterator_OfDouble_ORDERED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_DISTINCT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_SORTED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_SIZED : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_NONNULL : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_IMMUTABLE : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_CONCURRENT : Int64 = 0
public static var java_util_Spliterators_EmptySpliterator_OfDouble_SUBSIZED : Int64 = 0
}

public open class java_util_Spliterators_IteratorSpliterator <: Object {
public static var java_util_Spliterators_IteratorSpliterator_BATCH_UNIT : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_MAX_BATCH : Int64 = 0
public var java_util_Spliterators_IteratorSpliterator_collection : ?Object = None
public var java_util_Spliterators_IteratorSpliterator_it : ?Object = None
public var java_util_Spliterators_IteratorSpliterator_characteristics : Int64 = 0
public var java_util_Spliterators_IteratorSpliterator_est : Int64 = 0
public var java_util_Spliterators_IteratorSpliterator_batch : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_ORDERED : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_DISTINCT : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_SORTED : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_SIZED : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_NONNULL : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_IMMUTABLE : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_CONCURRENT : Int64 = 0
public static var java_util_Spliterators_IteratorSpliterator_SUBSIZED : Int64 = 0
}

public open class java_util_stream_StreamSupport <: Object {

}

public open class java_util_stream_BaseStream <: Object {

}

public open class java_util_stream_Stream <: Object {

}

public open class java_util_stream_PipelineHelper <: Object {

}

public open class java_util_stream_AbstractPipeline <: java_util_stream_PipelineHelper {
public static var java_util_stream_AbstractPipeline_MSG_STREAM_LINKED : ?java_lang_String = None
public static var java_util_stream_AbstractPipeline_MSG_CONSUMED : ?java_lang_String = None
public var java_util_stream_AbstractPipeline_sourceStage : ?java_util_stream_AbstractPipeline = None
public var java_util_stream_AbstractPipeline_previousStage : ?java_util_stream_AbstractPipeline = None
public var java_util_stream_AbstractPipeline_sourceOrOpFlags : Int64 = 0
public var java_util_stream_AbstractPipeline_nextStage : ?java_util_stream_AbstractPipeline = None
public var java_util_stream_AbstractPipeline_depth : Int64 = 0
public var java_util_stream_AbstractPipeline_combinedFlags : Int64 = 0
public var java_util_stream_AbstractPipeline_sourceSpliterator : ?Object = None
public var java_util_stream_AbstractPipeline_sourceSupplier : ?Object = None
public var java_util_stream_AbstractPipeline_linkedOrConsumed : Bool = false
public var java_util_stream_AbstractPipeline_sourceAnyStateful : Bool = false
public var java_util_stream_AbstractPipeline_sourceCloseAction : ?Object = None
public var java_util_stream_AbstractPipeline_parallel : Bool = false
public static var java_util_stream_AbstractPipeline__assertionsDisabled : Bool = false
}

public open class java_util_stream_ReferencePipeline <: java_util_stream_AbstractPipeline {

}

public open class java_util_stream_ReferencePipeline_Head <: java_util_stream_ReferencePipeline {

}

public open class java_util_stream_StreamOpFlag <: java_lang_Enum {
public static var java_util_stream_StreamOpFlag_DISTINCT : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_SORTED : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_ORDERED : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_SIZED : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_SHORT_CIRCUIT : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_SIZE_ADJUSTING : ?java_util_stream_StreamOpFlag = None
public static var java_util_stream_StreamOpFlag_SET_BITS : Int64 = 0
public static var java_util_stream_StreamOpFlag_CLEAR_BITS : Int64 = 0
public static var java_util_stream_StreamOpFlag_PRESERVE_BITS : Int64 = 0
public var java_util_stream_StreamOpFlag_maskTable : ?Object = None
public var java_util_stream_StreamOpFlag_bitPosition : Int64 = 0
public var java_util_stream_StreamOpFlag_set : Int64 = 0
public var java_util_stream_StreamOpFlag_clear : Int64 = 0
public var java_util_stream_StreamOpFlag_preserve : Int64 = 0
public static var java_util_stream_StreamOpFlag_SPLITERATOR_CHARACTERISTICS_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_STREAM_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_OP_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_TERMINAL_OP_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_UPSTREAM_TERMINAL_OP_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_FLAG_MASK : Int64 = 0
public static var java_util_stream_StreamOpFlag_FLAG_MASK_IS : Int64 = 0
public static var java_util_stream_StreamOpFlag_FLAG_MASK_NOT : Int64 = 0
public static var java_util_stream_StreamOpFlag_INITIAL_OPS_VALUE : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_DISTINCT : Int64 = 0
public static var java_util_stream_StreamOpFlag_NOT_DISTINCT : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_SORTED : Int64 = 0
public static var java_util_stream_StreamOpFlag_NOT_SORTED : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_ORDERED : Int64 = 0
public static var java_util_stream_StreamOpFlag_NOT_ORDERED : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_SIZED : Int64 = 0
public static var java_util_stream_StreamOpFlag_NOT_SIZED : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_SHORT_CIRCUIT : Int64 = 0
public static var java_util_stream_StreamOpFlag_IS_SIZE_ADJUSTING : Int64 = 0
public static var java_util_stream_StreamOpFlag__VALUES : ?Array<?java_util_stream_StreamOpFlag> = None
}

public open class java_util_stream_StreamOpFlag_Type <: java_lang_Enum {
public static var java_util_stream_StreamOpFlag_Type_SPLITERATOR : ?java_util_stream_StreamOpFlag_Type = None
public static var java_util_stream_StreamOpFlag_Type_STREAM : ?java_util_stream_StreamOpFlag_Type = None
public static var java_util_stream_StreamOpFlag_Type_OP : ?java_util_stream_StreamOpFlag_Type = None
public static var java_util_stream_StreamOpFlag_Type_TERMINAL_OP : ?java_util_stream_StreamOpFlag_Type = None
public static var java_util_stream_StreamOpFlag_Type_UPSTREAM_TERMINAL_OP : ?java_util_stream_StreamOpFlag_Type = None
public static var java_util_stream_StreamOpFlag_Type__VALUES : ?Array<?java_util_stream_StreamOpFlag_Type> = None
}

public open class java_util_stream_StreamOpFlag_MaskBuilder <: Object {
public var java_util_stream_StreamOpFlag_MaskBuilder_map : ?Object = None
}

public open class java_util_EnumMap <: java_util_AbstractMap {
public var java_util_EnumMap_keyType : ?java_lang_Class = None
public var java_util_EnumMap_keyUniverse : ?Array<?java_lang_Enum> = None
public var java_util_EnumMap_vals : ?Array<?Object> = None
public var java_util_EnumMap_size : Int64 = 0
public static var java_util_EnumMap_NULL : ?Object = None
public var java_util_EnumMap_entrySet : ?Object = None
public static var java_util_EnumMap_serialVersionUID : Int64 = 0
}

public open class java_util_EnumMap_1 <: Object {

}

public open class java_lang_Class_ReflectionData <: Object {
public var java_lang_Class_ReflectionData_declaredFields : ?Array<?java_lang_reflect_Field> = None
public var java_lang_Class_ReflectionData_publicFields : ?Array<?java_lang_reflect_Field> = None
public var java_lang_Class_ReflectionData_declaredMethods : ?Array<?java_lang_reflect_Method> = None
public var java_lang_Class_ReflectionData_publicMethods : ?Array<?java_lang_reflect_Method> = None
public var java_lang_Class_ReflectionData_declaredConstructors : ?Array<?java_lang_reflect_Constructor> = None
public var java_lang_Class_ReflectionData_publicConstructors : ?Array<?java_lang_reflect_Constructor> = None
public var java_lang_Class_ReflectionData_declaredPublicFields : ?Array<?java_lang_reflect_Field> = None
public var java_lang_Class_ReflectionData_declaredPublicMethods : ?Array<?java_lang_reflect_Method> = None
public var java_lang_Class_ReflectionData_interfaces : ?Array<?java_lang_Class> = None
public var java_lang_Class_ReflectionData_simpleName : ?java_lang_String = None
public var java_lang_Class_ReflectionData_canonicalName : ?java_lang_String = None
public static var java_lang_Class_ReflectionData_NULL_SENTINEL : ?java_lang_String = None
public var java_lang_Class_ReflectionData_redefinedCount : Int64 = 0
}

public open class java_lang_Class_Atomic <: Object {
public static var java_lang_Class_Atomic_unsafeHadTurn : ?jdk_internal_misc_Unsafe = None
public static var java_lang_Class_Atomic_reflectionDataOffset : Int64 = 0
public static var java_lang_Class_Atomic_annotationTypeOffset : Int64 = 0
public static var java_lang_Class_Atomic_annotationDataOffset : Int64 = 0
}

public open class java_lang_PublicMethods_MethodList <: Object {
public var java_lang_PublicMethods_MethodList_method : ?java_lang_reflect_Method = None
public var java_lang_PublicMethods_MethodList_next : ?java_lang_PublicMethods_MethodList = None
}

public open class java_lang_PublicMethods_Key <: Object {
public static var java_lang_PublicMethods_Key_reflectionFactory : ?jdk_internal_reflect_ReflectionFactory = None
public var java_lang_PublicMethods_Key_name : ?java_lang_String = None
public var java_lang_PublicMethods_Key_ptypes : ?Array<?java_lang_Class> = None
}

public open class java_lang_Class_3 <: Object {
public var java_lang_Class_3_val_values : ?java_lang_reflect_Method = None
public var java_lang_Class_3_this_0 : ?java_lang_Class = None
}

public open class sun_reflect_annotation_AnnotationParser <: Object {
public static var sun_reflect_annotation_AnnotationParser_EMPTY_ANNOTATIONS_ARRAY : ?Array<?Object> = None
public static var sun_reflect_annotation_AnnotationParser_EMPTY_ANNOTATION_ARRAY : ?Array<?Object> = None
}

public open class jdk_internal_reflect_NativeMethodAccessorImpl <: jdk_internal_reflect_MethodAccessorImpl {
public static var jdk_internal_reflect_NativeMethodAccessorImpl_U : ?jdk_internal_misc_Unsafe = None
public static var jdk_internal_reflect_NativeMethodAccessorImpl_GENERATED_OFFSET : Int64 = 0
public var jdk_internal_reflect_NativeMethodAccessorImpl_method : ?java_lang_reflect_Method = None
public var jdk_internal_reflect_NativeMethodAccessorImpl_parent : ?jdk_internal_reflect_DelegatingMethodAccessorImpl = None
public var jdk_internal_reflect_NativeMethodAccessorImpl_numInvocations : Int64 = 0
public var jdk_internal_reflect_NativeMethodAccessorImpl_generated : Int64 = 0
}

public open class jdk_internal_reflect_DelegatingMethodAccessorImpl <: jdk_internal_reflect_MethodAccessorImpl {
public var jdk_internal_reflect_DelegatingMethodAccessorImpl_delegate : ?jdk_internal_reflect_MethodAccessorImpl = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800003800 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800003800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_nio_file_Files__Lambda_6_0x0000000800017980 <: Object {
public var java_nio_file_Files__Lambda_6_0x0000000800017980_arg_1 : ?java_nio_file_FileTreeIterator = None
}

public open class java_util_function_Predicate <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800003c00 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800003c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_nio_file_Files__Lambda_7_0x0000000800017da8 <: Object {
public var java_nio_file_Files__Lambda_7_0x0000000800017da8_arg_1 : ?Object = None
}

public open class java_util_stream_ReferencePipeline_StatelessOp <: java_util_stream_ReferencePipeline {
public static var java_util_stream_ReferencePipeline_StatelessOp__assertionsDisabled : Bool = false
}

public open class java_util_stream_ReferencePipeline_2 <: java_util_stream_ReferencePipeline_StatelessOp {
public var java_util_stream_ReferencePipeline_2_val_predicate : ?Object = None
public var java_util_stream_ReferencePipeline_2_this_0 : ?java_util_stream_ReferencePipeline = None
}

public open class java_util_stream_StreamShape <: java_lang_Enum {
public static var java_util_stream_StreamShape_REFERENCE : ?java_util_stream_StreamShape = None
public static var java_util_stream_StreamShape_INT_VALUE : ?java_util_stream_StreamShape = None
public static var java_util_stream_StreamShape_LONG_VALUE : ?java_util_stream_StreamShape = None
public static var java_util_stream_StreamShape_DOUBLE_VALUE : ?java_util_stream_StreamShape = None
public static var java_util_stream_StreamShape__VALUES : ?Array<?java_util_stream_StreamShape> = None
}

public open class java_nio_file_Files__Lambda_8_0x0000000800018e28 <: Object {

}

public open class java_lang_invoke_InnerClassLambdaMetafactory_1 <: Object {
public var java_lang_invoke_InnerClassLambdaMetafactory_1_val_innerClass : ?java_lang_Class = None
public var java_lang_invoke_InnerClassLambdaMetafactory_1_this_0 : ?java_lang_invoke_InnerClassLambdaMetafactory = None
}

public open class jdk_internal_reflect_DelegatingConstructorAccessorImpl <: jdk_internal_reflect_ConstructorAccessorImpl {
public var jdk_internal_reflect_DelegatingConstructorAccessorImpl_delegate : ?jdk_internal_reflect_ConstructorAccessorImpl = None
}

public open class java_lang_invoke_BoundMethodHandle <: java_lang_invoke_MethodHandle {
public static var java_lang_invoke_BoundMethodHandle_FIELD_COUNT_THRESHOLD : Int64 = 0
public static var java_lang_invoke_BoundMethodHandle_FORM_EXPRESSION_THRESHOLD : Int64 = 0
public static var java_lang_invoke_BoundMethodHandle_SPECIALIZER : ?java_lang_invoke_BoundMethodHandle_Specializer = None
public static var java_lang_invoke_BoundMethodHandle__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_ClassSpecializer <: Object {
public var java_lang_invoke_ClassSpecializer_topClass : ?java_lang_Class = None
public var java_lang_invoke_ClassSpecializer_keyType : ?java_lang_Class = None
public var java_lang_invoke_ClassSpecializer_metaType : ?java_lang_Class = None
public var java_lang_invoke_ClassSpecializer_sdAccessor : ?java_lang_invoke_MemberName = None
public var java_lang_invoke_ClassSpecializer_sdFieldName : ?java_lang_String = None
public var java_lang_invoke_ClassSpecializer_transformMethods : ?Object = None
public var java_lang_invoke_ClassSpecializer_baseConstructorType : ?java_lang_invoke_MethodType = None
public var java_lang_invoke_ClassSpecializer_topSpecies : ?java_lang_invoke_ClassSpecializer_SpeciesData = None
public var java_lang_invoke_ClassSpecializer_cache : ?java_util_concurrent_ConcurrentHashMap = None
public var java_lang_invoke_ClassSpecializer_factory : ?java_lang_invoke_ClassSpecializer_Factory = None
public var java_lang_invoke_ClassSpecializer_topClassIsSuper : Bool = false
public static var java_lang_invoke_ClassSpecializer_CREATE_RESERVATION : ?Object = None
public static var java_lang_invoke_ClassSpecializer_MH : ?java_lang_String = None
public static var java_lang_invoke_ClassSpecializer_MH_SIG : ?java_lang_String = None
public static var java_lang_invoke_ClassSpecializer_STABLE : ?java_lang_String = None
public static var java_lang_invoke_ClassSpecializer_STABLE_SIG : ?java_lang_String = None
public static var java_lang_invoke_ClassSpecializer_E_THROWABLE : ?Array<?java_lang_String> = None
public static var java_lang_invoke_ClassSpecializer__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_BoundMethodHandle_Specializer <: java_lang_invoke_ClassSpecializer {
public static var java_lang_invoke_BoundMethodHandle_Specializer_SPECIES_DATA_ACCESSOR : ?java_lang_invoke_MemberName = None
public static var java_lang_invoke_BoundMethodHandle_Specializer_BMH_TRANSFORMS : ?Object = None
public static var java_lang_invoke_BoundMethodHandle_Specializer_TN_COPY_NO_EXTEND : Int64 = 0
public static var java_lang_invoke_BoundMethodHandle_Specializer__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_ClassSpecializer_1 <: Object {

}

public open class java_lang_invoke_ClassSpecializer_SpeciesData <: Object {
public var java_lang_invoke_ClassSpecializer_SpeciesData_key : ?Object = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_fieldTypes : ?Object = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_speciesCode : ?java_lang_Class = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_factories : ?Object = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_getters : ?Object = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_nominalGetters : ?Object = None
public var java_lang_invoke_ClassSpecializer_SpeciesData_transformHelpers : ?Array<?java_lang_invoke_MethodHandle> = None
public static var java_lang_invoke_ClassSpecializer_SpeciesData__assertionsDisabled : Bool = false
public var java_lang_invoke_ClassSpecializer_SpeciesData_this_0 : ?java_lang_invoke_ClassSpecializer = None
}

public open class java_lang_invoke_BoundMethodHandle_SpeciesData <: java_lang_invoke_ClassSpecializer_SpeciesData {
public var java_lang_invoke_BoundMethodHandle_SpeciesData_extensions : ?Array<?java_lang_invoke_BoundMethodHandle_SpeciesData> = None
public static var java_lang_invoke_BoundMethodHandle_SpeciesData__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_ClassSpecializer_Factory <: Object {
public var java_lang_invoke_ClassSpecializer_Factory_SPECIES_DATA : ?java_lang_String = None
public var java_lang_invoke_ClassSpecializer_Factory_SPECIES_DATA_SIG : ?java_lang_String = None
public var java_lang_invoke_ClassSpecializer_Factory_SPECIES_DATA_NAME : ?java_lang_String = None
public var java_lang_invoke_ClassSpecializer_Factory_SPECIES_DATA_MODS : Int64 = 0
public var java_lang_invoke_ClassSpecializer_Factory_TRANSFORM_NAMES : ?Object = None
public var java_lang_invoke_ClassSpecializer_Factory_TRANSFORM_TYPES : ?Object = None
public var java_lang_invoke_ClassSpecializer_Factory_TRANSFORM_MODS : ?Object = None
public static var java_lang_invoke_ClassSpecializer_Factory_ACC_PPP : Int64 = 0
public static var java_lang_invoke_ClassSpecializer_Factory__assertionsDisabled : Bool = false
public var java_lang_invoke_ClassSpecializer_Factory_this_0 : ?java_lang_invoke_ClassSpecializer = None
}

public open class java_lang_invoke_BoundMethodHandle_Specializer_Factory <: java_lang_invoke_ClassSpecializer_Factory {
public var java_lang_invoke_BoundMethodHandle_Specializer_Factory_this_0 : ?java_lang_invoke_BoundMethodHandle_Specializer = None
}

public open class java_lang_invoke_SimpleMethodHandle <: java_lang_invoke_BoundMethodHandle {
public static var java_lang_invoke_SimpleMethodHandle_BMH_SPECIES : ?java_lang_invoke_BoundMethodHandle_SpeciesData = None
}

public open class java_lang_NoSuchFieldException <: java_lang_ReflectiveOperationException {
public static var java_lang_NoSuchFieldException_serialVersionUID : Int64 = 0
}

public open class java_lang_invoke_BoundMethodHandle_Species_L <: java_lang_invoke_BoundMethodHandle {
public var java_lang_invoke_BoundMethodHandle_Species_L_argL0 : ?Object = None
public static var java_lang_invoke_BoundMethodHandle_Species_L_BMH_SPECIES : ?java_lang_invoke_BoundMethodHandle_SpeciesData = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800004000 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800004000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_DirectMethodHandle_2 <: Object {
public static var java_lang_invoke_DirectMethodHandle_2__SwitchMap_sun_invoke_util_Wrapper : ?Array<Int64> = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800004400 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800004400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_DirectMethodHandle_Accessor <: java_lang_invoke_DirectMethodHandle {
public var java_lang_invoke_DirectMethodHandle_Accessor_fieldType : ?java_lang_Class = None
public var java_lang_invoke_DirectMethodHandle_Accessor_fieldOffset : Int64 = 0
public static var java_lang_invoke_DirectMethodHandle_Accessor__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800004800 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800004800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_DelegatingMethodHandle <: java_lang_invoke_MethodHandle {
public static var java_lang_invoke_DelegatingMethodHandle_NF_getTarget : ?java_lang_invoke_LambdaForm_NamedFunction = None
public static var java_lang_invoke_DelegatingMethodHandle__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_MethodHandleImpl_IntrinsicMethodHandle <: java_lang_invoke_DelegatingMethodHandle {
public var java_lang_invoke_MethodHandleImpl_IntrinsicMethodHandle_target : ?java_lang_invoke_MethodHandle = None
public var java_lang_invoke_MethodHandleImpl_IntrinsicMethodHandle_intrinsicName : ?java_lang_invoke_MethodHandleImpl_Intrinsic = None
public var java_lang_invoke_MethodHandleImpl_IntrinsicMethodHandle_intrinsicData : ?Object = None
}

public open class java_lang_invoke_DelegatingMethodHandle_Holder <: Object {
public var java_lang_invoke_DelegatingMethodHandle_Holder_this_0 : ?java_lang_invoke_DelegatingMethodHandle = None
}

public open class sun_invoke_util_Wrapper_1 <: Object {
public static var sun_invoke_util_Wrapper_1__SwitchMap_sun_invoke_util_Wrapper : ?Array<Int64> = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800004c00 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800004c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaFormEditor <: Object {
public var java_lang_invoke_LambdaFormEditor_lambdaForm : ?java_lang_invoke_LambdaForm = None
public static var java_lang_invoke_LambdaFormEditor_BIND_ARG : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_ADD_ARG : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_DUP_ARG : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_SPREAD_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FILTER_ARG : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FILTER_RETURN : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FILTER_RETURN_TO_ZERO : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_COLLECT_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_COLLECT_ARGS_TO_VOID : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_COLLECT_ARGS_TO_ARRAY : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FOLD_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FOLD_ARGS_TO_VOID : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_PERMUTE_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_LOCAL_TYPES : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FOLD_SELECT_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FOLD_SELECT_ARGS_TO_VOID : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_FILTER_SELECT_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_REPEAT_FILTER_ARGS : Byte = 0
public static var java_lang_invoke_LambdaFormEditor_MIN_CACHE_ARRAY_SIZE : Int64 = 0
public static var java_lang_invoke_LambdaFormEditor_MAX_CACHE_ARRAY_SIZE : Int64 = 0
public static var java_lang_invoke_LambdaFormEditor__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaFormEditor_TransformKey <: Object {
public var java_lang_invoke_LambdaFormEditor_TransformKey_packedBytes : Int64 = 0
public var java_lang_invoke_LambdaFormEditor_TransformKey_fullBytes : ?Array<Byte> = None
public static var java_lang_invoke_LambdaFormEditor_TransformKey_NO_BYTES : ?Array<Byte> = None
public static var java_lang_invoke_LambdaFormEditor_TransformKey_STRESS_TEST : Bool = false
public static var java_lang_invoke_LambdaFormEditor_TransformKey_PACKED_BYTE_SIZE : Int64 = 0
public static var java_lang_invoke_LambdaFormEditor_TransformKey_PACKED_BYTE_MASK : Int64 = 0
public static var java_lang_invoke_LambdaFormEditor_TransformKey_PACKED_BYTE_MAX_LENGTH : Int64 = 0
public static var java_lang_invoke_LambdaFormEditor_TransformKey__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaFormBuffer <: Object {
public var java_lang_invoke_LambdaFormBuffer_arity : Int64 = 0
public var java_lang_invoke_LambdaFormBuffer_length : Int64 = 0
public var java_lang_invoke_LambdaFormBuffer_names : ?Array<?java_lang_invoke_LambdaForm_Name> = None
public var java_lang_invoke_LambdaFormBuffer_originalNames : ?Array<?java_lang_invoke_LambdaForm_Name> = None
public var java_lang_invoke_LambdaFormBuffer_flags : Byte = 0
public var java_lang_invoke_LambdaFormBuffer_firstChange : Int64 = 0
public var java_lang_invoke_LambdaFormBuffer_resultName : ?java_lang_invoke_LambdaForm_Name = None
public var java_lang_invoke_LambdaFormBuffer_dups : ?java_util_ArrayList = None
public static var java_lang_invoke_LambdaFormBuffer_F_TRANS : Int64 = 0
public static var java_lang_invoke_LambdaFormBuffer_F_OWNED : Int64 = 0
public static var java_lang_invoke_LambdaFormBuffer__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaFormEditor_Transform <: java_lang_ref_SoftReference {
public var java_lang_invoke_LambdaFormEditor_Transform_packedBytes : Int64 = 0
public var java_lang_invoke_LambdaFormEditor_Transform_fullBytes : ?Array<Byte> = None
public static var java_lang_invoke_LambdaFormEditor_Transform__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800005000 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800005000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800005400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800005400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_LambdaForm_MH_0x0000000800005800 <: Object {
public static var java_lang_invoke_LambdaForm_MH_0x0000000800005800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_util_stream_ReferencePipeline_3 <: java_util_stream_ReferencePipeline_StatelessOp {
public var java_util_stream_ReferencePipeline_3_val_mapper : ?Object = None
public var java_util_stream_ReferencePipeline_3_this_0 : ?java_util_stream_ReferencePipeline = None
}

public open class jdk_internal_module_ModulePath__Lambda_9_0x000000080001d830 <: Object {
public var jdk_internal_module_ModulePath__Lambda_9_0x000000080001d830_arg_1 : ?Object = None
}

public open class jdk_internal_module_ModulePath__Lambda_10_0x000000080001da78 <: Object {
public var jdk_internal_module_ModulePath__Lambda_10_0x000000080001da78_arg_1 : ?jdk_internal_module_ModulePath = None
}

public open class jdk_internal_module_ModulePath__Lambda_11_0x000000080001dcc0 <: Object {

}

public open class java_util_stream_ReferencePipeline_7 <: java_util_stream_ReferencePipeline_StatelessOp {
public var java_util_stream_ReferencePipeline_7_val_mapper : ?Object = None
public var java_util_stream_ReferencePipeline_7_this_0 : ?java_util_stream_ReferencePipeline = None
}

public open class java_util_stream_Collectors <: Object {
public static var java_util_stream_Collectors_CH_CONCURRENT_ID : ?Object = None
public static var java_util_stream_Collectors_CH_CONCURRENT_NOID : ?Object = None
public static var java_util_stream_Collectors_CH_ID : ?Object = None
public static var java_util_stream_Collectors_CH_UNORDERED_ID : ?Object = None
public static var java_util_stream_Collectors_CH_NOID : ?Object = None
public static var java_util_stream_Collectors_CH_UNORDERED_NOID : ?Object = None
}

public open class java_util_stream_Collector_Characteristics <: java_lang_Enum {
public static var java_util_stream_Collector_Characteristics_CONCURRENT : ?java_util_stream_Collector_Characteristics = None
public static var java_util_stream_Collector_Characteristics_UNORDERED : ?java_util_stream_Collector_Characteristics = None
public static var java_util_stream_Collector_Characteristics_IDENTITY_FINISH : ?java_util_stream_Collector_Characteristics = None
public static var java_util_stream_Collector_Characteristics__VALUES : ?Array<?java_util_stream_Collector_Characteristics> = None
}

public open class java_util_EnumSet <: java_util_AbstractSet {
public static var java_util_EnumSet_serialVersionUID : Int64 = 0
public var java_util_EnumSet_elementType : ?java_lang_Class = None
public var java_util_EnumSet_universe : ?Array<?java_lang_Enum> = None
}

public open class java_util_RegularEnumSet <: java_util_EnumSet {
public static var java_util_RegularEnumSet_serialVersionUID : Int64 = 0
public var java_util_RegularEnumSet_elements : Int64 = 0
}

public open class java_util_stream_Collector <: Object {

}

public open class java_util_stream_Collectors_CollectorImpl <: Object {
public var java_util_stream_Collectors_CollectorImpl_supplier : ?Object = None
public var java_util_stream_Collectors_CollectorImpl_accumulator : ?Object = None
public var java_util_stream_Collectors_CollectorImpl_combiner : ?Object = None
public var java_util_stream_Collectors_CollectorImpl_finisher : ?Object = None
public var java_util_stream_Collectors_CollectorImpl_characteristics : ?Object = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800005c00 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800005c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_util_stream_Collectors__Lambda_12_0x000000080001f740 <: Object {

}

public open class java_util_function_BiConsumer <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800006000 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800006000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_invoke_DirectMethodHandle_Interface <: java_lang_invoke_DirectMethodHandle {
public var java_lang_invoke_DirectMethodHandle_Interface_refc : ?java_lang_Class = None
public static var java_lang_invoke_DirectMethodHandle_Interface__assertionsDisabled : Bool = false
}

public open class java_util_stream_Collectors__Lambda_13_0x0000000800008000 <: Object {

}

public open class java_util_function_BiFunction <: Object {

}

public open class java_util_function_BinaryOperator <: Object {

}

public open class java_util_stream_Collectors__Lambda_14_0x0000000800008630 <: Object {

}

public open class java_util_stream_Collectors__Lambda_15_0x0000000800008878 <: Object {

}

public open class java_util_stream_ReduceOps <: Object {

}

public open class java_util_stream_TerminalOp <: Object {

}

public open class java_util_stream_ReduceOps_ReduceOp <: Object {
public var java_util_stream_ReduceOps_ReduceOp_inputShape : ?java_util_stream_StreamShape = None
}

public open class java_util_stream_ReduceOps_3 <: java_util_stream_ReduceOps_ReduceOp {
public var java_util_stream_ReduceOps_3_val_combiner : ?Object = None
public var java_util_stream_ReduceOps_3_val_accumulator : ?Object = None
public var java_util_stream_ReduceOps_3_val_supplier : ?Object = None
public var java_util_stream_ReduceOps_3_val_collector : ?Object = None
}

public open class java_util_stream_Sink <: Object {

}

public open class java_util_stream_TerminalSink <: Object {

}

public open class java_util_stream_ReduceOps_AccumulatingSink <: Object {

}

public open class java_util_stream_ReduceOps_Box <: Object {
public var java_util_stream_ReduceOps_Box_state : ?Object = None
}

public open class java_util_stream_ReduceOps_3ReducingSink <: java_util_stream_ReduceOps_Box {
public var java_util_stream_ReduceOps_3ReducingSink_val_supplier : ?Object = None
public var java_util_stream_ReduceOps_3ReducingSink_val_accumulator : ?Object = None
public var java_util_stream_ReduceOps_3ReducingSink_val_combiner : ?Object = None
}

public open class java_util_stream_Sink_ChainedReference <: Object {
public var java_util_stream_Sink_ChainedReference_downstream : ?Object = None
}

public open class java_util_stream_ReferencePipeline_7_1 <: java_util_stream_Sink_ChainedReference {
public var java_util_stream_ReferencePipeline_7_1_cancellationRequestedCalled : Bool = false
public var java_util_stream_ReferencePipeline_7_1_this_1 : ?java_util_stream_ReferencePipeline_7 = None
}

public open class java_util_stream_ReferencePipeline_3_1 <: java_util_stream_Sink_ChainedReference {
public var java_util_stream_ReferencePipeline_3_1_this_1 : ?java_util_stream_ReferencePipeline_3 = None
}

public open class java_util_stream_ReferencePipeline_2_1 <: java_util_stream_Sink_ChainedReference {
public var java_util_stream_ReferencePipeline_2_1_this_1 : ?java_util_stream_ReferencePipeline_2 = None
}

public open class sun_nio_fs_BasicFileAttributesHolder <: Object {

}

public open class jdk_internal_loader_ArchivedClassLoaders <: Object {
public static var jdk_internal_loader_ArchivedClassLoaders_archivedClassLoaders : ?jdk_internal_loader_ArchivedClassLoaders = None
public var jdk_internal_loader_ArchivedClassLoaders_bootLoader : ?java_lang_ClassLoader = None
public var jdk_internal_loader_ArchivedClassLoaders_platformLoader : ?java_lang_ClassLoader = None
public var jdk_internal_loader_ArchivedClassLoaders_appLoader : ?java_lang_ClassLoader = None
public var jdk_internal_loader_ArchivedClassLoaders_servicesCatalogs : ?Array<?jdk_internal_module_ServicesCatalog> = None
public var jdk_internal_loader_ArchivedClassLoaders_packageToModule : ?Object = None
}

public open class jdk_internal_loader_ClassLoaders_BootClassLoader <: jdk_internal_loader_BuiltinClassLoader {

}

public open class java_lang_ClassLoader_ParallelLoaders <: Object {
public static var java_lang_ClassLoader_ParallelLoaders_loaderTypes : ?Object = None
}

public open class java_util_WeakHashMap <: java_util_AbstractMap {
public static var java_util_WeakHashMap_DEFAULT_INITIAL_CAPACITY : Int64 = 0
public static var java_util_WeakHashMap_MAXIMUM_CAPACITY : Int64 = 0
public static var java_util_WeakHashMap_DEFAULT_LOAD_FACTOR : Float32 = 0.0
public var java_util_WeakHashMap_table : ?Array<?java_util_WeakHashMap_Entry> = None
public var java_util_WeakHashMap_size : Int64 = 0
public var java_util_WeakHashMap_threshold : Int64 = 0
public var java_util_WeakHashMap_loadFactor : Float32 = 0.0
public var java_util_WeakHashMap_queue : ?java_lang_ref_ReferenceQueue = None
public var java_util_WeakHashMap_modCount : Int64 = 0
public static var java_util_WeakHashMap_NULL_KEY : ?Object = None
public var java_util_WeakHashMap_entrySet : ?Object = None
}

public open class java_util_WeakHashMap_Entry <: java_lang_ref_WeakReference {
public var java_util_WeakHashMap_Entry_value : ?Object = None
public var java_util_WeakHashMap_Entry_hash : Int64 = 0
public var java_util_WeakHashMap_Entry_next : ?java_util_WeakHashMap_Entry = None
}

public open class java_util_WeakHashMap_KeySet <: java_util_AbstractSet {
public var java_util_WeakHashMap_KeySet_this_0 : ?java_util_WeakHashMap = None
}

public open class jdk_internal_loader_URLClassPath <: Object {
public static var jdk_internal_loader_URLClassPath_USER_AGENT_JAVA_VERSION : ?java_lang_String = None
public static var jdk_internal_loader_URLClassPath_JAVA_VERSION : ?java_lang_String = None
public static var jdk_internal_loader_URLClassPath_DEBUG : Bool = false
public static var jdk_internal_loader_URLClassPath_DISABLE_JAR_CHECKING : Bool = false
public static var jdk_internal_loader_URLClassPath_DISABLE_ACC_CHECKING : Bool = false
public static var jdk_internal_loader_URLClassPath_DISABLE_CP_URL_CHECK : Bool = false
public static var jdk_internal_loader_URLClassPath_DEBUG_CP_URL_CHECK : Bool = false
public var jdk_internal_loader_URLClassPath_path : ?java_util_ArrayList = None
public var jdk_internal_loader_URLClassPath_unopenedUrls : ?java_util_ArrayDeque = None
public var jdk_internal_loader_URLClassPath_loaders : ?java_util_ArrayList = None
public var jdk_internal_loader_URLClassPath_lmap : ?java_util_HashMap = None
public var jdk_internal_loader_URLClassPath_jarHandler : ?java_net_URLStreamHandler = None
public var jdk_internal_loader_URLClassPath_closed : Bool = false
public var jdk_internal_loader_URLClassPath_acc : ?java_security_AccessControlContext = None
public static var jdk_internal_loader_URLClassPath_JNUA : ?Object = None
}

public open class java_net_URLStreamHandlerFactory <: Object {

}

public open class java_net_URL_DefaultFactory <: Object {
public static var java_net_URL_DefaultFactory_PREFIX : ?java_lang_String = None
}

public open class jdk_internal_access_JavaNetURLAccess <: Object {

}

public open class java_net_URL_3 <: Object {

}

public open class sun_net_www_ParseUtil <: Object {
public static var sun_net_www_ParseUtil_HEX_UPPERCASE : ?java_util_HexFormat = None
public static var sun_net_www_ParseUtil_L_DIGIT : Int64 = 0
public static var sun_net_www_ParseUtil_H_DIGIT : Int64 = 0
public static var sun_net_www_ParseUtil_L_HEX : Int64 = 0
public static var sun_net_www_ParseUtil_H_HEX : Int64 = 0
public static var sun_net_www_ParseUtil_L_UPALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_H_UPALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_L_LOWALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_H_LOWALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_L_ALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_H_ALPHA : Int64 = 0
public static var sun_net_www_ParseUtil_L_ALPHANUM : Int64 = 0
public static var sun_net_www_ParseUtil_H_ALPHANUM : Int64 = 0
public static var sun_net_www_ParseUtil_L_MARK : Int64 = 0
public static var sun_net_www_ParseUtil_H_MARK : Int64 = 0
public static var sun_net_www_ParseUtil_L_UNRESERVED : Int64 = 0
public static var sun_net_www_ParseUtil_H_UNRESERVED : Int64 = 0
public static var sun_net_www_ParseUtil_L_RESERVED : Int64 = 0
public static var sun_net_www_ParseUtil_H_RESERVED : Int64 = 0
public static var sun_net_www_ParseUtil_L_ESCAPED : Int64 = 0
public static var sun_net_www_ParseUtil_H_ESCAPED : Int64 = 0
public static var sun_net_www_ParseUtil_L_URIC : Int64 = 0
public static var sun_net_www_ParseUtil_H_URIC : Int64 = 0
public static var sun_net_www_ParseUtil_L_PCHAR : Int64 = 0
public static var sun_net_www_ParseUtil_H_PCHAR : Int64 = 0
public static var sun_net_www_ParseUtil_L_PATH : Int64 = 0
public static var sun_net_www_ParseUtil_H_PATH : Int64 = 0
public static var sun_net_www_ParseUtil_L_DASH : Int64 = 0
public static var sun_net_www_ParseUtil_H_DASH : Int64 = 0
public static var sun_net_www_ParseUtil_L_USERINFO : Int64 = 0
public static var sun_net_www_ParseUtil_H_USERINFO : Int64 = 0
public static var sun_net_www_ParseUtil_L_REG_NAME : Int64 = 0
public static var sun_net_www_ParseUtil_H_REG_NAME : Int64 = 0
public static var sun_net_www_ParseUtil_L_SERVER : Int64 = 0
public static var sun_net_www_ParseUtil_H_SERVER : Int64 = 0
public static var sun_net_www_ParseUtil_L_ENCODED : Int64 = 0
public static var sun_net_www_ParseUtil_H_ENCODED : Int64 = 0
public static var sun_net_www_ParseUtil__assertionsDisabled : Bool = false
}

public open class java_net_URLStreamHandler <: Object {

}

public open class sun_net_www_protocol_file_Handler <: java_net_URLStreamHandler {

}

public open class sun_net_util_IPAddressUtil <: Object {
public static var sun_net_util_IPAddressUtil_INADDR4SZ : Int64 = 0
public static var sun_net_util_IPAddressUtil_INADDR16SZ : Int64 = 0
public static var sun_net_util_IPAddressUtil_INT16SZ : Int64 = 0
public static var sun_net_util_IPAddressUtil_cache : ?java_util_concurrent_ConcurrentHashMap = None
public static var sun_net_util_IPAddressUtil_L_IPV6_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_IPV6_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_GEN_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_GEN_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_AUTH_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_AUTH_DELIMS : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_COLON : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_COLON : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_SLASH : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_SLASH : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_BACKSLASH : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_BACKSLASH : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_NON_PRINTABLE : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_NON_PRINTABLE : Int64 = 0
public static var sun_net_util_IPAddressUtil_L_EXCLUDE : Int64 = 0
public static var sun_net_util_IPAddressUtil_H_EXCLUDE : Int64 = 0
public static var sun_net_util_IPAddressUtil_OTHERS : ?Array<Rune> = None
}

public open class jdk_internal_module_ServicesCatalog <: Object {
public var jdk_internal_module_ServicesCatalog_map : ?Object = None
public static var jdk_internal_module_ServicesCatalog_CLV : ?jdk_internal_loader_ClassLoaderValue = None
}

public open class jdk_internal_loader_AbstractClassLoaderValue <: Object {
public static var jdk_internal_loader_AbstractClassLoaderValue_JLA : ?Object = None
}

public open class jdk_internal_loader_ClassLoaderValue <: jdk_internal_loader_AbstractClassLoaderValue {

}

public open class jdk_internal_loader_BuiltinClassLoader_LoadedModule <: Object {
public var jdk_internal_loader_BuiltinClassLoader_LoadedModule_loader : ?jdk_internal_loader_BuiltinClassLoader = None
public var jdk_internal_loader_BuiltinClassLoader_LoadedModule_mref : ?java_lang_module_ModuleReference = None
public var jdk_internal_loader_BuiltinClassLoader_LoadedModule_uri : ?java_net_URI = None
public var jdk_internal_loader_BuiltinClassLoader_LoadedModule_codeSourceURL : ?java_net_URL = None
}

public open class jdk_internal_module_DefaultRoots <: Object {

}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800006400 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800006400__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_lang_Module_ReflectionData <: Object {
public static var java_lang_Module_ReflectionData_reads : ?java_lang_WeakPairMap = None
public static var java_lang_Module_ReflectionData_exports : ?java_lang_WeakPairMap = None
public static var java_lang_Module_ReflectionData_uses : ?java_lang_WeakPairMap = None
}

public open class java_lang_WeakPairMap <: Object {
public var java_lang_WeakPairMap_map : ?java_util_concurrent_ConcurrentHashMap = None
public var java_lang_WeakPairMap_queue : ?java_lang_ref_ReferenceQueue = None
}

public open class java_lang_WeakPairMap_Pair <: Object {

}

public open class java_lang_WeakPairMap_Pair_Lookup <: Object {
public var java_lang_WeakPairMap_Pair_Lookup_k1 : ?Object = None
public var java_lang_WeakPairMap_Pair_Lookup_k2 : ?Object = None
}

public open class jdk_internal_module_SystemModuleFinders_1__Lambda_16_0x000000080000e858 <: Object {
public var jdk_internal_module_SystemModuleFinders_1__Lambda_16_0x000000080000e858_arg_1 : ?Object = None
}

public open class java_util_HashMap_HashMapSpliterator <: Object {
public var java_util_HashMap_HashMapSpliterator_map : ?java_util_HashMap = None
public var java_util_HashMap_HashMapSpliterator_current : ?java_util_HashMap_Node = None
public var java_util_HashMap_HashMapSpliterator_index : Int64 = 0
public var java_util_HashMap_HashMapSpliterator_fence : Int64 = 0
public var java_util_HashMap_HashMapSpliterator_est : Int64 = 0
public var java_util_HashMap_HashMapSpliterator_expectedModCount : Int64 = 0
}

public open class java_util_HashMap_ValueSpliterator <: java_util_HashMap_HashMapSpliterator {
public static var java_util_HashMap_ValueSpliterator_ORDERED : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_DISTINCT : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_SORTED : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_SIZED : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_NONNULL : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_IMMUTABLE : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_CONCURRENT : Int64 = 0
public static var java_util_HashMap_ValueSpliterator_SUBSIZED : Int64 = 0
}

public open class java_util_HashMap_KeySpliterator <: java_util_HashMap_HashMapSpliterator {
public static var java_util_HashMap_KeySpliterator_ORDERED : Int64 = 0
public static var java_util_HashMap_KeySpliterator_DISTINCT : Int64 = 0
public static var java_util_HashMap_KeySpliterator_SORTED : Int64 = 0
public static var java_util_HashMap_KeySpliterator_SIZED : Int64 = 0
public static var java_util_HashMap_KeySpliterator_NONNULL : Int64 = 0
public static var java_util_HashMap_KeySpliterator_IMMUTABLE : Int64 = 0
public static var java_util_HashMap_KeySpliterator_CONCURRENT : Int64 = 0
public static var java_util_HashMap_KeySpliterator_SUBSIZED : Int64 = 0
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800006800 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800006800__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_module_DefaultRoots__Lambda_17_0x000000080000f180 <: Object {

}

public open class jdk_internal_module_DefaultRoots__Lambda_18_0x000000080000f3d0 <: Object {

}

public open class jdk_internal_module_DefaultRoots__Lambda_19_0x000000080000f610 <: Object {
public var jdk_internal_module_DefaultRoots__Lambda_19_0x000000080000f610_arg_1 : ?Object = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800006c00 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800006c00__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class jdk_internal_module_DefaultRoots__Lambda_20_0x000000080000f868 <: Object {

}

public open class jdk_internal_module_ModuleResolution <: Object {
public var jdk_internal_module_ModuleResolution_value : Int64 = 0
}

public open class jdk_internal_module_DefaultRoots__Lambda_21_0x000000080000fcb0 <: Object {

}

public open class java_util_stream_FindOps <: Object {

}

public open class java_util_stream_FindOps_FindSink <: Object {
public var java_util_stream_FindOps_FindSink_hasValue : Bool = false
public var java_util_stream_FindOps_FindSink_value : ?Object = None
}

public open class java_util_stream_FindOps_FindSink_OfRef <: java_util_stream_FindOps_FindSink {
public static var java_util_stream_FindOps_FindSink_OfRef_OP_FIND_FIRST : ?Object = None
public static var java_util_stream_FindOps_FindSink_OfRef_OP_FIND_ANY : ?Object = None
}

public open class java_util_stream_FindOps_FindOp <: Object {
public var java_util_stream_FindOps_FindOp_shape : ?java_util_stream_StreamShape = None
public var java_util_stream_FindOps_FindOp_opFlags : Int64 = 0
public var java_util_stream_FindOps_FindOp_emptyValue : ?Object = None
public var java_util_stream_FindOps_FindOp_presentPredicate : ?Object = None
public var java_util_stream_FindOps_FindOp_sinkSupplier : ?Object = None
}

public open class java_lang_invoke_LambdaForm_DMH_0x0000000800080000 <: Object {
public static var java_lang_invoke_LambdaForm_DMH_0x0000000800080000__D_0 : ?java_lang_invoke_LambdaForm = None
}

public open class java_util_stream_FindOps_FindSink_OfRef__Lambda_22_0x0000000800007a38 <: Object {

}

public open class java_util_stream_FindOps_FindSink_OfRef__Lambda_23_0x0000000800007c88 <: Object {

}

public open class java_util_stream_FindOps_FindSink_OfRef__Lambda_24_0x00000008000c0000 <: Object {

}

public open class java_util_stream_FindOps_FindSink_OfRef__Lambda_25_0x00000008000c0250 <: Object {

}

public open class java_lang_module_Configuration <: Object {
public static var java_lang_module_Configuration_EMPTY_CONFIGURATION : ?java_lang_module_Configuration = None
public var java_lang_module_Configuration_parents : ?Object = None
public var java_lang_module_Configuration_graph : ?Object = None
public var java_lang_module_Configuration_modules : ?Object = None
public var java_lang_module_Configuration_nameToModule : ?Object = None
public var java_lang_module_Configuration_targetPlatform : ?java_lang_String = None
public var java_lang_module_Configuration_allConfigurations : ?Object = None
public static var java_lang_module_Configuration__assertionsDisabled : Bool = false
}

public open class java_lang_module_Resolver <: Object {
public var java_lang_module_Resolver_beforeFinder : ?Object = None
public var java_lang_module_Resolver_parents : ?Object = None
public var java_lang_module_Resolver_afterFinder : ?Object = None
public var java_lang_module_Resolver_traceOutput : ?java_io_PrintStream = None
public var java_lang_module_Resolver_nameToReference : ?Object = None
public var java_lang_module_Resolver_haveAllAutomaticModules : Bool = false
public var java_lang_module_Resolver_targetPlatform : ?java_lang_String = None
public var java_lang_module_Resolver_visited : ?Object = None
public var java_lang_module_Resolver_visitPath : ?Object = None
public static var java_lang_module_Resolver__assertionsDisabled : Bool = false
}

public open class java_lang_module_ModuleFinder_1 <: Object {

}

public open class java_lang_ModuleLayer <: Object {
public static var java_lang_ModuleLayer_EMPTY_LAYER : ?java_lang_ModuleLayer = None
public var java_lang_ModuleLayer_cf : ?java_lang_module_Configuration = None
public var java_lang_ModuleLayer_parents : ?Object = None
public var java_lang_ModuleLayer_nameToModule : ?Object = None
public var java_lang_ModuleLayer_allLayers : ?Object = None
public var java_lang_ModuleLayer_modules : ?Object = None
public var java_lang_ModuleLayer_servicesCatalog : ?jdk_internal_module_ServicesCatalog = None
public static var java_lang_ModuleLayer_CLV : ?jdk_internal_loader_ClassLoaderValue = None
}

public open class java_util_LinkedHashSet <: java_util_HashSet {
public static var java_util_LinkedHashSet_serialVersionUID : Int64 = 0
}

public open class java_util_LinkedHashMap <: java_util_HashMap {
public static var java_util_LinkedHashMap_serialVersionUID : Int64 = 0
public var java_util_LinkedHashMap_head : ?java_util_LinkedHashMap_Entry = None
public var java_util_LinkedHashMap_tail : ?java_util_LinkedHashMap_Entry = None
public var java_util_LinkedHashMap_accessOrder : Bool = false
}

public open class java_lang_module_ResolvedModule <: Object {
public var java_lang_module_ResolvedModule_cf : ?java_lang_module_Configuration = None
public var java_lang_module_ResolvedModule_mref : ?java_lang_module_ModuleReference = None
}

public open class jdk_internal_module_ModuleLoaderMap <: Object {

}

public open class jdk_internal_module_ModuleLoaderMap_Mapper <: Object {
public static var jdk_internal_module_ModuleLoaderMap_Mapper_PLATFORM_CLASSLOADER : ?java_lang_ClassLoader = None
public static var jdk_internal_module_ModuleLoaderMap_Mapper_APP_CLASSLOADER : ?java_lang_ClassLoader = None
public static var jdk_internal_module_ModuleLoaderMap_Mapper_PLATFORM_LOADER_INDEX : ?java_lang_Integer = None
public static var jdk_internal_module_ModuleLoaderMap_Mapper_APP_LOADER_INDEX : ?java_lang_Integer = None
public var jdk_internal_module_ModuleLoaderMap_Mapper_map : ?Object = None
}

public open class jdk_internal_module_ModuleLoaderMap_Modules <: Object {
public static var jdk_internal_module_ModuleLoaderMap_Modules_bootModules : ?Object = None
public static var jdk_internal_module_ModuleLoaderMap_Modules_platformModules : ?Object = None
}

public open class jdk_internal_loader_AbstractClassLoaderValue_Memoizer <: Object {
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_cl : ?java_lang_ClassLoader = None
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_clv : ?jdk_internal_loader_AbstractClassLoaderValue = None
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_mappingFunction : ?Object = None
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_v : ?Object = None
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_t : ?java_lang_Throwable = None
public var jdk_internal_loader_AbstractClassLoaderValue_Memoizer_inCall : Bool = false
}

public open class jdk_internal_module_ServicesCatalog_ServiceProvider <: Object {
public var jdk_internal_module_ServicesCatalog_ServiceProvider_module : ?java_lang_Module = None
public var jdk_internal_module_ServicesCatalog_ServiceProvider_providerName : ?java_lang_String = None
}

public open class java_util_concurrent_CopyOnWriteArrayList <: Object {
public static var java_util_concurrent_CopyOnWriteArrayList_serialVersionUID : Int64 = 0
public var java_util_concurrent_CopyOnWriteArrayList_lock : ?Object = None
public var java_util_concurrent_CopyOnWriteArrayList_array : ?Array<?Object> = None
}

public open class java_lang_ModuleLayer_Controller <: Object {
public var java_lang_ModuleLayer_Controller_layer : ?java_lang_ModuleLayer = None
}

public open class jdk_internal_module_ModuleBootstrap_SafeModuleFinder <: Object {
public var jdk_internal_module_ModuleBootstrap_SafeModuleFinder_mrefs : ?Object = None
public var jdk_internal_module_ModuleBootstrap_SafeModuleFinder_nameToModule : ?Object = None
}

public open class java_lang_invoke_StringConcatFactory <: Object {
public static var java_lang_invoke_StringConcatFactory_TAG_ARG : Rune = ' '
public static var java_lang_invoke_StringConcatFactory_TAG_CONST : Rune = ' '
public static var java_lang_invoke_StringConcatFactory_MAX_INDY_CONCAT_ARG_SLOTS : Int64 = 0
public static var java_lang_invoke_StringConcatFactory_JLA : ?Object = None
public static var java_lang_invoke_StringConcatFactory_PREPEND : ?Object = None
public static var java_lang_invoke_StringConcatFactory_NULL_PREPEND : ?Object = None
public static var java_lang_invoke_StringConcatFactory_MIX : ?Object = None
public static var java_lang_invoke_StringConcatFactory_SIMPLE_CONCAT : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_NEW_STRING : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_NEW_ARRAY_SUFFIX : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_NEW_ARRAY : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_OBJECT_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_FLOAT_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_DOUBLE_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_INT_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_LONG_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_CHAR_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_BOOLEAN_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_NEW_STRINGIFIER : ?java_lang_invoke_MethodHandle = None
public static var java_lang_invoke_StringConcatFactory_PREPENDERS : ?Object = None
public static var java_lang_invoke_StringConcatFactory_NULL_PREPENDERS : ?Object = None
public static var java_lang_invoke_StringConcatFactory_MIXERS : ?Object = None
public static var java_lang_invoke_StringConcatFactory_INITIAL_CODER : Int64 = 0
public static var java_lang_invoke_StringConcatFactory__assertionsDisabled : Bool = false
}

public open class java_lang_invoke_StringConcatFactory_1 <: Object {

}

public open class java_lang_invoke_StringConcatFactory_2 <: Object {

}

public open class java_lang_invoke_StringConcatFactory_3 <: Object {

}

public open class sun_launcher_LauncherHelper <: Object {
public static var sun_launcher_LauncherHelper_JAVAFX_APPLICATION_MARKER : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_JAVAFX_APPLICATION_CLASS_NAME : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_JAVAFX_FXHELPER_CLASS_NAME_SUFFIX : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_LAUNCHER_AGENT_CLASS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_MAIN_CLASS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_ADD_EXPORTS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_ADD_OPENS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_outBuf : ?java_lang_StringBuilder = None
public static var sun_launcher_LauncherHelper_INDENT : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_VM_SETTINGS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_PROP_SETTINGS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_LOCALE_SETTINGS : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_diagprop : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_trace : Bool = false
public static var sun_launcher_LauncherHelper_defaultBundleName : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_ostream : ?java_io_PrintStream = None
public static var sun_launcher_LauncherHelper_appClass : ?java_lang_Class = None
public static var sun_launcher_LauncherHelper_LM_UNKNOWN : Int64 = 0
public static var sun_launcher_LauncherHelper_LM_CLASS : Int64 = 0
public static var sun_launcher_LauncherHelper_LM_JAR : Int64 = 0
public static var sun_launcher_LauncherHelper_LM_MODULE : Int64 = 0
public static var sun_launcher_LauncherHelper_LM_SOURCE : Int64 = 0
public static var sun_launcher_LauncherHelper_encprop : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_encoding : ?java_lang_String = None
public static var sun_launcher_LauncherHelper_isCharsetSupported : Bool = false
}

public open class sun_net_util_URLUtil <: Object {

}

public open class java_util_Locale <: Object {
public static var java_util_Locale_ENGLISH : ?java_util_Locale = None
public static var java_util_Locale_FRENCH : ?java_util_Locale = None
public static var java_util_Locale_GERMAN : ?java_util_Locale = None
public static var java_util_Locale_ITALIAN : ?java_util_Locale = None
public static var java_util_Locale_JAPANESE : ?java_util_Locale = None
public static var java_util_Locale_KOREAN : ?java_util_Locale = None
public static var java_util_Locale_CHINESE : ?java_util_Locale = None
public static var java_util_Locale_SIMPLIFIED_CHINESE : ?java_util_Locale = None
public static var java_util_Locale_TRADITIONAL_CHINESE : ?java_util_Locale = None
public static var java_util_Locale_FRANCE : ?java_util_Locale = None
public static var java_util_Locale_GERMANY : ?java_util_Locale = None
public static var java_util_Locale_ITALY : ?java_util_Locale = None
public static var java_util_Locale_JAPAN : ?java_util_Locale = None
public static var java_util_Locale_KOREA : ?java_util_Locale = None
public static var java_util_Locale_UK : ?java_util_Locale = None
public static var java_util_Locale_US : ?java_util_Locale = None
public static var java_util_Locale_CANADA : ?java_util_Locale = None
public static var java_util_Locale_CANADA_FRENCH : ?java_util_Locale = None
public static var java_util_Locale_ROOT : ?java_util_Locale = None
public static var java_util_Locale_CONSTANT_LOCALES : ?Object = None
public static var java_util_Locale_CHINA : ?java_util_Locale = None
public static var java_util_Locale_PRC : ?java_util_Locale = None
public static var java_util_Locale_TAIWAN : ?java_util_Locale = None
public static var java_util_Locale_PRIVATE_USE_EXTENSION : Rune = ' '
public static var java_util_Locale_UNICODE_LOCALE_EXTENSION : Rune = ' '
public static var java_util_Locale_serialVersionUID : Int64 = 0
public static var java_util_Locale_DISPLAY_LANGUAGE : Int64 = 0
public static var java_util_Locale_DISPLAY_COUNTRY : Int64 = 0
public static var java_util_Locale_DISPLAY_VARIANT : Int64 = 0
public static var java_util_Locale_DISPLAY_SCRIPT : Int64 = 0
public static var java_util_Locale_DISPLAY_UEXT_KEY : Int64 = 0
public static var java_util_Locale_DISPLAY_UEXT_TYPE : Int64 = 0
public var java_util_Locale_baseLocale : ?sun_util_locale_BaseLocale = None
public var java_util_Locale_localeExtensions : ?Object = None
public var java_util_Locale_hashCodeValue : Int64 = 0
public static var java_util_Locale_defaultLocale : ?java_util_Locale = None
public static var java_util_Locale_defaultDisplayLocale : ?java_util_Locale = None
public static var java_util_Locale_defaultFormatLocale : ?java_util_Locale = None
public var java_util_Locale_languageTag : ?java_lang_String = None
public static var java_util_Locale_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
public static var java_util_Locale_isoLanguages : ?Array<?java_lang_String> = None
public static var java_util_Locale_isoCountries : ?Array<?java_lang_String> = None
public static var java_util_Locale__assertionsDisabled : Bool = false
}

public open class sun_util_locale_BaseLocale <: Object {
public static var sun_util_locale_BaseLocale_constantBaseLocales : ?Array<?sun_util_locale_BaseLocale> = None
public static var sun_util_locale_BaseLocale_ENGLISH : Byte = 0
public static var sun_util_locale_BaseLocale_FRENCH : Byte = 0
public static var sun_util_locale_BaseLocale_GERMAN : Byte = 0
public static var sun_util_locale_BaseLocale_ITALIAN : Byte = 0
public static var sun_util_locale_BaseLocale_JAPANESE : Byte = 0
public static var sun_util_locale_BaseLocale_KOREAN : Byte = 0
public static var sun_util_locale_BaseLocale_CHINESE : Byte = 0
public static var sun_util_locale_BaseLocale_SIMPLIFIED_CHINESE : Byte = 0
public static var sun_util_locale_BaseLocale_TRADITIONAL_CHINESE : Byte = 0
public static var sun_util_locale_BaseLocale_FRANCE : Byte = 0
public static var sun_util_locale_BaseLocale_GERMANY : Byte = 0
public static var sun_util_locale_BaseLocale_ITALY : Byte = 0
public static var sun_util_locale_BaseLocale_JAPAN : Byte = 0
public static var sun_util_locale_BaseLocale_KOREA : Byte = 0
public static var sun_util_locale_BaseLocale_UK : Byte = 0
public static var sun_util_locale_BaseLocale_US : Byte = 0
public static var sun_util_locale_BaseLocale_CANADA : Byte = 0
public static var sun_util_locale_BaseLocale_CANADA_FRENCH : Byte = 0
public static var sun_util_locale_BaseLocale_ROOT : Byte = 0
public static var sun_util_locale_BaseLocale_NUM_CONSTANTS : Byte = 0
public static var sun_util_locale_BaseLocale_SEP : ?java_lang_String = None
public var sun_util_locale_BaseLocale_language : ?java_lang_String = None
public var sun_util_locale_BaseLocale_script : ?java_lang_String = None
public var sun_util_locale_BaseLocale_region : ?java_lang_String = None
public var sun_util_locale_BaseLocale_variant : ?java_lang_String = None
public var sun_util_locale_BaseLocale_hash : Int64 = 0
public static var sun_util_locale_BaseLocale_OLD_ISO_CODES : Bool = false
}

public open class sun_util_locale_LocaleUtils <: Object {

}

public open class java_security_PrivilegedExceptionAction <: Object {

}

public open class jdk_internal_loader_URLClassPath_3 <: Object {
public var jdk_internal_loader_URLClassPath_3_val_url : ?java_net_URL = None
public var jdk_internal_loader_URLClassPath_3_this_0 : ?jdk_internal_loader_URLClassPath = None
}

public open class jdk_internal_loader_URLClassPath_Loader <: Object {
public var jdk_internal_loader_URLClassPath_Loader_base : ?java_net_URL = None
public var jdk_internal_loader_URLClassPath_Loader_jarfile : ?java_util_jar_JarFile = None
}

public open class jdk_internal_loader_URLClassPath_FileLoader <: jdk_internal_loader_URLClassPath_Loader {
public var jdk_internal_loader_URLClassPath_FileLoader_dir : ?java_io_File = None
}

public open class jdk_internal_loader_Resource <: Object {
public var jdk_internal_loader_Resource_cis : ?java_io_InputStream = None
}

public open class jdk_internal_loader_URLClassPath_FileLoader_1 <: jdk_internal_loader_Resource {
public var jdk_internal_loader_URLClassPath_FileLoader_1_val_name : ?java_lang_String = None
public var jdk_internal_loader_URLClassPath_FileLoader_1_val_url : ?java_net_URL = None
public var jdk_internal_loader_URLClassPath_FileLoader_1_val_file : ?java_io_File = None
public var jdk_internal_loader_URLClassPath_FileLoader_1_this_0 : ?jdk_internal_loader_URLClassPath_FileLoader = None
}

public open class java_io_FileCleanable <: jdk_internal_ref_PhantomCleanable {
public static var java_io_FileCleanable_fdAccess : ?Object = None
public var java_io_FileCleanable_fd : Int64 = 0
public var java_io_FileCleanable_handle : Int64 = 0
}

public open class sun_nio_ByteBuffered <: Object {

}

public open class java_io_FileInputStream_1 <: Object {
public var java_io_FileInputStream_1_this_0 : ?java_io_FileInputStream = None
}

public open class java_security_SecureClassLoader_CodeSourceKey <: Object {
public var java_security_SecureClassLoader_CodeSourceKey_cs : ?java_security_CodeSource = None
}

public open class java_security_SecureClassLoader_1 <: Object {
public var java_security_SecureClassLoader_1_val_cs : ?java_security_CodeSource = None
public var java_security_SecureClassLoader_1_this_0 : ?java_security_SecureClassLoader = None
}

public open class java_security_PermissionCollection <: Object {
public static var java_security_PermissionCollection_serialVersionUID : Int64 = 0
public var java_security_PermissionCollection_readOnly : Bool = false
}

public open class sun_security_util_LazyCodeSourcePermissionCollection <: java_security_PermissionCollection {
public static var sun_security_util_LazyCodeSourcePermissionCollection_serialVersionUID : Int64 = 0
public var sun_security_util_LazyCodeSourcePermissionCollection_perms : ?java_security_PermissionCollection = None
public var sun_security_util_LazyCodeSourcePermissionCollection_cs : ?java_security_CodeSource = None
public var sun_security_util_LazyCodeSourcePermissionCollection_permissionAdded : Bool = false
}

public open class java_security_Permissions <: java_security_PermissionCollection {
public var java_security_Permissions_permsMap : ?java_util_concurrent_ConcurrentHashMap = None
public var java_security_Permissions_hasUnresolved : Bool = false
public var java_security_Permissions_allPermission : ?java_security_PermissionCollection = None
public static var java_security_Permissions_serialVersionUID : Int64 = 0
public static var java_security_Permissions_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
}

public open class java_lang_RuntimePermission <: java_security_BasicPermission {
public static var java_lang_RuntimePermission_serialVersionUID : Int64 = 0
}

public open class java_security_BasicPermissionCollection <: java_security_PermissionCollection {
public static var java_security_BasicPermissionCollection_serialVersionUID : Int64 = 0
public var java_security_BasicPermissionCollection_perms : ?java_util_concurrent_ConcurrentHashMap = None
public var java_security_BasicPermissionCollection_all_allowed : Bool = false
public var java_security_BasicPermissionCollection_permClass : ?java_lang_Class = None
public static var java_security_BasicPermissionCollection_serialPersistentFields : ?Array<?java_io_ObjectStreamField> = None
}

public open class java_security_AllPermission <: java_security_Permission {
public static var java_security_AllPermission_serialVersionUID : Int64 = 0
}

public open class java_security_UnresolvedPermission <: java_security_Permission {
public static var java_security_UnresolvedPermission_serialVersionUID : Int64 = 0
public static var java_security_UnresolvedPermission_debug : ?sun_security_util_Debug = None
public var java_security_UnresolvedPermission_typeHadTurn : ?java_lang_String = None
public var java_security_UnresolvedPermission_name : ?java_lang_String = None
public var java_security_UnresolvedPermission_actions : ?java_lang_String = None
public var java_security_UnresolvedPermission_certs : ?Array<?java_security_cert_Certificate> = None
public static var java_security_UnresolvedPermission_PARAMS0 : ?Array<?java_lang_Class> = None
public static var java_security_UnresolvedPermission_PARAMS1 : ?Array<?java_lang_Class> = None
public static var java_security_UnresolvedPermission_PARAMS2 : ?Array<?java_lang_Class> = None
}

public open class java_security_SecureClassLoader_DebugHolder <: Object {
public static var java_security_SecureClassLoader_DebugHolder_debug : ?sun_security_util_Debug = None
}

public open class sun_security_util_Debug <: Object {
public var sun_security_util_Debug_prefix : ?java_lang_String = None
public static var sun_security_util_Debug_args : ?java_lang_String = None
}

public open class Web <: Object {

}

public open class java_lang_NamedPackage <: Object {
public var java_lang_NamedPackage_name : ?java_lang_String = None
public var java_lang_NamedPackage_module : ?java_lang_Module = None
}

public open class Request <: Object {
public static var Request_BASIC_AUTH : ?java_lang_String = None
public static var Request_FORM_AUTH : ?java_lang_String = None
public static var Request_CLIENT_CERT_AUTH : ?java_lang_String = None
public static var Request_DIGEST_AUTH : ?java_lang_String = None
public var Request_requestParameter : ?RequestParameter = None
public var Request_requestUrl : ?java_lang_String = None
public var Request_requestMethod : ?java_lang_String = None
public var Request_requestHeader : ?RequestHeader = None
}

public open class ResponseBody <: Object {
public var ResponseBody_pages : ?Array<?Page> = None
}

public open class RequestParameter <: Object {
public var RequestParameter_pageSize : Int64 = 0
public var RequestParameter_pageNum : Int64 = 0
}

public open class Response <: Object {
public var Response_statusCode : Int64 = 0
public var Response_responseHeader : ?ResponseHeader = None
public var Response_responseBody : ?ResponseBody = None
}

public open class MyThread <: java_lang_Thread {
public var MyThread_request : ?Request = None
public var MyThread_response : ?Response = None
}

public open class RequestHeader <: Object {
public var RequestHeader_accept : ?java_lang_String = None
public var RequestHeader_acceptEncoding : ?java_lang_String = None
public var RequestHeader_acceptLanguage : ?java_lang_String = None
public var RequestHeader_connection : ?java_lang_String = None
public var RequestHeader_cookie : ?java_lang_String = None
public var RequestHeader_host : ?java_lang_String = None
public var RequestHeader_Referer : ?java_lang_String = None
public var RequestHeader_secChUa : ?java_lang_String = None
public var RequestHeader_SecChUaMobile : ?java_lang_String = None
public var RequestHeader_SecChUaPlatform : ?java_lang_String = None
public var RequestHeader_SecFetchDest : ?java_lang_String = None
public var RequestHeader_SecFetchMode : ?java_lang_String = None
public var RequestHeader_SecFetchSite : ?java_lang_String = None
public var RequestHeader_UpgradeInsecureRequests : ?java_lang_String = None
public var RequestHeader_UserAgent : ?java_lang_String = None
}

public open class java_util_IdentityHashMap_IdentityHashMapIterator <: Object {
public var java_util_IdentityHashMap_IdentityHashMapIterator_index : Int64 = 0
public var java_util_IdentityHashMap_IdentityHashMapIterator_expectedModCount : Int64 = 0
public var java_util_IdentityHashMap_IdentityHashMapIterator_lastReturnedIndex : Int64 = 0
public var java_util_IdentityHashMap_IdentityHashMapIterator_indexValid : Bool = false
public var java_util_IdentityHashMap_IdentityHashMapIterator_traversalTable : ?Array<?Object> = None
public var java_util_IdentityHashMap_IdentityHashMapIterator_this_0 : ?java_util_IdentityHashMap = None
}

public open class java_util_IdentityHashMap_KeyIterator <: java_util_IdentityHashMap_IdentityHashMapIterator {
public var java_util_IdentityHashMap_KeyIterator_this_0 : ?java_util_IdentityHashMap = None
}

public open class ResponseHeader <: Object {
public var ResponseHeader_Bdpagetype : Int64 = 0
public var ResponseHeader_Bdqid : ?java_lang_String = None
public var ResponseHeader_CacheControl : ?java_lang_String = None
public var ResponseHeader_Ckpacknum : Int64 = 0
public var ResponseHeader_Ckrndstr : ?java_lang_String = None
public var ResponseHeader_Connection : ?java_lang_String = None
public var ResponseHeader_ContentEncoding : ?java_lang_String = None
public var ResponseHeader_ContentSecurity_Policy : ?java_lang_String = None
public var ResponseHeader_ContentType : ?java_lang_String = None
public var ResponseHeader_Date : ?java_lang_String = None
public var ResponseHeader_Server : ?java_lang_String = None
public var ResponseHeader_SetCookie : ?java_lang_String = None
public var ResponseHeader_StrictTransportSecurity : ?java_lang_String = None
public var ResponseHeader_Traceid : Int64 = 0
public var ResponseHeader_TransferEncoding : ?java_lang_String = None
public var ResponseHeader_Vary : ?java_lang_String = None
public var ResponseHeader_XUaCompatible : ?java_lang_String = None
}

public open class java_util_concurrent_ConcurrentHashMap_ForwardingNode <: java_util_concurrent_ConcurrentHashMap_Node {
public var java_util_concurrent_ConcurrentHashMap_ForwardingNode_nextTable : ?Array<?java_util_concurrent_ConcurrentHashMap_Node> = None
}

public open class Page <: Object {
public var Page_address : ?java_lang_String = None
public var Page_expectedDigest : ?java_lang_String = None
public var Page_expectedStatus : Int64 = 0
public var Page_contents : ?Array<Byte> = None
}

public open class java_lang_Shutdown <: Object {
public static var java_lang_Shutdown_MAX_SYSTEM_HOOKS : Int64 = 0
public static var java_lang_Shutdown_hooks : ?Array<?Object> = None
public static var java_lang_Shutdown_currentRunningHook : Int64 = 0
public static var java_lang_Shutdown_lock : ?Object = None
public static var java_lang_Shutdown_haltLock : ?Object = None
}

public open class java_lang_Shutdown_Lock <: Object {

}

func turnClass<T1, T2>(a: ?T1) :?T2 {
        match (a) {
        case Some(v) => v as T2
        case None => Option<T2>.None
    }
}


main(): Unit {
	Main0.f()
	Main1.f()
	var startTime = DateTime.now()
	for (index in 0..50000:1){
	Web___main__ArrLjava_lang_String_V_v0(None)
	}
	var endTime = DateTime.now()
	println("web: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
}

func Web___main__ArrLjava_lang_String_V_v0(java_lang_string_array_1_0: ?Array<?java_lang_String>): Unit {
	var java_lang_string_array_1_01111: ?Array<?java_lang_String> = turnClass(java_lang_string_array_1_0)
	Web___batchRun__III_V_v0()
	Web___batchRun__III_V_v1()
}

func Web___batchRun__III_V_v0(): Unit {
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(8, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	Main0.Main0_globalVar_0.getOrThrow().java_lang_Class_componentType = turnClass(Main0.Main0_globalVar_1)
	Main0.Main0_globalVar_0.getOrThrow().java_lang_Class_classLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_0.getOrThrow().java_lang_Class_module = turnClass(Main0.Main0_globalVar_3)
	var mythread_array_1_0: ?Array<?MyThread> = Array<?MyThread>(3, repeat: None)
	var mythread_array_1_1: ?Array<?MyThread> = turnClass(mythread_array_1_0)
	var request_0: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v0())
	var request_1: ?Request = turnClass(request_0)
	var mythread_0: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v0(turnClass(Main0.Main0_globalVar_4), turnClass(request_0))
	mythread_array_1_0.getOrThrow()[0] = turnClass(Main0.Main0_globalVar_4)
	java_lang_Thread___start___V_v0(Main0.Main0_globalVar_4)
	var request_2: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v1())
	request_0 = turnClass(request_2)
	var mythread_1: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v1(turnClass(Main0.Main0_globalVar_5), turnClass(request_2))
	mythread_array_1_0.getOrThrow()[1] = turnClass(Main0.Main0_globalVar_5)
	java_lang_Thread___start___V_v1(Main0.Main0_globalVar_5)
	var request_3: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v1())
	request_2 = turnClass(request_3)
	var mythread_2: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v2(turnClass(Main0.Main0_globalVar_6), turnClass(request_3))
	mythread_array_1_0.getOrThrow()[2] = turnClass(Main0.Main0_globalVar_6)
	java_lang_Thread___start___V_v2(Main0.Main0_globalVar_6)
}

func Web___ConstructRequest__II_LRequest_v0(): ?Request {
	var request_0: ?Request = Request()
	Request_____init_____V_v0(turnClass(request_0))
	var request_1: ?Request = turnClass(request_0)
	Web___initRequest__LRequestII_V_v0(turnClass(request_0))
	return turnClass(request_0)
}

func Request_____init_____V_v0(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	java_lang_Object_____init_____V_v31(turnClass(request_0))
}

func java_lang_Object_____init_____V_v31(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
}

func Web___initRequest__LRequestII_V_v0(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = RequestParameter()
	RequestParameter_____init_____V_v0(turnClass(requestparameter_0))
	var requestparameter_1: ?RequestParameter = turnClass(requestparameter_0)
	Web___initRequestParameter__LRequestParameterII_V_v0(turnClass(requestparameter_0))
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(13, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var requestheader_0: ?RequestHeader = RequestHeader()
	RequestHeader_____init_____V_v0(turnClass(requestheader_0))
	var requestheader_1: ?RequestHeader = turnClass(requestheader_0)
	request_0.getOrThrow().Request_requestParameter = turnClass(requestparameter_0)
	request_0.getOrThrow().Request_requestHeader = turnClass(requestheader_0)
}

func RequestParameter_____init_____V_v0(requestparameter_0: ?RequestParameter): Unit {
	var requestparameter_01111: ?RequestParameter = turnClass(requestparameter_0)
	java_lang_Object_____init_____V_v32(turnClass(requestparameter_0))
}

func java_lang_Object_____init_____V_v32(requestparameter_0: ?RequestParameter): Unit {
	var requestparameter_01111: ?RequestParameter = turnClass(requestparameter_0)
}

func Web___initRequestParameter__LRequestParameterII_V_v0(requestparameter_0: ?RequestParameter): Unit {
	var requestparameter_01111: ?RequestParameter = turnClass(requestparameter_0)
}

func RequestHeader_____init_____V_v0(requestheader_0: ?RequestHeader): Unit {
	var requestheader_01111: ?RequestHeader = turnClass(requestheader_0)
	java_lang_Object_____init_____V_v61(turnClass(requestheader_0))
}

func java_lang_Object_____init_____V_v61(requestheader_0: ?RequestHeader): Unit {
	var requestheader_01111: ?RequestHeader = turnClass(requestheader_0)
}

func MyThread_____init____LRequestLResponse_V_v0(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_4.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_4.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v0(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_0___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func Web___ConstructRequest__II_LRequest_v1(): ?Request {
	var request_0: ?Request = Request()
	Request_____init_____V_v0(turnClass(request_0))
	var request_1: ?Request = turnClass(request_0)
	Web___initRequest__LRequestII_V_v1(turnClass(request_0))
	return turnClass(request_0)
}

func Web___initRequest__LRequestII_V_v1(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = RequestParameter()
	RequestParameter_____init_____V_v0(turnClass(requestparameter_0))
	var requestparameter_1: ?RequestParameter = turnClass(requestparameter_0)
	Web___initRequestParameter__LRequestParameterII_V_v0(turnClass(requestparameter_0))
	var requestheader_0: ?RequestHeader = RequestHeader()
	RequestHeader_____init_____V_v0(turnClass(requestheader_0))
	var requestheader_1: ?RequestHeader = turnClass(requestheader_0)
	request_0.getOrThrow().Request_requestParameter = turnClass(requestparameter_0)
	request_0.getOrThrow().Request_requestHeader = turnClass(requestheader_0)
}

func MyThread_____init____LRequestLResponse_V_v1(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_5.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_5.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v1(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_1___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func MyThread_____init____LRequestLResponse_V_v2(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_6.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_6.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v2(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_2___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func Web___batchRun__III_V_v1(): Unit {
	var mythread_array_1_0: ?Array<?MyThread> = Array<?MyThread>(3, repeat: None)
	var mythread_array_1_1: ?Array<?MyThread> = turnClass(mythread_array_1_0)
	var request_0: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v1())
	var request_1: ?Request = turnClass(request_0)
	var mythread_0: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v3(turnClass(Main0.Main0_globalVar_7), turnClass(request_0))
	mythread_array_1_0.getOrThrow()[0] = turnClass(Main0.Main0_globalVar_7)
	java_lang_Thread___start___V_v3(Main0.Main0_globalVar_7)
	var request_2: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v1())
	request_0 = turnClass(request_2)
	var mythread_1: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v4(turnClass(Main0.Main0_globalVar_8), turnClass(request_2))
	mythread_array_1_0.getOrThrow()[1] = turnClass(Main0.Main0_globalVar_8)
	java_lang_Thread___start___V_v4(Main0.Main0_globalVar_8)
	var request_3: ?Request = turnClass(Web___ConstructRequest__II_LRequest_v1())
	request_2 = turnClass(request_3)
	var mythread_2: ?MyThread = MyThread()
	MyThread_____init____LRequestLResponse_V_v5(turnClass(Main0.Main0_globalVar_9), turnClass(request_3))
	mythread_array_1_0.getOrThrow()[2] = turnClass(Main0.Main0_globalVar_9)
	java_lang_Thread___start___V_v5(Main0.Main0_globalVar_9)
}

func MyThread_____init____LRequestLResponse_V_v3(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_7.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_7.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v3(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_3___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func MyThread_____init____LRequestLResponse_V_v4(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_8.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_8.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v4(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_4___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func MyThread_____init____LRequestLResponse_V_v5(mythread_0: ?MyThread, request_0: ?Request): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	var request_01111: ?Request = turnClass(request_0)
	Main0.Main0_globalVar_9.getOrThrow().MyThread_request = turnClass(request_0)
	Main0.Main0_globalVar_9.getOrThrow().MyThread_response = None
}

func java_lang_Thread___start___V_v5(mythread_0: ?MyThread): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	futureList.append(spawn { => Thread_5___MyThread___run___V(mythread_0) })
	for (fut in futureList) { fut.get() }
}

func Thread_3___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v0(turnClass(Main0.Main0_globalVar_7.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v0(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v0(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v0(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v0(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v0(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v0(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v0(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v0(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v0(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v0(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v101(turnClass(response_0))
}

func java_lang_Object_____init_____V_v101(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v0(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v103(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v103(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v0(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v104(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v104(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v0(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v0(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v0(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v0(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v0(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v0(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v0(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v106(turnClass(page_0))
}

func java_lang_Object_____init_____V_v106(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}

func Thread_0___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v1(turnClass(Main0.Main0_globalVar_4.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v1(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v1(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v1(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v1(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v1(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v1(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v1(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v1(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v1(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v1(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v111(turnClass(response_0))
}

func java_lang_Object_____init_____V_v111(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v1(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v140(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v140(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v1(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v141(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v141(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v1(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v5(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v5(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v5(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v5(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v5(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v5(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v146(turnClass(page_0))
}

func java_lang_Object_____init_____V_v146(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}

func Thread_2___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v2(turnClass(Main0.Main0_globalVar_6.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v2(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v2(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v2(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v2(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v2(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v2(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v2(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v2(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v2(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v2(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v151(turnClass(response_0))
}

func java_lang_Object_____init_____V_v151(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v2(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v153(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v153(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v2(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v154(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v154(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v2(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v10(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v10(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v10(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v10(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v10(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v10(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v156(turnClass(page_0))
}

func java_lang_Object_____init_____V_v156(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}

func Thread_4___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v3(turnClass(Main0.Main0_globalVar_8.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v3(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v3(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v3(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v3(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v3(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v3(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v3(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v3(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v3(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v3(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v161(turnClass(response_0))
}

func java_lang_Object_____init_____V_v161(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v3(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v163(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v163(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v3(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v164(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v164(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v3(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v15(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v15(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v15(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v15(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v15(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v15(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v166(turnClass(page_0))
}

func java_lang_Object_____init_____V_v166(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}

func Thread_5___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v4(turnClass(Main0.Main0_globalVar_9.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v4(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v4(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v4(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v4(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v4(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v4(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v4(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v4(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v4(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v4(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v171(turnClass(response_0))
}

func java_lang_Object_____init_____V_v171(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v4(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v173(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v173(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v4(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v174(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v174(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v4(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	Main0.Main0_globalVar_10.getOrThrow().java_lang_Class_componentType = turnClass(Main0.Main0_globalVar_11)
	Main0.Main0_globalVar_10.getOrThrow().java_lang_Class_classLoader = turnClass(Main0.Main0_globalVar_2)
	Main0.Main0_globalVar_10.getOrThrow().java_lang_Class_module = turnClass(Main0.Main0_globalVar_3)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v20(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v20(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v20(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v20(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v20(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v20(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v202(turnClass(page_0))
}

func java_lang_Object_____init_____V_v202(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}

func Thread_1___MyThread___run___V(mythread_0: ?MyThread): Unit {
	var mythread_01111: ?MyThread = turnClass(mythread_0)
	Web___service__LRequestLResponse_V_v5(turnClass(Main0.Main0_globalVar_5.getOrThrow().MyThread_request))
}

func Web___service__LRequestLResponse_V_v5(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	Web___getRequestPageNum__LRequest_I_v5(turnClass(request_0))
	Web___getRequestPageSize__LRequest_I_v5(turnClass(request_0))
	var response_0: ?Response = Response()
	Response_____init_____V_v5(turnClass(response_0))
	var response_1: ?Response = turnClass(response_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(14, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var responseheader_0: ?ResponseHeader = ResponseHeader()
	ResponseHeader_____init_____V_v5(turnClass(responseheader_0))
	var responseheader_1: ?ResponseHeader = turnClass(responseheader_0)
	var responsebody_0: ?ResponseBody = ResponseBody()
	ResponseBody_____init_____V_v5(turnClass(responsebody_0))
	var responsebody_1: ?ResponseBody = turnClass(responsebody_0)
	Web___initResponseBody__LResponseBodyII_V_v5(turnClass(responsebody_0))
	response_0.getOrThrow().Response_responseHeader = turnClass(responseheader_0)
	response_0.getOrThrow().Response_responseBody = turnClass(responsebody_0)
}

func Web___getRequestPageNum__LRequest_I_v5(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Web___getRequestPageSize__LRequest_I_v5(request_0: ?Request): Unit {
	var request_01111: ?Request = turnClass(request_0)
	var requestparameter_0: ?RequestParameter = turnClass(request_0.getOrThrow().Request_requestParameter)
}

func Response_____init_____V_v5(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
	java_lang_Object_____init_____V_v207(turnClass(response_0))
}

func java_lang_Object_____init_____V_v207(response_0: ?Response): Unit {
	var response_01111: ?Response = turnClass(response_0)
}

func ResponseHeader_____init_____V_v5(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
	java_lang_Object_____init_____V_v209(turnClass(responseheader_0))
}

func java_lang_Object_____init_____V_v209(responseheader_0: ?ResponseHeader): Unit {
	var responseheader_01111: ?ResponseHeader = turnClass(responseheader_0)
}

func ResponseBody_____init_____V_v5(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	java_lang_Object_____init_____V_v210(turnClass(responsebody_0))
}

func java_lang_Object_____init_____V_v210(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
}

func Web___initResponseBody__LResponseBodyII_V_v5(responsebody_0: ?ResponseBody): Unit {
	var responsebody_01111: ?ResponseBody = turnClass(responsebody_0)
	var java_lang_string_0: ?java_lang_String = java_lang_String()
	var java_lang_string_1: ?java_lang_String = turnClass(java_lang_string_0)
	var byte_array_1_0: ?Array<Byte> = Array<Byte>(4, repeat: 0)
	java_lang_string_0.getOrThrow().java_lang_String_value = turnClass(byte_array_1_0)
	var page_array_1_0: ?Array<?Page> = Array<?Page>(5, repeat: None)
	var page_array_1_1: ?Array<?Page> = turnClass(page_array_1_0)
	var page_0: ?Page = Page()
	Page_____init_____V_v25(turnClass(page_0))
	page_array_1_0.getOrThrow()[0] = turnClass(page_0)
	var byte_array_1_1: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	var byte_array_1_2: ?Array<Byte> = turnClass(byte_array_1_1)
	page_0.getOrThrow().Page_contents = turnClass(byte_array_1_1)
	var page_1: ?Page = Page()
	Page_____init_____V_v25(turnClass(page_1))
	page_array_1_0.getOrThrow()[1] = turnClass(page_1)
	var byte_array_1_3: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_1 = turnClass(byte_array_1_3)
	page_1.getOrThrow().Page_contents = turnClass(byte_array_1_3)
	var page_2: ?Page = Page()
	Page_____init_____V_v25(turnClass(page_2))
	page_array_1_0.getOrThrow()[2] = turnClass(page_2)
	var byte_array_1_4: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_3 = turnClass(byte_array_1_4)
	page_2.getOrThrow().Page_contents = turnClass(byte_array_1_4)
	var page_3: ?Page = Page()
	Page_____init_____V_v25(turnClass(page_3))
	page_array_1_0.getOrThrow()[3] = turnClass(page_3)
	var byte_array_1_5: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_4 = turnClass(byte_array_1_5)
	page_3.getOrThrow().Page_contents = turnClass(byte_array_1_5)
	var page_4: ?Page = Page()
	Page_____init_____V_v25(turnClass(page_4))
	page_array_1_0.getOrThrow()[4] = turnClass(page_4)
	var byte_array_1_6: ?Array<Byte> = Array<Byte>(30, repeat: 0)
	byte_array_1_5 = turnClass(byte_array_1_6)
	page_4.getOrThrow().Page_contents = turnClass(byte_array_1_6)
	responsebody_0.getOrThrow().ResponseBody_pages = turnClass(page_array_1_0)
}

func Page_____init_____V_v25(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
	java_lang_Object_____init_____V_v212(turnClass(page_0))
}

func java_lang_Object_____init_____V_v212(page_0: ?Page): Unit {
	var page_01111: ?Page = turnClass(page_0)
}


