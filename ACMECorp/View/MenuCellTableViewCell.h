//
//  MenuCellTableViewCell.h
//  ACMECorp
//
//  Created by Sarath Ambati on 6/15/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end
