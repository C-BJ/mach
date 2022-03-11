const ComputePipeline = @This();

/// The type erased pointer to the ComputePipeline implementation
/// Equal to c.WGPUComputePipeline for NativeInstance.
ptr: *anyopaque,
vtable: *const VTable,

pub const VTable = struct {
    reference: fn (ptr: *anyopaque) void,
    release: fn (ptr: *anyopaque) void,
    // TODO:
    // WGPU_EXPORT WGPUBindGroupLayout wgpuComputePipelineGetBindGroupLayout(WGPUComputePipeline computePipeline, uint32_t groupIndex);
    // WGPU_EXPORT void wgpuComputePipelineSetLabel(WGPUComputePipeline computePipeline, char const * label);
};

pub inline fn reference(pipeline: ComputePipeline) void {
    pipeline.vtable.reference(pipeline.ptr);
}

pub inline fn release(pipeline: ComputePipeline) void {
    pipeline.vtable.release(pipeline.ptr);
}

test "syntax" {
    _ = VTable;
    _ = reference;
    _ = release;
}