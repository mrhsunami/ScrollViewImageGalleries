//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *imageGalleryScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageGalleryScrollView.delegate = self;
    
    NSArray <UIImage *>*images = @[
                                   [UIImage imageNamed:@"Lighthouse-in-Field"],
                                   [UIImage imageNamed:@"Lighthouse-night"],
                                   [UIImage imageNamed:@"Lighthouse-zoomed"]
                                   ];

    //create three UIImageView and place them inside the UIScrollView next to each other.
    
    CGFloat offsetForXDirection = 0;
    
    for (UIImage *image in images) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [self.imageGalleryScrollView addSubview:imageView];
        
        imageView.frame = CGRectMake(offsetForXDirection, 0, self.imageGalleryScrollView.bounds.size.width, self.imageGalleryScrollView.bounds.size.height);
        
        offsetForXDirection += imageView.frame.size.width;
    }

    self.imageGalleryScrollView.contentSize = CGSizeMake(offsetForXDirection, 0);
    self.imageGalleryScrollView.pagingEnabled = YES;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
