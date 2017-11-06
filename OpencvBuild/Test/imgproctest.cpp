#include "imgproctest.h"


ImgProcTest::ImgProcTest(const string &fileName)
    :m_strFilePath(fileName)
{
}

ImgProcTest::~ImgProcTest()
{
}

void ImgProcTest::blurTest()
{
    if (m_strFilePath.empty ())
        return;

    Mat image = imread(m_strFilePath);
    namedWindow ("image");
    imshow ("image",image);

    Mat resultBlur;
    blur (image,resultBlur,Size(5,5));
    namedWindow ("resultBlur");
    imshow ("resultBlur",resultBlur);

    //高斯滤波器
    Mat resultGauss;
    GaussianBlur(image, resultGauss, Size(5, 5), 1.5);
    namedWindow("resultGauss");
    imshow("resultGauss", resultGauss);
}

void ImgProcTest::saltTest()
{
    if (m_strFilePath.empty ())
        return;

    Mat image = imread(m_strFilePath);
    salt(image, 5000);
    namedWindow ("image");
    imshow ("image",image);

    Mat resultMedianBlur;
    medianBlur(image, resultMedianBlur, 5);
    namedWindow("resultMedianBlur");
    imshow("resultMedianBlur", resultMedianBlur);
}

void ImgProcTest::sobelTest()
{
    if (m_strFilePath.empty ())
        return;

    Mat image = imread(m_strFilePath);
    namedWindow("image");
    imshow("image", image);

    //水平滤波器
    Mat sobelX;
    Mat sobelY;

    //8位图像(CV_8U)表示结果
    Sobel(image, sobelX, CV_8U, 1, 0, 3, 0.4, 128);
    Sobel(image, sobelY, CV_8U, 0, 1, 3, 0.4, 128);
    namedWindow("sobelX");
    imshow("sobelX", sobelX);
    namedWindow("sobelY");
    imshow("sobelY", sobelY);

    //计算Sobel范式
    Sobel(image, sobelX, CV_16S, 1, 0);
    Sobel(image, sobelY, CV_16S, 0, 1);
    Mat sobelNorm;
    sobelNorm = abs(sobelX) + abs(sobelY);
    //搜寻sobel极大值
    double sobmin, sobmax;
    minMaxLoc(sobelNorm, &sobmin, &sobmax);
    //变换为8位图像
    Mat sobelImage;
    sobelNorm.convertTo(sobelImage, CV_8U, -255. / sobmax, 255);
    namedWindow("sobelImage");
    imshow("sobelImage", sobelImage);
    //阈值化得到二值图像
    Mat sobelThresholded;
    threshold(sobelImage, sobelThresholded, 220, 255, THRESH_BINARY);
    namedWindow("sobelThresholded");
    imshow("sobelThresholded", sobelThresholded);
}

void ImgProcTest::laplacTest()
{
    if (m_strFilePath.empty ())
        return;

    Mat image = imread(m_strFilePath,0);
    namedWindow("image");
    imshow("image", image);

    LaplacianZC laplacian;
    //图像7x7拉普拉斯变换
    laplacian.setAperture(7);
    Mat flap = laplacian.computeLaplacian(image);


    laplacian.laplace = laplacian.getLaplacianImage();
    namedWindow("laplace");
    imshow("laplace", laplacian.laplace);


    //零交叉的二值图像
    laplacian.laplace = laplacian.getZeroCrossings();

    namedWindow("zeroCross");
    imshow("zeroCross", laplacian.laplace);
}

void ImgProcTest::salt(Mat &image, int n)
{
    for (int k = 0; k<n; k++){
        int i = rand() % image.cols;
        int j = rand() % image.rows;

        if (image.channels() == 1){
            image.at<uchar>(j, i) = 255;
        }
        else{
            image.at<cv::Vec3b>(j, i)[0] = 255;
            image.at<cv::Vec3b>(j, i)[1] = 255;
            image.at<cv::Vec3b>(j, i)[2] = 255;
        }
    }
}

