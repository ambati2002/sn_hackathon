//
//  ProductCell.h
//  ACMECorp
//
//  Created by Sarath Ambati on 6/14/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
