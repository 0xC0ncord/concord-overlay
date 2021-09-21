# Whether compiler warnings are treated as errors. This is highly recommended,
# but it can be disabled to avoid patching the Makefile if a compiler version
# not tested by the project is being used and has warnings. Investigating
# these warnings is still recommended and the intention is to always be free
# of any warnings.
# Default: true
CONFIG_WERROR=true

# Whether the code is optimized for the detected CPU on the host. If this is
# disabled, setting up a custom -march higher than the baseline architecture
# is highly recommended due to substantial performance benefits for this code.
# Default: true
CONFIG_NATIVE=true

# Whether the C++ allocator is replaced for slightly improved performance and
# detection of mismatched sizes for sized deallocation (often type confusion
# bugs). This will result in linking against the C++ standard library.
# Default: true
CONFIG_CXX_ALLOCATOR=true

# Whether small allocations are zeroed on free, to mitigate use-after-free and
# uninitialized use vulnerabilities along with purging lots of potentially
# sensitive data from the process as soon as possible. This has a performance
# cost scaling to the size of the allocation, which is usually acceptable. This
# is not relevant to large allocations because the pages are given back to the
# kernel.
# Default: true
CONFIG_ZERO_ON_FREE=true

# Enable or disable sanity checking that new small allocations contain zeroed
# memory. This can detect writes caused by a write-after-free vulnerability and
# mixes well with the features for making memory reuse randomized/delayed. This
# has a performance cost scaling to the size of the allocation, which is usually
# acceptable. This is not relevant to large allocations because they're always
# a fresh memory mapping from the kernel.
# Default: true
CONFIG_WRITE_AFTER_FREE_CHECK=true

# Randomize selection of free slots within slabs. This has a measurable
# performance cost and isn't one of the important security features, but the cost
# has been deemed more than acceptable to be enabled by default.
# Default: true
CONFIG_SLOT_RANDOMIZE=true

# Enable support for adding 8 byte canaries to the end of memory allocations. The
# primary purpose of the canaries is to render small fixed size buffer overflows
# harmless by absorbing them. The first byte of the canary is always zero,
# containing overflows caused by a missing C string NUL terminator. The other 7
# bytes are a per-slab random value. On free, integrity of the canary is checked
# to detect attacks like linear overflows or other forms of heap corruption
# caused by imprecise exploit primitives. However, checking on free will often be
# too late to prevent exploitation so it's not the main purpose of the canaries.
# Default: true
CONFIG_SLAB_CANARY=true

# Whether memory Protection Keys are used to disable access to all writable
# allocator state outside of the memory allocator code. It's currently disabled
# by default due to lack of regular testing and a significant performance cost for
# this use case on current generation hardware, which may become drastically lower
# in the future. Whether or not this feature is enabled, the metadata is all
# contained within an isolated memory region with high entropy random guard
# regions around it.
# Default: false
CONFIG_SEAL_METADATA=false

# The number of slots in the random array used to randomize reuse for small
# memory allocations. This sets the length for the largest size class (either
# 16kiB or 128kiB based on CONFIG_EXTENDED_SIZE_CLASSES) and the quarantine length
# for smaller size classes is scaled to match the total memory of the
# quarantined allocations (1 becomes 1024 for 16 byte allocations with 16kiB
# as the largest size class, or 8192 with 128kiB as the largest).
# Default: 1
CONFIG_SLAB_QUARANTINE_RANDOM_LENGTH=1

# The number of slots in the queue used to delay reuse for small memory
# allocations. This sets the length for the largest size class (either 16kiB or
# 128kiB based on CONFIG_EXTENDED_SIZE_CLASSES) and the quarantine length for
# smaller size classes is scaled to match the total memory of the quarantined
# allocations (1 becomes 1024 for 16 byte allocations with 16kiB as the largest
# size class, or 8192 with 128kiB as the largest).
# Default: 1
CONFIG_SLAB_QUARANTINE_QUEUE_LENGTH=1

# The number of slabs before a slab is skipped and left as an unused memory
# protected guard slab. The default of 1 leaves a guard slab between every slab.
# This feature does not have a *direct* performance cost, but it makes the
# address space usage sparser which can indirectly hurt performance. The kernel
# also needs to track a lot more memory mappings, which uses a bit of extra
# memory and slows down memory mapping and memory protection changes in the
# process. The kernel uses O(log n) algorithms for this and system calls are
# already fairly slow anyway, so having many extra mappings doesn't usually add
# up to a significant cost.
# Default: 1
CONFIG_GUARD_SLABS_INTERVAL=1

# The maximum size of the guard regions placed on both sides of large memory
# allocations, relative to the usable size of the memory allocation.
# Default: 2
CONFIG_GUARD_SIZE_DIVISOR=2

# The number of slots in the random array used to randomize region reuse for
# large memory allocations.
# Default: 256
CONFIG_REGION_QUARANTINE_RANDOM_LENGTH=256

# The number of slots in the queue used to delay region reuse for large memory
# allocations.
# Default: 1024
CONFIG_REGION_QUARANTINE_QUEUE_LENGTH=1024

# The size threshold where large allocations will not be quarantined.
# Default: 33554432 
CONFIG_REGION_QUARANTINE_SKIP_THRESHOLD=33554432 

# The number of slots in the random array used to randomize free slab reuse.
# Default: 32
CONFIG_FREE_SLABS_QUARANTINE_RANDOM_LENGTH=32

# The size of the size class regions.
# Default: 34359738368 
CONFIG_CLASS_REGION_SIZE=34359738368 

# The number of arenas.
# Default: 4
CONFIG_N_ARENA=4

# Whether stats on allocation / deallocation count and active allocations are
# tracked.
# Default: false
CONFIG_STATS=false

# Whether small size class go up to 128kiB instead of the minimum requirement
# for avoiding memory waste of 16kiB. The option to extend it even further
# will be offered in the future when better support for larger slab allocations
# is added.
# Default: true
CONFIG_EXTENDED_SIZE_CLASSES=true

# Whether large allocations use the slab allocation size class scheme instead
# of page size granularity.
# Default: true
CONFIG_LARGE_SIZE_CLASSES=true
