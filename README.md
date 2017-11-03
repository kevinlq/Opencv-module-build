# Opencv-module-build
Use different tools to compile the opencv module

opencv模块裁剪编译

>Email  :kevinlq0912@163.com  
QQ      :2313828706  
Oschina :http://git.oschina.net/kevinlq0912   
GitHub  :https://github.com/kevinlq 

## 环境说明
>OS:windows7 64b  
Qt 5.7.0  
MinGW:53032  
CMake:3.10.0-rc3-w64  

## 全部编译

因为opencv模块比较多，如今3.3版本包含的更多了。模块化带了的好处就是我们可以自己编译需要的模块，
这个和Qt刚好类似，给我们开发者带来了极大的好处和方便。

### MinGW版本

提前安装好Qt,CMake，以及opencv源码

使用CMake-gui将opencv的cmake工程转化成makefile，然后使用MinGW进行编译，最后安装。ok

编译完成后的主要文件：

![](/OpencvBuild/screen/build_all.png)


## 编译`core`和`imgproc`两大模块

- `core`模块不依赖任何模块

实际中发现需要添加`3rdparty/include/opencl/1.2/CL/cl.h`文件

- `imgproc`模块依赖`core`模块

编译成静态库

### windows平台
使用`MinGW`工具链进行编译

- **编译core模块**

core模块编译过程中也是遇到了一些问题，大部分记录了下来，详细在后面问题记录里面

core模块编译时需要依赖opencv编译后生成的头文件，所以在编译模块化时需要提前将源码整体编译一遍，注意编译器版本、opencv版本对应。


#### 错误
- 找不到 `opencl_kernels_imgproc.hpp`

![](/OpencvBuild/screen/opencl_kernels_imgproc.hpp-norFind.png)

**解决办法**

查找该文件在哪里：`build_mingw53_32\modules\imgproc`

![](/OpencvBuild/screen/opencl_kernels_imgproc.hpp-norFind-A.png)

很奇怪，这个文件是之前我全部编译opencv后，生成的文件，而这里单独编译时需要这个文件，
仔细想应该是编译中某些开关设置没有打开或关闭吧。

`opencl_kernels_imgproc.hpp`该文件是编译后生成的，这里将该文件拷贝到了工程目录下，然后添加包含路径：
```C++
#build file
INCLUDEPATH +=$$PWD/../build_file/imgproc
```

添加后再次编译，居然通过了，生了了静态库，貌似有点大22.3M

![编译后的静态库](/OpencvBuild/screen/build_static_lib.png)

- 找不到`OCL_PERFORMANCE_CHECK`定义了

![](/OpencvBuild/screen/OCL_PERFORMANCE_CHECK.png)

这个是个宏定义开关`HAVE_OPENCL`

![](/OpencvBuild/screen/cvconfig.png)

- 类型出现问题

```C++
Opencv\core\src\glob.cpp:117: error: cannot convert 'WIN32_FIND_DATA* 
{aka _WIN32_FIND_DATAW*}' to 'LPWIN32_FIND_DATAA {aka _WIN32_FIND_DATAA*}'
 for argument '2' to 'WINBOOL FindNextFileA(HANDLE, LPWIN32_FIND_DATAA)'
             if (::FindNextFileA(dir->handle, &dir->data) != TRUE)
			 
```

![](OpencvBuild/screen/wchar.png)

**解决办法**

Google了下，这个问题是编码问题造成了，需要把自己电脑的编码转为Unicode编码才行，但是为了统一工程编码结构，显然这样不行，所以自己添加了一个编码定义头文件

```C++
#ifndef CODEDEF_H
#define CODEDEF_H

#ifndef UNICODE
#define UNICODE
#define UNICODE_WAS_UNDEFINED
#endif

#include <Windows.h>

#ifdef UNICODE_WAS_UNDEFINED
#undef UNICODE
#endif

#define WINRT
```

然后再core模块中将该头文件包含进去即可解决.

`core`模块静态库

Debug:18.2M,Release:2.86M


- **编译imgproc模块**

imgproc模块依赖于core模块，所以需要将core模块头文件、静态库(上一步编译好的)包含进来.

添加core模块包含路径，然后接着编译

#### 错误
和编译core模块类似，出现了找不到`opencl_kernels_imgproc.hpp`文件，同样该文件是编译opencv源码后生成的，此处需要拷贝过来，然后添加包含路径:

![编译错误](OpencvBuild/screen/imgproc_modules.png)

接着进行编译，约1分钟编译ok了.

ImgProc:Release:3.74M;Debug:22.3M


- **测试使用**

测试工程添加包含路径，和库路径:

![引入静态库路径](/OpencvBuild/screen/test_pro.png)

在main函数文件中引入时出现了链接错误，意思是找不到某些函数方法的实现了，即找不到.cpp文件实现了，这说明上一步生成的静态库中缺少某些函数的实现，静态库编译不正确，重新编译.

![测试错误](/OpencvBuild/screen/test_error.png)

### android平台


### ios平台


## 版本修改
- V0.0.1 添加了可以编译成功的core、imgproc两个模块，成功编译成静态库;
- V0.0.2 成功静态编译core模块;
- V0.0.3 成功静态编译imgProc模块;
