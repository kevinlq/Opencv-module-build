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

---

[opencv模块裁剪](http://blog.csdn.net/10km/article/details/72972844)


- `core`模块不依赖任何模块

实际中发现需要添加`3rdparty/include/opencl/1.2/CL/cl.h`文件

- `imgproc`模块依赖`core`模块


### windows平台
使用`MinGW`工具链进行编译

#### 编译core模块

core模块编译过程中也是遇到了一些问题，大部分记录了下来，详细在后面问题记录里面

core模块编译时需要依赖opencv编译后生成的头文件，所以在编译模块化时需要提前将源码整体编译一遍，注意编译器版本、opencv版本对应。


#### 错误
- 找不到`cvconfig.h`

![找不到配置头文件](/OpencvBuild/screen/cvconfignotfind.png)
**解决**

需要到opencv工程里找对应的`cvconfig.h`，具体位置在opencv/build/include/opencv2


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

- __OPENCV_BUILD问题

```C++
 error this is a private header which should not be used from outside of the OpenCV library
```
**解决办法**
Google解决:一个朋友说是直接删除掉....我注释掉了.
![](/OpencvBuild/screen/opencv_build_q.png)

[解决方案地址](http://answers.opencv.org/question/79178/error-compiling-traincascade-in-opencv-30/)

- 类型出现问题

```C++
Opencv\core\src\glob.cpp:117: error: cannot convert 'WIN32_FIND_DATA* 
{aka _WIN32_FIND_DATAW*}' to 'LPWIN32_FIND_DATAA {aka _WIN32_FIND_DATAA*}'
 for argument '2' to 'WINBOOL FindNextFileA(HANDLE, LPWIN32_FIND_DATAA)'
             if (::FindNextFileA(dir->handle, &dir->data) != TRUE)
			 
```

![](/OpencvBuild/screen/wchar.png)

**解决办法**

Google了下，这个问题是编码问题造成了，需要把自己电脑的编码转为Unicode编码才行，但是为了统一工程编码结构，显然这样不行，所以自己添加了一个编码定义头文件

```C++
#ifndef CODEDEF_H
#define CODEDEF_H

#ifndef UNICODE
#define UNICODE
#define UNICODE_WAS_UNDEFINED
#endif

#ifdef Q_OS_WIN
#include <Windows.h>

#endif

#ifdef UNICODE_WAS_UNDEFINED
#undef UNICODE
#endif

#define WINRT

#endif // CODEDEF_H

```

然后再core模块中将该头文件包含进去即可解决.

上述解决方案其实多此一举了，直接在`cvconfig.h`文件中添加`WINRT`宏定义即可

`cvconfig.h`中定义了好多模块编译的开关.


`core`模块静态库

Debug:18.2M,Release:2.86M


#### 编译imgproc模块

imgproc模块依赖于core模块，所以需要将core模块头文件、静态库(上一步编译好的)包含进来.

添加core模块包含路径，然后接着编译

#### 错误
和编译core模块类似，出现了找不到`opencl_kernels_imgproc.hpp`文件，同样该文件是编译opencv源码后生成的，此处需要拷贝过来，然后添加包含路径:

![编译错误](/OpencvBuild/screen/imgproc_modules.png)

接着进行编译，约1分钟编译ok了.

ImgProc:Release:3.74M;Debug:22.3M


- **测试使用**

测试工程添加包含路径，和库路径:

![引入静态库路径](/OpencvBuild/screen/test_pro.png)

在main函数文件中引入时出现了链接错误，意思是找不到某些函数方法的实现了，即找不到.cpp文件实现了，这说明上一步生成的静态库中缺少某些函数的实现，静态库编译不正确，重新编译.

![测试错误](/OpencvBuild/screen/test_error.png)


需要添加zlib支持

![](/OpencvBuild/screen/zlib_error.png)

进到该函数中，可以看到，跑到了mingw32自带的zlib库中了。

![](/OpencvBuild/screen/zlib_error2.png)

- 编译zlib库

此时需要下载第三方的zlib库.

>网上查找说是opencv使用自带的zlib会和开发过程中使用的zlib冲突，最好都使用第三方的库.

zlib库很好编译，直接添加到Qt子工程中即可，设置目标target和templete。

>很是奇怪的问题，zlibi已经编译成功了，而且已经添加到了core模块子工程配置中，但是最后程序链接时提示还是找不到某些zlib方法

**解决方案**
既然将zlib编译成静态库无法连接，那么就直接将zlib源码包含进来好了，和core模块一起编译算了，修改后终于编译成功了，最后连接成功了.

#### 编译imgcodecs模块

编译imgcodecs模块是为了编译higugui模块，后者依赖于前者，所以需要提前编译，测试发现，`imgcoedcs`模块依赖于`imgproc`模块，刚好该模块在上一步编译过了.

直接拷贝到当前工程下，配置到pro中，参数按照上2个模块配置方法，编译.

**出现错误:**

- 找不到`ImfHeader.h`文件

该文件是属于`openexr`开源库，是视觉效果行业使用的一种文件格式，适用于高动态范围图像.


出现静态库无法连接问题

* 问题描述:`imgcoedcs`模块依赖`tiff`库，已经将`tiff`编译成静态库了，并在`imgcoedcs`工程中引入了对应的头文件和库路径，在最后连接过程中无法找到……

#### 编译highgui模块

higugui模块依赖于`imgcodecs`模块，所以要先编译该模块.


---

### android平台

android平台编译前需要配置好环境变量，以下是我的环境变量:

![android平台环境参数](/OpencvBuild/screen/android_env.png)

设置好编译环境后，添加宏定义，以便区分编译后的文件:

![android平台编译宏定义](/OpencvBuild/screen/android_config.png)

然后直接编译，大约5分钟左右，编译完成，没有出现错误，很幸运.

最终生成的库文件:

![android平台编译生成库文件](/OpencvBuild/screen/android_lib.png)

---

### ios平台

配置好Qt for ios环境。以下是我编译时配置的环境.

![ios平台环境参数](/OpencvBuild/screen/ios_env.png)

基本编译也是没有问题的，最终生成了两个模块对应的库文件:

**core模块**

![ios平台生成的库文件](/OpencvBuild/screen/ios_core_size.png)

**imgproc模块**

![ios平台生成的库文件](/OpencvBuild/screen/ios_imgproc_size.png)

>比较发现，同样的模块，在不同平台下编译出来大小不一样，差距还是很大的.

## 问题与展望

目前关于opencv这块相关模块参数配置项都在cvconfig.h中，可以考虑将其容纳到工程pro文件中，这样修改时直接修改工程文件即可，带来更大的方便.


## 版本修改
- V0.0.1 添加了可以编译成功的core、imgproc两个模块，成功编译成静态库;
- V0.0.2 成功静态编译core模块;
- V0.0.3 成功静态编译imgProc模块;
- V0.0.5 编写测试demo，检测静态编译两大模块OK;
- V0.0.6 在android平台成功编译成功两大模块;
- V0.0.7 在ios平台成功编译两大模块；
