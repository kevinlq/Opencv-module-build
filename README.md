# Opencv-module-build
Use different tools to compile the opencv module

opencv模块裁剪编译

>Email  :kevinlq0912@163.com  
QQ      :2313828706  
Oschina :http://git.oschina.net/kevinlq0912   
GitHub  :https://github.com/kevinlq 


本次只编译`core`和`imgproc`两大模块

- `core`模块不依赖任何模块
- `imgproc`模块依赖`core`模块

编译成静态库和静态库

## windows平台
使用`MinGW工具链进行编译`

### 错误
- 找不到 `opencl_kernels_imgproc.hpp`

![](/screen/opencl_kernels_imgproc.hpp-norFind.png)

**解决办法**

查找该文件在哪里：`build_mingw53_32\modules\imgproc`

![](/screen/opencl_kernels_imgproc.hpp-norFind-A.png)

## android平台


## ios平台
