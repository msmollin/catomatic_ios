//
//  SXMainCatListCell.h
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/7/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//


@interface SXMainCatListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property (weak, nonatomic) IBOutlet UILabel *catNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *catShortDescriptionLabel;

@end
