//
//  ViewController.m
//  YHImage
//
//  Created by SYH on 16/7/8.
//  Copyright © 2016年 SYH523364. All rights reserved.
//

#import "ViewController.h"
#import "UIView+YHView.h"
#import "UIColor+YHColor.h"
#import "BDImagePicker.h"
#import "UIImage+YHImage.h"
#import <QuartzCore/QuartzCore.h>
#import <AFNetworking.h>
#import "NSString+YHString.h"
#define YHWidth self.view.frame.size.width
#define YHHeight self.view.frame.size.height
#define BIG_Width YHWidth
#define BIG_Height YHWidth


@interface ViewController ()<UIGestureRecognizerDelegate>

{
    UIView *background;
    
}
@property(nonatomic, strong)UIButton *button;
@property(nonatomic, strong)UIButton *uploadButton;
@property(nonatomic, strong)UIImageView *image;
@property(nonatomic, retain)UIImage *img;
@property CGFloat lastScale;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self creatView];

    [self addTapGesture];
    
    self.uploadButton = [[UIButton alloc]init];
    _uploadButton.top = 450;
    _uploadButton.left = 50;
    _uploadButton.width = 200;
    _uploadButton.height = 50;
    [self.view addSubview:self.uploadButton];
    [self.uploadButton setBackgroundImage:[UIImage YHimageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal];
    [self.uploadButton setTitle:@"上传照片" forState:UIControlStateNormal];
    [self.uploadButton addTarget:self action:@selector(uploadImage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
//上传照片到服务器的方法(未完成)
-(void)uploadImage:(UIButton *)button
{
    NSDictionary *dic;

    [[AFHTTPSessionManager manager]POST:@"" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        static int index = 1;
        //单张图片上传
//        NSString *paramName = [NSString stringWithFormat:@"%@%zi",self.img]
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

-(void)creatView
{
    self.button = [[UIButton alloc]init];
    [self.button setTitle:@"选择照片" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor YHWithRedColor:0 GreenColor:0 BlueColor:0 alpha:1];
    [self.button setTop:100];
    self.button.left = 50;
    self.button.width = 200;
    self.button.height = 50;
    [self.button addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    _image = [[UIImageView alloc]init];
    [self.view addSubview:_image];
    [self.image setTop:200];
    [self.image setLeft:50];
    self.image.width = 200;
    self.image.height = 200;
    self.image.image = [UIImage YHimageWithColor:[UIColor yellowColor]];
    self.image.userInteractionEnabled = YES;
    background = [[UIView alloc]initWithFrame:CGRectMake(0, 0,YHWidth, YHHeight)];
}
//添加放大照片手势
-(void)addTapGesture
{
    //加入点击手势
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView)];
    tapgesture.delegate = self;
    self.image.contentMode = UIViewContentModeScaleAspectFill;
    [self.image addGestureRecognizer:tapgesture];
}
//选择照片
-(void)choosePhoto
{
    __weak __typeof(&*self)weakself = self;
    [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
        
        if (image) {
              weakself.img = [UIImage imageCompressWithSimple:image scaledToSize:CGSizeMake(weakself.image.frame.size.width, weakself.image.frame.size.height) YHDrawInRectX:weakself.image.bounds InRectY:weakself.image.bounds];
            weakself.img = [UIImage YHWaterMarkImage:weakself.img withName:[NSString YHGetCurrentTime]];
            [weakself.image setImage:weakself.img];
        }

    }];
}


//手势放大图片
-(void)tapView
{
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, YHWidth, YHHeight)];
    background = bgView;
    bgView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bgView];
    //创建显示图像的试图
    //初始化要显示的图片内容的imageview
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, BIG_Width, BIG_Height)];
    [imageView setImage:self.img];
    imageView.userInteractionEnabled = YES;
    [bgView addSubview:imageView];
    
    //添加点击手势（收回照片）
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [imageView addGestureRecognizer:tap];
    [UIView YHShakeToShow:bgView];

}

-(void)back
{
    [background removeFromSuperview];
    
}

//手势代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return ![gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
