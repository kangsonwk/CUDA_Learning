#include<stdio.h>
// device code
// TAG:
// 1. 分配GPU内存
// 2. 从CPU内存中拷贝数据到GPU中
// 3. 调用CUDA中的内核函数来完成指定的运算
// 4. 将数据从GPU拷回到CPU
// 5. 释放GPU内存空间
__global__ void hello_world(void){
  printf("Hello My first GPU code");
}
int main(int argc,char **argv)
{
  printf("CPU,hello world");
  hello_world<<<1,10>>>();
  // if no this line,it can not output xxx from gpu
  cudaDeviceReset();
  return 0;
}