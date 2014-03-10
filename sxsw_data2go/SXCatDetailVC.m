//
//  SXCatDetailVC.m
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/9/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//

#import "SXAPIManager.h"
#import "SXCatDetailVC.h"

@interface SXCatDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UITextView *catDescription;

@end

@implementation SXCatDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    /***** Principle #2 : Reduce Verbosity *****/
    
//    self.catNameLabel.text = [self.theCat objectForKey:@"name"];
//    
//    SXAPIManager *manager = [SXAPIManager sharedInstance];
//    SXCatDetailVC __weak *weakSelf = self;
//    NSString *url = [NSString stringWithFormat:@"/cats/%@",[self.theCat objectForKey:@"id"]];
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        SXCatDetailVC *strongSelf = weakSelf;
//        strongSelf.theCat = responseObject;
//        [strongSelf.catImage setImageWithURL:[NSURL URLWithString:[strongSelf.theCat objectForKey:@"large_photo_url"]]
//                            placeholderImage:[UIImage imageNamed:@"question_mark"]];
//        strongSelf.catDescription.text = [strongSelf.theCat objectForKey:@"long_description"];
//        [strongSelf.catDescription flashScrollIndicators];
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
}

@end
