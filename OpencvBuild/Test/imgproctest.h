#ifndef IMGPROCTEST_H
#define IMGPROCTEST_H

#include <iostream>

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"

using namespace std;
using namespace cv;

class ImgProcTest
{
public:
    ImgProcTest(const string &fileName);
    ~ImgProcTest();

    //低通滤波
    void blurTest();

    //中值滤波
    void saltTest();

    //Sobel滤波器检测边缘
    void sobelTest();

    //图像的拉普拉斯变换
    void laplacTest();


private:
    void salt(cv::Mat& image,int n);

private:
    string m_strFilePath;
};


//拉普拉斯变换
class LaplacianZC{

public:
    Mat img;    //原图
    Mat laplace;    //包含Laplacian的32位浮点图像
    int aperture;
public:
    LaplacianZC() : aperture(3){};

    //设置卷积核的大小
    void setAperture(int a){
        aperture = a;
    }

    //计算浮点数Laplacian
    Mat computeLaplacian(const Mat&image){
        //计算Laplacian
        Laplacian(image, laplace, CV_32F, aperture);
        //保留图像的局部备份（用于零点交叉）
        img = image.clone();
        return laplace;
    }

    //返回8位图像存储的Laplacian结果，零点交叉于灰度值128
    //如果没有指定scale参数，那么最大值将缩放至强度255
    //必须在调用它之前调用computeLaplacian
    Mat getLaplacianImage(double scale = -1.0){

        if (scale<0)
        {
            double lapmin, lapmax;
            minMaxLoc(laplace, &lapmin, &lapmax);
            scale = 127 / max(-lapmin, lapmax);
        }

        Mat laplaceImage;
        laplace.convertTo(laplaceImage, CV_8U, scale, 128);
        return laplaceImage;
    }

    //得到零点交叉的二值图像，如果相邻像素的乘积小于threshold，那么相邻交叉将被忽略
    Mat getZeroCrossings(float threshold = 1.0){

        //创建迭代器
        Mat_<float>::const_iterator it = laplace.begin<float>()+laplace.step1();
        Mat_<float>::const_iterator itend = laplace.end<float>();
        Mat_<float>::const_iterator itup = laplace.begin<float>();
        //初始化为白色的二值图像
        Mat binary(laplace.size(), CV_8U, Scalar(255));
        Mat_<uchar>::iterator itout = binary.begin<uchar>() + binary.step1();
        //对输入阈值取反
        threshold*= -1.0;
        for (; it!=itend;++it,++itup,++itout)
        {
            //如果相邻像素的乘积为负数，那么符号发生改变
            if (*it**(it - 1) < threshold)*itout = 0;    //水平方向零点交叉
            else if (*it**itup < threshold) *itout = 0;  //垂直方向零点交叉
        }

        return binary;
    }

};

#endif // IMGPROCTEST_H
