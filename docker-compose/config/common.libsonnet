local shard_config(replicator_a, replicator_b) = [
    {
      backend: {
        mirrored: {
          backend_a: { grpc: { address: 'storage-0:8981' } },
          backend_b: { grpc: { address: 'storage-1:8981' } },
          replicator_a_to_b: replicator_a,
          replicator_b_to_a: replicator_b,
        },
      },
      weight: 1,
    },
  ];
  
local ac_shard_config = shard_config(
    { 'local': {} },
    { 'local': {} },
);


local ac_shard_config = shard_config(
    { remote: 'storage-1:8982' },
    { remote: '10.31.8.153:8982' },
);

{
  blobstore: {
    contentAddressableStorage: {
      sharding: {
        hashInitialization: 11946695773637837490,
        shards: [
          {
            backend: {
              mirrored: {
                backend_a: { grpc: { address: 'storage-0a:8981' } },
                backend_b: { grpc: { address: 'storage-0b:8981' } },
                replicator_a_to_b: { remote: 'storage-0b:8982' },
                replicator_b_to_a: { remote: 'storage-0a:8982' },
              },
            },
            weight: 1,
          },
          {
            backend: {
              mirrored: {
                backend_a: { grpc: { address: 'storage-1a:8981' } },
                backend_b: { grpc: { address: 'storage-1b:8981' } },
                replicator_a_to_b: { remote: 'storage-1b:8982' },
                replicator_b_to_a: { remote: 'storage-1a:8982' },
              },
            },
            weight: 1,
          },
        ],
      },
    },
    actionCache: {
      completenessChecking: {
        sharding: {
          hashInitialization: 14897363947481274433,
          shards: [
            {
              backend: {
                mirrored: {
                  backend_a: { grpc: { address: 'storage-0:8981' } },
                  backend_b: { grpc: { address: 'storage-1:8981' } },
                  replicator_a_to_b: { 'local': {} },
                  replicator_b_to_a: { 'local': {} },
                },
              },
              weight: 1,
            },
            {
              backend: {
                mirrored: {
                  backend_a: { grpc: { address: 'storage-2:8981' } },
                  backend_b: { grpc: { address: 'storage-3:8981' } },
                  replicator_a_to_b: { 'local': {} },
                  replicator_b_to_a: { 'local': {} },
                },
              },
              weight: 1,
            },
          ],
        },
      },
    },
  },
  browserUrl: 'http://localhost:7984',
  httpListenAddress: ':80',
  maximumMessageSizeBytes: 16 * 1024 * 1024,
  global: { diagnosticsHttpListenAddress: ':9980' },
}
