//
//  ImageDetailViewController.h
//  ScrollViewImageGalleries
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ImageDetailViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) UIImage *incomingImage;

@end
