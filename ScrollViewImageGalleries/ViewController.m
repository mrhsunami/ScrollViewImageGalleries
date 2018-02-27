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
@property (nonatomic) NSInteger numberOfPages;
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) UIPageControl *myPageControl;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myPageControl = [[UIPageControl alloc] init];
    
    self.imageGalleryScrollView.delegate = self;
    NSArray <UIImage *>*images = @[
                                   [UIImage imageNamed:@"Lighthouse-in-Field"],
                                   [UIImage imageNamed:@"Lighthouse-night"],
                                   [UIImage imageNamed:@"Lighthouse-zoomed"]
                                   ];
    
    self.numberOfPages = images.count;
    self.myPageControl.numberOfPages = self.numberOfPages;
    self.myPageControl.currentPage = self.currentPage;
    self.myPageControl.frame = CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 60);
    self.myPageControl.backgroundColor = [UIColor grayColor];
    [self.view addSubview: self.myPageControl];

    //create three UIImageView and place them inside the UIScrollView next to each other.
    
    CGFloat offsetForXDirection = 0;
    
    for (UIImage *image in images) {
        
        // create UIImageView
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        // add imageview as a subview to scrollview
        [self.imageGalleryScrollView addSubview:imageView];
        
        // create gesturerecognizer
        UITapGestureRecognizer *myTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
        
        // add gesturerecognizer to imageview
        [imageView addGestureRecognizer:myTapRecognizer];
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        // set imageview frame and line them up horizontally with offset
        imageView.frame = CGRectMake(offsetForXDirection, 0, self.imageGalleryScrollView.bounds.size.width, self.imageGalleryScrollView.bounds.size.height);
        
        // incretment offset with each new imageview that is added
        offsetForXDirection += imageView.frame.size.width;
    }

    self.imageGalleryScrollView.contentSize = CGSizeMake(offsetForXDirection, 0);
    self.imageGalleryScrollView.pagingEnabled = YES;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.bounds.origin.x < scrollView.bounds.size.width/2) {
        self.myPageControl.currentPage = 0;
    } else if (scrollView.bounds.origin.x > scrollView.bounds.size.width/2 && scrollView.bounds.origin.x < scrollView.bounds.size.width*1.5 ) {
        self.myPageControl.currentPage = 1;
    } else {
        self.myPageControl.currentPage = 2;
    }
    
}

-(void)viewDidAppear:(BOOL)animated {

    [self.imageGalleryScrollView.delegate scrollViewDidScroll:self.imageGalleryScrollView];
    
//    UIPageControl *pageControl = [[UIPageControl alloc] init];
//    pageControl.numberOfPages = self.numberOfPages;
}

-(void)tapHandler: (UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        NSLog(@"tap handled");
        [self performSegueWithIdentifier:@"mySegue" sender: gesture.view];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mySegue"]) {
        ImageDetailViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.incomingImage = ((UIImageView *)sender).image;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
