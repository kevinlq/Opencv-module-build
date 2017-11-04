#include <QApplication>

#include <QWidget>
#include <QDebug>

#include "opencv2/imgproc.hpp"

using namespace cv;

int main(int argc, char *argv[])
{
    qDebug()<<"start.....";

    const int r = 100;
    //Mat src = Mat::zeros (Size(4 * r,4 * r),CV_8UC1);

    //cv::Mat pic(10,3,CV_8SC3,cv::Scalar(0,0,255));

    qDebug()<<"end.....";
}
