HHJImageScroll
==============

简介
--------------
UICollectionView实现的无限循环自动图片轮播器<br>
1.本地图片和网络图片的无限轮播；<br>
2.底部带文字说明的图片无限循环自动轮播；<br>
3.只显示文字的无限循环自动轮播；<br>

实现方法
-------
使用工具时将demo下载下来，将demo中的Lib文件夹下的HHJImageScrollView文件拷贝到你的工程中即可<br>

实现代码
-------
```
 self.automaticallyAdjustsScrollViewInsets = NO;//注意一定要设置
    
    NSArray *imageUrlArray = @[@"http://www.tenda.com.cn/newspic/20170502/1ooxg23vu2n.jpg",
                                @"http://resource.feng.com/resource/h061/h78/img201705181655190.jpg",
                                @"http://car.southcn.com/7/attachment/20170425/20034044/414e22d1259941f49864.jpg",
                                @"http://img1.cheshi-img.com/center/600/74/e6/86/97c5597c7419b2ec344e75cd62.jpeg",
                                @"http://img1.bitautoimg.com/Video/2015/08/25/2015825174750469.jpg"
                                ];
    
    HHJImageScrollView *imageScroll = [HHJImageScrollView imageScrollViewWithFrame:CGRectMake(0, 64, hjScreen_width, 220) imageUrlStringArray:nil placeholderImage:[UIImage imageNamed:@"placeholder"]];//在初始化方法中赋值
    [self.view addSubview:imageScroll];
    imageScroll.imageUrlArray = imageUrlArray;//通过属性赋值
    imageScroll.pageControlDotSize = CGSizeMake(10, 10);
    //    imageScroll.pageControlRightOffset = 50;
    //    imageScroll.pageControlBottomOffset = 100;
    imageScroll.autoScrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    imageScroll.currentPageDotColor = [UIColor redColor];
    imageScroll.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    imageScroll.othersPageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _imageScroll = imageScroll;
    
    //block监听图片的点击事件
    
    _imageScroll.clickImageIndexOperationBlock = ^(NSInteger index) {
        NSLog(@"我点击的是第%ld张图片",index);
    };
    
    //block监听图片的滚动事件
    _imageScroll.scrollToImageIndexOperationBlock = ^(NSInteger index) {
        NSLog(@"图片滚动到第%ld张",index);
    };
    /*
    除了block监听点击事件之外，你还可以设置代理来实现点击事件的回调
    //点击图片的回调
- (void)imageScrollView:(HHJImageScrollView *)imageScrollView didSelectImageIndex:(NSInteger)index {
    NSLog(@"我点击的是第%ld张图片",index);
}

//图片滚动时的回调
- (void)imageScrollView:(HHJImageScrollView *)imageScrollView scrollToImageIndex:(NSInteger)index {
    NSLog(@"图片滚动到第%ld张",index);
}
    */
```
注意
-------
在使用此工具时，会在控制器的顶部出现一块空白区域。原因是：<br>
在iOS 7以后，controller 会对其中唯一的scrollView或其子类调整内边距，从而导致位置不准确。设置`self.automaticallyAdjustsScrollViewInsets = NO`;<br>
其他的设置可以在`HHJImageScrollView.h`查看一下，有详细说明。<br>

演示
-------

 ![](http://img.027cgb.cn/20170609/201768311978751583.gif)

最后
-------
* 思路参考：https://github.com/gsdios/SDCycleScrollView
* 在使用本工具的过程中如果发现有什么bug，欢迎大家在issues中给我提出宝贵的意见。
* 我的简书：[爱码师](http://www.jianshu.com/u/294a717ea284 "爱码师")
