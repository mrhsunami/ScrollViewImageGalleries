//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *imageDetailScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end



@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageDetailScrollView.delegate = self;
    self.imageDetailScrollView.minimumZoomScale = 0.1;
    self.imageDetailScrollView.maximumZoomScale = 1.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.imageView.image = self.incomingImage;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
