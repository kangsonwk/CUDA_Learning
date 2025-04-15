#include <cuda_runtime.h>
#include <stdio.h>
// TAG:grid、block、thread之间的关系见1.png

__global__ void checkIndex(int thread_x)
{
  if (threadIdx.x == thread_x)
  {
    printf("threadIdx:(%d,%d,%d),blockIdx:(%d,%d,%d),blockDim:(%d,%d,%d),gridDim(%d,%d,%d)\n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           blockDim.x, blockDim.y, blockDim.z,
           gridDim.x, gridDim.y, gridDim.z);
  }
  // 线程索引、块索引、块维度和网格维度
}
int main(int argc, char **argv)
{
  int nElem = 24;
  dim3 block(3, 2, 2);
  dim3 grid(2, (nElem + block.x * block.y - 1) / (block.x * block.y));
  printf("grid.x %d grid.y %d grid.z %d\n", grid.x, grid.y, grid.z);
  printf("block.x %d block.y %d block.z %d\n", block.x, block.y, block.z);
  checkIndex<<<grid, block>>>(2);
  cudaDeviceReset();
  return 0;
}
