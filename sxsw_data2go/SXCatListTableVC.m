//
//  SXCatListTableVC.m
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/7/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//f

#import "SXCatListTableVC.h"
#import "SXMainCatListCell.h"
#import "SXCatDetailVC.h"

@implementation SXCatListTableVC

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.catArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CatCell";
    SXMainCatListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    NSDictionary *catObject = [self.catArray objectAtIndex:indexPath.row];
    cell.catNameLabel.text = [catObject objectForKey:@"name"];
    cell.catShortDescriptionLabel.text = [catObject objectForKey:@"short_description"];
    [cell.thumbImage setImageWithURL:[NSURL URLWithString:[catObject objectForKey:@"small_photo_url"]]
                    placeholderImage:[UIImage imageNamed:@"question_mark"]];
    
    return cell;
}


#pragma mark - Navigation

/***** Principle #2 : Reduce Verbosity *****/

// In a story board-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"catDetailSegue"])
//    {
//        SXCatDetailVC *catDetail = segue.destinationViewController;
//        NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
//        catDetail.theCat = [self.catArray objectAtIndex:selectedIndexPath.row];
//    }
//}

@end
