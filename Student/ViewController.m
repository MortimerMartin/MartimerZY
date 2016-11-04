//
//  ViewController.m
//  Student
//
//  Created by pro on 16/10/18.
//  Copyright © 2016年 pro. All rights reserved.
//



#import "ViewController.h"
#import "Students.h"
#import "Person.h"
#import "UIImageView+LBBlurredImage.h"
#import "UIView+CLExtension.h"

#import "ChildImageView.h"
#import "ZYButton.h"

#import "AutoEncode.h"
#import "PP_PopOrPush.h"

#import "PPViewController.h"
//#import "NSObject+ExchangeMethod.h"


#import <AVFoundation/AVFoundation.h>
#import "CLAVPlayerView.h"
#import "ApiRequest.h"
#import "AFNetworking.h"
#import "YTKNetworkAgent.h"


#define ZFFuncLog ZFLog(@"%s",__func__)

//自定义log

#ifdef DEBUG//调试

# define ZFLog(fmt, ...) NSLog((@"%s [Line %d]"fmt),__PRETTY_FUNCTION__,__LINE__, ##__VA_ARGS__);//在这里写了分号ZFFuncLog就不用写分号了

#else//发布阶段

#define ZFlog(...)

#endif


//1.1Printing while in the debug model and pop an alert.模式下打印日志,当前行并弹出一个警告

#ifdef DEBUG

#define ULog(fmt, ...) { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"Ok"otherButtonTitles:nil]; [alert show]; }

#else

#   define ULog(...)

#endif

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue &0xFF0000) >>16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]
#define COLOR_666               UIColorFromRGB(0x666666)

@interface ViewController ()<PersonDelegate,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic , strong) ChildImageView * chileImg;

@property (nonatomic , strong) CLAVPlayerView * playView;

@end


//(lldb) po [self recursiveDescription]   打印一个View上的所有信息
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self initObject];

//     [self setUpVideoPlayView];

//

        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
        [self.view addSubview:img];



  
    //获取手机的uuid
//    NSUUID * uuid = [UIDevice currentDevice].identifierForVendor;
//    NSString * uuids = uuid.UUIDString;
   
//    [self clipViewToDocument];
//    [self MoBoLiImage];;
  
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)loadHttpsData{

    //    UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    //    [self.view addSubview:img];

    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 设置请求格式
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    // 2.申明返回的结果是text/html类型
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 加上这行代码，https ssl 验证。
    
    // 3.发送POST请求
    NSDictionary *dict = @{@"integerKey1":@(3),@"userId":@"41"};
    
    [mgr POST:@"http://sale.degjsm.cn/EDearWork/services/api/mobileManager/doQueryWork" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        //        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        //        NSDictionary * dict1 = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSDictionary * dict2 = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
   
    
    
    
    
    
    
    
    
//    UITextView * text = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, self.view.cl_width, 300)];
//    
//    NSString * string = @"3680u*&$##^/n";
//    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
//    NSString *trimmedString = [string stringByTrimmingCharactersInSet:set];
//    
//    
//    NSLog(@"%@",trimmedString);
    
    
    
    
    
    
    
    
    
    

    //    YTKNetworkAgent * agent = [YTKNetworkAgent sharedAgent];
    //    [agent setValue:[NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json",@"text/html",@"text/css", nil] forKeyPath:@"_manager.responseSerializer.acceptableContentTypes"];
    //    //AFNet支持Https 测试环境下忽略https证书。。
    //        [agent setValue:@NO forKeyPath:@"_manager.securityPolicy.allowInvalidCertificates"];
    
    //    [agent addRequest:request];
    
    //    NSDictionary *dict = @{};
    //    ApiRequest *request = [ApiRequest doRequest:@"https://ubmcmm.baidustatic.com/media/v1/0f000KgfXCLgov0kMJ-UOf.jpg" withParameter:dict];
    //
    //
    //    [request startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
    //
    //
    //        NSLog(@"SUCCESS");
    //
    //
    //        
    //    } failure:^(YTKBaseRequest *request) {
    //        
    //    }];

}
- (void)setUpVideoPlayView{

    self.playView = [CLAVPlayerView videoPlayView];
    
    self.playView.frame = CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.width * 9 / 16);
    self.playView.sonViewController = self;
    [self.view addSubview:self.playView];
    
     self.playView.urlString = @"http://120.25.226.186:32812/resources/videos/minion_02.mp4";
}


- (void)pushOrPresent{

    self.navigationController.delegate = self;
    
    
    ZYButton * btn = [[ZYButton alloc] initWithFrame:CGRectMake(10, 66, self.view.cl_width - 20, 36)];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.tag = 101;
    [btn addTarget:self action:@selector(shake:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}

// 导航控制器的跳转动画代理方法  在这里完成 Push 和 Pop 动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return operation == UINavigationControllerOperationPush ? [[PP_PopOrPush alloc] initWithStytle:(AnimatedScenePush)] : [[PP_PopOrPush alloc] initWithStytle:(AnimatedScenePop)];
}

// 完成转场 Present 动画代理
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    NSLog(@"----------->Present 一级视图控制器中");
    return [[PP_PopOrPush alloc] initWithStytle:(AnimatedScenePresent)];
}
// 转场 Dissmiss 动画 代理
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    NSLog(@"----------->Dissmiss 一级视图控制器中");
    return [[PP_PopOrPush alloc] initWithStytle:(AnimatedSceneDissmiss)];
}


- (void)tupianchandou{

        ZYButton * btn = [[ZYButton alloc] initWithFrame:CGRectMake(10, 10, self.view.cl_width - 20, 36)];
        [btn setBackgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(shake:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    
    
        AutoEncode * encode = [[AutoEncode alloc] init];
        encode.name = @"nihao";
        encode.sex = @"woman";
        encode.userID = 24;
        [encode saveInfo];
    
        NSLog(@"%@LLLL%@LLL%ld",[encode readInfo].name,[encode readInfo].sex,[encode readInfo].userID);
    
    
        self.chileImg = ({
    
            ChildImageView * shake = [[ChildImageView alloc] initWithFrame:CGRectMake(20, 70, self.view.cl_width - 40, 50)];
            shake.image = [UIImage imageNamed:@"niuqu.jpg"];
            [self.view addSubview:shake];
            
            shake;
        
        });
    
}

- (void)yidongdepikaqiu{

    // 1. 创建轨迹路径Path
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 400)]; //起点
    
    //设置终点 和两个控制点（拐点）
    [path addCurveToPoint:CGPointMake(400, 200) controlPoint1:CGPointMake(120, 10) controlPoint2:CGPointMake(300, 20)];
    
    // 2. 绘制运动路径轨迹
    CAShapeLayer * pathlayer = [CAShapeLayer layer];
    
    pathlayer.path = path.CGPath;// 绘制路径
    pathlayer.strokeColor = [UIColor redColor].CGColor;//轨迹颜色
    pathlayer.fillColor = [UIColor clearColor].CGColor;//填充颜色
    
    pathlayer.lineWidth = 5.0f;//线宽
    
    // 3. 创建关键帧动画
    CAKeyframeAnimation * pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //pathAnimation.calculationMode = kCAAnimationPaced;// 我理解为节奏
    
    pathAnimation.fillMode = kCAFillModeForwards;
    
    pathAnimation.removedOnCompletion = NO; //是否在动画完成后从 layer 层 移除 回到最开始状态
    
    pathAnimation.duration = 3.0f; //动画时间
    
    pathAnimation.repeatCount = 100;// 动画重复次数
    
    pathAnimation.path = path.CGPath;
    // 创建需要动画的pika
    
    UIImageView * pika = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 80, 80)];
    pika.image =  [UIImage imageNamed:@"pika.jpg"];
    
    [self.view.layer addSublayer:pathlayer];//绘制轨迹
    [self.view addSubview:pika];
    
    [pika.layer addAnimation:pathAnimation forKey:@"yidong"];//添加动画
}
- (void)shake:(UIButton *)sender{

    
    if (sender.tag == 101) {
        PPViewController * pp = [[PPViewController alloc] init];
        [self.navigationController pushViewController:pp animated:YES];
    }

    [_chileImg shake];
    
}

- (void)initObject{

    Students * st = [[Students alloc] init];
    st.name = @"test";
    st.sex = @"demo";
    st.number = 1;
    
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:st];
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    
    [user setObject:data forKey:@"testdemo"];
    
    NSData * data1 = [user objectForKey:@"testdemo"];
    
    Students * sts = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    
    
    NSLog(@"%@%@%ld",sts.name,sts.sex,sts.number);
//    ZFLog(@"%@%@%ld",sts.name,sts.sex,sts.number);
//    ULog(@"%@%@%ld",sts.name,sts.sex,sts.number);
    st = nil;
    sts = nil;
    
    
    
    
    Students * st1 = [[Students alloc] init];
    st1.name = @"file";
    st1.sex = @"demo";
    st1.number = 2;
    
    [Students saveStudents:st1];
    
    Students * st2 =  [Students loadData];
    NSLog(@"%@%@%ld",st2.name,st2.sex,st2.number);
    
    
    st1 = nil;
    
    st2 = nil;
    
    
    Person * person = [Person sharePerson];
    person.delegate = self;
    person.name = @"ren";
    person.userID = @"01";
    person.sex = @"man";
    
    Person * p1 = [[Person alloc] init];
    NSLog(@"%@,%@%@%@", p1,p1.name,p1.userID,p1.sex);
    
    Person * p2 = [p1 copy];
    NSLog(@"%@,%@%@%@", p2,p2.name,p2.userID,p2.sex);
    

}




#pragma mark PersonDelegate

- (void)test:(id)anything didFinishAnything:(id)anyting1{


    NSLog(@"..................%@",anyting1);
}


- (void)MoBoLiImage{

    UIImageView * MImageView = ({
        
        UIImageView * objc = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.cl_width - 20, self.view.cl_height - 20)];
        
        [objc setImageToBlur:[UIImage imageNamed:@"niuqu.jpg"] blurRadius:0 completionBlock:^{
            
            NSLog(@"what");
        }];
        
        
        objc;
    });
    
    [self.view addSubview:MImageView];

}


- (void)clipViewToDocument{

    UIImageView * img1 = ({
    
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width -20, 77)];
        
        image.image = [UIImage imageNamed:@"01.jpeg"];
        NSLog(@"%@",image);
        image;
    });
    NSLog(@"%@",img1);
    


    
    
    [self.view addSubview:img1];
    
    
    UIImageView * image1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 166, self.view.frame.size.width -20, 77)];
    
    image1.image = [UIImage imageNamed:@"02.jpg"];
    
    [self.view addSubview:image1];
    
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"clipImage"];
    
    [self clipScreenWithPath:filePath type:@"png" UIView:self.view];

    
    
    UIImageView * image2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 366, self.view.frame.size.width -20, 300)];
    
    image2.image = [UIImage imageWithData:[self loadFileImage]];
    
    [self.view addSubview:image2];
    
}

- (void)saveImageToPhotos{

    UIImageView * image2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 366, self.view.frame.size.width -20, 300)];
    
    image2.image = [UIImage imageWithData:[self loadFileImage]];
    
    [self.view addSubview:image2];
    
    [self loadImageFinished:image2.image];
    
}

/**
 *  把一个图片保存到相册
 *
 *  @param image   保存到相册的图像对象
 */
- (void)loadImageFinished:(UIImage *)image{

    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);


}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}



//  拖动代码块  选中代码 长按左键 箭头变成一个加粗加黑的箭头 按 command键  即可拖动


/**
 *  把一个UIView生成PNG或者JPG格式的图片,保存在指定路径
 *
 *  @param path   图片要保存到的路径
 *  @param type   图片的格式png或者jpg
 *  @param UIView 要转成图片的UIView
 */
- (void)clipScreenWithPath:(NSString *)path type:(NSString *)type UIView:(UIView *)view
{
    if ([self loadFileImage]) {
        NSLog(@"cunzai");
        return;
    }

    //1.开启一个和传进来的View大小一样的位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size,NO,0);
    //2.把控制器的View绘制到上下文当中
    //想把UIView上面的东西绘制到上下文当中,必须得使用渲染的方式
    //renderInContext:就是渲染的方式
    CGContextRef ctx= UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx ];
    //3从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭上下文
    UIGraphicsEndImageContext();
    //5.把生成的图片写入到桌面(以文件的方式进行传输:二进制流NSData,即把图片转为二进制流)
    NSData *data;
    if ([type isEqualToString:@"png"]) {
        //生成PNG格式的图片
        data = UIImagePNGRepresentation(newImage);
    }
    else if ([type isEqualToString:@"jpg"]){
        //5.1把图片转为二进制流(第一个参数是图片,第2个参数是图片压缩质量:1是最原始的质量)
        data = UIImageJPEGRepresentation(newImage,1);
    }
    
    [data writeToFile:path atomically:YES];
}



- (NSData *)loadFileImage{

    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"clipImage"];
    NSLog(@"%@",filePath);
    return [NSData dataWithContentsOfFile:filePath];

}

- (void )removeFileImage{

    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"clipImage"];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
